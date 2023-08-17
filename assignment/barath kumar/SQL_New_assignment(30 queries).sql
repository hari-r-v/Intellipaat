
---create table Employee
create table employee(
Employee_id int primary key,
First_name varchar(20), 
Last_name varchar(20), 
Salary int,
Joining_date datetime,
Department varchar(20));

sp_help employee

insert into employee values
(1,'Anika','Arora',100000,'2020-02-14 09:00:00','HR');
insert into employee values
(2,'Veena','Verma',80000,'2011-06-15 09:00:00','Admin');
insert into employee values
(3,'Vishal','Singhal',300000,'2020-02-16 09:00:00','HR');
insert into employee values
(4,'Sushanth','Singh',500000,'2020-02-17 09:00:00','Admin');
insert into employee values
(5,'Bhupal','Bhati',500000,'2011-06-18 09:00:00','Admin');
insert into employee values
(6,'Dheeraj','Diwan',200000,'2011-06-19 09:00:00','Account');
insert into employee values
(7,'Karan','Kumar',75000,'2020-01-14 09:00:00','Account');
insert into employee values
(8,'Chandrika','Chauhan',90000,'2011-04-15 09:00:00','Admin');

select * from employee

---create table Employee_bonus

create table Employee_bonus(
Employee_ref_id int foreign key references employee(Employee_id),
Bonus_Amount int,
Bonus_date datetime);

sp_help Employee_bonus

insert into Employee_bonus values
(1,5000,'2020-02-16 00:00:00');
insert into Employee_bonus values
(2,3000,'2011-6-16 00:00:00');
insert into Employee_bonus values
(3,4000,'2020-02-16 00:00:00');
insert into Employee_bonus values
(1,4500,'2020-02-16 00:00:00');
insert into Employee_bonus values
(2,3500,'2011-06-16 00:00:00');

select * from Employee_bonus


---create table Employee_Title
drop table Employee_title create table Employee_title(Employee_ref_id int,Employee_title varchar(25),Affective_date datetime);

sp_help Employee_title

insert into Employee_title values
(1,'Manager','2016-02-20 00:00:00');
insert into Employee_title values
(2,'Executive','2016-06-11 00:00:00');
insert into Employee_title values
(8,'Executive','2016-06-11 00:00:00');
insert into Employee_title values
(5,'Manager','2016-06-11 00:00:00');
insert into Employee_title values
(4,'Asst. Manager','2016-06-11 00:00:00');
insert into Employee_title values
(7,'Executive','2016-06-11 00:00:00');
insert into Employee_title values
(6,'Lead','2016-06-11 00:00:00');
insert into Employee_title values
(3,'Lead','2016-06-11 00:00:00');

select * from Employee_title


---1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.

select first_name as Employee_name from employee;

--- 2 Display “LAST_NAME” from Employee table in upper case.

select UPPER(last_name) from employee;

--- 3 Display unique values of DEPARTMENT from EMPLOYEE table.

select distinct Department from employee;

--- 4 Display the first three characters of LAST_NAME from EMPLOYEE table.

select left(last_name,3) from employee;

--- 5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.

select distinct DATALENGTH(Department) from employee;

--- 6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.  a space char should separate them.

select first_name + ' ' + last_name as Employee_name from employee;

--- 7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.

select * from employee
order by first_name asc

--- 8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.

select * from employee
order by first_name asc, last_name desc

--- 9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.

select * from employee where first_name='VEENA' or first_name='KARAN'

--- 10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.

select * from employee where department='Admin'

--- 11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’.

select * from employee where first_name like '%V%'

--- 12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.

select * from employee where Salary between 100000 and 500000

--- 13 Display details of the employees who have joined in Feb-2020.

select * from employee where datepart(yy,Joining_date) = '2020' and datename(M,Joining_date)='February'

--- 14 Display employee names with salaries >= 50000 and <= 100000.
select first_name + ' ' + last_name as Employee_name from employee where Salary between 50000 and 100000;

--- 16 DISPLAY details of the EMPLOYEES who are also Managers.

select * from Employee_title
inner join employee on employee.Employee_id = Employee_title.Employee_ref_id
where Employee_title='Manager'

--- 17 DISPLAY duplicate records having matching data in some fields of a table.
select A.Employee_ref_id,A.employee_title,A.Affective_date
FROM employee_title A inner join Employee_title B ON A.Employee_ref_id <> B.Employee_ref_id AND A.employee_title = B.employee_title
order by A.employee_title,A.Affective_date

--- 18 Display only odd rows from a table.

SELECT * FROM employee WHERE Employee_id % 2!=0;

--- 19 Clone a new table from EMPLOYEE table.
select * into employees_dummy from employee where 1 = 1;
SELECT * FROM employees_dummy

--- 20 DISPLAY the TOP 2 highest salary from a table.

select top 2 * from employee order by salary desc

--- 21. DISPLAY the list of employees with the same salary.

select A.Employee_id,A.first_name,A.last_name,A.Salary,A.Joining_date,A.Department
FROM employee A
inner join employee B ON A.Salary = B.Salary AND A.first_name <> B.first_name

--- 22 Display the second highest salary from a table.

SELECT MAX(salary) AS salary 
FROM employee 
WHERE salary <> (SELECT MAX(salary) FROM employee);

--- 23 Display the first 50% records from a table.
select top 50 percent * from employee

--- 24. Display the departments that have less than 4 people in it.

select top 2 department,COUNT(*) as headcount from employee 
GROUP BY DEPARTMENT
ORDER BY COUNT(*);

--- 25. Display all departments along with the number of people in there.

select department,COUNT(*) as headcount from employee 
GROUP BY DEPARTMENT
ORDER BY COUNT(*);


--- 26 Display the name of employees having the highest salary in each department.
SELECT e.first_name,e.last_name,e.department,e.salary FROM employee e
WHERE e.salary IN
    (SELECT max(salary)
     FROM employee
     GROUP BY department) 
order by e.salary desc;

--- 27 Display the names of employees who earn the highest salary.
SELECT e.first_name,e.last_name,e.department,e.salary FROM employee e
WHERE e.salary IN
    (SELECT max(salary)
     FROM employee);

--- 28 Diplay the average salaries for each department
SELECT department,avg(salary) as Avg_Salary
     FROM employee
     GROUP BY department

--- 29 display the name of the employee who has got maximum bonus
select top 1 e.first_name,e.last_name,b.bonus_amount FROM employee e
inner join Employee_bonus B ON e.Employee_id = B.Employee_ref_id
order by Bonus_Amount desc

--- 30 Display the first name and title of all the employees

select e.first_name,t.employee_title FROM employee e
inner join Employee_title t ON e.Employee_id = t.Employee_ref_id
