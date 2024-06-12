<template>
  <div class="module">
      <el-table
          :data="rows" :row-style="{height: '60px'}" :header-cell-style="headerCellStyle" :cell-style="cellStyle"
          style="width: 100%">
      <el-table-column
          width="500"
          label="预约时段">
          <template slot-scope="scope">
          <!-- <div>{{ scope.row.res_time }}</div> -->
          <!-- <div>{{ startText + " - " + endText }}</div> -->
          <div>{{ scope.row.time_interval }}</div>
          </template>
      </el-table-column>
      <el-table-column
          label="预约区域"
          width="300">
          <template slot-scope="scope">
          <!-- <div>{{ scope.row.res_seat }}</div> -->
          <div>{{ scope.row.areaName }}</div>
          </template>
      </el-table-column>
      <el-table-column
          label="预约座位"
          width="200">
          <template slot-scope="scope">
          <div>{{ scope.row.sid }}</div>
          </template>
      </el-table-column>
      <!-- <el-table-column
          label="下单时间"
          width="350">
          <template slot-scope="scope">
          <div>{{ scope.row.order_time }}</div>
          </template>
      </el-table-column> -->
      <el-table-column
          label="状态"
          width="250">
          <template slot-scope="scope">
          <div>{{ state_reverse(scope.row.state) }}</div>
          </template>
      </el-table-column>

      <!-- <el-table-column
          label="扣除信用分"
          width="350">
          <template slot-scope="scope">
          <div>{{ scope.row.score }}</div>
          </template>
      </el-table-column>-->

      </el-table>
      <router-view style="margin-bottom: 50px;overflow: scroll"></router-view>
      <TabLayout>
      <div @click="()=>{active=index;if($route.path!==tab.url)$router.replace(tab.url)}"
              :style="index===active?'color:#409eff;font-weight:bold;':''" v-for="(tab,index) in tabs">{{ tab.name }}
      </div>
      </TabLayout>
      <!-- <div class="label">
        <p>超时未签到: 1</p>
      </div> -->
  </div>
</template>



<script>
import request from "@/req";
import TabLayout from "@/components/TabLayout";

export default {
name: "History",
components: {TabLayout},
data() {
  return {
  active: 0,
  tabs: [
      {name: '历史记录', url: '/student/history'},
    //   {name: '预约记录', url: '/student/record'}
  ],
  tableData: [
      {res_time: '2024-05-01 14:00 - 18:00', res_seat: 'AW174', order_time: '2024-04-26 08:50', state: '已签到'},
      {res_time: '2024-05-10 16:00 - 18:00', res_seat: 'BW59', order_time: '2024-04-29 19:08', state: '已取消'},
      {res_time: '2024-05-15 14:00 - 18:00', res_seat: 'AE158', order_time: '2024-05-09 21:26', state: '超时未签到'},
      {res_time: '2024-05-17 09:00 - 10:00', res_seat: 'CE92', order_time: '2024-05-08 20:00', state: '已签到'},
  ],
  rows: [],
  headerCellStyle: {
    fontSize: '20px',
    // color: 'blue',
    fontWeight: 'bold',
  },
  cellStyle: {
    fontSize: '15px',
    // color: 'blue'
  }
  // startText: '',
  // endText: ''
  // state_new: "未知"
  };
},
methods: {
  addNewFieldToRows() {
    this.rows.forEach(row => {
      row.time_interval = this.calculateNewValue(row)[0] + " - " + this.calculateNewValue(row)[1];
      console.log(row);
    });
  },
  calculateNewValue(row) {
    let value = [0, 1];
    let date1 = new Date(row.startTime).toLocaleString();
    // let date1 = new Date(1660116600000)
    // console.log(row.startTime)
    // console.log(date1)
    let date2 = new Date(row.endTime).toLocaleString();
    return [date1, date2];
  },
  get_reservation(){
    request.post('/user/getReservationByUid', {
      uid: this.uid,
    }).then(res => {
      this.rows = res.rows;
      console.log(this.rows);
      this.addNewFieldToRows();
      // this.updateTime();
    })
  },
  state_reverse(state) {
    switch (state) {
      case -1:
        return "使用完成"
      case 0:
        return "待签到"
      case 1:
        return "已签到"
      case 2:
        return "超时未签到"
      case 3:
        return "暂离"
      case 4:
        return "暂离60分钟未签到"
    }
  },
  // signIn(index, row) {
  //     for (let item of this.rows) {
  //         // if (item.id === row.id) {
  //         if (item === row) {
  //             item.state = "已签到";
  //         }
  //     }
  //     this.$forceUpdate();
  //     this.$message({
  //         message: '签到成功',
  //         type: 'success'
  //     });
  // },
  // handleDelete(index, row) {
  // request.post('/admin/deleteArticle', {
  //     id: this.rows[index].id
  // }).then(res => {
  //     for (let item of this.rows) {
  //         // if (item.id === row.id) {
  //         if (item === row) {
  //             this.rows.splice(this.rows.indexOf(item), 1)
  //         }
  //     }
  //     this.$message({
  //         message: '取消成功',
  //         type: 'success'
  //     });
  // })
  // },
},
created() {
  // request.get('/user/getReservationByUid').then(res => {
  //     console.log(res);
  //     this.rows = res.rows;
  // })
  // this.rows = this.tableData;
  var data = JSON.parse(localStorage.getItem('user'));
  this.uid = data.uid;
  this.get_reservation();
  // console.log(this.rows);
  // console.log(this.startText)
},
}
</script>

<style scoped>
div {
display: -webkit-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 50;
overflow: hidden;
}
.module {
  margin-top: 80px; /* 添加上边距 */
  margin-left: 100px;
  margin-right: 100px;
}
.label {
  font-size: 16px;
  margin-left: 1050px;
  margin-top: 200px;
  color: red;
}
</style>  