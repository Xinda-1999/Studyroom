<template>
  <div>
    <div>
      <div class = "background1">
      </div>
      <LeftLayout :tabs="tabs" @changeTab="(cur)=>{active=cur}" class="background2">
        <div v-for="(tab,index) in tabs"
             :style="index===active?'background:rgba(255,255,255,0.2);font-weight:bold; color:white':'color:white'">{{ tab.name }}
        </div>
      </LeftLayout>
    </div>

    <router-view class = "background3"></router-view>
  </div>
</template>

<script>
import LeftLayout from "@/components/LeftLayout";

export default {
  name: "Main",
  components: {LeftLayout},
  data() {
    return {
      active: 0,
      tabs: [
        {name: '座位管理', url: '/admin/seat/number'},
        // {name: '论坛管理', url: '/admin/forum'},
        {name: '个人中心', url: '/admin/announce'},
        {name: '学生管理', url: '/admin/student'},
        // {name: '老师管理', url: '/admin/teacher'},
        // {name: '统计分析', url: '/admin/statistics'},
      ]
    }
  }
}
</script>

<style scoped>
.background1 {
    height: 15vw;
    position: fixed;
    width: 15vw;
    background-image: url("../assets/login.png");
}

.background2 {
  background-image: url("../assets/login.png");
}

.background3 {
  margin-left: 15vw;

}
</style>
