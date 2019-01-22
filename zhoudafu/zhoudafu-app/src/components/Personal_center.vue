<template>
    <div id="personal">
        <div class="header">
            <header class="mui-bar mui-bar-nav head">
                <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
                <h1 class="mui-title">我的周大福</h1>
            </header>
            <div></div>
        </div>
        <div class="users">
            <div class="no_login">
                <router-link to="/Login">未登录</router-link>
            </div>
            <div class="order">
                <ul>
                    <li>
                        <a><p>我的</p><p>订单</p></a>
                    </li>
                    <li>
                        <a><span>0</span><p>待付款</p></a>
                    </li>
                    <li>
                        <a><span>0</span><p>待收货</p></a>
                    </li>
                    <li>
                        <a><span>0</span><p>已完成</p></a>
                    </li>
                    <li>
                        <a><span>0</span><p>已取消</p></a>
                    </li>
                </ul>
            </div>
            <div class="pad">
                <a>
                    <img src="../img/point_pic6.png" alt="">
                    <p>积分</p>
                </a>
                <a>
                    <img src="../img/mb-ico3.png" alt="">
                    <p>优惠券</p>
                </a>
                <a>
                    <img src="../img/myredpackets1.png" alt="">
                    <p>我的红包</p>
                </a>
                <a>
                    <img src="../img/mb-ico6.png" alt="">
                    <p>我的收藏</p>
                </a>
                <a>
                    <img src="../img/mb-ico88.png" alt="">
                    <p>浏览历史</p>
                </a>
                <a>
                    <img src="../img/mb-ico4.png" alt="">
                    <p>个人信息</p>
                </a>
                <a>
                    <img src="../img/mb-ico8.png" alt="">
                    <p>修改密码</p>
                </a>
                <a>
                    <img src="../img/mb-ico2.png" alt="">
                    <p>收货地址</p>
                </a>
                <a>
                    <img src="../img/mb-ico1.png" alt="">
                    <p>会籍资料</p>
                </a>
                <a>
                    <img src="../img/mb-ico13.png" alt="">
                    <p>会员权益</p>
                </a>
                <a>
                    <img src="../img/progift.png" alt="">
                    <p>会员礼品</p>
                </a>
                <a>
                    <img src="../img/register.png" alt="">
                    <p>活动报名</p>
                </a>
                <a>
                    <img src="../img/byzn.png" alt="">
                    <p>保养指南</p>
                </a>
            </div>
        </div>
        <div class="fu">
            <img src="../img/nav.png" alt="">
        </div>
    </div>
</template>
<script>
export default {
    data() {
        return {
            
        }
    },
}
</script>
<style>
    #personal{
        background-color:#fff;
    }
    #personal .header{
        width:100%;
        height:44px;
        
    }
    #personal .header .mui-bar{
        background-color:#9e0028;       
    }
    #personal .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
    #personal .header .mui-title{
        color:#fff;
    }
    #personal .mui-bar .mui-icon{
        padding-top:8px;
    }
    #personal .users .no_login{
        text-align:center;
        padding:4rem;
        background-image:url(../img/yhzx.jpg);
    }
    #personal .users .no_login a{
        border:1px solid #333;
        border-radius:.2rem;
        padding:.5rem 2rem;
        color:#000;
        font-size:.14rem;
    }
    #personal .users .order{
        background-color:rgb(255, 245, 234);
    }
    
    #personal .users .order ul{
        margin:0;
        padding:0;
        -webkit-padding-start: 0px;
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
        width:100%;
        height:45px;
    }
    #personal .users .order ul li{
        width:20%;
        border-right:1px solid #d9d8d8;
        text-align:center;    
    }
    #personal p{
        margin:0;
        padding:0;
    }
    #personal .users .order ul li span{
        color:#9e0028;
    }
    #personal .users .pad{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        width:100%;
        text-align:center;
        padding:1rem 3rem;
    }
    #personal .users .pad a{
        width:57px;
        height:57px;
        display:block;
        border:1px solid #e9e9e9;
        border-radius:.2rem;
        padding:.1rem 0;
        margin-bottom:1rem;
        
    }
    #personal .users .pad p{
        font-size:.14rem;
    }
    #personal .users .pad a img{
        width:26px;
        height:26px;
    }
    #personal .fu{
       position:fixed;
       z-index:10;
    }
    #personal .fu img{
        width:48px;
        height:48px;
    }
</style>