<template>
  <div class="root">
    <!-- 标题 -->
    <div class="title">图书馆预约</div>
    <!-- 右侧布局，包含一张图片 -->
    <div class="right-content">
      <img src="../assets/library.png" alt="图书馆图片" style="width: 70%;">
    </div>
    <!-- 左侧布局 -->
    <div class="left-content">
      <el-card style="margin-top: 20px; position: relative">
        <div slot="header" class="clearfix" style="text-align: center;">
          <!-- 添加一个日期选择器 -->
          <el-date-picker v-model="selectedDate" type="date" placeholder="选择日期" :picker-options="pickerOptions"></el-date-picker>
          <!-- 添加一个场次选择器 -->
          <el-select v-model="selectedTime" placeholder="选择场次">
            <el-option label="上午" value="morning"></el-option>
            <el-option label="下午" value="afternoon"></el-option>
            <el-option label="晚上" value="evening"></el-option>
          </el-select>
          <!-- 添加一个查看座位按钮 -->
          <el-button type="primary" @click="viewSeats">查看座位</el-button>
        </div>

      </el-card>
    </div>

    <navbar title="预约座位" :left="false">
      <Score slot="right"></Score>
    </navbar>
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

  </div>
</template>

<script>

import Area from "@/components/Area";
import Navbar from "@/components/navbar";
import request from "@/req";
import HeadTip from "@/components/HeadTip";
import ToggleArea from "@/components/ToggleArea";
import TimeSlider from "@/components/TimeSlider";
import {Toast} from "vant";
import Score from "@/components/Score";

export default {
  components: {Score, TimeSlider, ToggleArea, HeadTip, Navbar, Area},
  data() {

    return {
      selectedDate: '', // 选择的日期
      selectedTime: '', // 选择的场次
      areaRows: null, // 区域信息
      seatRows: null, // 座位信息，根据日期和场次获取
      seatCurIndex: 0,
      pickerOptions: {
        disabledDate: time => {
          const now = new Date();
          const weekLater = new Date(now.getTime() + 7 * 24 * 60 * 60 * 1000);
          return time.getTime() < now.getTime() || time.getTime() > weekLater.getTime();
        }
      }
    };
  },
  components: {
    ToggleArea, // 在components中声明ToggleArea组件
    Area
  },
  methods: {
    async viewSeats() {
      try {
        const response = await fetch(`/api/seats?date=${this.selectedDate}&time=${this.selectedTime}`);
        const data = await response.json();
        this.seatRows = data.seats;
      } catch (error) {
        console.error('获取座位信息失败：', error);
      }
    },
    togglePage() {
      //当前有待操作的预约则跳转到操作页
      request.post('/user/getReservationByUid', {
        uid: this.$getUser().uid
      }).then(res => {
        console.log(res)
        for (let i = 0; i < res.rows.length; i++) {
          let item = res.rows[i]
          switch (item.state) {
            case 0:
            case 3:
              localStorage.setItem('reservation', JSON.stringify(item))
              if (this.$route.path !== '/student/seat/toSigned') {
                this.$router.replace('/student/seat/toSigned')
              }
              break
            case 1:
              localStorage.setItem('reservation', JSON.stringify(item))
              if (this.$route.path !== '/student/seat/beUse') {
                this.$router.replace('/student/seat/beUse')
              }
              break
          }
        }

      })
    },
    clickPop() {
      this.$nextTick(() => {
        let area = this.$refs.toggleArea.getArea();
        this.seatName = area.subName +
            this.seatRows[this.seatCurIndex].row + this.seatRows[this.seatCurIndex].column
      })
    },
    getSeatRows() {
      this.$nextTick(() => {
        if (this.$refs)
          request.post('/public/getAreaSeats', {
            area: this.$refs.toggleArea.getArea().aid
          }).then(res => {
            this.seatRows = res.rows
          })
      })
    },
    seatClick(index) {
      if (this.seatRows[index].type === 1 || this.seatRows[index].state === 2 || this.seatRows[index].state === 1) {
        this.seatRows[index].show = false;
        return
      }
      this.seatCurIndex = index
    },
    changeArea(index) {
      this.getSeatRows()
    },
  },
  created() {
    request.get('/public/getArea').then(res => {
      this.areaRows = res.rows
      this.getSeatRows()
    })
    this.togglePage()
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
  margin-top: 20px; /* 添加上边距 */
}

.left-content {
  width: 70%;
}

.right-content {
  width: 50%; /* 调整为 50% */
  margin-bottom: 20px; /* 添加一些底部间距 */
}
</style>
