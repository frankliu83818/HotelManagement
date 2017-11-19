insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('12345678','叶良辰','15210129608',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('23456789','赵日天','15210129609',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('34567890','马丽苏','15210129607',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('45678901','艾敬之','15210129606',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('56789012','张子','15210129605',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('67890123','芈月','15210129604',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('78901234','芈八子','15210129603',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('89012345','嬴荡','15210129602',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('90123456','嬴稷','15210129601',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('01234567','嬴祀','15210129600',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('13579086','张伟','15210129611',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('85365782','张涨涨','15210129622',false);
insert into customer (customer_id,customer_name,customer_phnum,customer_del_mark) values('29x76544','张弓长','15210129633',false);

insert into room_type(room_type,unit_price,p_num,deposit,type_del_mark) values('标准间',23000,2,5000,false);
insert into room_type(room_type,unit_price,p_num,deposit,type_del_mark) values('大床房',22500,2,5000,false);
insert into room_type(room_type,unit_price,p_num,deposit,type_del_mark) values('商务间',26000,2,5000,false);
insert into room_type(room_type,unit_price,p_num,deposit,type_del_mark) values('套房',31000,3,5000,false);

insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0101',1,1,1,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0102',1,1,1,'occupied',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0103',1,0,1,'occupied',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0104',1,0,1,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0105',1,1,2,'renovating',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state,room_del_mark) values('0106',1,1,2,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state, room_del_mark) values('0107',1,1,2,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state,room_del_mark) values('0108',1,1,2,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state,room_del_mark) values('0203',2,2,3,'idle',false);
insert into room(room_num,floor,windows,room_type_pkid,room_state,room_del_mark) values('0204',2,3,4,'idle',false);

insert into user_acount (user_name,user_password) values('boss_1','001');
insert into user_acount (user_name,user_password) values('manager_1','002');
insert into user_acount (user_name,user_password) values('employee_1','003');

insert into employee(employee_id,employee_name) values('001','a');
insert into employee(employee_id,employee_name) values('002','b');
insert into employee(employee_id,employee_name) values('003','c');

insert into order_type(order_type,discount,order_type_delmark) values('正常','100',false);
insert into order_type(order_type,discount,order_type_delmark) values('节日a','75',false);
insert into order_type(order_type,discount,order_type_delmark) values('节日b','85',false);

set @dt = now();
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (1,1,1,1,now(),0,date_add(@dt, interval 1 day), date_add(@dt, interval 1 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (2,2,2,6,now(),0,date_add(@dt, interval 2 day),date_add(@dt, interval 3 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (3,3,1,7,now(),0,date_add(@dt, interval 3 day),date_add(@dt, interval 9 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (2,4,1,8,now(),5000,date_add(@dt, interval 4 day),date_add(@dt, interval 5 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (3,5,1,9,now(),5000,date_add(@dt, interval 5 day),date_add(@dt, interval 7 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (3,6,2,2,date_add(@dt, interval -1 day),5000,date_add(@dt, interval -1 day),date_add(@dt, interval 6 day), 'checkin_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (3,7,1,4,date_add(@dt, interval -2 day),5000,date_add(@dt, interval 1 day),date_add(@dt, interval 7 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (4,4,1,3,now(),5000,date_add(@dt, interval 4 day),date_add(@dt, interval 5 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (5,5,1,5,now(),5000,date_add(@dt, interval 5 day),date_add(@dt, interval 7 day), 'reservation_confirm', 0);
insert orders(orderpepole_pkid,checkinpepole_pkid,order_type_pkid,room_pkid,createdaytime,paid_amount,indatetime,outdatetime,state,ifgroup) 
	  values (6,6,2,10,date_add(@dt, interval -1 day),5000,date_add(@dt, interval -1 day),date_add(@dt, interval 6 day), 'checkin_confirm', 0);
      