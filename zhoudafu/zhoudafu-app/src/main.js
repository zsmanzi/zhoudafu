// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router/router'
import Vuex from 'vuex'
import 'mint-ui/lib/style.css'

//1、发送ajax请求获取服务端信息，引入模块
import axios from 'axios'
//2、跨域访问保存session值
axios.defaults.withCredentials=true;
//3、注册axios
Vue.prototype.axios=axios;


//1.引入指定组件
import {Header,Swipe,SwipeItem} from 'mint-ui'
//2.注册指定组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);


Vue.config.productionTip = false
Vue.use(Vuex);
var store=new Vuex.Store({
  state:{cartCount:0},
  mutations:{
    increment(state){state.cartCount++},
    substract(){state.cartCount++}
  },//购物车加减
  getters:{optCartCount:function(state){
    return state.cartCount;
  }}
})

//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'


/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>',
  store
})
