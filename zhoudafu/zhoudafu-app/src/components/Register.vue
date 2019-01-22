<template>
    <div id="register">
        <div>
            <header id="header" class="mui-bar mui-bar-nav">
                <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
                <h1 class="mui-title">免费注册</h1>
                <button @click="jumpLogin" class="mui-btn mui-btn-blue mui-btn-link mui-pull-right">登录</button>
            </header>
            <div></div>
        </div>
        <div class="mui-content">
            <div class="mui-content-padded">
                <form class="form">
                    <div class="phone_test">
                        用户名：<input v-model="uname" autofocus class="phone" type="text" placeholder="请输入3~9位的数字、字母、下划线" maxlength="9" pattern="^[a-z0-9_]{3,9}$">
                        密码：<input v-model="upwd" @blur.prevent="checkName" autofocus class="phone" type="password" placeholder="请输入3~9位的数字、字母、下划线" maxlength="9" pattern="^[a-z0-9_]{3,9}$">
                        确认密码：<input v-model="upwd2" autofocus class="phone" type="password" placeholder="请输入3~9位的数字、字母、下划线" maxlength="9" pattern="^[a-z0-9_]{3,9}$">
                        <!--<input v-model="phone" autofocus class="phone" type="text" placeholder="请输入11位数字手机号" maxlength="11" pattern="^1[345678]\d{9}$">
                        <img src="../img/phone.png"/>-->
                    </div>
                    <!--<div class="slider">
                        <div class="label">向右滑动验证</div>
                        <div class="track"></div>
                        <div class="icon"></div>
                    </div>-->
                    <button @click="handleReg" type="button" class="mui-btn mui-btn-primary" data-loading-text = "提交中" data-loading-icon-position="right">注册</button> 
                    
                </form>  
                <div class="tip">
                    注册视为同意<span>《网站条款及隐私条款》</span>,系统将同步为您注册周大福<b>Fans Members</b>卡号，此卡号通用于任意周大福珠宝专营店及网络店铺。
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
            uname:"",
            upwd:"",
            upwd2:"",
            isSumit:false
        }
    },
    methods: {
        jumpLogin(){
            //跳转登录
            this.$router.push("/Login");       
        },
        checkName(){
            //console.log(123)
            var n=this.uname;
            var url="http://127.0.0.1:3000/existsName?uname="+n;
            this.axios.get(url).then(
                result=>{
                    if(result.data.code>0){
                        Toast("欢迎使用");
                        this.isSumit=true;
                    }else{
                        Toast("用户名已存在");
                        this.isSumit=false;
                    }
                   // console.log(result.data)
                    /*if(n){
                        Toast("用户名已存在");
                    }else{
                        Toast("欢迎使用");
                    }*/
                }
            )
        },
        handleReg(){
            if(!this.isSumit){
                Toast("用户名已存在，请修改");
                return;
            }
            var n=this.uname;
            var p=this.upwd;
            var p2=this.upwd;
            var regname=/^[a-z0-9_]{3,9}$/i;
            var regpwd=/^[a-z0-9]{3,9}$/i;
            if(!regname.test(n)){
                Toast("用户名格式不正确");
                return;
            }
            if(!regpwd.test(p)){
                Toast("密码格式不正确");
                return;
            }
            if(p!=p2){
                Toast("两次密码不一致");
                return;
            }
            var url="http://127.0.0.1:3000/register?uname="+n+"&upwd="+p;
            this.axios.get(url).then(result=>{
                //console.log(result.data);
                Toast(result.data.msg)
            })
        }
    },
}
</script>
<style>
    #register{
        background-color:#fff;
    }
    #register #header{
        width:100%;
        height:40px;
        position:relative;
    }
    #register #header.mui-bar{
        background-color:#9e0028;       
    }
    #register .mui-icon-back:before, .mui-icon-left-nav:before{
        color:#fff;
    }
    #register #header .mui-title{
        color:#fff;
    }
    #register .mui-bar .mui-btn-link{
        color:#fff;
        border:.1rem solid #fff;
        font-size:.5rem;
        line-height:20px;
        letter-spacing:0.2rem;
        margin-top:9px;
        padding:.05rem .5rem;
    }
    #register #header .mui-btn-blue{
        background-color:#9e0028; 
    }
    #register .mui-content{
        background-color:#fff;
        padding:3rem 0rem;
    }
    #register .mui-content input[type='submit'], .mui-btn-primary, .mui-btn-blue{
        padding:.5rem 10rem;
        border: 1px solid #BBBBBB;
        background-color: #BBBBBB;
        font-size:1rem;
        font-weight:bold;
    }
    #register .mui-content .phone_test{
        position:relative;
    }
    #register .mui-content .phone{
        font-size:.1rem;
        padding-left:3rem;
    }
    #register .mui-content .phone_test img{
        position:absolute;
        width:20px;
        height:24px;
        top:.55rem;
        left:1rem;
    }
    #register .mui-content .slider{    
        height: 50px;
        box-shadow: 0 0 3px #dddddd;
        background-color: #BBBBBB;
        margin-bottom:3rem;
        position:relative;
    }
    #register .mui-content .label {
        position:absolute;
        top:1rem;
        left:8rem;
        color:#4d4d4d;
        font-size:1rem;
    }
    #register .mui-content .icon{
        width:15%;
        height:50px;
        position:absolute;
        background-color:#fff;  
        text-align:center; 
    }
    #register .mui-content .icon:before {
        content: '>>';
        color: #ccc;
        line-height:3.5rem;
    }
    #register .mui-content .tip{
        font-size:.5rem;
        padding-top:5rem;
        color:#666666;
        text-align:left;
    }
    #register .mui-content .tip span{
        color:#00a0e9;
    }
    #register .mui-content .tip b{
        color:#9e0028;
    }
</style>