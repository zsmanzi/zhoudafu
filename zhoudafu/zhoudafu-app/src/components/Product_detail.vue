<template >
    <div id="product">
        <div id="header">
            <header class="mui-bar mui-bar-nav header">
                 <router-link to="Goodslist" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>  
                <ul>
                    <li><a class="active">商品</a></li>
                    <li><a>详情</a></li>
                    <li><a>评价</a></li>
                </ul>
                <a class="home">
                    <img src="../img/product-home.png" alt="">
                </a>
            </header>
            <div></div>
        </div> 
        <!--轮播图-->
        <mt-swipe :auto="0">
            <mt-swipe-item v-for="(item,index) in list" :key="index">
                <img :src="item"/>
            </mt-swipe-item>
        </mt-swipe>
        <div  v-for="(item,index) in detail" :key="index">
            <section class="s_price">
                <div class="title">{{item.title}}</div>
                <div class="d_price">推广价：<span>￥{{item.price.toFixed(2)}}</span></div>
                <div class="d_sales">
                    <span>吊牌价：<em>￥{{item.dprice.toFixed(2)}}</em></span>
                    <span>全网月销：{{item.sales}}</em>件</span>
                </div>
            </section>
            <section class="s_serve">
                <div>
                    服务：
                    <span class="img1"><img src="../img/product-free-clean.png" alt=""></span>
                    <span class="img2"><img src="../img/product-free-express.png" alt=""></span>
                </div>
                
            </section>
            <section class="s_select">
                <img src="../img/prc-b.png">
                <p> 我的选择</p>
                
                <div class="select" v-for="(item,index) in detail_sel" :key="index">
                {{item.title1}}<span>{{item.value1}}</span>{{item.title2}}<span>{{item.value2}}</span>{{item.title3}}<span>{{item.value3}}</span>
                </div>
                <img @click="msg" class="icon" src="../img/product-select-more.png">  
            </section>
            <section class="s_detail">
                <div class="detail">
                    <img src="../img/prc-txt.png">
                    <div class="d_detail">
                        详细参数
                    </div>
                    <img src="../img/prc-j.png">
                </div>
                <ul  >
                    <li v-for="(item,index) in detail_pra" :key="index">
                        <span>{{item.title1}} </span>{{item.value1}}
                        <span>{{item.title2}} </span>{{item.value2}}
                        <span>{{item.title3}} </span>{{item.value3}}
                        <span>{{item.title4}} </span>{{item.value4}}
                        <span>{{item.title5}} </span>{{item.value5}}
                        <span>{{item.title6}} </span>{{item.value6}}
                        <span>{{item.title7}} </span>{{item.value7}}
                        <span>{{item.title8}} </span>{{item.value8}}
                        <span>{{item.title9}} </span>{{item.value9}}
                        <span>{{item.title10}} </span>{{item.value10}}
                        <span>{{item.title11}} </span>{{item.value11}}
                        <span>{{item.title12}} </span>{{item.value12}}
                        <span>{{item.title13}} </span>{{item.value13}}
                        <span>{{item.title14}} </span>{{item.value14}}
                        <span>{{item.title15}} </span>{{item.value15}}
                    </li>
                </ul>
            </section>
            <section class="detail_img"  v-for="(item,index) in detail_img" :key="index">
                <img :src="item">
            </section>
        </div>
        <nav class="mui-bar mui-bar-tab foot">
			
            <router-link to="/Shopcart" class="mui-tab-item" >
				<img src="../img/product-cart.png" class="mui-icon mui-icon-extra mui-icon-extra-cart">
				<span class="mui-tab-label">购物车</span>
			</router-link>
			
            <router-link to="/" class="mui-tab-item" >
				<img src="../img/product-kefu.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">客服</span>
			</router-link>
            <router-link to="/" class="mui-tab-item" >
				<img src="../img/product-like.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">收藏</span>
			</router-link>
			<a class="mui-tab-item join"   @click.prevent="addCart" >	
				<span class="mui-tab-label">加入购物车</span>
			</a>
            <router-link to="" class="mui-tab-item buy">
				<span class="mui-tab-label">立即购买</span>
			</router-link>
		</nav>
        <div class="mask" v-show="mShow"  @touchmove.prevent>
            <div class="cover"></div>
            <div class="modal">
                <div class="modal_h">
                    <div class="model_select">
                        
                        <p> <img class="img1" src="../img/prc-b.png">我的选择</p>
                        <img class="close" @click="close" src="../img/product-close.png">
                    </div>
                    <!-- <div class="check" >
                        已选：<p  v-for="(item,index) in detail_sel" :key="index">
                       {{item.title1}}
                        <span>{{item.value1}}</span>
                        {{item.title2}}
                        <span>{{item.value2}}</span>
                        </p>
                    </div>
                    <div class="type">
                        {{item.title1}}
                        <span>{{item.value1}}</span>
                        <span class="active">{{item.value1}}</span>
                    </div>-->
                    <div class="num">数量：
                    <button @click="sub">-</button>
                    <input type="text" name="num"  placeholder="1" value="1" v-model="val"/>
                    <button @click="add">+</button>
                    <p><span>200</span>库存</p>
                </div>
                </div> 
                <div  class="modal_f">
                    <a class="join"   @click="addCart">	
                        <span class="l">加入购物车</span>
                    </a>
                    <a class="buy">
                        <span class="">立即购买</span>
                    </a>
                </div>  
                 
            </div>
        </div>   
    </div>
</template>
<script>
import {Toast} from 'mint-ui';
export default {
    data() {
        return {
            id:this.$route.params.id,
            list:[],
            detail:[],
            detail_sel:[],
            detail_img:[],
            detail_pra:[],
            mShow:false,
            val:1,
            
        }
    },
    methods: {
        addCart(){
            var uid=1;
            var pid=this.id;
            var count=this.val;
            var price=99;
            var url="http://localhost:3000/addCart";
            this.axios.get(url,
            {params:{
                    uid:uid,
                    pid:pid,
                    count:count,
                    price:price
                }
            }).then(result=>{
                console.log(result);
                if(result.data.code>0){
                    Toast(result.data.msg);
                }else{
                    Toast(result.data.msg);
                }
            })
        },
        getlist(){
            var url="http://localhost:3000/getDetail?id="+this.id;
            this.axios.get(url).then(result=>{
                //console.log(result.data)
                var a=JSON.parse(result.data[0].img_url);
                this.list=a;
                //console.log(this.list)    
            })
        },
        getProductetail(){
            //console.log(this.id)
            var id=this.id;
            var url="http://localhost:3000/getProductetail?id="+id;
            this.axios.get(url).then(result=>{
                console.log(result);
                this.detail=result.data;
                //console.log(this.detail);
                var s=JSON.parse(result.data[0].sel);             
                this.detail_sel=s;
                //console.log(this.detail_sel);
                var i=JSON.parse(result.data[0].img);             
                this.detail_img=i;
                var p=JSON.parse(result.data[0].pra);
                this.detail_pra=p;          
            })
        },
        msg:function(){
            this.mShow=true;
        },
        close:function(event){
            this.mShow=false;
        },
        sub(){
            if(this.val>1){
                this.val--;
            }
        },
        add(){
            if(this.val<1000){
                this.val++;
            }
        }
    },
     created() {
        this.getlist();
        this.getProductetail();
    },
}
</script>
<style>
    #product{
        position:relative;
    }
    #product #header{
        width:100%;
        height:50px;
        position:relative;
    }
    #product #header .mui-bar{
        background-color:#fff;
        height:50px;
        padding:0;
    }
    #product #header .mui-bar-nav{
        box-shadow:0 0 0 ;
        border-bottom:1px solid #d3d3d3;
    }
    #product #header .header{
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
    }
    #product #header ul{
        margin:0;
        padding:0;
        -webkit-padding-start: 0px;
        height:50px;
    }
    #product #header ul li{
        float:left;
        height:50px;
        line-height:50px;
        text-align:center;
        padding:0 1.5rem;
    }
    #product #header ul li a{
        color:#333;
        font-size:1.2rem;
        padding-bottom:.2rem;
        
    }
    #product #header ul li a.active{
        border-bottom:2px solid #9e0028;
    }
    #product .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#666666;
        z-index:100;
        margin-left:.5rem;
    }
    #product #header .home img{
        width:33px;
        height:30px;
        margin-top:.6rem;
        margin-right:.5rem;
    }
     #product .mint-swipe{
        height:375px;
    }
    #product .mint-swipe img{
        width:100%;
    }
    #product .mint-swipe-indicator.is-active{
        background-color:#9e0028;
        opacity:1;
    }
    #product section{
        border-top:1px solid #d3d3d3;
        border-bottom:1px solid #d3d3d3;
        padding:1rem .5rem;   
    }
    #product section div.d_price{
        padding:.5rem 0;
        font-size:.14rem;
    }
    #product section div.d_price span{
        font-size:1rem;
        color:#9e0028;
        font-weight:900;
    }
    #product section div.d_sales{
        font-size:.14rem;
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
    }
    #product section div.d_sales em{
        font-style:normal;
        text-decoration:line-through;
    }
    #product section.s_serve{
        font-size:.14rem;
        position:relative;
    }
    #product section.s_serve img{
        width:64px;
        height:22px;
        border:1px solid #d3d3d3;
        border-radius:.1rem;   
    }
    #product section.s_serve span.img1{
        position:absolute;
        top:1rem; 
    }
    #product section.s_serve span.img2{
        position:absolute;
        top:1rem;
        left:8rem;
    }
    #product section.s_select{
        font-size:.14rem;
        display:flex;
        flex-wrap:nowrap;
        justify-content:flex-start;
        position:relative;
    }
    #product section.s_select p{
        color:#000;
    }
    #product section.s_select .select{
        padding-left:.5rem;
    }
    #product section.s_select img{
        width:18px;
        height:19px;
    }
    #product section.s_select img.icon{
        position:absolute;
        top:1rem;
        right:1rem;
    }
    #product section.s_select span{
        color:#9e0028;
    }
    #product section.s_detail .detail{
        display:flex;
        flex-wrap:nowrap;
        justify-content:flex-start;
    }
    #product section.s_detail .detail .d_detail{
        margin-right:15.5rem;
    }
    #product section.s_detail img{
        width:18px;
        height:19px;
        font-size:.14rem;
        
    }
    #product section.s_detail ul{
        margin:0;
        padding:0;
        width:100%;
        -webkit-padding-start: 0px;
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        font-size:.14rem;
    }
    #product section.s_detail ul li{
        width:50%;
        display:block;
        margin:.5rem 0;
        overflow:hidden;
    }
    #product .detail_img,.detail_img img{
        width:100%;
    }
    #product .foot span{
        font-size:11px;
       
    }
    #product .foot .join{
        color:#fff;
        background-color:#ffb03f;
    }
    #product .foot .buy{
        color:#fff;
        background-color:#9e0028;
    }
    #product .mask{
        position:fixed;
        left:0;
        top:0;
        width:100%;
        height:100%;
        z-index:100;
    }
    #product .cover{ 
        /*底层遮罩元素*/
        position:fixed;/*元素的定位类型*/
        left:0px;
        top:0px;
        background:rgba(0, 0, 0, 0.6);
        width:100%;  /*宽度设置为100%，这样才能使隐藏背景层覆盖原页面*/
        height:100%;
        opacity:0.6;/*透明度*/
        z-Index:999;  /*层级关系*/
    }
    #product .modal{ 
        position:fixed;
        width:100%;
        height:400px;
        bottom:0;
        background-color:#fff;
        z-Index:1000;
         
        font-size:.14rem;
    }
    #product .modal .modal_h{
        padding:0 .5rem;
    }
    #product .modal img.img1{
        width:18px;
        height:19px;
        margin-right:.5rem;
    }
    #product .modal p{
        color:#000;
    }
    #product .modal img.close{
        width:28px;
        height:28px;
    }
    #product .model_select{
        display:flex;
        justify-content:space-between;
    }
    #product .check{
        border-top:1px solid #cfcfcf;
        border-bottom:1px solid #cfcfcf;
    }
    #product .check span{
        color:#9e0028;
    }
    #product .modal p{
        display:inline;
    }
    #product .modal input{
        width:15%;
        height:34px;
        font-size: 14px;
        line-height: 34px;
        display: inline-block;
        margin: 0;
        padding:0;
        cursor: pointer;
        text-align:center;
    }
    #product .modal .modal_h>div{
        padding:1rem 0;
    }
    #product .modal .type span{
        border:1px solid #c7c7c7;
        border-radius:3px;
        padding:.5rem;
    }
    #product .modal .type span.active{
        border:1px solid #9e0028;
    }
    #product .modal button{
        background:#eee;
    }
    #product .modal .num span{
        color:#9e0028;
    }
    #product .modal a{
        display:block;
        float:left;
        padding:1.3rem;
        text-align:center;
        margin-top:6rem;
        font-size:1rem;
    }
    #product .modal_f  .join{
        width:50%;
        background-color:#ffb03f;
        color:#fff;
    }
    #product .modal_f  .buy{
        width:50%;
        background-color:#9e0028;
        color:#fff;
    }
</style>