#客户端连接数据库，使用编码UTF8
SET NAMES UTF8;
#丢弃数据库，数据库存在情况下
DROP DATABASE IF EXISTS zdf;
#创建数据库，使用编码UTF8
CREATE DATABASE zdf CHARSET=UTF8;
#进入数据库
USE zdf;

#创建数据表
/***** 1首页轮播广告商品 *****/
CREATE TABLE zdf_index_carousel(
    cid INT PRIMARY KEY AUTO_INCREMENT,
    img_url VARCHAR(128),
    ctitle VARCHAR(64),
);
INSERT INTO zdf_index_carousel VALUES
(NULL,"http://localhost:3000/images/banner1.jpg","广告商品1"),
(NULL,"http://localhost:3000/images/banner2.jpg","广告商品2"),
(NULL,"http://localhost:3000/images/banner3.jpg","广告商品3"),
(NULL,"http://localhost:3000/images/banner4.jpg","广告商品4"),
(NULL,"http://localhost:3000/images/banner5.jpg","广告商品5"),
(NULL,"http://localhost:3000/images/banner6.jpg","广告商品6");
/***** 2金价表 *****/
CREATE TABLE zdf_gold_price(
    gid INT PRIMARY KEY AUTO_INCREMENT,
    gtitle VARCHAR(64),
    gprice DECIMAL(10,2)
)
INSERT INTO zdf_gold_price VALUES
(NULL,"足金零售价",363.00),
(NULL,"足金回购价",261.00),
(NULL,"金条/金章换购价",326.00),
(NULL,"投资产品零售价",353.00),
(NULL,"金条/金章换购价",325.00),
(NULL,"足金回购价",326.00),
(NULL,"金条/金章零售价",323.00),
/***** 3首页商品表 *****/
/*CREATE TABLE zdf_index_product(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    img_url VARCHAR(225)
);
INSERT INTO zdf_index_product VALUES
(NULL,"http://localhost:3000/images/WAP_640_11620_01.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_02.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_03.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_04.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_05.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_06.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_07.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_08.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_09.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_10.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_11.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_12.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_13.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_14.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_15.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_16.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_17.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_18.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_19.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_20.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_21.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_22.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_23.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_24.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_25.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_26.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_27.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_28.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_29.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_30.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_31.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_32.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_33.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_34.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_35.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_36.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_37.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_38.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_39.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_40.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_41.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_42.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_43.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_44.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_45.jpg"),
(NULL,"http://localhost:3000/images/WAP_640_11620_46.jpg");
*/
/*CREATE TABLE zdf_index_product(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255),
    img_url VARCHAR(225),
    price   DECIMAL(10,2),
    bank INT
);
INSERT INTO zdf_index_product VALUES
(NULL,"周大福喜狮系列龙腾虎跃龙头转运珠足金黄金吊坠","",1580.00),
(NULL,"周大福十二生肖猪抱元宝猪足金黄金吊坠","",2180.00),
(NULL,"周大福十二生肖猪飞天猪足金黄金转运珠吊坠","",741.00),
(NULL,"周大福喜狮系列吉祥喜狮转运珠男士足金黄金吊坠","",1422.00),
(NULL,"周大福喜狮系列神气喜狮转运珠足金黄金吊坠","",1422.00),
(NULL,"周大福潮酷墨镜猪生肖猪转运珠足金黄金吊坠","",1422.00),
(NULL,"【预售】周大福喜狮系列龙腾虎跃虎头转运珠足金黄金吊坠（19年3月8号前发货，包含8号）","",1422),
(NULL,"周大福喜狮系列龙腾虎跃龙头转运珠足金黄金吊坠","",1422.00),
(NULL,"周大福17916系列精致黄色22K金项链","",1692.00),
(NULL,"周大福简约告白气球18K金钻石时尚项链","",1880.00),
(NULL,"周大福小心意系列系列皇冠18K金钻石耳线（单只）","",684.00),
(NULL,"周大福焕美系列STELLA星空18K金红宝石钻石耳线...","",990.00),
(NULL,"周大福焕美系列STELLA爱心18K金红宝石钻石项链","",2790.00),
(NULL,"周大福珠宝首饰银杏叶925银钻石吊坠（附赠抹银布一条...","",522.00),
(NULL,"周大福珠宝首饰圆形星星PT950铂金耳线一对","",972.00),
(NULL,"周大福珠宝首饰时尚简约925银手链","",432.00),
(NULL,"【预售】周大福十二生肖猪超人小猪足金吊坠（19年1月...","",1602.00),
(NULL,"周大福Q萌小猪转运珠足金黄金吊坠","",1152.00),
(NULL,"【预售】周大福萌猪ATM金章储钱罐（2019年1月2...","",780.00),
(NULL,"【预售】周大福十二生肖猪飞天猪足金黄金转运珠吊坠（1...","",731.00),
(NULL,"周大福十二生肖猪四叶草小猪足金黄金吊坠","",1332.00),
(NULL,"【刻字】周大福时尚简约18K金钻石戒指","",1440.00),
(NULL,"【刻字】周大福时尚简约18K金钻石戒指","",1440.00),
(NULL,"周大福偏爱系列18K金钻石戒指","",16800.00),
(NULL,"周大福小心意系列逸彩简约时尚18K金钻石戒指","",432.00),
(NULL,"镂空雪花花瓣铂金耳环","",1580.00),
(NULL,"周大福怦然系列浪漫心动18K金钻石吊坠","",2180.00),
(NULL,"周大福车花时尚18K金手链","",741.00),
(NULL,"周大福宝宝快乐天使足金黄金吊坠","",1422.00),
(NULL,"周大福十二生肖猪抱元宝猪足金黄金吊坠","",1422.00),
(NULL,"周大福怦然系列为你星动18K金钻石吊坠","",1422.00),
(NULL,"周大福迪士尼公主系列天鹅白色18K金钻石吊坠","",1422),
(NULL,"周大福SOINLOVE密豆系列简约18K彩金手链","",1422.00),
(NULL,"周大福17916系列精致黄色22K金项链","",1692.00),*/

/***** 4商品表 *****/
CREATE TABLE zdf_product(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    name    VARCHAR(255),
    img_url VARCHAR(225),
    price   DECIMAL(10,2),
    bank INT        /*月销售*/
);
INSERT INTO zdf_product VALUES
(NULL,"周大福满天星铂金项链","http://localhost:3000/images/product/PT17766.jpg",1140.00,2941),
(NULL,"周大福生肖鸡吉星高照足金黄金吊坠","http://localhost:3000/images/product/F200643.jpg",650.70,2563),
(NULL,"周大福可爱猴宝宝足金黄金吊坠","http://localhost:3000/images/product/F189132.jpg",505.50,1662),
(NULL,"周大福生肖鸡 积极向上足金黄金吊坠","http://localhost:3000/images/product/F200642.jpg",1172.90,1064),
(NULL,"周大福时尚百搭足金黄金项链","http://localhost:3000/images/product/F159797.jpg",684.00,1021),
(NULL,"周大福车花精美心连心PT950铂金吊坠","http://localhost:3000/images/product/PT148874.jpg",171.00,950),
(NULL,"周大福银925十字项链","http://localhost:3000/images/product/AB37350.jpg",723.30,927),
(NULL,"周大福浪漫玫瑰足金黄金耳饰","http://localhost:3000/images/product/F3545.jpg",432.90,829),
(NULL,"周大福足金黄金吊坠转运珠","http://localhost:3000/images/product/F155440.jpg",904.80,795),
(NULL,"周大福心相印足金黄金吊坠","http://localhost:3000/images/product/F194023.jpg",469.20,755),
(NULL,"周大福光身可爱秀气铃铛足金黄金吊坠","http://localhost:3000/images/product/F194217.jpg",1172.90,1064),
(NULL,"周大福神气小黄鸡足金黄金吊坠","http://localhost:3000/images/product/F199502.jpg",911.80,680),
(NULL,"周大福X西游记之三打系列紧箍咒足金黄金戒指","http://localhost:3000/images/product/F196601.jpg",723.30,658),
(NULL,"周大福光身简约足金黄金戒指","http://localhost:3000/images/product/F185170.jpg",628.40,602),
(NULL,"周大福双层花朵足金黄金戒指","http://localhost:3000/images/product/F1284.jpg",1383.70,594),
(NULL,"周大福慈祥笑脸佛足金黄金吊坠","http://localhost:3000/images/product/F163126.jpg",984.40,570),
(NULL,"周大福HELLO KITTY系列凯蒂猫利是金足金黄金金币挂包","http://localhost:3000/images/product/R19956.jpg",228.00,499),
(NULL,"周大福HELLO KITTY系列凯蒂猫利是金足金黄金金币挂包","http://localhost:3000/images/product/R19957.jpg",228.00,494),
(NULL,"周大福典雅十字银925手链","http://localhost:3000/images/product/AB35097.jpg",324.00,490),
(NULL,"星形扭曲铂金吊坠","http://localhost:3000/images/product/PT148625.jpg",972.00,479);

/***** 5详情轮播图 *****/
CREATE TABLE zdf_detail(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    img_url VARCHAR(2250)
);
INSERT INTO zdf_detail VALUES
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg","http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/f200643a.jpg","http://localhost:3000/images/product/f200643b.jpg",
"http://localhost:3000/images/product/f200643c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F189132.jpg","http://localhost:3000/images/product/f189132a.jpg","http://localhost:3000/images/product/f189132b.jpg","http://localhost:3000/images/product/F189132c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F199502.jpg","http://localhost:3000/images/product/F200642.jpg","http://localhost:3000/images/product/f200643(1).jpg","http://localhost:3000/images/product/f200643(2).jpg",
"http://localhost:3000/images/product/F200643.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg",
"http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg","http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/f200643a.jpg","http://localhost:3000/images/product/f200643b.jpg",
"http://localhost:3000/images/product/f200643c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F189132.jpg","http://localhost:3000/images/product/f189132a.jpg","http://localhost:3000/images/product/f189132b.jpg","http://localhost:3000/images/product/F189132c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F199502.jpg","http://localhost:3000/images/product/F200642.jpg","http://localhost:3000/images/product/f200643(1).jpg","http://localhost:3000/images/product/f200643(2).jpg",
"http://localhost:3000/images/product/F200643.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg",
"http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg","http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/f200643a.jpg","http://localhost:3000/images/product/f200643b.jpg",
"http://localhost:3000/images/product/f200643c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F189132.jpg","http://localhost:3000/images/product/f189132a.jpg","http://localhost:3000/images/product/f189132b.jpg","http://localhost:3000/images/product/F189132c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F199502.jpg","http://localhost:3000/images/product/F200642.jpg","http://localhost:3000/images/product/f200643(1).jpg","http://localhost:3000/images/product/f200643(2).jpg",
"http://localhost:3000/images/product/F200643.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg",
"http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg","http://localhost:3000/images/product/PT17766b.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/F200643.jpg","http://localhost:3000/images/product/f200643a.jpg","http://localhost:3000/images/product/f200643b.jpg",
"http://localhost:3000/images/product/f200643c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F189132.jpg","http://localhost:3000/images/product/f189132a.jpg","http://localhost:3000/images/product/f189132b.jpg","http://localhost:3000/images/product/F189132c.jpg"]'),
(NULL,'["http://localhost:3000/images/product/F199502.jpg","http://localhost:3000/images/product/F200642.jpg","http://localhost:3000/images/product/f200643(1).jpg","http://localhost:3000/images/product/f200643(2).jpg",
"http://localhost:3000/images/product/F200643.jpg"]'),
(NULL,'["http://localhost:3000/images/product/PT17766(1).jpg","http://localhost:3000/images/product/PT17766c.jpg","http://localhost:3000/images/product/PT17766.jpg","http://localhost:3000/images/product/PT17766a.jpg",
"http://localhost:3000/images/product/PT17766b.jpg"]');
/***** 6详情数据表 *****/
CREATE TABLE zdf_product_detail(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(255),       /*商品标题*/
    price   DECIMAL(10,2),      /*商品推广价*/
    dprice  DECIMAL(10,2),      /*商品吊牌价*/
    sales   INT,                /*商品月销量*/
    sel      VARCHAR(2550),       /*商品选择类型*/
    pra     VARCHAR(2550),       /*商品详细参数*/
    img     VARCHAR(2550),      /*商品详情图*/
    comment VARCHAR(2500)       /*商品评价*/
);
INSERT INTO zdf_product_detail VALUES
(NULL,"周大福满天星铂金项链",1140.00,1140.00,2941,'[{"title1":"链长：","value1":"45cm"},{"title2":"数量：","value2":1}]','[{"title1":"模号：","value1":"PT17766"},{"title2":"类型：","value2":"定价类"},{"title3":"款式：","value3":"项链"},{"title4":"材质：","value4":"铂金类"},{"title5":"系列：","value5":"无"},{"title6":"镶法：","value6":"白色"},{"title7":"打磨方法：","value7":"其他"},{"title8":"成色：","value8":"铂(Pt)950"},{"title9":"配链：","value9":"是"},{"title10":"可刻字：","value10":"否"},{"title11":"适合人群：","value11":"中性"},{"title12":"计价方式：","value12":"一口价"},{"title13":"产品说明：","value13":"重量约1.88克"}]','["http://localhost:3000/images/product/PT17766wapdanpinye.jpg","http://localhost:3000/images/product/wapnvshi.jpg","http://localhost:3000/images/product/ssby_h3.jpg","http://localhost:3000/images/product/BJBY.jpg","http://localhost:3000/images/product/clff_h3.jpg","http://localhost:3000/images/product/DZZLCC.jpg","http://localhost:3000/images/product/jiageshuoming.jpg"]',"非常满意"),
(NULL,"周大福生肖鸡吉星高照足金黄金吊坠",647.00,647.00,2000,'[{"title1":"金类：","value1":"足金"},{"title2":"克重：","value2":"1.7克"},{"title3":"数量：","value3":1}]','[{"title1":"模号：","value1":"F200643"},{"title2":"类型：","value2":"计价类"},{"title3":"款式：","value3":"吊坠"},{"title4":"材质：","value4":"足金类"},{"title5":"系列：","value5":"无"},{"title6":"重量：","value6":"约1.7克"},{"title7":"镶法：","value7":"无"},{"title8":"打磨方法：","value8":"无"},{"title9":"成色：","value9":"足金"},{"title10":"配链：","value10":"否"},{"title11":"可刻字：","value11":"否"},{"title12":"适合人群：","value12":"无"},{"title13":"计价方式：","value13":"足金价"},{"title14":"工费：","value14":"￥48.00"}]','["http://localhost:3000/images/product/JJMO.jpg","http://localhost:3000/images/product/f200643a.jpg","http://localhost:3000/images/product/F200643wapdanpinye.jpg","http://localhost:3000/images/product/wapnvshiertong.jpg","http://localhost:3000/images/product/ssby_h3.jpg","http://localhost:3000/images/product/HJBY.jpg","http://localhost:3000/images/product/clff_h3.jpg","http://localhost:3000/images/product/DZZLCC.jpg","http://localhost:3000/images/product/jiageshuoming.jpg"]',"满意");
/***** 7注册登录数据表 *****/
CREATE TABLE zdf_user(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    uname   VARCHAR(32),
    upwd    VARCHAR(32)
);
INSERT INTO zdf_user VALUES
(NULL,"tom",md5("123456")),
(NULL,"marry",md5("789102"));
/*CREATE TABLE zdf_login(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    avatar  
    phone  
    email 
    adder  
)*/
/***** 8购物车表 *****/
CREATE TABLE zdf_cart(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    uid     INT,            /*用户编号*/
    pid     INT,            /*商品编号*/
    count   INT,            /*购买数量*/
    price   DECIMAL(10,2)   /*商品价格*/
);
INSERT INTO zdf_cart VALUES(NULL,1,1,1,140.00),(NULL,1,2,1,1000.00);
/***** 9查询购物车信息 *****/
/*多表查询步骤：
将所有表名保存FROM后
为每一张表起一个别名
查找两张表1个列有关系(- != <= >=)*/

