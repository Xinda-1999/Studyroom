<template>
  <div>
    <div>
      <div class="background1"></div>
      <LeftLayout :tabs="tabs" @changeTab="(cur)=>{active=cur}" class="background2">
        <div v-for="(tab,index) in tabs"
             :style="index===active?'background:rgba(255,255,255,0.2);font-weight:bold; color:white':'color:white'">{{ $t(tab.name) }}
        </div>
      </LeftLayout>
    </div>
    <div class="language-switcher">
      <button @click="switchLanguage('en')">English</button>
      <button @click="switchLanguage('zh')">中文</button>
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
        { name: 'seat_management', url: '/admin/seat/number' },
        { name: 'personal_center', url: '/admin/announce' },
        { name: 'student_management', url: '/admin/student' }
        // 添加其他选项卡时请确保在语言文件中包含相应的翻译
      ]
    }
  },
  methods: {
    switchLanguage(lang) {
      this.$i18n.locale = lang;
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

.language-switcher {
  position: fixed;
  top: 10px;
  right: 10px;
  z-index: 1000;
}

.language-switcher button {
  margin: 5px;
}
</style>
