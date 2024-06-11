import Vue from 'vue';
import App from './App.vue';
import router from './router';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import Vant from 'vant';
import 'vant/lib/index.css';
import VueI18n from 'vue-i18n'; // 确保导入 vue-i18n
import en from './locales/en.json';
import zh from './locales/zh.json';

Vue.config.productionTip = false;

Vue.use(Vant);
Vue.use(ElementUI);
Vue.use(VueI18n);

const messages = {
  en: en,
  zh: zh
};

const i18n = new VueI18n({
  locale: 'zh', // 设置默认语言
  messages
});

function getUser() {
  return JSON.parse(localStorage.getItem('user'));
}

function timeStamp(value) {
  let date = new Date(value); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
  let year = date.getFullYear();
  let month = ("0" + (date.getMonth() + 1)).slice(-2);
  let sdate = ("0" + date.getDate()).slice(-2);
  let hour = ("0" + date.getHours()).slice(-2);
  let minute = ("0" + date.getMinutes()).slice(-2);
  let second = ("0" + date.getSeconds()).slice(-2);
  let result = year + "." + month + "." + sdate + " " + hour + ":" + minute; //+ ":" + second;
  // 返回
  return result;
}

Vue.prototype.$getUser = getUser;
Vue.prototype.$formatTime = timeStamp;

new Vue({
  router,
  i18n, // 将 i18n 添加到 Vue 实例中
  render: h => h(App)
}).$mount('#app');
