<template>
  <div class="root">
    <div class="title">选择座位</div>
    <!-- 在此处显示座位 -->
    <el-card style="overflow: scroll;">
      <div slot="header" class="clearfix">
        <ToggleArea @changeArea="getSeatRows" ref="toggleArea" :area-rows="areaRows" v-if="areaRows"></ToggleArea>
        <HeadTip></HeadTip>
      </div>
      <Area ref="room" v-if="seatRows" :seat-rows="seatRows" @seatClick="seatClick">
        <div slot="seatMenu" class="blankMenu">
          <div @click="clickPop">
            <i class="el-icon-s-flag"></i>预约
          </div>
        </div>
      </Area>
    </el-card>
    <!-- 添加一个预约按钮 -->
    <div style="text-align: center; margin-top: 20px;">
      <el-button type="primary" @click="submit">预约</el-button>
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
import Score from "@/components/Score";

export default {
  components: { ToggleArea, HeadTip, Area, Navbar, Score },
  data() {
    return {
      selectedDate: this.$route.query.date,
      selectedTime: this.$route.query.time,
      areaRows: null, // 区域信息
      seatRows: null, // 座位信息
      seatCurIndex: 0,
      seatName: '请选择座位' // 当前选择的座位
    };
  },
  methods: {
    getSeatRows() {
      request.post('/public/getAreaSeats', {
        area: this.$refs.toggleArea.getArea().aid,
        date: this.selectedDate,
        time: this.selectedTime
      }).then(res => {
        this.seatRows = res.rows;
      });
    },
    seatClick(index) {
      if (this.seatRows[index].type === 1 || this.seatRows[index].state === 2 || this.seatRows[index].state === 1) {
        this.seatRows[index].show = false;
        return;
      }
      this.seatCurIndex = index;
    },
    submit() {
      if (this.seatName === '请选择座位') {
        Toast.fail('请选择座位');
        return;
      }
      const body = {
        startTime: this.selectedDate + ' ' + this.selectedTime,
        uid: this.$getUser().uid,
        sid: this.seatRows[this.seatCurIndex].sid
      };
      request.post('/user/addReservation', body).then(res => {
        if (res.code === 200) {
          Toast.success('预约成功');
          this.togglePage();
        } else {
          Toast.fail('预约失败，当前已有预约');
        }
      });
    },
    togglePage() {
      request.post('/user/getReservationByUid', {
        uid: this.$getUser().uid
      }).then(res => {
        for (let i = 0; i < res.rows.length; i++) {
          let item = res.rows[i];
          switch (item.state) {
            case 0:
            case 3:
              localStorage.setItem('reservation', JSON.stringify(item));
              if (this.$route.path !== '/student/seat/toSigned') {
                this.$router.replace('/student/seat/toSigned');
              }
              break;
            case 1:
              localStorage.setItem('reservation', JSON.stringify(item));
              if (this.$route.path !== '/student/seat/beUse') {
                this.$router.replace('/student/seat/beUse');
              }
              break;
          }
        }
      });
    },
    clickPop() {
      this.$nextTick(() => {
        const area = this.$refs.toggleArea.getArea();
        this.seatName = area.subName + this.seatRows[this.seatCurIndex].row + this.seatRows[this.seatCurIndex].column;
      });
    }
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
</style>
