<template>
    <div id="goodslist">
        <div id="header">
            <header class="mui-bar-nav header">
                <router-link class="logo mui-action-back mui-icon mui-pull-left" to="/">
                    <img src="../img/LOGO.jpg">
                    <!--<img :src="img_url">-->
                </router-link>   
                <div class="search">
                    <input type="text" placeholder="请输入要搜索的内容"/>
                    <img src="../img/search.png" class="btn">
                    <!--<img :src="btn_url" class="btn">-->
                </div>
                <!--<a class="mui-icon mui-icon-bars mui-pull-right menu">
                    
                </a>-->
            </header>
            <div></div>
        </div> 
        <div class="nav">
            <ul>
                <li class="ative">销量</li>
                <li>新品</li>
                <li>价格</li>
                <li>筛选<img src="../img/pic4.png"></li>
            </ul>
        </div>
        <div class="goods">
            <div class="goods_item" v-for="item in list" :key="item.id">        
                <img :src="item.img_url" @click="jumpDetail" :data-id="item.id">
                <div>
                    <p class="title">{{item.name}}</p>
                    <span>￥{{item.price.toFixed(2)}}</span>
                    <p>月销：<span>{{item.bank}}</span>件</p>
                </div>
            </div>       
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            list:[],
            pageIndex:0,
            pageCount:1,
            pageSize:6
        }
    },
    created() {
        this.getMore();
    },
    methods: {
        getMore(){
            //1：创建url地址
            this.pageIndex++;
            var pno=this.pageIndex;
            var ps=this.pageSize;
            var url="http://127.0.0.1:3000/getProduct?pno="+pno+"&pageSize"+ps;
            //2：发送ajax请求
            this.axios.get(url).then(result=>{
                this.list=result.data.data;
                //console.log(this.list)
            });
            //3：获取返回数据保存list
            //4：在模板循环创建数据
        },
        jumpDetail(event){
            //获取参数
            var id=event.target.dataset.id;
            //跳转详情
            this.$router.push("/Productdetail/"+id);       
        }
    },
}
</script>
<style>
    #goodslist #header .logo{
        width:20%; 
        display: flex; 
        padding:.5rem;
    }
    #goodslist #header .logo img{
        width:100%;
        height:30px; 
        margin:auto;
    }
    #goodslist #header .search input[type='text']{
        width:70%;
        display: flex;
        height:30px;
        border-radius:1rem;
        font-size:.12rem;
        position: relative; 
        top:0.5rem;        
    }
    #goodslist #header .search .btn{       
		position: absolute;
        width:18px;
        height:18px;
        right: 3.2rem;
        top: 0.9rem;
    }
    #goodslist #header .header{
        width:100%;
        height:44px;
        background-color:#9e0028;
        padding:0;
    }
    #goodslist #header .menu{
        width:10%;
        position:absolute;
        top:.1rem;
        right:0;
    }
    #goodslist #header .mui-bar-nav{
        box-shadow:0 0 0 ;
    }
    #goodslist #header .mui-bar-nav.mui-bar .mui-icon{
        margin:0;
        padding-top:7px;
    }
    #goodslist .mui-icon-bars:before{
        color:#fff;
        z-index:100;
    }
    #goodslist .nav ul{
        margin:0;
        width:100%;
        height:30px;
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
        border-bottom:1px solid #d5d5d5;
    }
    #goodslist .nav ul li{
        width:25%;
        height:30px;
        line-height:30px;
        float:left;
        font-size:.14rem;
        margin:auto;
        text-align:center;
        position:relative;
    }
    #goodslist .nav ul li img{
        position:absolute;
        top:.2rem;
    }
    #goodslist .nav ul li.ative{  
        color:#9e0028;
        border-bottom:1px solid #9e0028;
    }
    #goodslist .goods{
        width:100%;
        height:100%;
          padding:.5rem;
       /* display:flex;
        flex-wrap:wrap;*/
       
        
    }
    #goodslist .goods_item{
        width:48%;
        float:left;
        margin:.2rem;
        border:1px solid #d5d5d5;
        box-shadow:0 0 8px #d5d5d5;
        box-sizing:border-box;
        padding:.2rem;
        
        /*display:flex;
        flex-direction:column;
        justify-content:center;
        min-height:150px;
        border:1px solid #d5d5d5;
        box-shadow:0 0 8px #d5d5d5;
        padding:.2rem;
        margin:.5rem;*/
    }
    /*#goodslist .goods_item>div{
        width:100%;
        height:260px;
        border:1px solid #d5d5d5;
        box-shadow:0 0 8px #d5d5d5;
        margin:.5rem;
    }*/
    #goodslist .goods_item img{
        width:100%;
        
    }
    #goodslist .goods_item p{
        color:#000;
        margin:0;
        font-size:.14rem;
        overflow:hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    #goodslist .goods_item div>span{
        font-size:.14rem;
        color:#9e0028;     
    }
</style>