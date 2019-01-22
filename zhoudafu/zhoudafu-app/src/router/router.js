import Vue from 'vue'
import Router from 'vue-router'

//1.引入自定义组件
import Home from "../components/Home.vue"
import Register from "../components/Register.vue"
import Login from "../components/Login.vue"
import Shopcart from "../components/Shop_cart.vue"
import Productdetail from "../components/Product_detail.vue"
import Personalcenter from "../components/Personal_center.vue"
import Goodslist from "../components/Goods_list.vue"
import Shopspe from "../components/Shop_spe.vue"

Vue.use(Router)

export default new Router({
  routes: [
    {path:'/',component:Home},
    {path:'/Register',component:Register},
    {path:'/Login',component:Login},
    {path:'/Shopcart',component:Shopcart},
    {path:'/Productdetail/:id',component:Productdetail},
    {path:'/Personalcenter',component:Personalcenter},
    {path:'/Goodslist',component:Goodslist},
    {path:'/Shopspe',component:Shopspe},
  ]
})