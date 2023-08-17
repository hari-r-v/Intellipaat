--- 1. Arrange the ‘Orders’ dataset in decreasing order of amount

select * from orders order by amount desc

--- 2. Create a table with name ‘Employee_details1’ and comprising of these columns – ‘Emp_id’, ‘Emp_name’, ‘Emp_salary’. Create another table with name ‘Employee_details2’, which comprises of same columns as first table.

create table Employee_details1
(
Emp_id int primary key,
Emp_name varchar(25),
Emp_salary int
)

insert into Employee_details1 values(1,'Ram',5000)
insert into Employee_details1 values(2,'Shyam',45000)
insert into Employee_details1 values(3,'Radhe',57000)
insert into Employee_details1 values(4,'Ben',50700)
insert into Employee_details1 values(5,'Stokes',54000)
insert into Employee_details1 values(6,'Aamir',85000)
insert into Employee_details1 values(7,'Aamir',85000)
insert into Employee_details1 values(8,'xAamir',85000)

select * from Employee_details1

create table Employee_details2
(
Emp_id int primary key,
Emp_name varchar(25),
Emp_salary int
)

insert into Employee_details2 values(1,'xRam',5000)
insert into Employee_details2 values(2,'xShyam',45000)
insert into Employee_details2 values(3,'xRadhe',57000)
insert into Employee_details2 values(4,'xBen',50700)
insert into Employee_details2 values(5,'xStokes',54000)
insert into Employee_details2 values(6,'xAamir',85000)
insert into Employee_details2 values(7,'Aamir',85000)

select * from Employee_details2

select * from Employee_details1

--- 3. Apply the union operator on these two tables

select * from Employee_details1 
union
select * from Employee_details2

--- 4. Apply the intersect operator on these two tables

select * from Employee_details1 
intersect
select * from Employee_details2

--- 5. Apply the except operator on these two tables

select * from Employee_details1 
except
select * from Employee_details2