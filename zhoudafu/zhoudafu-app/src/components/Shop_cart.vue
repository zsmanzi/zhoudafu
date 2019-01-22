<template lang="">
    <div id="shop_cart">
        <div>
            <header id="header" class="mui-bar mui-bar-nav">
                <router-link to="/" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
                <!--:to="{path:'/Productdetail',query:{id:data.id}}"-->
                <h1 class="mui-title">购物车</h1>
            </header>
            <div></div>
        </div>
        <section class="shop">
            <!--<div class="shop_k">
                <span>
                    <img src="../img/gwck.png">                  
                </span>
                <p>您的购物车当前没有任何商品哟~</p>
            </div>
            <div class="shop_a">
                <a>去首页</a>
                <a>我的收藏</a>
            </div>-->
            <div class="shop_list shop_on" v-for="item in list" :key="item.id">
                <div class="shop_head">
                    <span><img src="../img/chk1.png"></span>
                    <div class="title">{{item.name}}</div>
                    <em @click="jumpShop"><img src="../img/xg.png"></em>
                </div>
                <div class="shop_content">
                    <div class="shop_img">
                        <img :src="item.img_url" alt="">
                    </div>
                    <div class="shop_t">
                        <ul>
                            <li v-for="item in detail_pra" :key="item.id">
                                <span>{{item.value4}}</span>
                                <span>{{item.value3}}</span>
                                <span></span>
                            </li>
                           <!-- <li>
                                <span>工费;</span>
                                <span>￥48.00</span></li>-->
                        </ul>
                        <div class="shop_price">
                            <div><span class="shop_d">￥919.20</span></div>
                            <div class="shop_t"><span class="shop_p">￥904.80</span><span class="shop_n">X1</span></div>
                        </div>
                    </div>
                    
                </div>
                <div class="shop_foot">
                    <img src="../img/del.png" alt="删除">
                </div>
            </div>
            <div class="remove">
                <span>清空</span>
                <label>取消全选</label>
            </div>
        </section>
        <nav class="mui-bar mui-bar-tab">
			<div class="total">
                合计（免运费）
                <span>￥0.00</span>
            </div>
            <button value="0">去结算（0）</button>
		</nav>
    </div>
</template>
<script>
export default {
    data() {
        return {
            list:[],
                // {id:1,img_url:"http://localhost:3000/images/F63286.jpg"},
                // {id:2,img_url:"http://localhost:3000/images/F63286.jpg"},
            
            id:this.$route.params.id,
            detail_pra:[],
            detail_sel:[],
        }
    },
    methods: {
        jumpShop(){
            this.$router.push("/Shopspe");
        },
        getList(){
            var url="http://127.0.0.1:3000/getCartList";
            this.axios.get(url).then(result=>{
                console.log(result.data.data);
                this.list=result.data.data;
                var p=JSON.parse(result.data.data[0].pra);
                this.detail_pra=p;
                console.log(p);
                var s=JSON.parse(result.data.data[0].sel);             
                this.detail_sel=s;
                console.log(s);
            })
        },
    },
    created() {
        this.getList();
       
    },
}
</script>
<style >
    #shop_cart{
        background-color:#fff;
    }
    #shop_cart #header{
        width:100%;
        height:40px;
        position:relative;
    }
    #shop_cart #header.mui-bar{
        background-color:#9e0028;       
    }
    #shop_cart .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
    #shop_cart #header .mui-title{
        color:#fff;
    }
    #shop_cart .mui-bar .mui-icon{
        padding-top:8px;
    }
    #shop_cart .shop{
        margin:1rem;
    }
    #shop_cart .shop_k{
        width:100%;
        margin:3rem auto;
    }
    #shop_cart .shop_k img{
        width:100px;
        height:90px;        
    }
    #shop_cart .shop_k p{
        margin:1rem 0;
    }
    #shop_cart .shop_a a{
        width:5rem;
        height:2rem;
        line-height:2rem;
        border:.05rem solid #5e5e5e;
        font-size: .14rem;
        display:inline-block;
        text-align:center;
        color: #333;
        border-radius:.2rem;
     }
    #shop_cart nav{
        font-size:.14rem;
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
    }
    #shop_cart nav div.total{
        height:35px;
        margin:1rem 1rem;
    }
    #shop_cart nav button{
        height:35px;
        margin:.5rem 1rem;
    }
    #shop_cart nav .total span{
        color:#9e0028;
        font-size: 1rem;
    }
    #shop_cart .shop_list{
        border:.05rem solid #dddddd;
        border-radius:.3rem;
    } 
    #shop_cart .shop_on{
        border:.05rem solid #9e0028;
    } 
    #shop_cart .shop_list .shop_head{
        height:30px;
        text-align:left;
        font-size:.14rem;
        background-color:#f0f0f0;
        position:relative;
        padding-left:3rem;
        border-bottom:.01rem solid #dddddd;
    }
    #shop_cart .shop_list .shop_head img{
        width:20px;
        height:20px;
        position:absolute;
        top:.3rem;
        
    }
    #shop_cart .shop_list .shop_head span img{
        left:.5rem;
    }
    #shop_cart .shop_list .shop_head em img{
        right:.5rem;
    }
    #shop_cart .shop_list .shop_head .title{
        line-height:30px;
        display:inline;
    }
    #shop_cart .shop_list em{
        font-style:normal;
        float:right;
    }
    #shop_cart .shop_content{
        padding:1rem .5rem;
        font-size:.14rem;
        display:flex;
        flex-wrap:nowrap;
        justify-content:flex-start;
       
    }
    #shop_cart .shop_content .shop_img{
        width:4.5rem;
        height:4.5rem;
        border:.08rem solid #dddddd;
        border-radius:.3rem;
    }
    #shop_cart .shop_content img{
        width:69px;
        height:69px;
    }
    #shop_cart .shop_content .shop_t{
        width:16rem;
        /*text-align:left;*/
    }
    #shop_cart .shop_content ul{
       -webkit-padding-start: 0px;
        list-style:none;
        text-align:left;
        padding:0 1rem;
        
    }
    #shop_cart .shop_content ul li{
        padding:.2rem 0;
    }
    #shop_cart .shop_content .shop_price{
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
        padding:0 1rem;
    }
    #shop_cart .shop_content .shop_price .shop_t{
        padding-left:7rem;
        text-align:right;
    }
    #shop_cart .shop_content .shop_price .shop_d{
        text-decoration:line-through;
    }
    #shop_cart .shop_content .shop_price .shop_p{
        color:#9e0028;
    }
    #shop_cart .shop_content .shop_price .shop_t .shop_n{
        padding-left:.5rem;
    }
    #shop_cart .shop_list .shop_foot{
        height:30px;
        position:relative; 
        border-top:.05rem dashed #ddd;
    }
    #shop_cart .shop_list .shop_foot img{
        width:13px;
        height:15px;
        position:absolute;
        top:.5rem;
        right:.3rem;
    }
    #shop_cart .shop .remove{
        text-align:right;
        padding:1rem 0;
        font-size:.14rem;
    }
    #shop_cart .shop .remove span{
        color:#00a0e9;
    }
    #shop_cart .shop .remove label{
        border:1px solid #5e5e5e;
        border-radius:.3rem;
        padding:.5rem 1rem ;
        margin-left:1rem;
    }
</style>