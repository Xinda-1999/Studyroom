<template>
  <div>
    <navbar title="使用中" :left="false">
      <Score slot="right"></Score>
    </navbar>
    <el-divider></el-divider>
    <el-card class="box-card">
      <div slot="header" class="clearfix">
        <span style="margin-left: 1em">座位信息</span>
      </div>
      <van-cell title="座位号" :value="item.subName + item.row + item.column"/>
      <van-cell title="区域名" :value="item.areaName"/>
      <TimeSlider :disable="true" :start-time="item.startTime" :end-time="item.endTime"></TimeSlider>

    </el-card>
    <el-form>
      <el-form-item label=" " style="text-align: center; margin-bottom: 10px;">
        <el-button type="primary" @click="submit" style="width: 900px;">正在使用中</el-button>
      </el-form-item>
    </el-form>
    <div class="btn-container">
      <div class="btn1" @click="cancelReservation">签退</div>
    </div>
  </div>
</template>

<script>
import Navbar from "@/components/navbar";
import TimeSlider from "@/components/TimeSlider";
import request from "@/req";
import {Toast} from "vant";
import Score from "@/components/Score";

export default {
  name: "BeUse",
  components: {Score, TimeSlider, Navbar},
  props: {},
  data() {
    return {
      item: null,
      number: null
    }
  },
  methods: {
    submit() {
      if (this.item===null){
        Toast.fail('请完整输入')
        return
      }
      request.post('/user/toLeave', {
        sid: this.item.sid,
        rid: this.item.rid
      }).then(res => {
        this.item.state = 3
        localStorage.setItem('reservation', JSON.stringify(this.item))
        Toast.success('操作成功，请回馆后及时签到')
        this.$router.replace('/student/seat/toSigned')
      })
    },
    cancelReservation() {
      request.post('/user/cancelReservation', {
        rid: this.item.rid
      }).then(res => {
        if (res.code === 200) {
          Toast.success('签退成功');
          this.$router.replace('/student/seat/reservation');
        } else {
          Toast.fail('取消预约失败');
        }
        console.log('取消预约失败:', res.code);
      }).catch(error => {
        console.error('取消预约请求失败:', error);
        Toast.fail('取消预约失败');
      });
    }
  
  },
  
  created() {
    this.item = JSON.parse(localStorage.getItem('reservation'));
    console.log(this.item)
  }
}
</script>


<style scoped>
.btn-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-top: 10px; /* 调整这个值来控制与签到按钮的间距 */
}

.btn, .btn1 {
  width: 70%;
  margin: 10px 0;
  padding: 10px;
  text-align: center;
  border-radius: 4px;
  cursor: pointer;
}

.btn {
  background-color: #409EFF;
  color: white;
}

.btn1 {
  background-color: #F56C6C;
  color: white;
}
</style>
