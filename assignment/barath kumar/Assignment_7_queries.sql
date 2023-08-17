CREATE TABLE Studies
(
Pname varchar(20),
Institute varchar(20),
Course varchar(20),
CourseFee int
)


INSERT INTO Studies VALUES ('Anand','Sabhari','PGDCA',4500);
INSERT INTO Studies VALUES ('Altaf','Coit','PGDCA',7200);
INSERT INTO Studies VALUES ('Juliana','Bdps','MCA',22000);
INSERT INTO Studies VALUES ('Kamala','Pragathi','DCA',5000);
INSERT INTO Studies VALUES ('Mary','Sabhari','PGDCA',4500);
INSERT INTO Studies VALUES ('Nelson','Pragathi','DAP',6200);
INSERT INTO Studies VALUES ('Patrick','Pragathi','DCAP',5200);
INSERT INTO Studies VALUES ('Qadir','Apple','HDCA',14000);
INSERT INTO Studies VALUES ('Ramesh','Sabhari','PGDCA',4500);
INSERT INTO Studies VALUES ('Rebecca','Brilliant','DCAP',11000);
INSERT INTO Studies VALUES ('Ramitha','Bdps','DCS',6000);
INSERT INTO Studies VALUES ('Revathi','Sabhari','DAP',5000);
INSERT INTO Studies VALUES ('Vijaya','Bdps','DCA',48000);

CREATE TABLE Software
(
Pname varchar(20),
Title varchar(20),
Developin varchar(20),
Scost decimal(10,2),
Dcost int,
Sold int
)

INSERT INTO Software VALUES ('Mary','Readme','CPP',300,1200,84);
INSERT INTO Software VALUES ('Anand','Parachutes','Basic',399.95,6000,43);
INSERT INTO Software VALUES ('Anand','Video Titling','Pascal',7500,16000,9);
INSERT INTO Software VALUES ('Juliana','Inventory','Cobol',3000,3500,0);
INSERT INTO Software VALUES ('Kamala','Payroll Pkg','Dbase',9000,20000,7);
INSERT INTO Software VALUES ('Mary','Financial Acc','Oracle',18000,85000,4);
INSERT INTO Software VALUES ('Mary','Code Generator','C',4500,20000,23);
INSERT INTO Software VALUES ('Patrick','Readme','CPP',750,1200,84);
INSERT INTO Software VALUES ('Qadir','Bombs Away','Assembly',1900,3000,11);
INSERT INTO Software VALUES ('Qadir','Vaccines','C',13000,3100,21);
INSERT INTO Software VALUES ('Ramesh','Hotel Mgmt','Dbase',599.95,35000,4);
INSERT INTO Software VALUES ('Ramesh','Dead Lee','Pascal',725,4500,73);
INSERT INTO Software VALUES ('Remitha','PC Utilities','C',2500,5000,51);
INSERT INTO Software VALUES ('Remitha','TSR Help Pkg','Assembly',300,6000,7);
INSERT INTO Software VALUES ('Revathi','Hospital Mgmt','Pascal',1100,75000,2);
INSERT INTO Software VALUES ('Vijaya','TSR Editor','C',900,700,6);

CREATE TABLE Programmer 
(
PNAME VARCHAR (50),
DOB date,
DOJ date,
GENDER VARCHAR(10),
Prof1 VARCHAR(50),
Prof2 VARCHAR (50),
SALARY INT
)

INSERT INTO Programmer VALUES ('Anand','12-APR-66','21-APR-92','M','Pascal','Basic',3200);
INSERT INTO Programmer VALUES ('Altaf','02-JUL-64','30-NOV-90','M','Clipper','Clobber',2800);
INSERT INTO Programmer VALUES ('Juliana','31-JAN-60','21-APR-90','F','Cobol','Dbase',3000);
INSERT INTO Programmer VALUES ('Kamala','30-OCT-68','02-JAN-92','F','C','Dbase',2900);
INSERT INTO Programmer VALUES ('Marie','24-JUN-70','01-FEB-91','F','CPP','Oracle',4500);
INSERT INTO Programmer VALUES ('Nelson','11-SEP-85','11-OCT-89','M','Cobol','Dbase',2500);
INSERT INTO Programmer VALUES ('Patric','10-NOV-85','21-APR-90','M','Pascal','Clipper',2800);
INSERT INTO Programmer VALUES ('Qadir','31-AUG-85','21-APR-91','M','Assembly','C',3000);
INSERT INTO Programmer VALUES ('Ramesh','03-MAY-67','28-FEB-91','M','Pascal','Dbase',3200);
INSERT INTO Programmer VALUES ('Rebecca','01-JAN-67','01-DEC-90','F','Basic','Cobol',2500);
INSERT INTO Programmer VALUES ('Remitha','19-APR-70','20-APR-93','M','C','Assembly',3600);
INSERT INTO Programmer VALUES ('Revathi','02-DEC-69','02-JAN-92','F','Pascal','Basic',3700);
INSERT INTO Programmer VALUES ('Vijaya','14-DEC-65','02-MAY-92','F','FoxPro','C',3500);


--1. Find out the selling cost AVG for packages developed in Pascal

Select AVG(Scost) From Software Where Developin LIKE 'Pascal';


--2. Display Names, Ages of all Programmers

Select Pname, DATEDIFF(YEAR,DOB,GETDATE()) FROM Programmer;

--3. Display the Names of those who have done the DAP Course

Select Pname from Studies Where Course='DAP';

--4. Display the Names and Date of Births of all Programmers Born in January

Select Pname,DOB From Programmer WHERE MONTH(DOB) = 1;

--5. What is the Highest Number of copies sold by a Package?

Select MAX(Sold) From Software;

--6. Display lowest course Fee

Select MIN(CourseFee) From Studies;

--7. How many programmers done the PGDCA Course?

Select COUNT(Pname) From Studies Where Course LIKE 'PGDCA';

--8. How much revenue has been earned thru sales of Packages Developed in C.

Select SUM(Sold*Scost)
From Software
Where Developin LIKE 'C';

--9. Display the Details of the Software Developed by Ramesh.

Select * 
From Software
Where Pname LIKE 'Ramesh';

--10. How many Programmers Studied at Sabhari? 

Select COUNT(Pname) From Studies Where Institute = 'Sabhari';

--11. Display details of Packages whose sales crossed the 20000 Mark. 

Select *
From Software
Where (Sold*Scost) > 20000;

--12. Display the Details of Packages for which Development Cost have been recovered. 

Select Pname,Scost,Dcost,Sold From Software Where Scost*Sold > Dcost;

--13. What is the cost of the costliest software development in Basic?

Select Max(Dcost) From Software Where Developin LIKE 'Basic';

--14. How many Packages Developed in DBASE?

Select Count(Developin) From Software Where Developin='Dbase';

--15. How many programmers studied in Pragathi?

Select Count(Pname) From Studies Where Institute LIKE 'Pragathi';

--16. How many Programmers Paid 5000 to 10000 for their course?

Select COUNT(Pname) AS No_Of_Pogrammers
From Studies
Where CourseFee>=5000 AND CourseFee<=10000;

--17. What is AVG Course Fee

Select AVG(CourseFee) From Studies;

--18. Display the details of the Programmers Knowing C.

Select * From Programmer Where Prof1='C' OR Prof2='C';

--19. How many Programmers know either COBOL or PASCAL. 

Select Count(Pname) From Programmer Where Prof1 IN ('Cobol','Pascal') OR Prof2 IN ('Cobol','Pascal');

--20. How many Programmers Don’t know PASCAL and C 

Select Count(Pname) From Programmer Where Prof1 NOT IN ('C','Pascal') AND Prof2 NOT IN ('C','Pascal');

--21. How old is the Oldest Male Programmer

Select DateDiff(YEAR,MIN(DOB),GETDATE()) FROM programmer Where Gender='M';

--22. What is the AVG age of Female Programmers?

Select AVG(DATEDIFF(YEAR,DOB,GETDATE())) From Programmer Where Gender='F';

--23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order. 

Select Pname,DATEDIFF(YEAR,DOB,DOJ) From Programmer GROUP BY Pname,Dob,Doj ORDER BY Pname Desc;

--24.  Who are the Programmers who celebrate their Birthday’s During the Current Month? 

Select Pname,DOB
From programmer 
Where
DATENAME(MONTH,GETDATE())=DATENAME(MONTH,DOB);

--25. How many Female Programmers are there?

Select Count(Pname)
From Programmer Where Gender='F'

--26. What are the Languages studied by Male Programmers

Select DISTINCT(Prof1) Lang
From Programmer
Where Gender='M'
UNION
Select DISTINCT(Prof2) Lang
From Programmer
Where Gender='M';

--27. What is the AVG Salary? 

Select Avg(Salary) from Programmer;

--28. How many people draw salary 2000 to 4000? 

Select Count(PNAME) 
From Programmer
Where Salary BETWEEN 2000 AND 4000;

--29. Display the details of those who don’t know Clipper, COBOL or PASCAL

Select *
From Programmer
Where Prof1 NOT IN ('Clipper','Cobol','Pascal')
AND
      Prof2 NOT IN ('Clipper','Cobol','Pascal');

--30. Display the Cost of Package Developed By each Programmer

Select Dcost From Software;

--31. Display the sales values of the Packages Developed by the each Programmer

Select (Scost*Sold) AS Sales_Value From Software;

--32. Display the Number of Packages sold by Each Programmer.

Select sold,Pname From Software;

--33. Display the sales cost of the packages Developed by each Programmer Language wise.

Select Developin,Pname,Scost
From Software
Group By Developin,Pname,Scost;

--34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.

Select Avg(Dcost),Avg(Scost),CAST(Avg(Scost/NULLIF(Sold,0)) AS Decimal(10,2))
From Software;


--35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her. 

Select Pname,MAX(Dcost),MIN(Dcost) From Software Group By Pname;

--36. Display each institute name with number of Courses, Average Cost per Course.

Select Count(Course),Institute,Avg(CourseFee)
From Studies
Group BY Institute;

--37. Display each institute Name with Number of Students.

Select Institute,Count(Pname)
From Studies
Group By Institute;

--38. Display Names of Male and Female Programmers. Gender also.

Select Pname,Gender
From Programmer;

--39. Display the Name of Programmers and Their Packages.

Select Pname,Salary
From Programmer;

--40. Display the Number of Packages in Each Language Except C and C++. 

Select Count(Salary) ,Prof1,Prof2
From Programmer
Where Prof1 NOT IN ('c','c++') And PROF2 NOT IN ('c','c++')
Group By Prof1,Prof2;

--41. Display the Number of Packages in Each Language for which Development Cost is less than 1000

Select Distinct(Developin),Count(Developin)
From Software Where Dcost<1000
Group By Developin;

--More than 100

Select Distinct(Developin),Count(Developin)
From Software Where Dcost>1000
Group By Developin;

--42. Display AVG Difference between SCOST, DCOST for Each Package.

Select Developin, CAST(Avg(Dcost-Scost) AS Decimal(10,2)) AS Avg_difference
From Software
Group By Developin;

--43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for
--Those Whose Cost has not yet been Recovered.

Select Pname, SUM(Dcost), (Scost*Sold) , ((Dcost-(Scost*Sold)))
From Software
where (Scost*Sold)<Dcost
Group By Pname,Dcost,Scost,Sold;

--44. Display Highest, Lowest and Average Salaries for those earning more than 2000.

Select MAX(Salary),MIN(Salary),AVG(Salary)
From Programmer
Where Salary>2000;

--45. Who is the Highest Paid C Programmers?

Select * From Programmer 
Where Salary =
(Select Max(Salary) From Programmer Where Prof1 LIKE 'c' OR Prof2 LIKE 'c');

--46. Who is the Highest Paid Female COBOL Programmer? 

Select Top 1 Salary,Pname 
From Programmer
Where (PRof1 LIKE'Cobol' OR Prof2 LIKE 'COBOL') And Gender LIKE 'F'
ORDER BY Salary DESC;

--47. Display the names of the highest paid programmers for each Language. 

Select MAX(Pname),Max(Salary),Prof1 
From Programmer
Group By Prof1;

--48. Who is the least experienced Programmer.

Select TOP 1 DOJ,Pname From Programmer ORDER BY DOJ DESC;

--49. Who is the most experienced male programmer knowing PASCAL. 

Select TOP 1 DOJ,Pname From Programmer ORDER BY DOJ ASC;

--50. Which Language is known by only one Programmer?

SELECT PROF1 FROM PROGRAMMER ---???
GROUP BY PROF1
HAVING PROF1 NOT IN
(SELECT PROF2 FROM PROGRAMMER)
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM PROGRAMMER
GROUP BY PROF2
HAVING PROF2 NOT IN
(SELECT PROF1 FROM PROGRAMMER)
AND COUNT(PROF2)=1;


--51. Who is the Above Programmer Referred in 50?

CREATE TABLE PSLang(PROF VARCHAR(20))

Select * from pslang

INSERT INTO PSLang 
SELECT PROF1 FROM programmer 
GROUP BY PROF1 HAVING
PROF1 NOT IN (SELECT PROF2 FROM programmer) 
AND COUNT(PROF1)=1
UNION
SELECT PROF2 FROM programmer 
GROUP BY PROF2 HAVING
PROF2 NOT IN (SELECT PROF1 FROM programmer) 
AND COUNT(PROF2)=1

SELECT PNAME, PROF FROM programmer 
INNER JOIN PSLang ON
PROF=PROF1 OR PROF=PROF2

--52. Who is the Youngest Programmer knowing DBASE?

Select *
From Programmer Where DOB=(Select MAX(DOB) AS Youngest 
From Programmer Where Prof1='Dbase' OR Prof2='Dbase')

--53. Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?

Select *
From Programmer
Where Gender LIKE 'F' AND Salary>3000 And Prof1 NOT IN ('C','C++','ORacle','Dbase') AND Prof2 NOT IN ('C','C++','ORacle','Dbase');

--54. Which Institute has most number of Students?

Select top 1 Institute,Count(institute) AS Most_Students  
From Studies Group by Institute Order by institute desc;

--55. What is the Costliest course?

Select Top 1 CourseFee,Course
From Studies Order By CourseFee DESC;

--56. Which course has been done by the most of the Students

Select Top 1 Course,Count(Course) From Studies Group BY Course Order By Course DESC;

--57. Which Institute conducts costliest course. 

Select Top 1 CourseFee,Course,Institute
From Studies Order By CourseFee DESC;

--58. Display the name of the Institute and Course, which has below AVG course fee.

Select Pname,Institute,Course,CourseFee 
From Studies
Where CourseFee<(Select AVG(CourseFee) AS Avg_Fee From Studies	);

--59. Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee

Select Course,CourseFee
From Studies WHERE CourseFee < (SELECT AVG(CourseFee)+1000 FROM Studies) AND CourseFee > (SELECT AVG(CourseFee)-1000 FROM Studies);

--60. Which package has the Highest Development cost?

Select Pname,Developin,Dcost
From Software WHERE DCOST = (Select MAX(DCOST) FROM SOFTWARE);

--61. Which course has below AVG number of Students?

Select Course, Avg_Of_Count,Count_Students
From 
(	Select Course,Count(Course) Count_Students,AVG(COUNT(Course)) OVER() Avg_Of_Count
	From Studies GROUP BY Course) X
Where Avg_Of_Count>=Count_Students;

--62. Which Package has the lowest selling cost? 

Select TOP 2 Scost,Developin
From Software Order By Scost ASC;

--63. Who Developed the Package that has sold the least number of copies?

Select Pname From Software Where Sold=(Select MIN(Sold) From Software)

--64. Which language was used to develop the package, which has the highest sales amount?

Select * From Software Where (Scost*Sold)=(Select MAX(Scost*Sold) From Software);

--65. How many copies of package were sold that has the least difference between development and scost.

Select (Sold) From Software Where Dcost-Scost=(Select MIN(Dcost-Scost) From Software)

--66. Which is the costliest package developed in PASCAL.

Select * From Software Where Dcost IN
(Select MAX(Dcost) From Software Where Developin='pascal');

--67. Which language was used to develop the most number of Packages.

Select Developin
From Software Group By Developin Having Developin=(Select MAX(Developin) From Software);

--68. Which programmer has developed the highest number of Packages?

Select Pname
From Software Group By Pname Having Pname=(Select MAX(Pname)From Software);

--69. Who is the Author of the Costliest Package? 

Select Pname
From Software Where Dcost=(Select MAX(Dcost) From Software);

--70. Display the names of the packages, which have sold less than the AVG number of copies.

Select * From Software Where Sold<(Select AVG(Sold) From Software);

--71. Who are the authors of the Packages, which have recovered more than double the Development cost?

Select DISTINCT(Pname)
From Software
Where (Scost*Sold)>(2*Dcost);

--72. Display the pname and the cheapest packages developed by them in each language.

Select Pname,Developin
From Software
Where Dcost In (Select MIN(Dcost) From Software Group By Developin);

--73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package

Select Pname,Developin
From Software
Where Sold IN (Select MAX(Sold) [max] From Software
 Group By Pname )
UNION
Select Pname,Developin
From Software
Where Sold IN ( Select MIN(Sold) [min] From Software Group By Pname);

--74. Who is the youngest male Programmer born in 1965? 

Select *
From Programmer Where DOB =
	(Select MAX(DOB) From Programmer Where Gender='M' AND YEAR(DOB)=('1965')); 

--75. Who is the oldest Female Programmer who joined in 1992?

Select * 
From Programmer
Where DOB=(Select MIN(DOB)
From Programmer 
 Where Gender='F' AND YEAR(DOJ)=('1992') );

--76. In which year was the most number of Programmers born.

SELECT *
FROM (SELECT YEAR(DOB) AS year_dob, COUNT(YEAR(DOB)) AS count_year From Programmer GROUP BY YEAR(DOB)
	 ) YC
JOIN
(
SELECT MAX(count_year) AS max_year
FROM
	( SELECT YEAR(DOB) AS year_dob, COUNT(YEAR(DOB)) AS count_year FROM ProgrammerGROUP BY YEAR(DOB)
	) X
) MC
ON YC.count_year=MC.max_year;

--77. In which month did most number of programmers join?

SELECT *
FROM (
	  SELECT MONTH(DOJ) AS month_doj, COUNT(MONTH(DOJ)) AS count_month
	  From Programmer
	  GROUP BY MONTH(DOJ)
	 ) YC
JOIN
(
SELECT MAX(count_month) AS max_month
FROM
	(
	 SELECT MONTH(DOJ) AS month_dob, COUNT(MONTH(DOJ)) AS count_month
	 FROM Programmer
	 GROUP BY MONTH(DOJ)
	) X
) MC
ON YC.count_month=MC.max_month;


--78. In which language are most of the programmer’s proficient

CREATE TABLE Proficient (PR VARCHAR(20), Count INT)
CREATE TABLE PsCount (PRs VARCHAR(20), sCount INT)

INSERT INTO Proficient
	SELECT PROF1, COUNT(pname) FROM programmer GROUP BY PROF1
		UNION ALL
	SELECT PROF2, COUNT(pname) FROM programmer GROUP BY PROF2

Select * from Proficient

INSERT INTO PsCount
	SELECT PR, SUM(Count) FROM Proficient GROUP BY PR

Select * from PsCount

SELECT PRs, sCount
FROM PsCount
WHERE sCount = 
		(SELECT MAX(sCount) FROM PsCount)

--79. Who are the male programmers earning below the AVG salary of Female Programmers? 


Select Pname,Salary
From Programmer
Where Salary<(	Select AVG(Salary) AS Avg_sal From Programmer
Where Gender='F')
	AND Gender='M';

--80. Who are the Female Programmers earning more than the Highest Paid?

Select Gender,Pname,salary 
From Programmer
Where  Gender<>'M' and Salary > (Select MAX(Salary) AS Higest_Salary From Programmer)

--81. Which language has been stated as the proficiency by most of the Programmers?

SELECT PROF1 FROM PROGRAMMER GROUP BY PROF1 HAVING PROF1 = (SELECT MAX(PROF1) FROM PROGRAMMER)
UNION
SELECT PROF2 FROM PROGRAMMER GROUP BY PROF2 HAVING PROF2 = (SELECT MAX(PROF2) FROM PROGRAMMER);

--82. Display the details of those who are drawing the same salary.

Select *
From Programmer 
Where Salary IN (Select Salary 
From Programmer
Group By Salary
Having COUNT(Salary) > 1);

--83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-

Select Prof1,Prof2
From Programmer Where gender='M' AND Salary > 3000;

--84. Display the details of the packages developed in Pascal by the Female Programmers. 

Select * 
From Programmer Where Gender='F' AND (Prof1='Pascal' OR Prof2='Pascal');

--85. Display the details of the Programmers who joined before 1990. 

Select *
From Programmer Where YEAR(DOJ) < 1990;

--86. Display the details of the Software Developed in C By female programmers of Pragathi.

Select s., st., p.*
From Studies as ST, Software as S, Programmer as P Where ST.Pname = S.Pname
AND P.Pname = S.Pname AND Gender = 'F' AND  Institute = 'Pragathi' AND (Prof1 = 'C' OR Prof2 = 'C');

--87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.

Select ST.institute, COUNT(S.developin) AS Developin, COUNT(S.sold) As Sold, SUM(S.sold*S.scost) AS Sales_Value
From Software S,Studies ST Where S.pname = ST.pname GROUP BY ST.institute;

--88. Display the details of the software developed in DBASE by Male Programmers,
-- who belong to the institute in which most number of Programmers studied.

CREATE TABLE INST (INS VARCHAR(20), CNT INT)

INSERT INTO INST
Select Institute, COUNT(Pname)
FROM Studies
GROUP BY Institute

Select DISTINCT S.* FROM Software S, Programmer P, Studies ST, INST
WHERE DEVELOPIN = 'DBASE' AND GENDER='M' AND S.PNAME = P.PNAME AND INSTITUTE = INS AND CNT= (SELECT MAX(CNT) FROM INST);

--89. Display the details of the software Developed by:
-- male programmers Born before 1965 
-- female programmers born after 1975

SELECT S., YEAR(DOB), Gender, P., ST.*
FROM Programmer P,Software S, Studies ST
WHERE S.Pname = P.Pname AND ((GENDER='M' AND YEAR(DOB)<1965) OR (GENDER='F' AND YEAR(DOB)>1975));

--90. Display the details of the software developed in the language:
--which is neither the first nor the second proficiency of the programmers. 

Select s.* 
From Programmer P, Software S
Where s.pname = p.pname and (developin <> prof1 and developin <> prof2);

--91. Display the details of the software developed by the male students of Sabhari. 

Select s.* ,st.*
From Software S, Studies ST, Programmer P
Where S.Pname = ST.Pname  and P.Pname = S.Pname and Gender = 'M' and Institute='Sabhari';

--92. Display the names of the programmers who have not developed any packages. 

Select Pname
From Programmer Where Pname NOT IN (select pname from software);

--93. What is the total cost of the Software developed by the programmers of Apple? 

Select SUM(Scost)
From Software S, Studies ST Where S.Pname = ST.Pname AND Institute = 'apple';

--94. Who are the programmers who joined on the same day? 

Select A.Pname, A.DOJ
From Programmer A, Programmer B Where A.DOJ = B.DOJ AND A.Pname <> B.Pname;

--95. Who are the programmers who have the same Prof2? 

Select DISTINCT(A.Pname), A.Prof2
From Programmer A,Programmer B Where A.Prof2 = B.Prof2 AND A.Pname <> B.Pname;

--96. Display the total sales value of the software, institute wise. 

Select ST.Institute, SUM (S.Sold * S.Scost) Total_Sales_Value
From Software S, Studies ST Where ST.Pname = S.Pname Group By ST.Institute;

--97. In which institute does the person who developed the costliest package studied.

Select Institute
From Software st, Studies s
Where s.Pname = st.Pname Group By Institute, Dcost Having dcost = (Select MAX(Dcost) From Software);

--98. Which language listed in prof1, prof2 has not been used to develop any package. 

Select Prof1 
From Programmer Where Prof1 NOT IN (Select developin From Software) 
	UNION
Select Prof2
From Programmer Where Prof2 NOT IN (Select developin From software);

--99. How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. 

--???????

--100. What is the AVG salary for those whose software sales is more than 50,000/-

Select AVG(Salary) as Avg_Salary From Programmer P, Software S
Where P.Pname = S.Pname
	AND Sold * Scost > 50000;

--101. How many packages were developed by students, who studied in institute that charge the lowest course fee? 

Select S.pname, COUNT(Title) packages
From Software s, Studies st
Where s.Pname = st.Pname 
GROUP BY s.Pname, Coursefee
HAVING MIN(Coursefee) = (SELECT MIN(Coursefee) From studies);

--102. How many packages were developed by the person who developed the cheapest package? Where did he\She study?

Select ST.Institute,count(*) as No_Of_Packages
From Programmer P, Software S, Studies ST Where S.Pname = P.Pname AND S.Pname=ST.Pname
Group By ST.Institute Having MIN(Dcost) = (Select MIN (Dcost) From Software);

--103. How many packages were developed by the female programmers earning more than the highest paid male programmer? 

select COUNT(Developin) as No_Of_packages From Programmer P, Software S
Where S.Pname = P.Pname AND Gender = 'F' AND Salary > (Select MAX(Salary) 
From Programmer P, Software S Where S.Pname = P.Pname AND Gender='M');

--104. How many packages are developed by the most experienced programmer form BDPS. 

select COUNT(*)
From Software S, Programmer P Where P.Pname = S.Pname GROUP BY DOJ 
HAVING MIN(DOJ) = (SELECT MIN(DOJ)
From Studies ST, Programmer P, Software S Where P.Pname = S.Pname AND ST.Pname = P.Pname AND (Institute='bdps'));

--105. List the programmers (form the software table) and the institutes they studied
--including those WHO DIDN'T develop any package.
 select pname,institute from studies where pname not in(select pname from software);

--106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF

select count(*),sum(scost*sold-dcost) "PROFIT" from software where developin in (select prof1 from programmer) group by developin;

--107. List the programmer names (from the programmer table) and No. Of Packages each has developed.

select S.Pname,count(Developin) as No_of_Packages 
From Programmer P1, Software S
Where P1.Pname = S.Pname 
Group By S.Pname

SELECT * FROM Studies
SELECT * FROM Software
SELECT * FROM Programmer