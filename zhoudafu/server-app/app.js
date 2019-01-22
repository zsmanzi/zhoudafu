//引入允许跨域的域名的模块
const cors=require("cors");
//引入sesstion模块
const session=require("express-session")
//创建服务器
const express=require("express");
//引入路由
const pool = require("./pool");
var app=express();
app.listen(3000);
app.use(express.static("public"));

//配置cors
app.use(cors({
    //允许列表
    origin:["http://127.0.0.1:8080","http://localhost:8080"],
    //是否验证
    credentials:true
}))
//对sesstion模块配置
app.use(session({
    secret:"128位随机字符串",   //安全令牌
    resave:false,               //请求保存
    saveUninitialized:true,     //创建一个cookie,初始化
    cookie:{
        maxAge:1000*60*60*24    //sesstion保存时间一天
    }
}))
//功能一：首页轮播图
app.get("/getImages",(req,res)=>{
    var sql="SELECT cid,img_url FROM zdf_index_carousel";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send(result);
        //console.log(result);
    })
    /*var rows=[
        {id:1,img_url:"http://localhost:3000/images/banner1.jpg"},
        {id:2,img_url:"http://localhost:3000/images/banner2.jpg"},
        {id:3,img_url:"http://localhost:3000/images/banner3.jpg"},
        {id:4,img_url:"http://localhost:3000/images/banner4.jpg"},
        {id:5,img_url:"http://localhost:3000/images/banner5.jpg"},
        {id:6,img_url:"http://localhost:3000/images/banner6.jpg"},
    ];
    res.send(rows);*/
})
//功能二：金价数据切换
app.get("/getGold",(req,res)=>{
    var sql="SELECT gid,gtitle,gprice FROM zdf_gold_price";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send(result);
    })
})
//功能三：首页商品列表
/*app.get("/getIproduct",(req,res)=>{
    var sql="SELECT * FROM zdf_index_product";
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        res.send(result);
    })
})*/
//功能四：商品列表
app.get("/getProduct",(req,res)=>{
        //1:参数       pno 页码;pageSize 页大小
    var pno = req.query.pno;
    var pageSize = req.query.pageSize;
    //1.2:默认值
    if(!pno){
        pno = 1;
    }
    if(!pageSize){
        pageSize = 6;
    }
    //2:验证正则表达式
    var reg = /^[0-9]{1,}$/;
    if(!reg.test(pno)){
        res.send({code:-1,msg:"页码格式不正确"});
        return;
    }
    if(!reg.test(pageSize)){
        res.send({code:-2,msg:"页大小格式不正确"});
        return;
    }
    //3:创建sql
    //  查询总页数
    var sql = "SELECT count(id) as c FROM zdf_product";
    var progress = 0; //sql执行进度
    obj = {code:1};
    pool.query(sql,(err,result)=>{
        if(err)throw err;
        //console.log(result[0].c);
        var pageCount = Math.ceil(result[0].c/pageSize);
        obj.pageCount = pageCount;
        progress += 50;
        if(progress == 100){
            res.send(obj);
        }
    });
    //  查询当前页内容
    var sql=" SELECT id,name,img_url,price,bank FROM zdf_product  LIMIT ?,?";
    var offset = parseInt((pno-1)*pageSize);
    pageSize = parseInt(pageSize);
    pool.query(sql,[offset,pageSize],(err,result)=>{
        if(err)throw err;
        //console.log(result);
        obj.data = result;
        progress+=50;
        if(progress==100){
        res.send(obj);
        }
    }); 
})
//功能五：详情轮播
app.get("/getDetail",(req,res)=>{

    var id=req.query.id;
    //console.log(id);
    var sql="SELECT id,img_url FROM zdf_detail WHERE id=?";
    pool.query(sql,[id],(err,result)=>{
        //console.log(result)
        if(err)throw err;
        res.send(result);
        
    })
})
//功能六：详情数据
app.get("/getProductetail",(req,res)=>{
    var id=parseInt(req.query.id);
    var sql="SELECT * FROM zdf_product_detail WHERE id=?";
    pool.query(sql,[id],(err,result)=>{
        if(err)throw err;
        res.send(result);
        
    })
})
//功能七：用户注册
app.get("/register",(req,res)=>{
    //1.参数 uname,upwd,phone
    var uname = req.query.uname;
    var upwd = req.query.upwd;
    //1.1.验证
    var reg = /^[a-z0-9_]{3,9}$/;
    if(!reg.test(uname)){
      res.send({code:-1,msg:"用户名格式不正确"});
      return;
    }
    //2.sql INSERT INTO xz_login VALUES(null,?,md5(?))
    var sql = "INSERT INTO zdf_user VALUES(NULL,?,md5(?))";
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err) throw err;
      if(result.affectedRows>0){
        res.send({code:1,msg:"注册成功"});
      }else{
        res.send({code:-1,msg:"注册失败"});
      }
    })
    //3.json
  })
  //功能八：用户名是否存在
  app.get("/existsName",(req,res)=>{
    var uname=req.query.uname;
    
    var sql="SELECT count(id) as c FROM zdf_user WHERE uname=?";
    pool.query(sql,[uname],(err,result)=>{
      if(err)throw err;
      if(result[0].c>0){
        res.send({code:-1,msg:"该用户名已存在"})
      }else{
         res.send({code:1,msg:"欢迎使用"})
      }
     
   });
  })
  //功能九：用户登录
  app.get("/login",(req,res)=>{
    var uname=req.query.uname;
    var upwd=req.query.upwd;
    var sql="SELECT count(id) as c,id FROM zdf_user WHERE uname=? AND upwd=md5(?)";
    pool.query(sql,[uname,upwd],(err,result)=>{
      if(err) throw err;
      var c=result[0].c;//获取数值
      if(c==1){
        req.session.uid=result[0].id;
        res.send( {code:1,msg:"登录成功"})
      }else{
        res.send( {code:-1,msg:"用户名或密码错误"})
      }
  
    })
  })
  //功能十：查询购物车数据
  app.get("/getCartList",(req,res)=>{
      var uid=req.session.uid;
      console.log("|"+uid+"|");
      var sql="SELECT p.name,p.img_url,c.count,c.id,d.price,d.sel,d.pra FROM zdf_product p,zdf_cart c,zdf_product_detail d WHERE p.id=c.pid=d.id AND c.uid=?";
      pool.query(sql,[uid],(err,result)=>{
          if(err)throw err;
          res.send({code:1,data:result});
      })
  })
  //功能十一：将商品信息添加购物车
  app.get("/addCart",(req,res)=>{
      var uid=parseInt(req.query.uid);
      console.log("|"+uid+"|");
      var pid=parseInt(req.query.pid);    
      console.log("|"+pid+"|"); 
      var price=parseFloat(req.query.dprice);
      console.log("|"+price+"|");
      var count=parseInt(req.query.count);
      console.log("|"+count+"|");
      var sql="INSERT INTO `zdf_cart`(`id`, `uid`, `pid`, `count`, `price`) VALUES(NULL,?,?,?,?)";
      pool.query(sql,[uid,pid,count,price],(err,result)=>{
          if(err)throw err;
          if(result.affectedRows>0){
              res.send({code:1,msg:"添加成功"});
          }else{
              res.send({code:-1,msg:"添加失败"});
          }
      })
  })
