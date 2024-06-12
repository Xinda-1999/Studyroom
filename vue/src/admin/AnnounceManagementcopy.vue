<template>
  <div>
    <!-- <el-form style="padding: 1em" :inline="true" class="demo-form-inline" label-width="120px"> -->
    <el-form>
      <br><br><br><br>
      <!-- 用户输入 -->
      <el-form-item label="个人信息" label-width="570px" style="font-weight: bold"></el-form-item>
      <el-form-item label="学工号" label-width="400px">
        <!-- v-model是vue的一个指令,负责在表单的控件元素和组件的属性实现数据的双向绑定与动态自动更新 -->
        <!-- v-model 实际上是语法糖，它等同于 :value 和 @input 的结合。 -->
        <el-input v-model="number" placeholder="23210000001" style="width: 300px"></el-input>
      </el-form-item><br>
      <el-form-item label="用户名" label-width="400px">
        <el-input v-model="username" placeholder="王五" style="width: 300px"></el-input>
      </el-form-item><br>
      <el-form-item label="密码" label-width="400px">
        <el-input v-model="password" placeholder="*********" style="width: 300px"></el-input>
      </el-form-item><br>

      <!-- 修改按钮 -->
      <el-form-item label=" " label-width="500px">
        <!-- 按了修改后会调用update函数 -->
        <el-button type="primary" @click="update">修改</el-button>
      </el-form-item><br>

    </el-form>
  </div>

</template>

<script>
import request from "@/req";

export default {
  // name: "AdminInfo",
  data() {
    return {
      number: "",
      username: "",
      password: "",
    }
  },
  methods: {
    
    // TODO:保存新的学工号、username、密码
    update(){                                                                                 // 把组件实例的属性的实际值更新到数据库
      // 必须要用chrome
      // 验证性输出
      alert("修改成功! 修改后结果如下:\n学工号:" + this.number + "\n用户名:" + this.username + "\n密码:" + this.password)     // alert只接受一个字符串, 所以彼此要用加号连接。不像console.log可以接受多个
      // 把三个值都存到数据库中去

    }
  },

  // TODO:读取学工号、username、密码.
  // 在创建的时候就将数据取来然后发给相应input框，get请求是从视图获取数据，所以一开始的载入窗口并不需要get
  // created函数是在methods之外的
  created(){
    this.number = "23210000001";
    this.username = "李明";
    this.password = "000000";
  },

}
</script>

<style>
body {
  background-color: #edffff;
}
</style>