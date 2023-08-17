--------------------------------------------------------CASE_STUDY ASSIGNMENT----------------------------------------------------------

Drop table JOB
Drop Table Department
Drop Table [Location]
Drop table Employee

CREATE TABLE Location
(
Location_ID int NOT NULL PRIMARY KEY,
City varchar(20)
)

Insert Into Location VALUES
(122, 'New York'),
(123, 'Dallas'),
(124, 'Chicago'),
(167, 'Boston');

Create Table Department
(
Department_ID int NOT NULL PRIMARY KEY,
[name] varchar(20),
Location_ID int
Foreign KEY (Location_ID) REFERENCES [Location](Location_ID) 
)

Insert Into Department VALUES
(10, 'AcCOUNTing', 122),
(20, 'Sales', 124),
(30, 'Research', 123),
(40, 'Operations', 167);

Create Table JOB
(
Job_ID int NOT NULL PRIMARY KEY,
Designation varchar(20)
)

Insert Into JOB Values
(667, 'Clerk'),
(668, 'Staff'),
(669, 'Analyst'),
(670, 'Sales Person'),
(671, 'Manager'),
(672, 'President');

Create Table Employee
(
Employee_ID int NOT NULL PRIMARY KEY,
Last_name varchar(20),
First_name varchar(20),
Middle_name varchar(20),
Job_ID int,
Manager_ID int,
Hire_date date,
Salary int,
Comm int,
Department_ID int
)

Insert Into Employee VALUES
(7369, 'SMITH', 'JOHN', 'Q', 667, 7902, '17-DEC-84', 800, NULL, 20),
(7499, 'ALLEN', 'KEVIN', 'J', 670, 7698, '20-FEB-85', 1600, 300, 30),
(7505, 'DOYLE', 'JEAN', 'K', 671, 7839, '04-APR-85', 2850, NULL, 30),
(7506, 'DENNIS', 'LYNN', 'S', 671, 7839, '15-MAY-85', 2750, NULL, 30),
(7507, 'BAKER', 'LESLIE', 'D', 671, 7839, '10-JUN-85', 2200, NULL, 40),
(7521, 'WARK', 'CYNTHIA', 'D', 670, 7698, '22-FEB-85', 1250, 500, 30);

ALTER TABLE Employee 
	ADD CONSTRAINT Fk_JobID 
	Foreign Key (Job_ID) REFERENCES JOB(Job_ID);

ALTER TABLE Employee 
	ADD CONSTRAINT Fk_Department_Id
	Foreign Key (Department_ID) REFERENCES Department(Department_ID);

Select * From JOB;
Select * From Department;
Select * From  [Location];
Select * From  Employee;

------------------------------------------------------------- SIMPLE QUERIES----------------------------------------------------------

--1. LIST ALL THE Employee DETAILS.
SELECT * FROM Employee ;

--2. LIST ALL THE DEPARTMENT DETAILS
SELECT * FROM Department ;

--3. LIST ALL JOB DETAILS.
SELECT * FROM Job ;

--4. LIST ALL THE LOCATIONS.
SELECT * FROM Location ;

--5. LIST OUT THE FIRSTname, LASTname, Salary, COMMISSION FOR ALL EmployeeS.
SELECT FIRST_name, LAST_name, Salary, COMM FROM Employee ;

--6. LIST OUT EmployeeID,LAST name, DEPARTMENT ID FOR ALL EmployeeS 
--AND ALIAS EmployeeID AS "ID OF THE Employee", LAST name AS "name OF THE Employee", 
--DEPARTMENTID AS "DEP_ID".

SELECT Employee_id ID_of_the_Employee, Last_name name_of_the_Employee, Department_id Dep_id 
FROM Employee ;

--7. LIST OUT THE EmployeeS ANNUAL Salary WITH THEIR nameS ONLY.
SELECT First_name, Middle_name, Last_name, (Salary * 12) as Annual_Salary
FROM Employee ;

-------------------------------------------------------------WHERE CONDITION-----------------------------------------------------------

-- 1. LIST THE DETAILS ABOUT "SMITH"
SELECT * 
FROM Employee 
WHERE Last_name = 'Smith' ;

--2. LIST OUT THE EmployeeS WHO ARE WORKING IN DEPARTMENT 20
SELECT * 
FROM Employee
WHERE Department_Id = 20 ; 

--3. LIST OUT THE EmployeeS WHO ARE EARNING Salary BETWEEN 3000 AND 4500.
SELECT *
FROM Employee
WHERE Salary Between 3000 AND 4500 ;

--4. LIST OUT THE EmployeeS WHO ARE WORKING IN DEPARTMENT 10 OR 20.
SELECT *
FROM Employee
WHERE Department_Id = 10 OR Department_Id = 20 ;

--5. FIND OUT THE EmployeeS WHO ARE NOT WORKING IN DEPARTMENT 10 OR 30. 
SELECT *
FROM Employee
WHERE Department_Id !=10 AND Department_Id != 20 ;

--6. LIST OUT THE EmployeeS WHOSE name STARTS WITH 'S'
SELECT *
FROM Employee
WHERE Last_name LIKE 's%' ;

--7. LIST OUT THE EmployeeS WHOSE name STARTS WITH 'S' AND ENDS WITH 'H'.
SELECT *
FROM Employee
WHERE Last_name LIKE 's%h' ;

--8. LIST OUT THE EmployeeS WHOSE name LENGTH IS 4 AND START WITH 'S'.
SELECT * 
FROM Employee
WHERE Last_name = '___s' ;

--9. LIST OUT EmployeeS WHO ARE WORKING IN DEPARRTMENT 10 
--AND DRAW THE SALARIES MORE THAN 3500.
SELECT *
FROM Employee
WHERE Department_Id = 10 AND Salary > 3500 ;

--10. LIST OUT THE EmployeeS WHO ARE NOT RECEVING COMMISSION. 
SELECT * 
FROM Employee
WHERE Comm IS NULL ;

---------------------------------------------------------------------- ORDER BY CLAUSE---------------------------------------------------------

--1. LIST OUT THE Employee ID, LAST name IN ASCENDING ORDER BASED ON THE Employee ID
SELECT Employee_Id, Last_name
FROM Employee
Order By Employee_Id ASC ;

--2. LIST OUT THE Employee ID, name IN DESCENDING ORDER BASED ON Salary.
SELECT Employee_Id, Last_name
FROM Employee
Order By Salary DESC ;

--3. LIST OUT THE Employee DETAILS ACCORDING TO THEIR LAST-name IN ASCENDING ORDER
SELECT *
FROM Employee
Order By Last_name ASC ;

--4. LIST OUT THE Employee DETAILS ACCORDING TO THEIR LAST-name IN ASCENDING ORDER
--AND THEN ON DEPARTMENT_ID IN DESCENDING ORDER.
SELECT *
FROM Employee
Order By Last_name ASC, Department_Id DESC ;

-----------------------------------------------------------GROUP BY AND HAVING CLAUSE---------------------------------------------------

--1. HOW MANY EmployeeS WHO ARE IN DIFFERENT DEPARTMENTS WISE IN THE ORGANIZATION
SELECT COUNT (Department_Id) No_Of_People, Department_Id
FROM Employee
Group By Department_Id ;

--2. LIST OUT THE DEPARTMENT WISE MAXIMUM Salary, MINIMUM Salary, AVERAGE Salary OF THE EmployeeS.
SELECT Department_ID, MAX(Salary) MAX_Salary, MIN (Salary) Min_Salary, AVG (Salary) AVG_Salary
FROM Employee
Group By Department_ID ;

--3. LIST OUT JOB WISE MAXIMUM Salary, MINIMUM Salary, AVERAGE SALARIES OF THE EmployeeS.
SELECT JOB_ID, MAX(Salary) MAX_Salary, MIN (Salary) Min_Salary, AVG (Salary) AVG_Salary
FROM Employee
Group By JOB_ID ;

--4. LIST OUT THE NUMBER OF EmployeeS JOINED IN EVERY MONTH IN ASCENDING ORDER.
SELECT COUNT(Hire_date) AS COUNT_Month,MONTH(Hire_Date) AS Joining_Month
FROM Employee
GROUP BY MONTH(Hire_Date)
ORDER BY MONTH(Hire_Date) ASC ;

--5. LIST OUT THE NUMBER OF EmployeeS FOR EACH MONTH AND YEAR,
--IN THE ASCENDING ORDER BASED ON THE YEAR, MONTH.

SELECT MONTH(Hire_date) [month],YEAR(Hire_date) [year],COUNT(MONTH(Hire_date)) COUNT_month,COUNT(YEAR(Hire_date)) COUNT_year
FROM Employee
GROUP BY MONTH(Hire_date),YEAR(Hire_date)
ORDER BY MONTH(Hire_date),YEAR(Hire_date) ASC ;

--6. LIST OUT THE DEPARTMENT ID HAVING ATLEAST FOUR EmployeeS.
SELECT Department_ID
FROM Employee
GROUP BY Department_ID
HAVING COUNT(Department_ID) >= 4 ;

--7. HOW MANY EmployeeS JOINED IN JANUARY MONTH.
SELECT MONTH(Hire_date) AS [Month], COUNT(Hire_date) AS No_Of_Joined
FROM Employee
GROUP BY MONTH(Hire_date)
HAVING MONTH(Hire_date) = 1 ;

--8. HOW MANY EmployeeS JOINED IN JANUARY OR SEPTEMBER MONTH.
SELECT MONTH(Hire_date) AS [Month], COUNT(Hire_date) AS No_Of_Joined
FROM Employee
GROUP BY MONTH(Hire_date)
HAVING MONTH(Hire_date) IN (1,9) ; 

--9. HOW MANY EmployeeS WERE JOINED IN 1985?
SELECT COUNT(YEAR(Hire_date)) COUNT_1985_Joined ,YEAR(Hire_date) Joining_Year
FROM Employee
GROUP BY YEAR(Hire_date)
HAVING YEAR(Hire_date) = 1985 ;

--10. HOW MANY EmployeeS WERE JOINED EACH MONTH IN 1985.
SELECT COUNT(YEAR(Hire_date)) COUNT_1985_Joined ,MONTH(Hire_date) Joining_Month,YEAR(Hire_date) Joining_Year
FROM Employee
GROUP BY YEAR(Hire_date),MONTH(Hire_date)
HAVING YEAR(Hire_date) = 1985 ;

--11. HOW MANY EmployeeS WERE JOINED IN MARCH 1985?
SELECT COUNT(YEAR(Hire_date)) COUNT_1985_Joined ,MONTH(Hire_date) Month_Joining,YEAR(Hire_date) Joining_Year
FROM Employee
GROUP BY YEAR(Hire_date),MONTH(Hire_date)
HAVING YEAR(Hire_date) IN (1985) AND MONTH(Hire_date) IN (3) ;

--12. WHICH IS THE DEPARTMENT ID, HAVING GREATER THAN OR EQUAL TO 3 EmployeeS JOINED IN APRIL 1985
SELECT Department_ID, MONTH(Hire_date) Joining_Month, YEAR(Hire_date) Joining_Year
FROM Employee
WHERE MONTH(Hire_date) = 4 AND YEAR(Hire_date) = 1985
GROUP BY MONTH(Hire_date),YEAR(Hire_date),Department_ID
HAVING COUNT(MONTH(Hire_date)) >= 3 ;

------------------------------------------------------------ JOINS-------------------------------------------------------------

--1. LIST OUT EmployeeS WITH THEIR DEPARTMENT nameS.
SELECT E.Employee_ID,E.Last_name,D.name
FROM Employee E 
	JOIN Department D
ON E.Department_ID = D.Department_ID ;

--2. DISPLAY EmployeeS WITH THEIR DESIGNATIONS
SELECT E.Employee_ID,E.Last_name,J.Designation
FROM Employee E
	JOIN Job J 
ON E.Job_ID = J.Job_ID ;

--3. DISPLAY THE EmployeeS WITH THEIR DEPARTMENT nameS AND REGIONAL GROUPS.
SELECT E.Employee_ID,E.Last_name,D.[name],L.City
FROM Employee E 
	JOIN Department D 
ON E.Department_ID = D.Department_ID
	JOIN [Location] L
ON D.Location_ID = L.Location_ID ;

--4. HOW MANY EmployeeS ARE WORKING IN DIFFERENT DEPARTMENTS AND DISPLAY WITH DEPARTMENT nameS.
SELECT D.name, COUNT(D.name) AS No_Of_Employeees
FROM Employee E 
	JOIN Department D
ON E.Department_ID = D.Department_ID
GROUP BY D.name ;

--5. HOW MANY EmployeeS WHO ARE WORKING IN SALES DEPARTMENT.
SELECT D.name, COUNT(D.name) AS No_Of_Employeees
FROM Employee E 
	JOIN Department D
ON E.Department_ID = D.Department_ID
WHERE D.name IN ('Sales')
GROUP BY D.name ;

--6. WHICH IS THE DEPARTMENT HAVING GREATER THAN OR EQUAL TO 5 EmployeeS AND DISPLAY THE DEPARTMENT nameS IN ASCENDING ORDER.
SELECT D.name, COUNT(D.name) AS No_Of_Employeees
FROM Employee E 
	JOIN Department D
ON E.Department_ID = D.Department_ID
GROUP BY D.name
HAVING COUNT(D.name) >= 5
ORDER BY D.name ASC ;

--7. HOW MANY JOBS IN THE ORGANIZATION WITH DESIGNATIONS.
SELECT COUNT(J.Job_ID) as No_Of_Jobs,J.Designation
FROM Employee E
	JOIN Job J 
ON E.Job_ID = J.Job_ID
GROUP BY J.Designation ;

--8. HOW MANY EmployeeS ARE WORKING IN "NEW YORK".
SELECT COUNT(L.City) as No_Of_Employees
FROM     Employee E INNER JOIN
                  Department D ON E.Department_ID = D.Department_ID
				  INNER JOIN
                  Location L ON D.Location_ID = L.Location_ID
WHERE L.City LIKE 'new york' ;
--9. DISPLAY THE EMPLOYEE DETAILS WITH SALARY GRADES.
ALTER Table Employee ADD Salary_Grade varchar(20)
UPDATE Employee SET Salary_Grade =
(
CASE
    WHEN Salary < 1000 THEN 'Low_Salary'
    WHEN Salary > 1000 AND Salary < 2000 THEN 'AVG_Salary'
    WHEN Salary > 2000 THEN 'High_Salary'
    ELSE 'NULL'
END);


CREATE PROCEDURE Salary_Grade 
AS
SELECT Salary_grade FROM Employee

EXEC Salary_Grade

--10. LIST OUT THE NO. OF EMPLOYEES ON GRADE WISE.
SELECT COUNT(Last_name) as No_of_Employees, Salary_Grade
FROM Employee
GROUP BY Salary_Grade;

--11. DISPLAY THE EMPLOYEE SALARY GRADES AND NO. OF EMPLOYEES BETWEEN 2000 TO 5000 RANGE OF SALARY.
SELECT Salary_Grade,COUNT(*)
FROM Employee
WHERE Salary BETWEEN 2000 AND 5000
GROUP BY Salary_Grade;

--12. DISPLAY THE EMPLOYEE DETAILS WITH THEIR MANAGER NAMES.
SELECT Last_name, J.Job_id , Designation 
FROM Employee E, Job J
WHERE E.job_id = J.job_id AND J.Job_id =
	(SELECT J.Job_id WHERE Designation = 'Manager');

-------------------------------------------------[ASSUMING WE HAVE MANAGER TABLE]-------------------------------------------
[ SELECT Last_name, Manager_id
FROM Employee E JOIN Manager M
ON E.Employee_ID = M. Manager_ID
WHERE E.Manager_id = M.Manager_id 
GROUP BY name ];

--13. DISPLAY THE Employee DETAILS WHO EARN MORE THAN THEIR MANAGERS SALARIES.
[SELECT E.Last_name, E.Salary, M.Last_name, M.Manager_name, M.mgr_salary 
FROM Employee E, Employee M
WHERE E.Manager_id = M.Employee_id AND M.Salary < E.Salary ];

--14. SHOW THE NO. OF EmployeeS WORKING UNDER EVERY MANAGER.
[SELECT M.Manager_id, COUNT(*)
FROM Employee E, Employee M
WHERE E.Employee_id = M.Manager_id
GROUP BY M.Manager_id];

--15. DISPLAY Employee DETAILS WITH THEIR MANAGER nameS.
[SELECT Last_name, J.Job_id , Designation 
FROM Employee E, Job J
WHERE E.job_id = J.job_id AND J.Job_id =
	(SELECT J.Job_id WHERE Designation = 'Manager')];

--16. DISPLAY ALL EmployeeS IN SALES OR OPERATION DEPARTMENTS.
SELECT * 
FROM Employee AS E
FULL JOIN Department AS D
ON E.Department_ID = D.Department_ID 
WHERE D.name='Operations' OR D.name='Sales';

---------------------------------------------------------------SET OPERATORS--------------------------------------------------------
--1. LIST OUT THE DISTINCT JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
SELECT Designation
FROM job
WHERE job_id in
	(SELECT job_id FROM Employee WHERE department_id=
		(SELECT department_id FROM department WHERE name ='SALES'))
UNION
SELECT Designation
FROM job
WHERE job_id in 
	(SELECT job_id FROM Employee WHERE department_id=
		(SELECT department_id FROM department WHERE name='ACCOUNTING'));

--2. LIST OUT ALL THE JOBS IN SALES AND ACCOUNTING DEPARTMENTS.
SELECT Designation 
FROM job
WHERE job_id IN 
	(SELECT job_id FROM Employee WHERE department_id=
		(SELECT department_id FROM department WHERE name='SALES'))
UNION ALL
SELECT Designation
FROM job 
WHERE job_id IN
	(SELECT job_id FROM Employee WHERE department_id=
		(SELECT department_id FROM department WHERE name='ACCOUNTING'));

--3. LIST OUT THE COMMON JOBS IN RESEARCH AND ACCOUNTING DEPARTMENTS IN ASCENDING ORDER.
SELECT Designation
FROM Job
WHERE Job_id IN 
	(SELECT job_id FROM Employee WHERE department_id =
		(SELECT department_id FROM department WHERE name='RESEARCH'))
INTERSECT
SELECT Designation 
FROM job
WHERE job_id IN
	(SELECT job_id FROM Employee WHERE department_id=
		(SELECT department_id FROM department WHERE name='ACCOUNTING'))
ORDER BY Designation;

----------------------------------------------------------- SUB QUERIES -----------------------------------------------------
--1. DISPLAY THE EMPLOYEE WHO GOT THE MAXIMUM SALARY.
SELECT *
FROM Employee
WHERE Salary=
	(SELECT MAX(Salary) FROM Employee);

--2. DISPLAY THE EMPLOYEES WHO ARE WORKING IN SALES DEPARTMENT.
SELECT *
FROM Employee 
WHERE Department_id IN 
	(SELECT department_id FROM department WHERE name='sales');
          
--3. DISPLAY THE EMPLOYEES WHO ARE WORKING AS 'CLERK'.
SELECT * 
FROM Employee
WHERE Job_id IN
	(SELECT job_id FROM job WHERE Designation='clerk');

--4. DISPLAY THE EMPLOYEES WHO ARE LIVING IN “NEW YORK”.
SELECT * 
FROM Employee
WHERE Department_ID = 
	(SELECT Department_ID FROM Department WHERE Location_id =
		(SELECT location_id FROM [location] WHERE City='new york'));

--5. FIND OUT NO.OF EMPLOYEES WORKING IN “SALES” DEPARTMENT.
SELECT COUNT(*) as No_Of_Employees
FROM Employee
WHERE Department_ID IN 
	(SELECT Department_ID FROM department WHERE name ='sales');
 
--6. UPDATE THE EMPLOYEES SALARIES, WHO ARE WORKING AS CLERK ON THE BASIS OF 10%.
UPDATE Employee
SET Salary = Salary * 10/100 
WHERE Job_id =
	(SELECT job_id FROM job WHERE Designation='clerk'); 
    
--7. DELETE THE EMPLOYEES WHO ARE WORKING IN ACCOUNTING DEPARTMENT.
DELETE FROM  Employee
WHERE Department_ID = 
	(SELECT Department_ID FROM department WHERE name='accounting');

--8. DISPLAY THE SECOND HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
SELECT * 
FROM Employee
WHERE Salary =
	(SELECT MAX(Salary) FROM Employee WHERE Salary <
		(SELECT MAX(Salary) FROM Employee));

--9. DISPLAY THE NTH HIGHEST SALARY DRAWING EMPLOYEE DETAILS.
SELECT * 
FROM Employee
WHERE Salary =
	(SELECT MAX(Salary) FROM Employee);

--10. LIST OUT THE EMPLOYEES WHO EARN MORE THAN EVERY EMPLOYEE IN DEPARTMENT 30.
SELECT *
FROM Employee 
WHERE Salary > all (SELECT Salary FROM Employee WHERE Department_id=30);


--11. LIST OUT THE EMPLOYEES WHO EARN MORE THAN THE LOWEST SALARY IN DEPARTMENT 30.
SELECT *
FROM Employee
WHERE Salary > 
	ANY (SELECT salary FROM Employee WHERE Department_ID=30);   
    
--12. FIND OUT WHOSE DEPARTMENT HAS NO EMPLOYEES.
SELECT * 
FROM Employee E
WHERE NOT EXISTS 
	(SELECT Department_ID FROM Department d WHERE D.Department_ID = E.Department_ID);

--13. FIND OUT WHICH DEPARTMENT DOES NOT HAVE ANY EMPLOYEES.
SELECT Department_ID
FROM Employee
WHERE Department_ID NOT IN (SELECT  Department_ID FROM department);

--14. FIND OUT THE EMPLOYEES WHO EARN GREATER THAN THE AVERAGE SALARY FOR THEIR DEPARTMENT.
SELECT *
FROM Employee E
WHERE Salary > 
	(SELECT AVG(Salary) FROM Employee WHERE Department_ID = e.Department_ID);
