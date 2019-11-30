create database erpdb;
alter database erpdb default character set utf8;

use erpdb;

/*用户表*/
create table t_user (
    u_id int(10) primary key not null auto_increment=100000 comment '用户ID',
    u_name varchar(10) not null  comment '用户名',
    u_pwd varchar(16) not null comment '密码'
);
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
    g_creTime timestamp default current_timestamp on update current_timestamp comment '商品创建时间',
    constraint fk_c_id foreign key (c_id) references t_category(c_id),
    constraint fk_b_id foreign key (b_id) references t_brand(b_id)
);
insert into t_goods(g_id,g_name,c_id,b_id,g_price)
values(1,'保时捷手机壳 华为 P30 Pro',1,1,12.9),
      (2,'光面手机壳 小米8 探索版',1,3,8),
      (3,'光面手机壳 华为P20',1,1,8.5),
      (4,'光面手机壳iPhone7/8',1,2,15.5),
      (5,'樱桃小熊iphone11手机壳',1,2,68.00),
      (6,'复古撞色格子毛绒软壳苹',1,2,27),
      (6,'Huawei/华为移动电源12000毫安40W快充充电宝大容量超薄小巧便携',3,1,349.00),
      (7,'Huawei/华为移动电源20000毫安便携充电宝双向18W快充原装正品',3,1,219.00),
      (8,'Huawei/华为经典耳机CM33 type-c接头适配华为p20耳机原装正品',4,1,89.00),
      (9,'Huawei/华为Mate30定制硅胶手机壳华为手机壳多彩简约时尚耐磨',1,1,99.00),
      (10,'Huawei/华为充电器5V2A带线手机充电头USB数据线2A快充原装正品',2,1,49.00);

/*商品库存表*/
create table t_store(
    s_id int not null primary key auto_increment comment '库存id',
    g_id int not null comment '商品Id',
    s_residue int not null comment '商品剩余库存' default 0,
    s_undeliver int not null comment '未发商品数量' default 0,
    s_delivered int not null comment '已发商品数量' default 0,
    constraint fk_s_g_id foreign key (g_id) references t_goods(g_id)
);
/*添加一个商品后自动向库存表插入库存*/
create trigger ins_goods_after after insert on t_goods
    for each row
begin
    insert into t_store(g_id) value(new.g_id);
end;
/*订单子表*/
create table t_order(
    o_id varchar(36) not null primary key comment '订单号',
    u_id int not null comment '买家id',
    o_goods_number int not null comment '商品数量',
    o_total_money decimal(14,3) not null comment '订单总金额',
    o_status TINYINT not null default 1 comment '订单状态',
    o_creTime timestamp default current_timestamp on update current_timestamp comment '订单创建时间',
    constraint fk_o_u_id foreign key(u_id) references t_user(u_id)
);
/*商品订单表*/
create table t_orderitem(
    oi_id int not null primary key auto_increment comment '订单id',
    g_id int not null comment '商品id',
    oi_goods_number int not null comment '商品数量',
    oi_total_money decimal(14,3) not null comment 'item总金额',
    oi_orderId varchar(36) not null comment '订单编号',
    constraint fk_oi_g_id foreign key(g_id) references t_goods(g_id),
    constraint fk_oi_oi_orderId foreign key(oi_orderId) references t_order(o_id)
);
/*生成订单后减少商品的库存*/
create trigger ins_goods_orderitem after insert on t_orderitem
    for each row
begin
    update t_store set s_residue = s_residue-new.oi_goods_Number  where g_id = new.g_id;
end;
