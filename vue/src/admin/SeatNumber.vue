<template>
  <div class="root">
    <el-card style="margin-top: 10%;position: relative">
      <div slot="header" class="clearfix">
        <ToggleArea @changeArea="getSeatRows" ref="toggleArea" :area-rows="areaRows" v-if="areaRows"></ToggleArea>
        <HeadTip></HeadTip>
      </div>
      <Area ref="room" v-if="seatRows" :seat-rows="seatRows" @seatClick="seatClick">
        <div slot="seatMenu" class="blankMenu">
          <div>签到码：{{number}} </div>
        </div>
      </Area>
    </el-card>
    <div class="qrcode" ref="qrCodeUrl"></div>
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
  components: {ToggleArea, HeadTip, Area},
  data() {
    return {
      areaRows: null,
      seatRows: null,
      number:'000000'
    }
  },
  methods: {
    seatClick(index) {
      //正在使用的座位无法操作
      if (this.seatRows[index].state !== 1) {
        this.seatRows[index].show = false
        return
      }
      request.post('/public/getSignedNumber',{
        sid:this.seatRows[index].sid
      }).then(res=>{
        this.number=res.number
      })
    },
    getSeatRows() {
      this.$nextTick(() => {
        request.post('/public/getAreaSeats', {
          area: this.$refs.toggleArea.getArea().aid
        }).then(res => {
          this.seatRows = res.rows
        })
      })

    },
    creatQrCode() {
      var qrcode = new QRCode(this.$refs.qrCodeUrl, {
        text: "https://blog.csdn.net/weixin_42601136", // 需要转换为二维码的内容
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
      this.areaRows = res.rows
      this.getSeatRows()
    })
  },
  mounted() {
    this.creatQrCode();
  }
}
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
