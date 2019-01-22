<template>
    <div id="app-home">
        <!--首页头部-->
        <div id="header">
            <header class="mui-bar mui-bar-nav header">
                <a class="logo mui-action-back mui-icon mui-pull-left">
                    <img src="../img/LOGO.jpg">
                    <!--<img :src="img_url">-->
                </a>   
                <div class="search">
                    <input type="text" placeholder="请输入要搜索的内容"/>
                    <img src="../img/search.png" class="btn">
                    <!--<img :src="btn_url" class="btn">-->
                </div>
               <!-- <div><a href="">注册</a></div>-->
               <div class="r_menu">
                    <a class="mui-icon mui-icon-bars mui-pull-right menu" @click="showToggle">         
                    </a>
                    <ul class="amenu" v-show="isShow">
                        <li><router-link to="/Register">注册</router-link></li>  
                        <li><router-link to="/Login">登录</router-link></li>           
                    </ul>
                </div>
            </header>
            <div></div>
        </div> 
        <!--轮播图-->
        <mt-swipe :auto="3000">
            <mt-swipe-item v-for="item in banner" :key="item.id">
                <img :src="item.img_url"/>
            </mt-swipe-item>
        </mt-swipe>
        <!--首页内容1：导航-->
        <div class="card">
            <!--<div><span>全部商品</span></div>
            <div><span>积分商城</span></div>
            <div><span>新品汇</span></div>
            <div><span>商品核验</span></div>
            <div><span>发票管家</span></div>-->
            <ul>
                <li><router-link to="/Goodslist"><img src="../img/goods.png">
                <span>全部商品</span>
                </router-link></li>
                <li><router-link to=""><img src="../img/inregral.png">
                <span>积分商城</span>
                </router-link ></li>
                <li><router-link to=""><img src="../img/news.png">
                <span>新品汇</span>
                </router-link></li>
                <li><router-link to=""><img src="../img/check.png">
                <span>商品核验</span>
                </router-link></li>
                <li><router-link to=""><img src="../img/bill.png">
                <span>发票管家</span>
                </router-link></li>     
            </ul>        
        </div>
        <!--首页内容1：今日金价-->
        <div class="price">                
            <div class="p">
                <img src="../img/j-price.png"><p>今日金价：
                    
                </p>
            </div> 
            <ul>
                <li v-for="g in gold" v-if="g.gid==i">{{g.gtitle}}：<span>￥{{g.gprice}}</span>元/克</li>
            </ul>
            <div class="more">查看更多</div>
        </div> 
        <!--首页内容2：产品展示-->
        <div class="mui-content">
			<div class="mui-content-padded" >
               
				<p>
                    <a>
                        <img :src="product[0].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[1].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[2].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[3].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[4].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a><img :src="product[5].btn_url" data-preview-src="" data-preview-group="1" /></a>
				</p>
                <p>
					<a>
                        <img :src="product[6].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[7].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[8].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[9].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[10].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[11].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[12].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[13].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[14].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[15].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[16].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[17].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[18].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[19].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[20].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[21].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[22].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[23].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[24].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[25].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[26].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[27].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[28].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[29].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[30].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
				</p>
                <p>
					<a>
                        <img :src="product[31].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[32].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[33].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[34].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[35].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[36].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[37].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[38].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[39].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[40].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[41].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>
                    <a>
                        <img :src="product[42].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                  
				</p>
                <p>
					<a>
                        <img :src="product[43].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                
				</p>
                <p>
					<a>
                        <img :src="product[44].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                
				</p>
                <p>
					<a>
                        <img :src="product[45].btn_url" data-preview-src="" data-preview-group="1" />
                    </a>                
				</p>
                <p>               
				</p>
			</div>
            
		</div>
        <!--首页底部-->
        <nav class="mui-bar mui-bar-tab">
			<router-link to="/" class="mui-tab-item mui-active" >
				<img src="../img/nav_home1.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">首页</span>
			</router-link>
			<router-link class="mui-tab-item" href=""  to="/Goodslist">
				<img src="../img/nav_product1.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">全部商品</span>
			</router-link>
            <router-link to="/Shopcart" class="mui-tab-item" >
				<img src="../img/nav_shopping1.png" class="mui-icon mui-icon-extra mui-icon-extra-cart"><span class="mui-badge">0</span>
				<span class="mui-tab-label">购物车</span>
			</router-link>
			<router-link to="/Personalcenter" class="mui-tab-item">
				<img src="../img/nav_user1.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">用户中心</span>
			</router-link>
            <router-link to="/" class="mui-tab-item" >
				<img src="../img/nav_service1.png"  class="mui-icon mui-icon-home">
				<span class="mui-tab-label">联系客服</span>
			</router-link>
		</nav>
    </div>
</template>
<script>
export default {
    data() {
        return {
            //存储轮播数据
            banner:[],
            //存储金价数据
            gold:[],
            //
            i:1,
            n:0,
            product:[
                {btn_url:"http://localhost:3000/images/WAP_640_11620_01.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_02.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_03.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_04.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_05.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_06.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_07.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_08.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_09.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_10.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_11.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_12.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_13.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_14.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_15.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_16.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_17.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_18.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_19.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_20.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_21.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_22.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_23.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_24.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_25.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_26.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_27.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_28.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_29.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_30.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_31.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_32.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_33.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_34.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_35.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_36.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_37.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_38.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_39.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_40.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_41.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_42.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_43.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_44.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_45.jpg"},
                {btn_url:"http://localhost:3000/images/WAP_640_11620_46.jpg"},
            ],
            btnText:"隐藏",
            isShow:false
        }
    },
    //实例创建成功后调用方法
    created() {
        //当组建对象创建成功后发送ajax请求
        this.getImages();
        this.getGold();
        this.time();
        // this.getIproduct();
        
    },
    methods: {
        //获取服务器端轮播图图片的方法    
        getImages(){
            //1、发送ajax请求
            var url="http://127.0.0.1:3000/getImages";
            this.axios.get(url).then(result=>{
                this.banner=result.data;
            })
            //2、获取放回数据保存banner
            //console.log(123)
        },
        //获取金价数据
        getGold(){
            var url="http://127.0.0.1:3000/getGold";
            this.axios.get(url).then(result=>{
                this.gold=result.data;
                this.n=this.gold.length;
            })
        },
        time(){           
            setInterval(()=>{
                this.i++;
                if(this.i==this.n){
                    this.i=1;
                }
            },5000);
        },
        //菜单的点击显示隐藏
        showToggle(){
            this.isShow=!this.isShow;
            if(this.isShow){
                this.btnText="隐藏"
            }else{
                this.btnText="显示"
                 
            }
        }
    },
}
</script>
<style>
    #app-home #header{
        width:100%;
        height:44px;
    }
    #app-home #header .logo{
        width:20%; 
    }
    #app-home #header .logo img{
        width:100%;
        height:30px; 
        margin:auto;
    }
    #app-home #header .search input[type='text']{
        width:70%;
        height:30px;
        border-radius:1rem;
        font-size:.12rem;
        position: relative; 
        top:0.5rem;        
    }
    #app-home #header .search .btn{       
		position: absolute;
        width:18px;
        height:18px;
        right: 3.2rem;
        top: 0.9rem;
    }
    #app-home #header .mui-bar{
        background-color:#9e0028;
        padding:0;
    }
    #app-home #header .menu{
        width:10%;
        position:absolute;
        top:.1rem;
        right:.3rem;
    }
    #app-home #header .mui-bar-nav{
        box-shadow:0 0 0 ;
    }
    #app-home #header .mui-bar-nav.mui-bar .mui-icon{
        margin:0;
        padding-top:7px;
    }
    #app-home .mui-icon-bars:before{
        color:#fff;
        z-index:100;
    }
    #app-home .mint-swipe{
        height:200px;
    }
    #app-home .mint-swipe img{
        width:100%;
    }
    #app-home .mint-swipe-indicator.is-active{
        background-color:#9e0028;
        opacity:1;
    }
   /*#app-home .card{

    }*/
    #app-home .card{
        width:100%;
        height:80px;
        margin:0;    
        position:relative;
    }
    #app-home .card  ul{
        width:100%;
        height:100px;
        list-style:none;
       display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
        padding:0;
        margin:1rem 0;
    }
    #app-home .card  ul li{
        float:left;
        text-align:center;
        width:20%; 
        
    }
    #app-home .card  a{      
        height:100px;
    }
    #app-home .card  img{    
        width:46px;
        height:46px;   
        /*margin:0 1.15rem;  */    
    }
    #app-home .card  span{
        display:block;
        width:100%;
        font-size:8px;
        color:#000;
        text-align:center;
    }
    #app-home .price{
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between; 
        border-top:1px solid #d5d5d5;
        border-bottom:1px solid #d5d5d5;
        padding:.3rem;
    }
    #app-home .price img{
        width:10px;
        height:8px;
        margin-right:.3rem;
    }
    #app-home .price  p{
        display:inline;
        font-size:.14rem;
        margin:auto 0;
        color:#000;
    }
    #app-home .price .more{
        font-size:.14rem;
        margin:auto 0;
    }
    #app-home .price span{
        font-weight:900;
        color:#9e0028;
    }
    #app-home .price ul{
        margin:0;
        padding:0;
        height:14px; 
        margin-left:-5.5rem;
    }
    #app-home .price ul li{
        font-size:.14rem;
        height:14px; 
    }
    #app-home .mui-content-padded{
        margin:1rem 0 0 0;
    }
    #app-home .mui-content-padded p{
        margin:0 0 -6px 0;
    }
    #app-home .mui-content-padded p{   
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;      
    }
    #app-home .mui-content-padded p:last-child{
        height:55px;
    }
    #app-home .mui-content-padded img:first-child{
        width:100%;     
    }

    #app-home .mui-bar-tab .mui-tab-item{
        position:relative;
    }
    #app-home .mui-bar-tab .mui-tab-item.mui-active{
        color:#9e0028;
    }
    #app-home .mui-bar-tab .mui-badge{
        position:absolute;
        right:.5rem;
        color:#fff;
        background-color:#9e0028;
    }
    #app-home .mui-bar-tab img{
        width:40px;
        height:30px;   
    }
    
    #app-home .price  li{
        /*position:relative;*/
        transform:(1,0,0,360deg);
        -webkit-transform:rotate(1,0,360deg);
        -moz-transform:rotate(1,0,360deg);
        transition:all  3s linear 0s;
        -webkit-transition:all  5s linear 0s;
    }
    #app-home .r_menu ul{
        position:absolute;
        right:0;
        top:2.75rem;
        margin:0;
        padding:.5rem 0;
        width:50px;
        height:60px;
        background:rgba(158,0,40,1);
        font-size:.14rem;
        text-align:center;
    }
    #app-home .r_menu ul a{
        color:#fff;
    }
</style>
