<template >
    <div id="login">
        <div>
            <header id="header" class="mui-bar mui-bar-nav header">
                <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
                <h1 class="mui-title">登录</h1>
                <button @click="jumpRegister" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right">注册</button>            
            </header>
            <div></div>
        </div>
        <!--<div class="login">
            <ul>
                <li class="active"><a>普通登录</a></li>
                <li><a>动态密码登录</a></li>
            </ul>
        </div>-->
        <section class="container">
            <form class="form">
                <div class="username">
					<label><img src="../img/username.png"></label>
					<input v-model="uname" type="text" class="user" placeholder="请输入用户名" autofocus>
                    <!--<input type="text" class="user" placeholder="手机/邮箱/会员卡号" autofocus>-->
				</div>
				<div class="upwd">
					<label><img src="../img/pwd.png"></label>
					<input v-model="upwd" class='password' type="password" placeholder="请输入登录密码">
                    <!--<span><img src="../img/off.png"></span>-->
				</div>
                
            </form>
            <div class="btn">
                <button @click="handleLogin" class="btn_login">登录</button>
            </div>
            <div class="option_login">
                <label>
                    <span class="radio on"><img src="../img/chk1.png"></span>
                    <span>两周内免登录</span>
                </label>
                <span><a>忘记密码？</a></span>
            </div>
            <!--<div class="other_login">
                <p>其他登录方式：
                    <a>免注册购物</a>
                    <a><img src="../img/AlipayLogo.png"></a>
                </p>
            </div>-->
        </section>
    </div>
</template>
<script>
import {Toast} from 'mint-ui';
export default {
    data() {
        return {
            uname:"",
            upwd:""
        }
    },
    methods: {
        jumpRegister(){
            //跳转注册
            this.$router.push("/Register");       
        },
        handleLogin(){  
            var n=this.uname;
            var p=this.upwd;    
            var reg=/^[a-z0-9_]{3,9}$/i;
           
            if(!reg.test(n)){
                Toast("用户名格式不正确");
                return;
            }
            if(!reg.test(p)){
                Toast("密码格式不正确");
                return;
            }
            var url="http://127.0.0.1:3000/login?uname="+n+"&upwd="+p;
            
            this.axios.get(url).then(
                result=>{
                   
                    if(result.data.code==1){
                        Toast("登录成功")
                        this.$router.push("/");//登录成功跳转首页
                    }else{
                        Toast("用户名或密码不匹配")
                    }
                }
            )
        }
    },
}
</script>
<style >
    * {
        margin: 0;
        padding: 0;
        -webkit-margin-before: 0;
        -webkit-margin-after: 0;
        -webkit-margin-start: 0;
        -webkit-margin-end: 0;
        -webkit-padding-start: 0;
    }

    #login{
        background-color:#fff;       
    }
    #login #header{
        width:100%;
        height:40px;
        position:relative;
    }
    #login #header.mui-bar{
        background-color:#9e0028;       
    }
    #login .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
    #login #header .mui-title{
        color:#fff;
        line-height:40px;
    }
    #login .mui-bar .mui-btn-link{
        color:#fff;
        border:.1rem solid #fff;
        font-size:.5rem;
        line-height:20px;
        letter-spacing:0.2rem;
        padding:.05rem .5rem;
        position:absolute;
        top:.5rem;
        right:.5rem;
    }
    #login .mui-bar  .mui-icon{
        padding-bottom:0;
    }
    #login #header .mui-btn-blue{
        background-color:#9e0028; 
    }
    #login .login ul{
        list-style:none;
        width:100%;
        height:32px;
        background-color:#eaeaea;
        margin:0; 
                    
    }
    #login .login ul li{
        width:50%;
        height:32px;
        box-sizing: border-box;
        float:left;
        text-align:center;
        line-height:32px;
        font-size:.14rem;        
    }
    #login .login ul li:first-child{
        /*margin-left: -34px;*/
        border-right:.01rem solid #cccccc;        
    }
    #login .login ul li a{
        color:#000;
    }

    #login .login ul li.active {
        border-bottom:1px solid #9e0028;
    }

    #login .login ul li.active a{
        color:#9e0028;
    }

    #login .container{
        padding:2rem 1rem;
    }
    #login .form{
        border:1px solid #dddddd;
        border-radius:0.3rem;
    }
    #login .container input{
        font-size:.14rem;
        padding-left:2.5rem;
        border:0;  
    }
    #login .username{
        position:relative; 
        height:40px;
        border-bottom:1px solid #dddddd;  
    }
    #login .username input{
        border-bottom:1px solid #dddddd;
    }
    #login .upwd{
        position:relative;
        height:40px;
    }
    #login .username img{
        position:absolute;
        width:20px;
        height:23px;
        top:.5rem;
        left:.5rem;
    }
    #login .upwd label>img{
        position:absolute;
        width:20px;
        height:23px;
        top:.5rem;
        left:.5rem;
    }
    #login .upwd span>img{
        position:absolute;
        width:40px;
        height:20px;
        top:.7rem;
        right:.5rem;
    }
    #login .container .btn .btn_login{
        width:100%;
        background-color:#9e0028;
        color:#fff;
        border-radius:0.3rem;
        margin:1rem 0;
        padding:.5rem 0;
    }
    #login .option_login,.other_login{
        font-size:.14rem;
        text-align:left;
        clear:both;
    }
    #login .option_login>label{
        float:left;
    }
    #login .option_login>span{
        float:right;
    }
    #login .option_login span.radio img{
        width:20px;
        height:20px;
        margin-right:.5rem;
    }
    #login .other_login img{
        width:50px;
        height:20px;
        vertical-align:middle;
        margin-left:.5rem;
    }
</style>