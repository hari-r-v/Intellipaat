---1.Create a customer table which comprises of these columns – ‘customer_id’, ‘first_name’, ‘last_name’, ‘email’, ‘address’, ‘city’,’state’,’zip’
create database moduleassignment

create table customer2(customer_id int , first_name varchar(20),last_name varchar(20) ,email varchar(50) , address varchar(50)  
, city varchar(15),state varchar(20),zip int)

select*from customer2

--2. Insert 5 new records into the table 
insert into customer2 values 
(1 , 'sumanth','kanakal','sumanthkanakal@gmail.com','vanasthalipuram', 'hyderabad','telangana',500071),
(2 ,'pratyush','kanakal','pratyush0770@gmail.com','ngos colony ', 'banglore','karnataka',674711),
(3 , 'malash','uppa','uppamallesh@gmail.com','lbnagar', 'hyderabad','telangana',500091),
(4 , 'ravi','bunda','bundaravi@gmail.com','hitectcity', 'hyderabad','telangana',600091),
(5 , 'gautham','pasha','pashgautham@gmail.com','mirzapur', 'San Jose','telangana',690091)



--3.Select only the ‘first_name’ & ‘last_name’ columns from the customer table

select first_name,last_name from customer

--4.Select those records where ‘first_name’ starts with “G” and city is ‘San Jose’

select *from customer2 where first_name like 'g%' and city='sanjose'

--1.Create an ‘Orders’ table which comprises of these columns – ‘order_id’, ‘order_date’, ‘amount’, ‘customer_id’
create table orders(order_id int , order_date int, amount int , customer_id int );

insert into orders values (100 , 2020-10-01 , 9000 , 20),
(103,2020-10-21,350,36),
(111,2012-10-21,542,67),
(182,2022-10-21,909,68),
(222,2022-10-21,999,31);


--2.Make an inner join on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column 
 
 select *from orders o inner join 
 customer c on c.customer_id=o.customer_id

--3.Make left and right joins on ‘Customer’ & ‘Order’ tables on the ‘customer_id’ column
--left join
select*from orders o  left join
customer c on o.customer_id=c.customer_id
-- right join 
select*from orders o right join 
customer c on c.customer_id=o.customer_id


--4.Update the ‘Orders’ table, set the amount to be 100 where ‘customer_id’ is 3
 
 update orders set  amount = 100 where customer_id = 3

 select*from orders