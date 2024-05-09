<!-- <template>
  <el-table
      :data="rows" :row-style="{height: '40px'}"
      style="width: 100%">
    <el-table-column
        label="标题"
        width="180">
      <template slot-scope="scope">
        <div>{{ scope.row.title }}</div>
      </template>
    </el-table-column>
    <el-table-column
        label="内容"
        width="180">
      <template slot-scope="scope">
        <div>{{ scope.row.content }}</div>
      </template>
    </el-table-column>
    <el-table-column
        label="时间">
      <template slot-scope="scope">
        <div>{{ $formatTime(scope.row.datetime) }}</div>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template slot-scope="scope">
        <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)">删除
        </el-button>
      </template>
    </el-table-column>
  </el-table>
</template> -->

<template>
  <div>
    <!-- <el-form style="padding: 1em" :inline="true" class="demo-form-inline" label-width="120px"> -->
    <el-form>
      <br><br><br><br>
      <el-form-item label="个人信息" label-width="570px" style="font-weight: bold"></el-form-item>
      <el-form-item label="学工号" label-width="400px">
        <el-input v-model="number" placeholder="23210000001" style="width: 300px"></el-input>
      </el-form-item><br>
      <el-form-item label="用户名" label-width="400px">
        <el-input v-model="username" placeholder="王五" style="width: 300px"></el-input>
      </el-form-item><br>
      <el-form-item label="密码" label-width="400px">
        <el-input v-model="password" placeholder="*********" style="width: 300px"></el-input>
      </el-form-item><br>
      <el-form-item label=" " label-width="500px">
        <el-button type="primary" @click="add">修改</el-button>
      </el-form-item><br>
    </el-form>
    <!-- <el-table
        :data="rows" :row-style="{height: '40px'}"
        class="background">
      <el-table-column
          label="学号"
          width="180">
        <template slot-scope="scope">
          <div>{{ scope.row.number }}</div>
        </template>
      </el-table-column>
      <el-table-column
          label="姓名"
          width="180">
        <template slot-scope="scope">
          <div>{{ scope.row.username }}</div>
        </template>
      </el-table-column>
      <el-table-column
          label="信用分">
        <template slot-scope="scope">
          <div>{{ scope.row.score }}</div>
        </template>
      </el-table-column>
      <el-table-column
          label="重置密码">
        <template slot-scope="scope">
          <div style="display: flex;align-items: center">
            <input :id="'input'+scope.$index" type="text"></input>
            <el-button
                size="mini"
                @click="remarkPwd(scope.$index, scope.row)">重置
            </el-button>
          </div>

        </template>
      </el-table-column>
      <el-table-column
          label="操作">
          <el-button
              size="mini"
              @click="">删除
          </el-button>
      </el-table-column>

    </el-table> -->
  </div>

</template>

<script>
import request from "@/req";

export default {
  name: "AnnounceManagement",
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
  -webkit-line-clamp: 50;
  overflow: hidden;
}
</style>
