create table Employee_table(Employee_id int primary key,First_name varchar(20),Last_name varchar(20),Salary int,Joining_date datetime,Department varchar(20))
insert into Employee_table values
(1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR'),
(2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin'),
(3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR'),
(4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin'),
(5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin'),
(6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account'),
(7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account'),
(8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin') 

select * from Employee_table

create table employee_bonus(Employee_ref_id int Foreign key References Employee_table(Employee_id) ,Bonus_Amount int ,Bonus_Date datetime,)

insert into employee_bonus values(1,5000,'2020-2-16 0:00:00'),
(2,3000,'2011-06-16 0:00:00'),
(3,4000,'2020-02-16 0:00:00'),
(1,4500,'2020-02-16 0:00:00'),
(2,3500,'2011-06-16 0:00:00')

select * from employee_bonus


create table Employee_Title(Employee_ref_id int,Employee_title varchar(20),Affective_Date datetime)

insert into Employee_Title values(1,'Manager','2016-02-20 0:00:00'),
(2,'Executive','2016-06-11 0:00:00'),
(8,'Executive','2016-06-11 0:00:00'),
(5,'Manager','2016-06-11 0:00:00'),
(4,'Asst.Manager','2016-06-11 0:00:00'),
(7,'Executive','2016-06-11 0:00:00'),
(6,'Lead','2016-06-11 0:00:00'),
(3,'Lead','2016-06-11 0:00:00')

select * from Employee_Title

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name
select First_name as Employee_Name from Employee_table 

--2 Display “LAST_NAME” from Employee table in upper case.
select Upper(Last_name) from Employee_table 

--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select department from Employee_table group by Department having count(*)>1

--4 Display the first three characters of LAST_NAME from EMPLOYEE table
select top 3 last_name from Employee_table 

--5 Display the unique values of DEPARTMENT from EMPLOYEE table andprints its length.
select len(department) as length from Employee_table group by Department having count(*)>1 

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME. 
select CONCAT(First_name,' ',Last_name) as Full_Name from Employee_table

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending
select * from Employee_table order by First_name

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from Employee_table order by Department desc,first_name asc

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
SELECT * FROM Employee_table WHERE First_Name='VEENA' or First_Name='KARAN'

--Question 10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”.
SELECT * FROM Employee_table WHERE Department='Admin';

--Question 11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V’
SELECT * FROM Employee_table WHERE First_Name like '[V]%';

--Question 12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
SELECT * FROM Employee_table WHERE Salary BETWEEN 100000 and 500000;

--Question 13 Display details of the employees who have joined in Feb-2020.
select * from Employee_table where Joining_date>='2020-02-01' and Joining_date<='2020-02-28'

--Question 14 Display employee names with salaries >= 50000 and <= 100000.
SELECT First_Name FROM Employee_table WHERE Salary>=50000 and Salary<=100000;

--Question 16 DISPLAY details of the EMPLOYEES who are also Managers.
select * from Employee_Title where Employee_title='MANAGER'

--Question 17 DISPLAY duplicate records having matching data in some fields of a table.
SELECT Department, COUNT(department) as count FROM Employee_table GROUP BY Department HAVING COUNT(Department) > 1

--Question 18 Display only odd rows from a table.
SELECT * from Employee_table where Employee_ID%2=1;

--Question 19 Clone a new table from EMPLOYEE table.
select * into Emp_new from Employee_table where 1=1

--Question 20 DISPLAY the TOP 2 highest salary from a table.
SELECT TOP 2 Salary FROM Employee_table ORDER BY Salary DESC;

--Question 21. DISPLAY the list of employees with the same salary.
SELECT First_Name FROM Employee_table WHERE Salary IN (SELECT Salary FROM Employee_table GROUP BY Salary HAVING COUNT(*) > 1)

--Question 22 Display the second highest salary from a table.
SELECT MAX(Salary) FROM Employee_table WHERE salary < (SELECT MAX(Salary) FROM Employee_table)

--Question 23 Display the first 50% records from a table.
SELECT TOP 50 PERCENT  * FROM Employee_table

--Question 24. Display the departments that have less than 4 people in it.
SELECT Department FROM Employee_table WHERE Department IN (SELECT Department FROM Employee_table GROUP BY Department HAVING COUNT(*) < 4)

--Question 25. Display all departments along with the number of people in there.
select department,count(First_Name) from Employee_table group by Department 

-- Question 26 Display the name of employees having the highest salary in each department.
SELECT Department, max(SALARY) FROM Employee_table GROUP BY Department;

--Question 27 Display the names of employees who earn the highest salary
SELECT top 1 First_Name from Employee_table order by Salary DESC;

--Question 28 Diplay the average salaries for each department
SELECT AVG(salary) as AVRG_Salary,Department from Employee_table group by Department;

--Question 29 display the name of the employee who has got maximum bonus
SELECT First_Name FROM Employee_table INNER JOIN Employee_Bonus ON Employee_ID=Employee_Bonus.Employee_ref_ID;

--Question 30 Display the first name and title of all the employees
SELECT * FROM Employee_table INNER JOIN Employee_Title ON Employee_ID=Employee_Title.Employee_ref_ID;


