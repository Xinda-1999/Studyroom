<template>
    <div>
      <!-- <el-form style="padding: 1em" :inline="true" class="demo-form-inline" label-width="120px"> -->
        <el-form>
        <br><br><br><br>
        <p class="title">个人信息</p><br>
        <!-- <el-form-item label="个人信息" label-width="670px" class="title-form-item"></el-form-item> -->
        <el-form-item label="学工号" label-width="500px">
          <el-input v-model="number" placeholder="23210000001" style="width: 300px"></el-input>
        </el-form-item><br>
        <el-form-item label="用户名" label-width="500px">
          <el-input v-model="username" placeholder="王五" style="width: 300px"></el-input>
        </el-form-item><br>
        <el-form-item label="密码" label-width="500px">
          <el-input v-model="password" placeholder="*********" style="width: 300px"></el-input>
        </el-form-item><br>
        <el-form-item label=" " style="text-align: center">
          <el-button type="primary" @click="add">修改</el-button>
        </el-form-item><br><br><br><br><br><br><br>
      </el-form>
    </div>
  </template>

  
  <script>
  import request from "@/req";
  
  export default {
    name: "UserManagement",
    data() {
      return {
        rows: null,
      }
    },
    methods: {
      handleDelete(index, row) {
        request.post('/admin/deleteArticle', {
          id: this.rows[index].id
        }).then(res => {
          for (let item of this.rows) {
            if (item.id === row.id) {
              this.rows.splice(this.rows.indexOf(item), 1)
            }
          }
          this.$message({
            message: '删除成功',
            type: 'success'
          });
        })
      }
    },
    created() {
      request.get('/forum/getAnnounce').then(res => {
        console.log(res);
        this.rows = res.rows
      })
    }
  }
  </script>
  
  <style scoped>
  div {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 100;
    overflow: hidden;
  }
  .title {
    font-size: 20px;
    font-weight: bold;
    text-align: center;
  }
  </style>
  
