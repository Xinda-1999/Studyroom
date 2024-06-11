<template>
    <div class="module">
        <el-table
            :data="tableData" :row-style="{height: '40px'}"
            style="width: 100%">
        <el-table-column
            label="预约时段"
            width="220">
            <template slot-scope="scope">
            <div>{{ scope.row.res_time }}</div>
            </template>
        </el-table-column>
        <el-table-column
            label="预约座位"
            width="120">
            <template slot-scope="scope">
            <div>{{ scope.row.res_seat }}</div>
            </template>
        </el-table-column>
        <el-table-column
            label="下单时间"
            width="180">
            <template slot-scope="scope">
            <div>{{ scope.row.order_time }}</div>
            </template>
        </el-table-column>
        <el-table-column
            label="状态"
            width="140">
            <template slot-scope="scope">
            <div>{{ scope.row.state }}</div>
            </template>
        </el-table-column>
        <el-table-column label="操作">
            <template slot-scope="scope">
            <el-button
                size="mini"
                type="success"
                @click="signIn(scope.$index, scope.row)">签到
            </el-button>
            <el-button
                size="mini"
                type="danger"
                @click="handleDelete(scope.$index, scope.row)">取消预约
            </el-button>
            </template>
        </el-table-column>
        <el-table-column
            label="备注">
            <template slot-scope="scope">
            <div>{{ scope.row.notes }}</div>
            </template>
        </el-table-column>
        </el-table>
        <router-view style="margin-bottom: 50px;overflow: scroll"></router-view>
        <TabLayout>
        <div @click="()=>{active=index;if($route.path!==tab.url)$router.replace(tab.url)}"
                :style="index===active?'color:#409eff;font-weight:bold;':''" v-for="(tab,index) in tabs">{{ tab.name }}
        </div>
        </TabLayout>
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
        {name: '预约记录', url: '/student/record'}
    ],
    tableData: [
        {res_time: '2024-06-13 14:00 - 18:00', res_seat: 'AW100', order_time: '2024-06-05 13:50', state: '待签到', notes: '已超时，请尽快签到'},
        {res_time: '2024-06-13 16:00 - 18:00', res_seat: 'AW213', order_time: '2024-06-05 13:52', state: '待签到', notes: '预约时间临近，请尽快签到'},
        {res_time: '2024-06-15 14:00 - 18:00', res_seat: 'AE158', order_time: '2024-06-09 21:26', state: '待签到', notes: '无'},
        {res_time: '2024-06-17 09:00 - 10:00', res_seat: 'BE92', order_time: '2024-06-08 20:00', state: '待签到', notes: '无'},
    ]
    };
},
methods: {
    signIn(index, row) {
        for (let item of this.rows) {
            // if (item.id === row.id) {
            if (item === row) {
                item.state = "已签到";
            }
        }
        this.$forceUpdate();
        this.$message({
            message: '签到成功',
            type: 'success'
        });
    },
    handleDelete(index, row) {
    request.post('/admin/deleteArticle', {
        id: this.rows[index].id
    }).then(res => {
        for (let item of this.rows) {
            // if (item.id === row.id) {
            if (item === row) {
                this.rows.splice(this.rows.indexOf(item), 1)
            }
        }
        this.$message({
            message: '取消成功',
            type: 'success'
        });
    })
    },
    checkAndDeleteItems () {
        // 创建一个 Date 对象
        let currentDate = new Date();
        // 获取当前时间的年、月、日、时、分、秒
        let year = currentDate.getFullYear().toString();
        let month = (currentDate.getMonth() + 1).toString().padStart(2, '0'); // 月份补足为两位数
        let day = currentDate.getDate().toString().padStart(2, '0'); // 日补足为两位数
        let hours = currentDate.getHours().toString().padStart(2, '0'); // 小时补足为两位数
        let minutes = currentDate.getMinutes().toString().padStart(2, '0'); // 分钟补足为两位数
        let seconds = currentDate.getSeconds().toString().padStart(2, '0'); // 秒补足为两位数
        // 当前时间
        let curr_date = "${year}${month}${day}";
        let curr_time = "${hours}:${minutes}:${seconds}";
        this.rows = this.rows.filter(item => {
            return (item.res_time.substring(0, 10).replace(/-/g, '') < curr_date) || item.res_time.substring(20, 17).replace(/-/g, '') < curr_date;/* 判断逻辑，返回 true 表示保留，false 表示删除 */
        })
    }
},
created() {
    // request.get('/public/getArea').then(res => {
    //     console.log(res);
    //     this.rows = res.rows;
    // })
    this.rows = this.tableData;
    // this.deletionInterval = setInterval(this.checkAndDeleteItems, 1000);
},
// beforeDestroy () {
//     clearInterval(this.deletionInterval)
// },
}
</script>

<style scoped>
div {
display: -webkit-box;
-webkit-box-orient: vertical;
-webkit-line-clamp: 50;
overflow: hidden;
}
.title {
    font-size: 20px;
    font-weight: bold;
    text-align: center;
}
.module {
    margin-top: 50px; /* 添加上边距 */
    margin-left: 50px;
    margin-right: 50px;
}
</style>  