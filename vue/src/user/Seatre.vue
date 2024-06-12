<template>
  <div class="root">
    <!-- 标题 -->
    <div class="title">{{ $t('libraryReservation') }}</div>
    <!-- 右侧布局，包含一张图片 -->
    <div class="right-content">
      <img src="../assets/library.png" alt="图书馆图片" style="width: 70%;">
    </div>
    <!-- 左侧布局 -->
    <div class="left-content">
      <el-card style="margin-top: 20px; position: relative">
        <div slot="header" class="clearfix" style="text-align: center;">
          <!-- 添加一个日期选择器 -->
          <el-date-picker v-model="selectedDate" type="date" :placeholder="$t('selectDate')" :picker-options="pickerOptions"></el-date-picker>
          <!-- 添加一个场次选择器 -->
          <el-select v-model="selectedTime" :placeholder="$t('selectTimeSlot')" @change="setTimeRange">
            <el-option :label="$t('morning')" value="morning"></el-option>
            <el-option :label="$t('afternoon')" value="afternoon"></el-option>
            <el-option :label="$t('evening')" value="evening"></el-option>
          </el-select>
          <!-- 添加一个查看座位按钮 -->
          <el-button type="primary" @click="viewSeats">{{ $t('viewSeats') }}</el-button>
        </div>
      </el-card>
    </div>

    <navbar :title="$t('reserveSeat')" :left="false">
      <!-- <Score slot="right"></Score>-->
    </navbar>

    <el-card v-if="showReservation" style="overflow: scroll;">
      <div slot="header" class="clearfix">
        <ToggleArea @changeArea="getSeatRows" ref="toggleArea" :area-rows="areaRows" v-if="areaRows"></ToggleArea>
        <HeadTip></HeadTip>
      </div>
      <Area ref="room" v-if="seatRows" :seat-rows="seatRows" @seatClick="seatClick">
        <div slot="seatMenu" class="blankMenu">
          <div @click="clickPop">
            <i class="el-icon-s-flag"></i>{{ $t('reserve') }}
          </div>
        </div>
      </Area>
    </el-card>

    <el-card v-if="showReservation" style="width: 500px;">
      <van-cell :title="$t('seat')" :value="seatName"/>
    </el-card>

    <div v-if="showReservation" style="text-align: center; margin-top: 20px;">
      <el-button type="primary" @click="submit">{{ $t('reserve') }}</el-button>
    </div>
  </div>
</template>

<script>
import Area from "@/components/Area";
import Navbar from "@/components/navbar";
import request from "@/req";
import HeadTip from "@/components/HeadTip";
import ToggleArea from "@/components/ToggleArea";
import { Toast } from "vant";
//import Score from "@/components/Score";

export default {
  components: { ToggleArea, HeadTip, Navbar, Area },
  data() {
    return {
      selectedDate: '', // 选择的日期
      selectedTime: '', // 选择的场次
      startTime: '', // 开始时间
      endTime: '', // 结束时间
      areaRows: null, // 区域信息
      seatRows: null, // 座位信息，根据日期和场次获取
      seatCurIndex: 0,
      seatName: this.$t('selectSeat'), // 当前选择的座位
      pickerOptions: {
        disabledDate: time => {
          const now = new Date();
          const weekLater = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000);
          return time.getTime() < now.getTime() || time.getTime() > weekLater.getTime();
        }
      },
      showReservation: false // 控制预约信息显示
    };
  },
  methods: {
    setTimeRange() {
      if (this.selectedTime === 'morning') {
        this.startTime = '09:00';
        this.endTime = '12:00';
      } else if (this.selectedTime === 'afternoon') {
        this.startTime = '13:00';
        this.endTime = '17:00';
      } else if (this.selectedTime === 'evening') {
        this.startTime = '18:00';
        this.endTime = '21:00';
      }
      console.log(this.$t('time') + ':', this.startTime, this.endTime);
    },
    
    async viewSeats() {
      if (!this.selectedDate || !this.selectedTime) {
        Toast.fail(this.$t('selectDateTime'));
        return;
      }
      try {
        const response = await fetch(`/api/seats?date=${this.selectedDate}&time=${this.selectedTime}`);
        const data = await response.json();
        this.seatRows = data.seats;
        this.showReservation = true; // 成功获取座位信息后显示预约信息
      } catch (error) {
        console.error(this.$t('fetchSeatsFailed') + ':', error);
      }
    },
    submit() {
      console.log(this.$t('reserveButtonClicked')); // 添加日志
      if (this.seatName === this.$t('selectSeat')) {
        Toast.fail(this.$t('selectSeat'));
        return;
      }
      if (new Date().getHours() >= 22) {
        Toast.fail(this.$t('cannotReserveAfter22'));
        return;
      }
      this.$nextTick(() => {
        if (!this.startTime || !this.endTime) {
          Toast.fail(this.$t('selectTimeSlot'));
          return;
        }
        if (!this.selectedDate) {
          Toast.fail(this.$t('selectDate'));
          return;
        }

        const formattedDate = this.selectedDate.toISOString().split('T')[0];
        console.log('formattedDate:', formattedDate);

        const startDateTime = new Date(`${formattedDate}T${this.startTime}:00`).getTime();
        const endDateTime = new Date(`${formattedDate}T${this.endTime}:00`).getTime();
        console.log('最终时间:', startDateTime, endDateTime);

        if (isNaN(startDateTime) || isNaN(endDateTime)) {
          Toast.fail(this.$t('timeFormatError'));
          return;
        }

        const body = {
          startTime: startDateTime,
          endTime: endDateTime,
          uid: this.$getUser().uid,
          sid: this.seatRows[this.seatCurIndex].sid
        };
        console.log(this.$t('submitData') + ':', body); // 添加日志

        request.post('/user/addSimpleReservation', body).then(res => {
          console.log(this.$t('apiResponse') + ':', res); // 添加日志
          if (res.code === 200) {
            Toast.success(this.$t('reservationSuccessful'));
            this.togglePage();
          } else {
            Toast.fail(this.$t('reservationFailedExisting'));
          }
        }).catch(error => {
          console.error(this.$t('reservationRequestFailed') + ':', error); // 错误处理
        });
      });
    },
    togglePage() {
      request.post('/user/getReservationByUid', {
        uid: this.$getUser().uid
      }).then(res => {
        console.log(this.$t('fetchReservationInfo') + ':', res); // 添加日志
        for (let i = 0; i < res.rows.length; i++) {
          let item = res.rows[i];
          console.log(this.$t('processingReservation') + ':', item); // 添加日志
          switch (item.state) {
            case 0:
            case 3:
              localStorage.setItem('reservation', JSON.stringify(item));
              console.log(this.$t('navigateToToSigned')); // 添加日志
              if (this.$route.path !== '/student/seat/toSigned') {
                this.$router.replace('/student/seat/toSigned');
              }
              break;
            case 1:
              localStorage.setItem('reservation', JSON.stringify(item));
              console.log(this.$t('navigateToBeUse')); // 添加日志
              if (this.$route.path !== '/student/seat/beUse') {
                this.$router.replace('/student/seat/beUse');
              }
              break;
            default:
              console.log(this.$t('unhandledReservationState') + ':', item.state); // 添加日志
          }
        }
      }).catch(error => {
        console.error(this.$t('fetchReservationInfoFailed') + ':', error); // 错误处理
      });
    },

    clickPop() {
      this.$nextTick(() => {
        const area = this.$refs.toggleArea.getArea();
        this.seatName = area.subName +
          this.seatRows[this.seatCurIndex].row + this.seatRows[this.seatCurIndex].column;
      });
    },
    getSeatRows() {
      this.$nextTick(() => {
        if (this.$refs.toggleArea) {
          const area = this.$refs.toggleArea.getArea();
          request.post('/public/getAreaSeats', { area: area.aid }).then(res => {
            this.seatRows = res.rows;
          }).catch(error => {
            console.error(this.$t('fetchSeatsFailed') + ':', error); // 错误处理
          });
        }
      });
    },

    seatClick(index) {
      if (this.seatRows[index].type === 1 || this.seatRows[index].state === 2 || this.seatRows[index].state === 1) {
        this.seatRows[index].show = false;
        return;
      }
      this.seatCurIndex = index;
    },
    changeArea(index) {
      this.getSeatRows();
    },
  },
  created() {
    request.get('/public/getArea').then(res => {
      this.areaRows = res.rows;
      this.getSeatRows();
    });
    this.togglePage();
  }
}
</script>

<style scoped>
.root {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
}

.title {
  font-size: 24px;
  font-weight: bold;
  margin-bottom: 20px;
  text-align: center;
  margin-top: 20px;
}

.left-content {
  width: 70%;
}

.right-content {
  width: 50%;
  margin-bottom: 20px;
}
</style>
