SET NAMES UTF8;
DROP DATABASE IF EXISTS ly;
CREATE DATABASE ly CHARSET UTF8;
USE ly;
#/**用户信息**/
CREATE TABLE ly_user(
  uid INT PRIMARY KEY AUTO_INCREMENT,
  uname VARCHAR(32),
  upwd VARCHAR(32),
  email VARCHAR(64),
  phone VARCHAR(16),
  avatar VARCHAR(128),        #头像图片路径
  user_name VARCHAR(32),      #用户名，如王小明
  gender INT                  #性别  0-女  1-男
);
#/**用户信息**/
INSERT INTO ly_user VALUES
(NULL, 'dingding', '123456', 'ding@qq.com', '13501234567', 'img/avatar/default.png', '丁伟', '1'),
(NULL, 'dangdang', '123456', 'dang@qq.com', '13501234568', 'img/avatar/default.png', '林当', '1'),
(NULL, 'doudou', '123456', 'dou@qq.com', '13501234569', 'img/avatar/default.png', '窦志强', '1'),
(NULL, 'yaya', '123456', 'ya@qq.com', '13501234560', 'img/avatar/default.png', '秦小雅', '0');
#/*轮播商品*/
CREATE TABLE ly_index_carousel(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  img VARCHAR(128),
  title VARCHAR(64),
  href VARCHAR(128)
);
#/****首页轮播广告商品****/
INSERT INTO ly_index_carousel VALUES
(NULL, 'img/header/banner_1.jpg','轮播广告1','lookforward.html'),
(NULL, 'img/header/banner_2.jpg','轮播广告2','lookforward.html'),
(NULL, 'img/header/banner_3.jpg','轮播广告3','lookforward.html'),
(NULL, 'img/header/banner_4.jpg','轮播广告4','lookforward.html');

#/**家族列表**/
CREATE TABLE ly_family(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(128)         #主标题
);

#/**列表内容**/
INSERT INTO ly_family VALUES
(null,"焦作云台山"),
(null,"重渡沟风景区"),
(null,"万仙山"),
(null,"鲁山皇姑浴温泉"),
(null,"郑州海洋馆"),
(null,"黄山风景区"),
(null,"上海迪士尼乐园"),
(null,"世纪欢乐园"),
(null,"郑州方特欢乐世界"),
(null,"洛阳龙门石窟");

#/**目的地内容列表**/
CREATE TABLE ly_md_content(
  mid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
	info VARCHAR(128),
  subtitle VARCHAR(128),     #副标题
	intro VARCHAR(128)
);

#/**目的地内容**/
INSERT INTO ly_md_content VALUES
(null,'img/mudi/modules_1.jpg',"厦门","252207人去过","文青们都来了 你呢"),
(null,'img/mudi/modules_2.jpg',"札幌","10072人去过","四季分明，独特而静美"),
(null,'img/mudi/modules_3.jpg',"三亚","483940人去过","花最少的钱吹南国海风"),
(null,'img/mudi/modules_4.jpg',"箱根","2088人去过","日本著名的温泉之乡、疗养胜地。"),
(null,'img/mudi/modules_5.jpg',"小樽","8197人去过","小樽是灯的故乡，保留着许多明治大正时代的..."),
(null,'img/mudi/modules_6.jpg',"曼谷","120995人去过","在天使之城 买到失心疯"),
(null,'img/mudi/modules_7.jpg',"塞舌尔","514人去过","镶嵌在印度洋上的璀璨明珠"),
(null,'img/mudi/modules_8.jpg',"马尔代夫","30514人去过","上帝抛洒人间的项链");

#/**游记列表**/
CREATE TABLE ly_yj_left(
  lid INT PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(128),
  title VARCHAR(128),         #主标题
  subtitle VARCHAR(128),     #副标题
	subimg VARCHAR(128),
	auther_name VARCHAR(128),
	list_scan VARCHAR(128),
	list_comment VARCHAR(128),
	auther_right VARCHAR(128)
);
#/**游记内容**/
INSERT INTO ly_yj_left VALUES
(null,'img/yj/yj_1.jpg',"#我的小长假# 时光多情似故人 弄堂里的老上海","夜上海，夜上海，你是个不夜城，华灯起，车声响，歌舞升平...对上海的了解来自老上海的经典老歌，我知道终有一天我会带着这些歌曲穿梭在上海的街道，寻找老上海存在的痕迹。","img/yj/user_2.jpg","秦楚妃","634" ,"1" ,"为TA加牛"),
(null,'img/yj/yj_2.jpg',"我的北疆","不知道在别人眼里，说起新疆第一印象会是什么样的，切糕、小偷、暴乱……这是我最初脑海里会浮现的字眼，其次就只有“葡萄干”和“哈密瓜”了。借用在别处看到的一段话：在很久很久以前，新疆离我很远很远——吐鲁番只出现在小学课文里；达坂城只出现在那句歌词里；乌鲁木齐只出现在天气预报里；喀纳斯只出现在湖怪的传说里……","img/yj/user_3.jpg","匠匠","623","0","为TA加牛"),
(null,'img/yj/yj_3.jpg',"【途牛首发】#我的小长假#探秘黄土高原上的那些震撼美景！","穿过人潮汹涌灯火阑珊，没有想过回头，一段又一段走不完的旅程，哪里是终点？自己都不清楚，笑对现实的无奈，不能后退的时候，不再傍徨的时候，永远向前，路一直都在！徘徊到不再徘徊，重来都不怕重来，没有选择的时候，不能选择的时候，永远向前，路一直都在！","img/yj/user_4.jpg","mibachn","375","0","为TA加牛"),
(null,'img/yj/yj_4.jpg',"三亚游记之#我是你的小情人#走进老爸说起的福地","其实说起三亚，很多人都有一种大海的情节，大部分人听到三亚两个字，首先想到的就是浪漫or，蜜月，其次再是海滩，阳光和椰林，似乎三亚就是情人的专属天堂，国内的看海圣地也是三亚的代名词。","img/yj/user10.jpg","唐笑姗","885","0","为TA加牛"),
(null,'img/yj/yj_5.jpg',"#我的小长假#BORACAY，你来，许你一片静谧的海。","三毛说过：一个人至少拥有一个梦想，有一个理由去坚强。心若没有栖息的地方，到哪里都是在流浪。","img/yj/user_5.jpg","Miss_婉言谢绝","445","0","为TA加牛"),
(null,'img/yj/yj_6.jpg',"#我的小长假#【2017、印尼巴厘岛】跨越赤道静享悠闲时光","巴厘岛（Bali）行政上被称为巴厘省，位于印度尼西亚中部，坐落在赤道偏南一点（南纬8度），属于南半球。巴厘岛比一般东南亚的度假海岛要大，面积接近整个上海市。","img/yj/user_6.jpg","虔诚守梦人","759","0","为TA加牛"),
(null,'img/yj/yj_7.jpg',"#我的小长假#你好，我是高黎贡山下的伊甸园：腾冲","【高黎贡山下的伊甸园】一条古往今来的通道一段荡气回肠的历史一部散落边地的汉书一个世界罕见的奇观腾冲,这块古老、神奇而蕴藏着无限生机和活力的土地，因为地势偏远，外来旅客偏少，属于云南处女地:","img/yj/user_6.jpg","盛开之夏沫","4293","0","为TA加牛"),
(null,'img/yj/yj_8.jpg',"蜀南渝北——千里之行，始于足下","我活在世上，无非想要明白些道理，遇见些有趣的事。	———— 王小波倘能如我愿，我将踏足千里，行至远方……","img/yj/user_8.jpg","一坪的海岸线","759","0","为TA加牛"),
(null,'img/yj/yj_9.jpg',"【途牛首发】用一个周末的时光，去感受宝鸡这座历史文化名城","大家都知道西安的古城墙和兵马俑全国闻名，是否知道距离西安仅100多公里的宝鸡也是一处历史悠久，名胜古迹众多的地方呢？这里是华夏始祖炎帝的故里，也是周秦王朝的发祥地。一个弥漫着青铜器气息、历经岁月沧桑依然不改其本色的地方","img/yj/user_9.jpg"," 旅行摄影师冉静","14488","0","为TA加牛"),
(null,'img/yj/yj_10.jpg',"#我的小长假#【2017、内蒙古呼伦贝尔】自驾追寻草原之秋","哈拉哈河是中国同蒙古国的界河,发源于大兴安岭西侧摩天岭北坡的松叶湖（达尔滨湖），流经杜鹃湖，同时还汇集于苏呼河和古尔班河等支流，干流由东向西经伊尔施镇流入蒙古国，属额尔古纳水系，在我国流域面积7520平方公里。","img/yj/user_6.jpg"," 虔诚守梦人","929","0","为TA加牛");

CREATE TABLE ly_scenery(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	family_id INT,						#所属旅游景点编号
	lname VARCHAR(32),				#景点名称
	price DECIMAL(8,2),				#价格
	sat VARCHAR(64),           #满意度
	appraise VARCHAR(64)			#评价
);
INSERT INTO ly_scenery VALUES
(NULL,1,"焦作云台山","8","满意度：93%","974人点评"),
(NULL,2,"重渡沟风景区","55","满意度：95%","52人点评"),
(NULL,3,"万仙山","40","满意度：90%","143人点评"),
(NULL,4,"鲁山皇姑浴温泉","69","满意度：98%","37人点评"),
(NULL,5,"郑州海洋馆","80","满意度：84%","23人点评"),
(NULL,6,"黄山风景区","188","满意度：93%","45人点评"),
(NULL,7,"上海迪士尼乐园","280","满意度：93%","14594人点评"),
(NULL,8,"世纪欢乐园","35","满意度：91%","146人点评"),
(NULL,9,"郑州方特欢乐世界","170","满意度：98%","990人点评"),
(NULL,10,"洛阳龙门石窟","1","满意度：91%","390人点评");

CREATE TABLE ly_view(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  jd_id INT,              #所属景点家族编号
  title VARCHAR(128),         #主标题
  price DECIMAL(10),					#价格
	address	VARCHAR(128),				#具体地址
	open_date VARCHAR(128),			#开放时间
	sat VARCHAR(128),						#满意度
	comments VARCHAR(128),			#点评人数
	tpc	VARCHAR(128)						#游客评论
);

INSERT INTO ly_view VALUES
(NULL,1,"焦作云台山","135","河南省焦作市修武县修武正北30公里方庄(靠近233省道)","夏季06:00-18:00，冬季07:00-17:00","93%","974","很方便，用身份证就能直接进入景区"),
(NULL,2,"重渡沟景区","110","河南省洛阳市栾川县潭头镇重渡村","09:00-18:00","95%","52","挺不错的有山有水玩的挺开心"),
(NULL,3,"万仙山","180","河南省新乡市辉县市沙窑乡境内","全天","90%","143","不错，挺快的，直接取票不用排队"),
(NULL,4,"鲁山黄姑浴温泉","138","河南鲁山县下汤镇西北隅","08:00-23:00","98%","37","早上去的，和家人一起自驾游，地方很好找，室内室外都有，室外的池子很大，人也很多，地方很干净，水也很干净，温度也符合我的要求，服务态度很好，下次有机会还要再去一次，家人也很蚂蚁"),
(NULL,5,"郑州海洋馆","80","文化路与国基路向西100米","08:00-17:00","84%","23","去的有点晚了，早一点安排会更好点。建议最迟下午两点前开始。"),
(NULL,6,"黄山风景区","188","黄山市黄山区汤口镇","淡季7:30-16:00,旺季6:00-17:00","90%","189","不错，挺快的，直接取票不用排队"),
(NULL,7,"上海迪士尼乐园","280","上海市浦东新区川沙新镇申迪北路753号上海迪士尼度假区","9:00-19:00(开放时间以当天公示为准，遇周末节假日开园时间会延长)","94%","14732","上海迪士尼，环境优美，城堡很漂亮，在城堡里面还看了白雪公主的表演，还有很多游戏项目，由于当天周六，确实很多人，只玩了2.3个项目，主要是创极速光轮，很刺激，玩了2次，基本表演剧场的都看完了，很好看，内容很精彩"),
(NULL,8,"世纪欢乐园","75","河南省郑州市管城区石化路1号","09:30-17:30，4月28日-5月1日09:00-22:00。","91%","146","挺好，订票快，出票方便快捷"),
(NULL,9,"郑州方特欢乐世界","170","河南省郑州市郑开大道与人文路交叉口向南（绿博园北门正对面）","09:30-17:30","98%","990","很好,去了直接刷身份证进.淡季，人不多，几乎都玩了。表演也全看了,方特欢乐世界"),
(NULL,10,"洛阳龙门石窟","30","河南省洛阳市洛龙区龙门中街","07:30-17:30","91%","390","值得一去的地方 很壮观 就是门票没有打小折扣 换票的时候没有独立的窗口 要打完单子 再去排队拿票 要是有一个网上订票取票专口就更好啦");

/*景区图片*/
CREATE TABLE ly_scenery_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,
	scenery_id INT,						#景点品编号
	sm VARCHAR(128),						#小图片路径
	md VARCHAR(128),						#中图片路径
	lg VARCHAR(128)             #大图片路径
);
INSERT INTO ly_scenery_pic VALUES
(NULL, 1, 'img/dingpiao/jz/sm_1.jpg','img/dingpiao/jz/md_1.jpg','img/dingpiao/jz/lg_1.jpg'),
(NULL, 1, 'img/dingpiao/jz/sm_2.jpg','img/dingpiao/jz/md_2.jpg','img/dingpiao/jz/lg_2.jpg'),
(NULL, 1, 'img/dingpiao/jz/sm_3.jpg','img/dingpiao/jz/md_3.jpg','img/dingpiao/jz/lg_3.jpg'),
(NULL, 1, 'img/dingpiao/jz/sm_4.jpg','img/dingpiao/jz/md_4.jpg','img/dingpiao/jz/lg_4.jpg'),
(NULL, 1, 'img/dingpiao/jz/sm_5.jpg','img/dingpiao/jz/md_5.jpg','img/dingpiao/jz/lg_5.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_1.jpg','img/dingpiao/cdg/md_1.jpg','img/dingpiao/cdg/lg_1.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_2.jpg','img/dingpiao/cdg/md_2.jpg','img/dingpiao/cdg/lg_2.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_3.jpg','img/dingpiao/cdg/md_3.jpg','img/dingpiao/cdg/lg_3.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_4.jpg','img/dingpiao/cdg/md_4.jpg','img/dingpiao/cdg/lg_4.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_5.jpg','img/dingpiao/cdg/md_5.jpg','img/dingpiao/cdg/lg_5.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_6.jpg','img/dingpiao/cdg/md_6.jpg','img/dingpiao/cdg/lg_6.jpg'),
(NULL, 2, 'img/dingpiao/cdg/sm_7.jpg','img/dingpiao/cdg/md_7.jpg','img/dingpiao/cdg/lg_7.jpg'),
(NULL, 3, 'img/dingpiao/wxs/sm_1.jpg','img/dingpiao/wxs/md_1.jpg','img/dingpiao/wxs/lg_1.jpg'),
(NULL, 3, 'img/dingpiao/wxs/sm_2.jpg','img/dingpiao/wxs/md_2.jpg','img/dingpiao/wxs/lg_2.jpg'),
(NULL, 3, 'img/dingpiao/wxs/sm_3.jpg','img/dingpiao/wxs/md_3.jpg','img/dingpiao/wxs/lg_3.jpg'),
(NULL, 3, 'img/dingpiao/wxs/sm_4.jpg','img/dingpiao/wxs/md_4.jpg','img/dingpiao/wxs/lg_4.jpg'),
(NULL, 3, 'img/dingpiao/wxs/sm_5.jpg','img/dingpiao/wxs/md_5.jpg','img/dingpiao/wxs/lg_5.jpg'),
(NULL, 4, 'img/dingpiao/wq/sm_1.jpg','img/dingpiao/wq/md_1.jpg','img/dingpiao/wq/lg_1.jpg'),
(NULL, 4, 'img/dingpiao/wq/sm_2.jpg','img/dingpiao/wq/md_2.jpg','img/dingpiao/wq/lg_2.jpg'),
(NULL, 4, 'img/dingpiao/wq/sm_3.jpg','img/dingpiao/wq/md_3.jpg','img/dingpiao/wq/lg_3.jpg'),
(NULL, 5, 'img/dingpiao/hyg/sm_1.jpg','img/dingpiao/hyg/md_1.jpg','img/dingpiao/hyg/lg_1.jpg'),
(NULL, 5, 'img/dingpiao/hyg/sm_2.jpg','img/dingpiao/hyg/md_2.jpg','img/dingpiao/hyg/lg_2.jpg'),
(NULL, 5, 'img/dingpiao/hyg/sm_3.jpg','img/dingpiao/hyg/md_3.jpg','img/dingpiao/hyg/lg_3.jpg'),
(NULL, 5, 'img/dingpiao/hyg/sm_4.jpg','img/dingpiao/hyg/md_4.jpg','img/dingpiao/hyg/lg_4.jpg'),
(NULL, 5, 'img/dingpiao/hyg/sm_5.jpg','img/dingpiao/hyg/md_5.jpg','img/dingpiao/hyg/lg_5.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_1.jpg','img/dingpiao/hs/md_1.jpg','img/dingpiao/hs/lg_1.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_2.jpg','img/dingpiao/hs/md_2.jpg','img/dingpiao/hs/lg_2.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_3.jpg','img/dingpiao/hs/md_3.jpg','img/dingpiao/hs/lg_3.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_4.jpg','img/dingpiao/hs/md_4.jpg','img/dingpiao/hs/lg_4.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_5.jpg','img/dingpiao/hs/md_5.jpg','img/dingpiao/hs/lg_5.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_6.jpg','img/dingpiao/hs/md_6.jpg','img/dingpiao/hs/lg_6.jpg'),
(NULL, 6, 'img/dingpiao/hs/sm_7.jpg','img/dingpiao/hs/md_7.jpg','img/dingpiao/hs/lg_7.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_1.jpg','img/dingpiao/dsn/md_1.jpg','img/dingpiao/dsn/lg_1.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_2.jpg','img/dingpiao/dsn/md_2.jpg','img/dingpiao/dsn/lg_2.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_3.jpg','img/dingpiao/dsn/md_3.jpg','img/dingpiao/dsn/lg_3.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_4.jpg','img/dingpiao/dsn/md_4.jpg','img/dingpiao/dsn/lg_4.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_5.jpg','img/dingpiao/dsn/md_5.jpg','img/dingpiao/dsn/lg_5.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_6.jpg','img/dingpiao/dsn/md_6.jpg','img/dingpiao/dsn/lg_6.jpg'),
(NULL, 7, 'img/dingpiao/dsn/sm_7.jpg','img/dingpiao/dsn/md_7.jpg','img/dingpiao/dsn/lg_7.jpg'),
(NULL, 8, 'img/dingpiao/hly/sm_1.jpg','img/dingpiao/hly/md_1.jpg','img/dingpiao/hly/lg_1.jpg'),
(NULL, 8, 'img/dingpiao/hly/sm_2.jpg','img/dingpiao/hly/md_2.jpg','img/dingpiao/hly/lg_2.jpg'),
(NULL, 8, 'img/dingpiao/hly/sm_3.jpg','img/dingpiao/hly/md_3.jpg','img/dingpiao/hly/lg_3.jpg'),
(NULL, 8, 'img/dingpiao/hly/sm_4.jpg','img/dingpiao/hly/md_4.jpg','img/dingpiao/hly/lg_4.jpg'),
(NULL, 8, 'img/dingpiao/hly/sm_5.jpg','img/dingpiao/hly/md_5.jpg','img/dingpiao/hly/lg_5.jpg'),
(NULL, 9, 'img/dingpiao/ft/sm_1.jpg','img/dingpiao/ft/md_1.jpg','img/dingpiao/ft/lg_1.jpg'),
(NULL, 9, 'img/dingpiao/ft/sm_2.jpg','img/dingpiao/ft/md_2.jpg','img/dingpiao/ft/lg_2.jpg'),
(NULL, 9, 'img/dingpiao/ft/sm_3.jpg','img/dingpiao/ft/md_3.jpg','img/dingpiao/ft/lg_3.jpg'),
(NULL, 9, 'img/dingpiao/ft/sm_4.jpg','img/dingpiao/ft/md_4.jpg','img/dingpiao/ft/lg_4.jpg'),
(NULL, 10, 'img/dingpiao/lmsk/sm_1.jpg','img/dingpiao/lmsk/md_1.jpg','img/dingpiao/lmsk/lg_1.jpg'),
(NULL, 10, 'img/dingpiao/lmsk/sm_2.jpg','img/dingpiao/lmsk/md_2.jpg','img/dingpiao/lmsk/lg_2.jpg'),
(NULL, 10, 'img/dingpiao/lmsk/sm_3.jpg','img/dingpiao/lmsk/md_3.jpg','img/dingpiao/lmsk/lg_3.jpg'),
(NULL, 10, 'img/dingpiao/lmsk/sm_4.jpg','img/dingpiao/lmsk/md_4.jpg','img/dingpiao/lmsk/lg_4.jpg'),
(NULL, 10, 'img/dingpiao/lmsk/sm_5.jpg','img/dingpiao/lmsk/md_5.jpg','img/dingpiao/lmsk/lg_5.jpg');

CREATE TABLE ly_admission_ticket(
	lid INT PRIMARY KEY AUTO_INCREMENT,
	scene_id INT,							#景点品编号
	title  VARCHAR(128),				#产品名称
	subtitle VARCHAR(128),			#副标题	
	timer VARCHAR(128),					#提前预定时间
	bazaar VARCHAR(128),				#市场价
	tuniu VARCHAR(128)          #途牛价
);
INSERT INTO ly_admission_ticket VALUES
(NULL,1,"<云台山门票+景区区间交通成人门票>","1张身份证仅能预订1张门票","当天16点前","135","135"),
(NULL,1,"<【电子导游】焦作云台山—手机智能导游（3D地图，语音讲解，必玩清单）【不含门票】专项>","1张身份证仅能预订1张门票","当天23点前","20","5"),
(NULL,1,"<【电子导游】焦作云台山智能中文语音讲解（不含景区门票）专项>","","当天16点前","15","8"),
(NULL,1,"<【淡季票】焦作云台山景区成人票（二代身份证可直接入园）专项>","","当天16点前","135","135"),
(NULL,1,"<焦作云台山景区成人票（二代身份证可直接入园）专项>","","当天16点前","210",""),
(NULL,2,"<【电子导游】洛阳重渡沟风景区——手机智能导游（3D地图，语音讲解，必玩清单）【不含门票】专项>","","当天23点前","20","5"),
(NULL,2,"<洛阳重渡沟景区单程云顶索道票专项>","","当天16点前","60","55"),
(NULL,2,"<【旺季票】栾川重渡沟成人票专项>","","1天23点前","120","110"),
(NULL,3,"<【电子导游】新乡万仙山——手机智能导游（3D地图，语音讲解，必玩清单）【不含门票】专项>","","当天天23点前","20","5"),
(NULL,3,"<新乡万仙山景区优待票（学生/老人）专项>","","当天19点前","40","40"),
(NULL,3,"<新乡万仙山景区成人票专项>","","当天19点前","80","75"),
(NULL,3,"<【全景太行】万仙山（景区内部往返景交）+天界山套票专项>","","当天18点前","228","180"),
(NULL,3,"<【全景太行】万仙山（景区内部往返景交）+九莲山（景区往返景交）联票专项>","","当天18点前","248","180"),
(NULL,3,"<【全景太行】新乡万仙山+八里沟成人套票（含景区往返小交通）专项>","","当天18点前","248","180"),
(NULL,3,"<【全景太行】新乡万仙山+八里沟+天界山成人套票专项>","","当天18点前","353","198"),
(NULL,4,"<【温泉特惠】平顶山皇姑浴温泉成人票专项>","","当天20点前","168","69"),
(NULL,4,"<【周二特惠】平顶山皇姑浴温泉成人票（一票两人）专项>","","当天20点前","168","69"),
(NULL,4,"<【精选套票】平顶山皇姑浴温泉+鱼疗成人套票专项>","","当天20点前","188","79"),
(NULL,4,"<平顶山皇姑浴温泉成人票专项>","","当天20点前","168","79"),
(NULL,4,"<平顶山皇姑浴温泉双人票专项>","","当天20点前","336","138"),
(NULL,5,"<【景区直销】郑州海洋馆儿童票专项>","","当天15点前","80","80"),
(NULL,5,"<郑州海洋馆大学生票专项>","","当天15点前","100","90"),
(NULL,5,"<【景区直销】郑州海洋馆优待票专项>","","当天15点前","100","100"),
(NULL,5,"<【景区直销】郑州海洋馆成人票专项>","","当天15点前","130","125"),
(NULL,6,"<黄山风景区——手机智能语音导游（不含门票）专项>","","当天18点前","30","20"),
(NULL,6,"<黄山风景区学生票（旺季：3.1-11.30）专项>","","当天18点前","115","115"),
(NULL,6,"<黄山风景区成人票（淡季：12.1-次年2.28）专项>","","当天18点前","150","150"),
(NULL,7,"<【早定早优惠】【圣诞狂欢】上海迪士尼乐园成人门票>","【立减31元】","当天18点前","499","339"),
(NULL,7,"<【早定早优惠】【圣诞狂欢】上海迪士尼乐园儿童门票>","1米-1.4米儿童","当天18点前","375","249"),
(NULL,7,"<【邮储银行上海分行8折活动】上海迪士尼乐园成人门票>","","当天18点前","499","370"),
(NULL,7,"<【银行活动专享】上海迪士尼乐园儿童门票【平日】>","1米-1.4米儿童","当天18点前","375","280"),
(NULL,7,"<【银行活动专享】上海迪士尼乐园儿童门票【高峰】>","1米-1.4米儿童","当天18点前","375","375"),
(NULL,7,"<【银行活动专享】上海迪士尼乐园成人门票【平日】>","","当天18点前","499","370"),
(NULL,7,"<【银行活动专享】上海迪士尼乐园成人门票【高峰】>","","当天18点前","499","499"),
(NULL,7,"<上海迪士尼乐园成人门票>","","当天18点前","499","370"),
(NULL,7,"<上海迪士尼乐园（两日）成人门票>","成人两日票","当天18点前","950","670"),
(NULL,7,"<上海迪士尼乐园儿童门票>","1米-1.4米儿童","当天18点前","375","280"),
(NULL,7,"<上海迪士尼乐园长者门票>","65周岁及以上人士","当天18点前","375","280"),
(NULL,7,"<上海迪士尼乐园（两日）儿童门票>","儿童两日票","当天18点前","710","510"),
(NULL,7,"<上海迪士尼乐园（两日）长者门票>","长者两日票","当天18点前","710","510"),
(NULL,8,"<【电子导游】郑州世纪欢乐园——手机智能导航（3D地图，语音讲解，必玩清单）【不含门票】专项>","","当天23点前","20","5"),
(NULL,8,"<【奇幻之夜】郑州世纪欢乐园夜场成人票专项>","","当天19点前","40","35"),
(NULL,8,"<郑州世纪欢乐园全天场成人票（9:30之前入园）专项>","","当天09点前","160","75"),
(NULL,9,"<郑州方特欢乐世界成人票>","一起到方特high翻天！","1天23点前","240","230"),
(NULL,9,"<郑州方特欢乐世界儿童票>","一起来方特HIGH翻天！（限1.2-1.5米儿童订购）","1天23点前","180","170"),
(NULL,9,"<【电子导游】郑州方特欢乐世界——手机智能导航（3D地图，语音讲解，必玩清单）【不含门票】专项>","一起来方特HIGH翻天！（限1.2-1.5米儿童订购）","当天23点前","20","5"),
(NULL,9,"<郑州方特欢乐世界儿童票专项>","","1天23点前","180","170"),
(NULL,9,"<郑州方特欢乐世界大学生票专项>","","1天23点前","240","180"),
(NULL,9,"<郑州方特欢乐世界成人票专项>","","1天23点前","240","230"),
(NULL,10,"<【大师讲解】洛阳龙门石窟（不含门票）大师讲解中文露娜精简版专项>","","当天16点前","0.2298","1"),
(NULL,10,"<【电子导游】洛阳龙门石窟智能中文语音讲解（不含景区门票）专项>","","当天16点前","15","5"),
(NULL,10,"<【电子导游】5个必游景区手机智能语音导游套餐（含少林寺、龙门石窟、白马寺、天堂明堂、关林庙）（不含景区门票）专项>","","当天16点前","60","16");

#/**购物车条目**/
CREATE TABLE ly_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  scenery_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);
















