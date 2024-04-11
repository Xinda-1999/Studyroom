<template>
  <div>
    <el-menu :default-active="activeIndex" class="el-menu-demo" mode="horizontal">
      <el-menu-item index="1" @click="()=>{if ($route.path!=='/admin/seat/number')
        $router.replace('/admin/seat/number')}">座位预约记录
      </el-menu-item>
      <el-menu-item index="2" @click="()=>{if ($route.path!=='/admin/seat/crud')
        $router.replace('/admin/seat/crud')}">座位管理
      </el-menu-item>
    </el-menu>
    <div class="line"></div>
    <router-view class = "background"></router-view>

  </div>
</template>

<script>

export default {
  name: "SeatManagement",
  data() {
    return {
      activeIndex: '1'
    }
  },
  methods: {},
  created() {
    if (this.$route.path === '/admin/seat/crud') {
      this.activeIndex = '2'
    }
  }
}
</script>

<style scoped>

.background3 {
  background-image: url("../assets/background.webp");
}

</style>
