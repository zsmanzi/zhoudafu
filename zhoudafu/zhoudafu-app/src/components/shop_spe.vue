<template >
    <div id="shopSpe">
       <div class="header">
            <header class="mui-bar mui-bar-nav head">
                <router-link to="/Shopcart" class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></router-link>
                <h1 class="mui-title">变更商品规格</h1>
            </header>
            <div></div>
        </div> 
        <div class="shop_p" >
            <div class="shop_img">
                <img src="" alt="">
            </div>
            <div class="shop_t">
                <ul>
                    <li>
                        <h4>商品标题</h4>
                    </li>
                    <li>
                        <p>价格：
                        <span>￥48.00</span>
                        </p>
                    </li>
                </ul>
                
            </div>             
        </div>
        <div class="shop_g">
            <div class="shop_t">
                <p>金类：<span class="active">足金</span></p>
            </div>
            <div class="shop_k">
               <p> 克重：
                    <span>1.3克</span>
                    <span>1.4克</span>
                    <span>1.5克</span>
                    <span>1.6克</span>
                </p>
            </div>
            <div class="shop_n">
                <div>数量：
                    <button @click="sub">-</button>
                    <input type="text" name="num"  placeholder="1" value="1" v-model="val"/>
                    <button @click="add">+</button>
                    <p><span>200</span>库存</p>
                </div>
            </div>
            <button>确定</button>
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            list:[],
            val:1
        }
    },
    created() {
        this.getlist();
    },
    methods: {
        getlist(){
            var url="http://127.0.0.1:3000/getCartList";
            this.axios.get(url).then(result=>{
                console.log(result);
                this.list=result.data.data;
                console.log(this.list)
            })
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
}
</script>
<style >
    #shopSpe{
        background-color:#fff;
    }
    #shopSpe .header{
        width:100%;
        height:44px;  
    }
    #shopSpe .header .mui-bar{
        background-color:#9e0028;       
    }
    #shopSpe .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
    #shopSpe .header .mui-title{
        color:#fff;
    }
    #shopSpe .mui-bar .mui-icon{
        padding-top:8px;
    }
    #shopSpe .shop_p{
        padding:1rem .5rem;
        display:flex;
        flex-wrap:nowrap;
        justify-content:flex-start;
       
    }
    #shopSpe .shop_p .shop_img{
        width:4.5rem;
        height:4.5rem;
        border:.08rem solid #dddddd;
        border-radius:.3rem;
    }
    #shopSpe .shop_p img{
        width:69px;
        height:69px;
    }
    #shopSpe .shop_p .shop_t{
        width:16rem;
        /*text-align:left;*/
    }
    #shopSpe .shop_p ul{
       -webkit-padding-start: 0px;
        list-style:none;
        text-align:left;
        padding:0 1rem;
        
    }
    #shopSpe .shop_p ul li{
        padding:.2rem 0;
    }
    #shopSpe p{
        color:#000;
    }
    #shopSpe .shop_p ul li span{
        color:#9e0028;
        font-size:1.5rem;
        font-weight:bold;
    }
    #shopSpe .shop_p{
        border-bottom:.05rem solid #c7c7c7;
    }
    #shopSpe .shop_g{
        padding:2rem 1rem;
    }
    #shopSpe .shop_g .shop_n button{
        background-color:#eee;
    }
    #shopSpe .shop_g input{
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
    #shopSpe .shop_g .shop_t span{
        border:1px solid #c7c7c7;
        border-radius:3px;
        padding:.5rem .8rem;
        margin-left:.3rem;
    }
    #shopSpe .shop_g .shop_k span{
        border:1px solid #c7c7c7;
        border-radius:3px;
        padding:.5rem .8rem;
    }
    #shopSpe .shop_g .shop_n p{
        display:inline;
    }
    #shopSpe .shop_g .shop_n p span{
        color:#9e0028;
    }
    #shopSpe .shop_g .shop_t,.shop_k,.shop_n{
        padding:1rem 0;
        border-bottom:1px dashed rgb(207, 207, 207);
    }
    #shopSpe .shop_g>button{
        width:100%;
        background:#9e0028;
        color:#fff;
        margin:2rem 0;
    }
    #shopSpe .shop_g span.active{
        border:1px solid #9e0028;
    }
</style>