CREATE DATABASE lexian;

/*用户表*/
CREATE TABLE users(
  u_id CHAR(32) PRIMARY KEY,/*主键*/
  u_name VARCHAR(15) NOT NULL,/*用户名*/
  u_pwd VARCHAR(15) NOT NULL/*密码*/
);

/*商家表*/
CREATE TABLE seller(
  s_id CHAR(32) PRIMARY KEY,/*主键*/
  s_name VARCHAR(15) NOT NULL,/*用户名*/
  s_pwd VARCHAR(15) NOT NULL,/*密码*/
	s_email VARCHAR(50) NOT NULL,/*邮箱*/
  s_code CHAR(64) NOT NULL,/*邮箱激活码*/
	s_storeName VARCHAR(50), /*店名*/
	s_phone VARCHAR(11), /*门店电话*/
	s_addr VARCHAR(20), /*门店地址*/
	s_openTime TIME, /*营业开始时间*/
	s_closeTime TIME, /*营业结束时间*/
  s_state TINYINT(1) DEFAULT 0,/*商家状态，0表示未激活，1表示已激活*/
	s_likeCount INT(10) DEFAULT 0/*收藏人数*/
);

/*商品主类别表*/
CREATE TABLE type (
  t_id CHAR(32) PRIMARY KEY,/*主键*/
  t_name VARCHAR(20) NOT NULL/*分类名称*/
);

/*商品详细类别表*/
CREATE TABLE subType (
  sub_id CHAR(32) PRIMARY KEY,/*主键*/
  sub_name VARCHAR(20) NOT NULL,/*分类名称*/
	sub_t_id CHAR(32),/*外键，该详细类别所属主类别的id*/

	FOREIGN KEY (sub_t_id) REFERENCES type (t_id)/*建立主外键关系*/
);

/*商品表*/
CREATE TABLE goods(
  g_id CHAR(32) PRIMARY KEY,/*主键*/
  g_name VARCHAR(50) NOT NULL,/*商品的名称*/
  g_desc VARCHAR(200),/*商品描述*/
	g_price DECIMAL(10,2) NOT NULL,/*价格*/
  g_discount DECIMAL(10,2),/*促销价格*/
	g_image VARCHAR(100),/*商品图片地址*/
	g_updateTime TIMESTAMP,/*商品最后修改时间*/
	g_t_id CHAR(32),/*外键，商品所属主类别的id*/
	g_sub_id CHAR(32),/*外键，商品所属详细类别的id*/
	g_s_id CHAR(32),/*外键，商家的id*/
	g_del TINYINT(1),/*商品是否下架，0表示未下架，1表示下架*/
	g_likeCount INT(10) DEFAULT 0,/*收藏人数*/

	FOREIGN KEY (g_t_id) REFERENCES type (t_id),/*建立主外键关系*/
	FOREIGN KEY (g_sub_id) REFERENCES subType (sub_id),/*建立主外键关系*/
	FOREIGN KEY (g_s_id) REFERENCES seller (s_id)/*建立主外键关系*/
);

/*订单表*/
CREATE TABLE orders (
  o_id CHAR(32) PRIMARY KEY,/*主键*/
	o_orderTime TIMESTAMP,/*订单时间*/
	o_totalPrice DECIMAL(12,2),/*订单总价*/
	o_state SMALLINT(1),/*订单状态*/
	o_u_id CHAR(32),/*外键，该订单的用户id*/
	o_s_id CHAR(32),/*外键，该订单的商家id*/

  FOREIGN KEY (o_u_id) REFERENCES users (u_id),/*建立主外键关系*/
	FOREIGN KEY (o_s_id) REFERENCES seller (s_id)/*建立主外键关系*/
);

/*订单条目表*/
CREATE TABLE orderitem (
  oi_id CHAR(32) PRIMARY KEY,/*主键*/
	oi_singlePrice DECIMAL(8,2),/*购买时单价*/
  oi_count INT(10),/*数量*/
  oi_subTotal DECIMAL(10,2),/*小计*/
  oi_o_id CHAR(32),/*外键，所属订单的id*/
  oi_g_id CHAR(32),/*外键，订单项所指的商品id*/

  FOREIGN KEY (oi_o_id) REFERENCES orders (o_id),/*建立主外键关系*/
  FOREIGN KEY (oi_g_id) REFERENCES goods (g_id)/*建立主外键关系*/
);

/*商品收藏对应表*/
CREATE TABLE likeGoods(
  lg_u_id CHAR(32),/*外键，用户id*/
  lg_g_id CHAR(32),/*外键，商品id*/

	FOREIGN KEY (lg_u_id) REFERENCES users (u_id),/*建立主外键关系*/
	FOREIGN KEY (lg_g_id) REFERENCES goods (g_id)/*建立主外键关系*/
);

/*商家收藏对应表*/
CREATE TABLE likeSeller(
  ls_u_id CHAR(32),/*外键，用户id*/
  ls_s_id CHAR(32),/*外键，商家id*/

	FOREIGN KEY (ls_u_id) REFERENCES users (u_id),/*建立主外键关系*/
	FOREIGN KEY (ls_s_id) REFERENCES seller (s_id)/*建立主外键关系*/
);

/*用户消息提醒表*/
CREATE TABLE userMsg(
  um_u_id CHAR(32),/*外键，用户id*/
	um_code CHAR(6),/*订单取货码*/
  um_s_id CHAR(32),/*外键，商家id*/

	FOREIGN KEY (um_u_id) REFERENCES users (u_id),/*建立主外键关系*/
	FOREIGN KEY (um_s_id) REFERENCES seller (s_id)/*建立主外键关系*/
);
