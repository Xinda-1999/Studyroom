<template>
  <div>
    <el-form style="padding: 1em" :inline="true" class="demo-form-inline">
      <el-form-item :label="$t('studentId')">
        <el-input v-model="number" :placeholder="$t('studentId')"></el-input>
      </el-form-item>
      <el-form-item :label="$t('username')">
        <el-input v-model="username" :placeholder="$t('username')"></el-input>
      </el-form-item>
      <el-form-item :label="$t('password')">
        <el-input v-model="password" :placeholder="$t('password')"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="add">{{ $t('add') }}</el-button>
      </el-form-item>
    </el-form>
    <el-table
        :data="rows" :row-style="{height: '40px'}"
        class="background">
      <el-table-column
          :label="$t('studentId')"
          width="180">
        <template slot-scope="scope">
          <div>{{ scope.row.number }}</div>
        </template>
      </el-table-column>
      <el-table-column
          :label="$t('username')"
          width="180">
        <template slot-scope="scope">
          <div>{{ scope.row.username }}</div>
        </template>
      </el-table-column>
      <el-table-column
          :label="$t('resetPassword')">
        <template slot-scope="scope">
          <div style="display: flex;align-items: center">
            <input :id="'input'+scope.$index" type="text"></input>
            <el-button
                size="mini"
                @click="remarkPwd(scope.$index, scope.row)">{{ $t('reset') }}
            </el-button>
          </div>
        </template>
      </el-table-column>
      <el-table-column
          :label="$t('actions')">
        <template slot-scope="scope">
          <el-button
              size="mini"
              @click="deleteUser(scope.row)">{{ $t('delete') }}
          </el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import request from "@/req";

export default {
  name: "Management",
  data() {
    return {
      rows: null,
      username: null,
      password: null,
      number: null,
    }
  },
  methods: {
    add() {
      request.post('/public/register', {
        number: this.number,
        password: this.password,
        username: this.username,
        type: 0
      }).then(res => {
        this.$message({
          message: this.$t('addSuccess'),
          type: 'success'
        });
        this.number = ''
        this.username = ''
        this.password = ''
        this.update()
      })
    },
    remarkPwd(index, row) {
      this.$nextTick(() => {
        let input = document.getElementById('input' + index);

        request.post('/admin/updatePwd', {
          uid: row.uid,
          password: input.value
        }).then(res => {
          input.value = ''
          this.$message({
            message: this.$t('updateSuccess'),
            type: 'success'
          });
        })
      });

    },
    update() {
      request.get('/admin/getUser').then(res => {
        console.log(res);
        this.rows = res.rows
      })
    },
    deleteUser(row) {
      // 假设你有一个删除用户的接口
      request.post('/admin/deleteUser', { uid: row.uid }).then(res => {
        if (res.code === 200) {
          this.$message({
            message: this.$t('deleteSuccess'),
            type: 'success'
          });
          this.update();
        } else {
          this.$message({
            message: this.$t('deleteFailed'),
            type: 'error'
          });
        }
      }).catch(error => {
        console.error('删除请求失败:', error);
        this.$message({
          message: this.$t('deleteFailed'),
          type: 'error'
        });
      });
    }
  },
  created() {
    this.update()
  }
}
</script>

<style scoped>
div {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}

input {
  border-top: none;
  border-left: none;
  border-right: none;
  border-bottom: #102438 solid 1px;
  width: 10em;
}

.background {
  background-image: url("../assets/background.webp");
}
</style>
