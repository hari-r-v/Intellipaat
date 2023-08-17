
--1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table
 
 select 
 max(amount) as max_amount ,
 min(amount ) as min_amount,
 avg(amount) as avg_amounnt 
  from orders



--2.Create a user-defined function, which will multiply the given number with 10

create function mul_ten(@num int )
returns int
as
begin
return(
@num*10
)
end

select dbo.mul_ten(10)




--3.Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value
 
  

 select 
 case 
 when 100<200 then '100 is less then 200'
 when 200 >100 then '200 is greater then 100 '
 when 100 = 200 then '100 is equal to 200 ' 
 end
 
--1.Arrange the ‘Orders’ dataset in decreasing order of amount
 
 select*from orders order by amount desc

--2.Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table.

create table Employee_details1 (emp_id  int primary key , emp_name varchar(20), emp_salary int )
create table Employee_details2(emp_id int primary key, emp_name varchar(20), emp_salary int )

insert into Employee_details1 values 
(1,'sumanth ', 22),
(2,'sam',15),
(3,'mani',20)

insert into Employee_details2 values 
(1,'pratyush',25),
(2,'kanna',12),
(3,'satish',17)
select*from Employee_details1
--3.Apply the union operator on these two tables

select*from Employee_details1
union 
select*from Employee_details2

select*from Employee_details1
union all
select*from Employee_details2

--4.Apply the intersect operator on these two tables

select* from Employee_details1
intersect
select*from Employee_details2

--5.Apply the except operator on these two tables

select* from Employee_details1
except
select*from Employee_details2

 select * from Employee_details2
Except
select * from Employee_details1