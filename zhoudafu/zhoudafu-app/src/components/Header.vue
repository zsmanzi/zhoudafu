<!--<template>
    <div id="header">  
        <div class="header">
            <a class="logo">
            <img src="../img/LOGO.jpg">
            </a>    
            <div class="search">
            <input type="text" placeholder="请输入要搜索的内容"/>
            <img src="../img/search.png" class="btn">
            </div>
            <div class="menu"><h6>菜单</h6></div>
        </div>
        <div></div>
    </div>
</template>
<script>
export default {
    // name:'HomeHeader',
    data() {
        return {
            /*img_url:"http://localhost:3000/images/LOGO.jpg",
            btn_url:"http://localhost:3000/images/search.png"*/
        }
    },
}
</script>
<style scoped>
    #header{
        width:100%;
        height:40px;
    }
    #header .header{
        width:100%;
        height:40px;
        position:fixed;
        z-index:100;
        background-color:#9e0028;
        display:flex;
        flex-wrap:nowrap;
        justify-content:space-between;
    }
    #header .logo{
        width:20%; 
        display: flex; 
    }
    #header .logo img{
        width:70%;
        height:30px; 
        margin:auto;
    }
    #header .search{
        width:75%;
        display: flex;      
    }
    #header .search input{
        width:100%;
        height:30px;
        border-radius:1rem;
        font-size:.12rem;
        margin:auto;
        position: relative;
    }
    #header .search .btn{       
		position: absolute;
        width:18px;
        height:18px;
        right: 3rem;
        top: 0.7rem;
    }
    #header .menu{
        width:10%;
    }
    #header .menu h6{
        width:100%;
        height:30px;
        line-height:30px;
        text-align:center;
        color:#fff;
    }
</style>-->