<template>
  <div>
    <div>
      <div class="background1"></div>
      <LeftLayout :tabs="tabs" @changeTab="(cur)=>{active=cur}" class="background2">
        <div v-for="(tab, index) in tabs"
             :key="index"
             @click="()=>{active=index;if($route.path!==tab.url)$router.replace(tab.url)}"
             :style="index === active ? 'background:rgba(255,255,255,0.2);font-weight:bold;color:white' : 'color:white'">
          {{ tab.name }}
        </div>
      </LeftLayout>
    </div>
    <router-view class="background3"></router-view>
  </div>
</template>

<script>
import LeftLayout from "@/components/LeftLayout";

export default {
  name: "Main",
  components: { LeftLayout },
  data() {
    return {
      active: 0,
      tabs: [
        { name: '预约座位', url: '/student/seatre' },
        { name: '抢座', url: '/student/seat/reservation' },
        { name: '个人中心', url: '/student/announce' }
      ]
    }
  },
  methods: {
    getCurIndex() {
      for (let i = 0; i < this.tabs.length; i++) {
        if (this.$route.path.indexOf(this.tabs[i].url) !== -1) {
          return i;
        }
      }
      return 0;
    }
  },
  created() {
    this.active = this.getCurIndex();
    if (this.$route.path.indexOf('/student/seat') !== -1) {
      this.$router.replace('/student/seat/reservation');
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
  background-size: cover;
}

.background2 {
  width: 15vw;
  height: calc(100vh - 15vw);
  background-image: url("../assets/login.png");
  background-size: cover;
  display: flex;
  flex-direction: column;
  justify-content: start;
  padding-top: 1vw;
}

.background2 div {
  padding: 10px;
  cursor: pointer;
}

.background2 div:hover {
  background-color: rgba(255, 255, 255, 0.1);
}

.background3 {
  margin-left: 15vw;
  padding: 20px;
  overflow: auto;
}
</style>
