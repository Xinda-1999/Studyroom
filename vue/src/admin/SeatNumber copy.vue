<template>
  <div class="root">
    <el-card style="margin-top: 10%;position: relative">
      <div slot="header" class="clearfix">
        <ToggleArea @changeArea="getSeatRows" ref="toggleArea" :area-rows="areaRows" v-if="areaRows"></ToggleArea>
        <HeadTip></HeadTip>
      </div>
      <Area ref="room" v-if="seatRows" :seat-rows="seatRows" @seatClick="seatClick">
        <div slot="seatMenu" class="blankMenu">
          <div>{{ $t("check_in_code") }}: {{ number }}</div>
        </div>
      </Area>
    </el-card>
    <div class="qrcode" v-if="showQrCode" ref="qrCodeUrl"></div>
  </div>
</template>

<script>
import Area from "@/components/Area";
import request from "@/req";
import HeadTip from "@/components/HeadTip";
import ToggleArea from "@/components/ToggleArea";
import QRCode from "qrcodejs2";

export default {
  name: "SeatNumber",
  components: { ToggleArea, HeadTip, Area },
  data() {
    return {
      areaRows: null,
      seatRows: null,
      number: '000000',
      showQrCode: false, // 控制二维码显示的标志位
      currentSeatState: 0, // 当前座位的状态
    };
  },
  methods: {
    seatClick(index) {
      // 生成座位二维码，无论座位状态如何
      this.createQrCode(this.seatRows[index].sid);

      // 只有正在使用的座位才请求签到码
      if (this.seatRows[index].state === 1) {
        request.post('/public/getSignedNumber', {
          sid: this.seatRows[index].sid
        }).then(res => {
          this.number = res.number;
        });
      } else {
        this.number = '000000'; // 非使用中的座位重置签到码
      }
      this.currentSeatState = this.seatRows[index].state;
      this.showQrCode = true; // 点击座位后显示二维码
    },
    getSeatRows() {
      this.$nextTick(() => {
        request.post('/public/getAreaSeats', {
          area: this.$refs.toggleArea.getArea().aid
        }).then(res => {
          this.seatRows = res.rows;
        });
      });
    },
    createQrCode(seatNumber) {
      this.$refs.qrCodeUrl.innerHTML = ""; // 清除之前的二维码
      new QRCode(this.$refs.qrCodeUrl, {
        text: `https://blog.csdn.net/weixin_42601136?seatId=${seatNumber}`, // 需要转换为二维码的内容，座位号
        width: 100,
        height: 100,
        colorDark: "#000000",
        colorLight: "#ffffff",
        correctLevel: QRCode.CorrectLevel.H,
      });
    }
  },
  created() {
    request.get('/public/getArea').then(res => {
      this.areaRows = res.rows;
      this.getSeatRows();
    });
  }
};
</script>

<style scoped>
.root {
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
}
.qrcode {
  display: inline-block;
  width: 132px;
  height: 132px;
  background-color: #fff;
  padding: 6px;
  box-sizing: border-box;
}
</style>
