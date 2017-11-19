drop database hotel;
create database hotel;
use hotel;
create table customer(
customer_pkid int UNSIGNED primary key auto_increment,
customer_id varchar(60) unique not null,
customer_name varchar(60) not null,
customer_phnum varchar(60),
customer_del_mark boolean
)auto_increment=1;

create table user_acount(
user_pkid int UNSIGNED primary key auto_increment,
user_name varchar(60) not null,
user_password varchar(60) not null
)auto_increment=1;

create table employee(
employee_pkid int UNSIGNED primary key auto_increment,
employee_id varchar(60),
employee_name varchar(60) not null
)auto_increment=1;

create table order_type(
order_type_pkid int UNSIGNED primary key auto_increment,
order_type varchar(60) not null,
discount int UNSIGNED not null,
order_type_delmark boolean
)auto_increment=1;

create table room_type(
room_type_pkid int UNSIGNED primary key auto_increment,
room_type varchar(61) not null,
unit_price int UNSIGNED not null,
p_num int,
deposit int UNSIGNED not null,
type_del_mark boolean
)auto_increment=1;

create table room(
room_pkid int UNSIGNED primary key auto_increment,
room_num varchar(66) not null,
floor int not null,
windows boolean,
room_type_pkid int UNSIGNED,
room_state varchar(60) not null,
room_del_mark boolean,
FOREIGN KEY (room_type_pkid) REFERENCES room_type(room_type_pkid)
)auto_increment=1;

create table orders(
order_pkid int UNSIGNED primary key auto_increment,
orderpepole_pkid int UNSIGNED,
checkinpepole_pkid int UNSIGNED,
room_pkid int UNSIGNED,
createdaytime datetime,
dropdaytime datetime,
indatetime datetime,
outdatetime datetime,
state varchar(64),
ifgroup int,
paid_amount int UNSIGNED,
order_type_pkid int UNSIGNED,
foreign key (orderpepole_pkid) references customer(customer_pkid),
foreign key (checkinpepole_pkid) references customer(customer_pkid),
foreign key (order_type_pkid) references order_type(order_type_pkid),
foreign key (room_pkid) references room(room_pkid)
)auto_increment=1;

create table cgroup(
cgroup_pkid int UNSIGNED primary key auto_increment,
group_name varchar(65),
customer_pkid int UNSIGNED,
foreign key (customer_pkid) references customer(customer_pkid)
)auto_increment=1;

create table customer_belong_cgroup(
customer_pkid int UNSIGNED,
cgroup_pkid int UNSIGNED,
foreign key (customer_pkid) references customer(customer_pkid),
foreign key (cgroup_pkid) references cgroup(cgroup_pkid)
);
