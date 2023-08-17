Create table Role
(
id int primary key,
role_name varchar (50))

insert  into role values 
(1,'Designer'),
(2, 'site engineer');


drop table user_has_role
Create table user_has_role
(
id int primary key,
role_start_time datetime ,
role_end_time datetime ,
user_account_id int,
role_id int foreign key references role(id))

insert into user_has_role values
(
001,'2023-01-10;09:00:00',('2017-07-23'),  '13:10:11')


Create table user_account
(
id int primary key,
user_name varchar(50),
email varchar(100),
password varchar(100),
password_salt varchar(100) not null,
password_hash_algorithm varchar(50))



ALTER TABLE user_has_role
ADD FOREIGN KEY (user_account_id ) REFERENCES user_account(id);



insert into user_account values
(100, 'Sid','sidd@123','sidroadster','sidroadster','Siddique_123')
insert into user_account values
(101, 'Taz','taz@123','Taz_001','Taz_12345','tas_123')



Select * from user_has_role
insert into user_has_role (id,role_start_time,role_end_time,user_account_id,role_id)
values
(001,'2020-01-10 09:00:00',getdate(),101 ,1)
insert into user_has_role (id,role_start_time,role_end_time,user_account_id,role_id)
values
(002,'2019-01-10 09:00:00',getdate(),100 ,2)


 
Create table user_has_status
(id int primary key,
Status_start_time Datetime,
status_end_time timestamp not null,
user_account_id int foreign key references user_account(id),
status_id int)




Create table status
(id int primary key,
status_name varchar(100),
is_user_workinng bit)



ALTER TABLE user_has_status
ADD FOREIGN KEY (status_id) REFERENCES status(id);

insert into status values
(1001,'on_process',1)
insert into status values
(1002,'closed',2)

insert into user_has_status 
( id,status_start_time,user_account_id,status_id) 
values
(11,'2022-12-11 10:00:00',100,1001)

insert into user_has_status 
( id,status_start_time,user_account_id,status_id) 
values
(12,'2023-12-11 11:00:00',101,1002)



Select * from Role
Select * from user_has_status 
Select * from status
Select * from user_has_role
Select * from user_account

delete from role
delete from user_has_role
delete from user_has_status
delete from status
delete from user_account