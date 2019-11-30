create database erpdb;
alter database erpdb default character set utf8;

use erpdb;
/*用户表*/
create table t_user (
    u_id int(10) primary key not null auto_increment comment '用户ID',
    u_name varchar(10) not null  comment '用户名',
    u_pwd varchar(16) not null comment '密码'
);
alter table t_user auto_increment=100000;

insert into t_user(u_id,u_name,u_pwd) values(100000,'alliswell','123456'),(100001,'admin','123456');

/*商品类别表*/
create table t_category(
   c_id int not null primary key auto_increment comment '类别id',
   c_name varchar(64) not null unique comment '类别名称'
);
insert into t_category(c_id,c_name) values(1,'手机壳'),(2,'数据线'),(3,'充电宝'),(4,'耳机');
/*商品品牌表*/
create table t_brand(
    b_id int not null primary key auto_increment comment'品牌id',
    b_name varchar(64) not null unique comment '品牌名称'
);
insert into t_brand(b_id,b_name) values(1,'华为'),(2,'苹果'),(3,'小米');

/*商品表*/
create table t_goods(
    g_id int not null primary key auto_increment comment '商品id',
    g_name varchar(256) not null unique comment '商品名称',
    c_id int not null comment '商品类别id',
    b_id int not null comment '商品品牌id',
    g_price decimal(8,3) not null comment '商品价格',
    g_creTime timestamp default current_timestamp comment '商品创建时间',
    constraint fk_c_id foreign key (c_id) references t_category(c_id),
    constraint fk_b_id foreign key (b_id) references t_brand(b_id)
);

/*商品库存表*/
create table t_store(
    s_id int not null primary key auto_increment comment '库存id',
    g_id int not null comment '商品Id',
    s_residue int not null comment '商品剩余库存' default 0,
    s_undeliver int not null comment '未发商品数量' default 0,
    s_delivered int not null comment '已发商品数量' default 0
);

/*添加一个商品后自动向库存表插入库存*/
create trigger ins_goods_after after insert on t_goods
    for each row
begin
    insert into t_store(g_id) value(new.g_id);
end;

/*删除商品后删除商品的库存信息*/
create trigger del_goods_after after delete on t_goods
    for each row
begin
    delete from t_store where g_id = old.g_id;
end;

insert into t_goods(g_id,g_name,c_id,b_id,g_price)
values
    (1,'Huawei/华为移动电源12000毫安40W快充充电宝大容量超薄小巧便携',3,1,349.00),
    (2,'Huawei/华为经典耳机CM33 type-c接头适配华为p20耳机原装正品',4,1,89.00),
    (3,'Huawei/华为Mate30定制硅胶手机壳华为手机壳多彩简约时尚耐磨',1,1,99.00),
    (4,'Huawei/华为充电器5V2A带线手机充电头USB数据线2A快充原装正品',2,1,49.00),
    (5,'Apple/苹果 iPhone 11 Pro 硅胶保护壳',1,2,329.00),
    (6,'Apple/苹果 闪电转 USB 连接线 (1 米)',2,2,145.00),
    (7,'Apple/苹果 采用 3.5 毫米耳机插头的 EarPods',4,2,223.00),
    (8,'小米充电宝移动电源 10000毫安 超薄小巧便携大容量迷你金属通用',3,3,79.00),
    (9,'Xiaomi/小米 Redmi 红米Note 7 洞洞保护壳 创意镂空保护套手机壳',1,3,29.00),
    (10,'小米Redmi AirDots真无线蓝牙耳机 迷你隐形耳塞式耳机音乐耳麦',4,3,99.90),
    (11,'小米USB Type-C快速充电线1200mm线长多色高速USB手机数据线',2,3,16.90);

update t_store set s_residue = 100 where g_id = 1;
update t_store set s_residue = 100 where g_id = 2;
update t_store set s_residue = 100 where g_id = 3;
update t_store set s_residue = 100 where g_id = 4;
update t_store set s_residue = 100 where g_id = 5;
update t_store set s_residue = 100 where g_id = 6;
update t_store set s_residue = 100 where g_id = 7;
update t_store set s_residue = 100 where g_id = 8;
update t_store set s_residue = 100 where g_id = 9;
update t_store set s_residue = 100 where g_id = 10;
update t_store set s_residue = 100 where g_id = 11;


/*用户订单表*/
create table t_order(
    o_id varchar(36) not null primary key comment '订单号',
    u_id int not null comment '买家id',
    o_goods_number int not null comment '商品数量',
    o_total_money decimal(14,3) not null comment '订单总金额',
    o_status TINYINT not null default 1 comment '订单状态',
    o_creTime timestamp default current_timestamp comment '订单创建时间',
    constraint fk_o_u_id foreign key(u_id) references t_user(u_id)
);

/*删除用户订单删除后删除对应的商品订单信息*/
create trigger del_order_before before delete on t_order
    for each row
begin
    delete from t_orderitem where oi_orderId = old.o_id;
end;

/*商品订单表*/
create table t_orderitem(
    oi_id int not null primary key auto_increment comment '订单id',
    g_id int not null comment '商品id',
    oi_goods_number int not null comment '商品数量',
    oi_total_money decimal(14,3) not null comment 'item总金额',
    oi_orderId varchar(36) not null comment '订单编号',
    constraint fk_oi_oi_orderId foreign key(oi_orderId) references t_order(o_id)
);

/*生成订单后减少商品的库存*/
create trigger ins_goods_orderitem after insert on t_orderitem
    for each row
begin
    update t_store set s_residue = s_residue-new.oi_goods_Number where g_id = new.g_id;
end;

insert into t_order(o_id,u_id,o_goods_number,o_total_money,o_status)
values
    ('461d1f26fa23400ab5492c481f68ca23',100000,6,279.500,1),
    ('491ecef3ea634ed3852146fa1023ac79',100000,3,537.000,1),
    ('dc1699fc87c440f4bbb4216f50d0461f',100000,4,826.000,1),
    ('fa97ca17e17841d0b6da3d6ef4b3a5ac',100000,3,447.000,1);

insert into t_orderItem(g_id,oi_goods_number,oi_total_money,oi_orderId)
values
    (10,2,199.800,'461d1f26fa23400ab5492c481f68ca23'),
    (9,1,29.000,'461d1f26fa23400ab5492c481f68ca23'),
    (11,3,50.700,'461d1f26fa23400ab5492c481f68ca23'),
    (1,1,349.000,'491ecef3ea634ed3852146fa1023ac79'),
    (2,1,89.000,'491ecef3ea634ed3852146fa1023ac79'),
    (3,1,99.000,'491ecef3ea634ed3852146fa1023ac79'),
    (1,1,349.000,'dc1699fc87c440f4bbb4216f50d0461f'),
    (3,1,99.000,'dc1699fc87c440f4bbb4216f50d0461f'),
    (4,1,49.000,'dc1699fc87c440f4bbb4216f50d0461f'),
    (5,1,329.000,'dc1699fc87c440f4bbb4216f50d0461f'),
    (8,1,79.000,'fa97ca17e17841d0b6da3d6ef4b3a5ac'),
    (7,1,223.000,'fa97ca17e17841d0b6da3d6ef4b3a5ac'),
    (6,1,145.000,'fa97ca17e17841d0b6da3d6ef4b3a5ac');
