CREATE TABLE studies (PNAME varchar(20), INSTITUTE varchar(20), COURSE varchar(20), COURSE_FEE int )

SELECT * FROM studies

INSERT INTO studies values
('ANAND','SABHARI','PGDCA',4500 ),
('ALTAF','COIT','DCA',7200 ),
('JULIANA','BDPS','MCA',22000 ),
('KAMALA','PRAGATHI','DCA',5000 ),
('MARY','SABHARI','PGDCA ',4500 ),
('NELSON','PRAGATHI','DAP',6200 ),
('PATRICK','PRAGATHI','DCAP',5200 ),
('QADIR','APPLE','HDCA',14000 ),
('RAMESH','SABHARI','PGDCA',4500 ),
('REBECCA','BRILLIANT','DCAP',11000 ),
('REMITHA','BDPS','DCS',6000),
('REVATHI','SABHARI','DAP',5000 ),
('VIJAYA','BDPS','DCA',48000)

CREATE TABLE software (PNAME varchar(20), TITLE varchar(20), DEVELOPIN varchar(20), SCOST decimal(10,2),  DCOST int, SOLD int)

SELECT * FROM software

INSERT INTO software values
('MARY','README','CPP',300, 1200, 84),
('ANAND','PARACHUTES','BASIC',399.95, 6000, 43 ),
('ANAND','VIDEO TITLING','PASCAL',7500, 16000, 9 ),
('JULIANA','INVENTORY','COBOL',3000, 3500, 0 ),
('KAMALA','PAYROLL PKG.','DBASE',9000, 20000, 7),
('MARY','FINANCIAL ACCT.','ORACLE',18000, 85000, 4),
('MARY','CODE GENERATOR','C',4500, 20000, 23),
('PATTRICK','README','CPP',300, 1200, 84),
('QADIR','BOMBS AWAY','ASSEMBLY',750, 3000, 11 ),
('QADIR','VACCINES','C',1900, 3100, 21 ),
('RAMESH','HOTEL MGMT.','DBASE',13000, 35000, 4),
('RAMESH','DEAD LEE','PASCAL',599.95, 4500, 73 ),
('REMITHA','PC UTILITIES','C',725, 5000, 51 ),
('REMITHA','TSR HELP PKG.','ASSEMBLY',2500, 6000, 7 ),
('REVATHI','HOSPITAL MGMT.','PASCAL',1100, 75000, 2 ),
('VIJAYA','TSR EDITOR','C',900, 700, 6);

CREATE TABLE programmer (PNAME varchar(20), DOB date, DOJ date, GENDER varchar(2), PROF1 varchar(20), PROF2 varchar(20), SALARY int)

SELECT * FROM programmer

INSERT INTO programmer values
('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800 ),
('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','DBASE',3000 ),
('KAMALA','30-Oct-68','02-Jan-92','F','C','DBASE',2900 ),
('MARY','24-Jun-70','01-Feb-91','F','CPP','ORACLE',4500 ),
('NELSON','11-Sep-85','11-Oct-89','M','COBOL','DBASE',2500 ),
('PATTRICK','10-Nov-65','21-Apr-90','M','PASCAL','CLIPPER',2800 ),
( 'QADIR','31-Aug-65','21-Apr-91','M','ASSEMBLY','C',3000 ),
('RAMESH','03-May-67','28-Feb-91','M','PASCAL','DBASE',3200 ),
('REBECCA','01-Jan-67','01-Dec-90','F','BASIC','COBOL',2500 ),
('REMITHA','19-Apr-70','20-Apr-93','F','C','ASSEMBLY',3600 ),
('REVATHI','02-Dec-69','02-Jan-92','F','PASCAL','BASIC',3700 ),

('VIJAYA','14-Dec-65','02-May-92','F','FOXPRO','C',3500);

--1. Find out the selling cost AVG for packages developed in Pascal.
select avg(scost) as avg_cost from software where DEVELOPIN='PASCAL'

--2. Display Names, Ages of all Programmers. 
select PNAME AS Names, Datediff(yy,DOB,getdate()) as Ages from programmer

--3.Display the Names of those who have done the DAP Course
select PNAME as Names from studies where COURSE='DAP'

--4.Display the Names and Date of Births of all Programmers Born in January. 
select PNAME as Names, Dob as DOB from programmer where month(dob)=1

--5. What is the Highest Number of copies sold by a Package? 
select MAX(sold) from  software
select PNAME, Sold from software where SOLD=(select MAX(sold) from  software)

--6.Display lowest course Fee. 
select min(Course_fee) from studies

--7.How many programmers done the PGDCA Course? 
select count(PNAME) from studies where COURSE='PGDCA'

--8.How much revenue has been earned thru sales of Packages Developed in C.
select SUM(scost*sold) from software where DEVELOPIN='c'

--9.Display the Details of the Software Developed by Ramesh.
select * from software where PNAME='ramesh'

--10.How many Programmers Studied at Sabhari? 
select count(*) from studies where INSTITUTE='SABHARI'

--11.Display details of Packages whose sales crossed the 2000 Mark. 
select * from software where (SCOST*SOLD)>=2000

--12.Display the Details of Packages for which Development Cost have been recovered. 
select * from software where (SCOST*SOLD)>dcost

--13.What is the cost of the costliest software development in Basic? 
select MAX(scost) from software  where developin='basic'

--14.How many Packages Developed in DBASE?
select count(*) from software where DEVELOPIN='DBASE'

--15.How many programmers studied in Pragathi? 
select count(*) from studies where INSTITUTE='PRAGATHI'

--16.How many Programmers Paid 5000 to 10000 for their course? 
select count(*) from studies where COURSE_FEE>=5000 and COURSE_FEE<=10000

--17.What is AVG Course Fee
SELECT AVG(COURSE_FEE) from studies

--18.Display the details of the Programmers Knowing C.
select count(*) from programmer where PROF1='C' or PROF2='C'

--19.. How many Programmers know either COBOL or PASCAL. 
select count(*) from programmer where PROF1='COBOL' OR PROF2='PASCAL'

--20.How many Programmers Don’t know PASCAL and C 
SELECT COUNT(*) from programmer where PROF1 not in ('C','PASCAL') or PROF2 not in('C','PASCAL')

--21.How old is the Oldest Male Programmer. 
SELECT TOP 1 * FROM programmer order by DOB

--22.What is the AVG age of Female Programmers?
select Avg(Datediff(year,DOB,GetDate())) Avg_F_Age from programmer where Gender = 'F'

--23.Calculate the Experience in Years for each Programmer and Display with their names in Descending order.
select *,Datediff(year,DOJ,Getdate()) Experiance from programmer order by PNAME desc

--24.Who are the Programmers who celebrate their Birthday’s During the Current
Month?
select * from programmer where month(DOB)=Month(getdate())

--25.How many Female Programmers are there?
select * from programmer where GENDER='F'

--26.What are the Languages studied by Male Programmers.
select programmer.PNAME,
studies.INSTITUTE,
studies.Course
from programmer join studies on programmer.PNAME=studies.PNAME

--27.	What is the AVG Salary?
select avg(salary) Avg_Sal from programmer

--28.	How many people draw salary 2000 to 4000?
select PNAME,Salary from programmer where salary between 2000 and 4000

--29.	Display the details of those who don’t know Clipper, COBOL or PASCAL.
select * from programmer where
PROF1 not in ('clipper','COBAL','PASCAL')
AND
PROF2 NOT IN ('clipper','COBAL','PASCAL')

--30.	Display the Cost of Package Developed By each Programmer.
SELECT PNAME,TITLE,DCOST FROM software order by PNAME

--31.	Display the sales values of the Packages Developed by the each Programmer.
SELECT PNAME,sum(DCOST) from software group by Pname Order By PNAME

--32.	Display the Number of Packages sold by Each Programmer.
select Pname,Sold from software group by Pname, Sold Order by Sold

--33.	Display the sales cost of the packages Developed by each Programmer Language wise.
select pname, scost from software group by pname,scost order by scost

--34.	Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.
select developin,
avg(Dcost) Avg_dev_cost,
avg(scost) Avg_Sal_cost,
(sum(Scost)+sum(dcost))/(sold) Avg_per_copy
from software group by DEVELOPIN having sum(Sold)>0

--35.	Display each programmer’s name, costliest and cheapest Packages Developed by him or her.
select Max_Val.Pname,
Max_Val.Costliest_Package,
min_val.cheapest_package

from
(Select distinct(PName) Pname, Max(DCOST) costliest_package from Software group by Pname) Max_Val,
(Select distinct(Pname),Min(DCOST)cheapest_package from software group by Pname) Min_val
where Max_val.Pname = Min_val.Pname

--36.	Display each institute name with number of Courses, Average Cost per Course.
select institute,count(course)#courses,
avg(course_fee)avg_cost
from studies group by INSTITUTE

--37.	Display each institute Name with Number of Students.
select institute,count(pname)#students
from studies group by INSTITUTE

--38.	Display Names of Male and Female Programmers. Gender also.
select Pname, Gender from programmer order by GENDER

--39.	Display the Name of Programmers and Their Packages.
select Pname,Title from software

--40.	Display the Number of Packages in Each Language Except C and C++.
select title, developin from software where DEVELOPIN not in('c','c++') order by DEVELOPIN

--41.	Display the Number of Packages in Each Language for which Development Cost is less than 1000.
select developin, count(title)#packages from software group by DEVELOPIN having developin in (Select distinct(DEVELOPIN) from software where Dcost<1000) order by DEVELOPIN

--42.	Display AVG Difference between SCOST, DCOST for Each Package.
select title, avg(DCOST)-Avg(SCOST) avg_Diff from software group by TITLE

 --43.	Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered.
 select title,Scost,Dcost,(DCOST-SCOST) Amt_to_recover from software where Scost<DCOST

 --44.	Display Highest, Lowest and Average Salaries for those earning more than 2000.
 select Max(Salary)Highest_Sale
 Min(Salary) Lowest_Sal
 Avg(Salary)Average_sal
 from programmer
 where salary in(select salary from programmer where SALARY>2000)

 --45.Who is the Highest Paid C Programmers?
 select * from programmer where SALARY=(select max(salary) from programmer where PROF1='C' or PROF2='C')

 --46.	Who is the Highest Paid Female COBOL Programmer?
 select * from programmer
 where salary=(select max(salary) from programmer where PROF1='COBOL' and Gender='F') and Gender='F'

 --47.	Display the names of the highest paid programmers for each Language.
 declare @prog_sal as table(prog_name char(15), prof char(15), salary int)
 insert into @prog_sal
 select Pname,prof1,salary from programmer;
 insert into @prog_sal
 select Pname,prof2,salary from programmer

 declare @prog_sal_cal as table (prof char(15), Min(Salary) Min_sal
 from @ prog_sal group by prof;

 select PSC.Prof,
 PS.Prog_Name,
 PS.Salary
 from@prog_sal ps join @prog_sal_cal psc
 on ps.prof=psc.prof
 where salary=max_sal or salary = min_sal order by prof

 --48.	Who is the least experienced Programmer.
 select top 1* from programmer order by datediff(MM,DOJ,Getdate());

 --49.	Who is the most experienced male programmer knowing PASCAL.
 select top 1* from programmer where prof1='PASCAL' or Prof2='PASCAL'
 order by datediff(MM,DOJ,Getdate())desc;

 --50.	Which Language is known by only one Programmer?
 declare @lan_prog as table (prog char(15), language char(15));
 insert into @lan_prog
 select pname, prof1 from programmer
 insert into @lan_prog select pname, prof2 from programmer
select language,count(*)#programmer
from @lan_prog group by language having count(*)=1

--51.	Who is the Above Programmer Referred in 50?
 declare @lan_prog as table (prog char(15), language char(15));
 insert into @lan_prog
 select pname, prof1 from programmer
 insert into @lan_prog select pname, prof2 from programmer
 select * from @lan_prog
 where language in (select language from @lan_prog group by language having count(*)=1

 --52.	Who is the Youngest Programmer knowing DBASE?
 select top 1*,datediff(mm,DOB,Getdate()) Age
 from programmer where prof1='DBASE' or Prof2 = 'DBASE'
 order by age

 --53.	Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?
 select * from programmer
 where PROF1 not in('C','C++','ORACLE','DBASE')
 and
 PROF2 NOT IN ('C','C++','ORACLE','DBASE') AND GENDER='F'

 ---54.	Which Institute has most number of Students?
 Select Institute , count(*) 
From Studies
Group BY Institute 


---55.	What is the Costliest course?
SELECT TOP 1* FROM studies ORDER BY COURSE

--56.	Which course has been done by the most of the Students?
DECLARE @MAX_COURSE AS TABLE(COURSE CHAR(15),#Students int);
insert into @MAX_COURSE
select COURSE , count(*)#students
--RANK() OVER (Partition by course order by #students)
from studies group by COURSE order by #students desc;

select * from @MAX_COURSE where #Students=(select max(#students) from @MAX_COURSE)


---57.	Which Institute conducts costliest course.
select * from studies
select top 1 institute,course_fee from studies
group by institute,course_fee order by course_fee desc


---58.	Display the name of the Institute and Course, which has below AVG coursefee.
select institute, course, course_fee 
from studies where COURSE_FEE<(select avg(course_fee) from studies) order by COURSE_FEE


---59.	Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,
select * from studies
where COURSE_FEE between(select avg(course_fee)+1000 from studies) and (select avg(COURSE_FEE)-1000 from studies)

---60.	Which package has the Highest Development cost?
select top 1 * from software order by DCOST desc

---61.	Which course has below AVG number of Students?
declare @cour_stud as table (course char(10), stud_num int);
insert into @cour_stud
select course,count(*)#students from studies
group by COURSE

select * from @cour_stud where stud_num<(select avg(stud_num)from@cour_stud)


---62.	Which Package has the lowest selling cost?
select top 1 * from software order by SCOST

---63.	Who Developed the Package that has sold the least number of copies?
select top 1 * from software order by SOLD

---64.	Which language has used to develop the package, which has the highest sales amount?
select top 1 * from software order by SCOST

---65.	How many copies of package that has the least difference between development and selling cost where sold.
declare @Package_diff as table(Package_Name char(20), Sold int, Diff int);
insert into @Package_diff select title,sold,abs(Scost-Dcost) Diff
from software

select top 1 package_name,sold from @Package_diff order by diff


---66.	Which is the costliest package developed in PASCAL.
Select top 1 * from software where DEVELOPIN='PASCAL' order by DCOST desc

---67.	Which language was used to develop the most number of Packages.
Select top 1 developin, count(*) software_count from software grouyp by developin order by software_count desc

--68.	Which programmer has developed the highest number of Packages?
select top 1 PNAME, Count(*) software_count from software
group by Pname order by software_count desc

---69.	Who is the Author of the Costliest Package?
select top 1 * from software order by Dcost desc

---70.	Display the names of the packages, which have sold less than the AVG number of copies.
select * from software where sold<(select avg(sold) from software) order by SOLD


---71.	Who are the authors of the Packages, which have recovered more than double the Development cost?
select * from software where scost>(2*Dcost)


---72.	Display the programmer Name and the cheapest packages developed by them in each language.
declare @cheap_pack as table (Pname char(20),Dcost money,Row_num int);

insert into @cheap_pack
select Pname,Dcost,rank() over (Partition by Pname order by Dcost)
from software;

select Pname,Dcost from @cheap_pack where Row_Num=1


---73.	Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.
Select 
	PNAME, 
	Min(Scost) Highest_Scost, 
	Max(Scost) Lowest_Scost
from Software Group by Pname 

--74.	Who is the youngest male Programmer born in 1965?
Select Top 1 PNAME, DOB From Programmer 
Where Year(DOB) = 1965 Order by DOB

--75.	Who is the oldest Female Programmer who joined in 1992?
Select Top 1 * From Programmer 
Where Year(DOJ) = 1992  and Gender = 'F' Order by DOB

--76.	In which year was the most number of Programmers born.
Declare @Prog_Bron As Table (Born_Year Int);

Insert Into @Prog_Bron
Select Year(DOB) from Programmer;

Select Top 1 * , Count(*) #Programmer
From @Prog_Bron Group By Born_Year Order By #Programmer desc;

--77.In which month did most number of programmers join?
Declare @Prog_Bron_month As Table (Born_Month Int);

Insert Into @Prog_Bron_month
Select Month(DOB) from Programmer;

Select Top 1 * , Count(*) #Programmer
From @Prog_Bron_month Group By Born_Month Order By #Programmer desc;

--78.	In which language are most of the programmer’s proficient.
Declare @Prog_Proficiency As Table ( Prof char(15) , Prog_num Int);

Insert Into @Prog_Proficiency
	Select 
		Prof1,
		Count(*)
	From Programmer Group BY Prof1

Insert Into @Prog_Proficiency
	Select 
		Prof2,
		Count(*)
	From Programmer Group BY Prof2

Select 
	Prof , 
	SUM(pp.Prog_num) #Programmer
	From @Prog_Proficiency PP
Group by pp.Prof  Having SUM(pp.Prog_num) =(Select Top 1 SUM(pp.Prog_num) #Programmer
From @Prog_Proficiency PP
Group by pp.Prof order by #Programmer desc )


--79.	Who are the male programmers earning below the AVG salary of Female Programmers?
Select * from Programmer
Where Salary < (Select Avg(Salary) from Programmer 
Where Gender = 'F') And Gender = 'M' 

--80.	Who are the Female Programmers earning more than the Highest Paid Male?
Select * from Programmer
Where Gender = 'F' And 
Salary > (Select Max(Salary) From Programmer 
		   Where Gender = 'M');

--81.	Which language has been stated as the proficiency by most of the Programmers?
Declare @Prog_Proficiency As Table ( Prof char(15) , Prog_num Int);

Insert Into @Prog_Proficiency
	Select 
		Prof1,
		Count(*)
	From Programmer Group BY Prof1

Insert Into @Prog_Proficiency
	Select 
		Prof2,
		Count(*)
	From Programmer Group BY Prof2

Select * from @Prog_Proficiency 
Where Prog_num =(Select Max(Prog_num) From @Prog_Proficiency )

--82.	Display the details of those who are drawing the same salary.
Select * From Programmer
Where Salary In ( Select  Salary from Programmer 
                 Group By Salary Having Count(PName) >1) order By Salary , PName

--83.	Display the details of the Software Developed by the Male Programmers Earning More than 3000/-.
Select* From Programmer
Where Salary > 3000 And Gender= 'M'

--84.	Display the details of the packages developed in Pascal by the Female Programmers.
Select* From Programmer
Where Gender= 'F' And 
Prof1 = 'Pascal' Or Prof2 = 'Pascal'

--85.	Display the details of the Programmers who joined before 1990.
Select * from Programmer 
Where Year(DOJ) < 1990;

--86.	Display the details of the Software Developed in C By female programmers of Pragathi.

Select Programmer.PNAME,
	   Programmer.DOB,
	   Studies.Institute,
	   Programmer.DOJ,
	   Programmer.Gender,
	   Programmer.Prof1,
	   Programmer.Prof2,
	   Programmer.Salary
from Programmer Join Studies
on Programmer.PNAME =  Studies.PNAME
Where Institute = 'Pragathi' And Gender = 'F'

--87.	Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise.
Select 
	Studies.Institute,
	count(Software.Title) #Packages,
	Sum(Software.Sold) #Packages_Sold , 
	Sum(Software.SCOST) #Packages_SCOST
from Software Join Studies
On Software.PNAME = Studies.PNAME  
Group By Studies.Institute

--88.	Display the details of the software developed in DBASE by Male Programmers, 
--who belong to the institute in which most number of Programmers studied.

Declare @Inst_Name Char(20)
Set @Inst_Name = (Select Top 1 Institute from Studies group by Institute Order by Count(*) Desc); 

Select * from Programmer
Where Gender ='M' And
	  Prof1 = 'DBASE' Or Prof2 = 'DBASE' 
	  And PName In (Select PNAME from Studies where Institute = @Inst_Name)

--89.	Display the details of the software Developed by the male programmers Born before 1965 
--and female programmers born after 1975.
Select * From Software 
Where PNAME IN (Select PNAME From Programmer
Where Gender = 'M' and Year(DOB) < 1965
Or	  Gender = 'F' and Year(DOB) > 1975 )

--90.	Display the details of the software that has developed in the language which is 
--neither the first nor the second proficiency of the programmers.
 Declare @Proficency As Table ( Developer_Proficency Char(15));
 
 Insert Into @Proficency 
	Select Distinct(Prof1)  From Programmer
 Insert Into @Proficency 
	Select Distinct(Prof2)  From Programmer

Select * From Software where Developin Not In (Select Distinct * From @Proficency )

-- 91.	Display the details of the software developed by the male students of Sabhari.
Select * From Software 
Where PNAME In (Select PNAME From Studies Where Institute = 'Sabhari') 
And   PNAME In (Select PNAME From Programmer Where Gender = 'M')

--92.	Display the names of the programmers who have not developed any packages.
Select * from Programmer 
Where PNAME Not in (Select Distinct PNAME from Software)

--93.	What is the total cost of the Software developed by the programmers of Apple?
Select PNAME, Sum(Dcost)#Development_Cost  From Software
Where PNAME IN (Select PNAME from Studies where Institute = 'Apple' )
Group By PNAME 
--94.	Who are the programmers who joined on the same day?
Select * from Programmer 
Where DOJ In (Select DOJ from Programmer Group By DOJ Having Count(*) > 1) Order By DOJ

--95.	Who are the programmers who have the same Prof2?
Select * from Programmer 
Where Prof2 In (Select Prof2 from Programmer Group By Prof2 Having Count(*) > 1) Order By Prof2 

--96.	Display the total sales value of the software, institute wise.
Select 
	Studies.Institute, 
	Sum(SCOST) Sum_Of_Sales
From Software Inner Join Studies 
On Software.PNAME = Studies.PNAME 
Group By Studies.Institute

--97.	In which institute does the person who developed the costliest package studied.
Declare @Prog_Name Char(20)
Set @Prog_Name = (Select Top 1 PNAME From Software Order By  Dcost);

Select * From Studies 
Where PNAME = @Prog_Name

--98.	Which language listed in prof1, prof2 has not been used to develop any package.
Declare @Proficency As Table ( Developer_Proficency Char(15));
 
 Insert Into @Proficency 
	Select Distinct(Prof1)  From Programmer
 Insert Into @Proficency 
	Select Distinct(Prof2)  From Programmer

Select * From Software where Developin Not In (Select Distinct * From @Proficency )

--99.	How much does the person who developed the highest selling package earn and what course did HE/SHE undergo.
Declare @Prog_Name Char(20)
Set @Prog_Name = (Select Top 1 PNAME From Software Order By  Scost);

Select 
	Programmer.PNAME,
	Studies.Course 
From Programmer Join Studies 
on Programmer.PNAME = Studies.PNAME 
Where Programmer.PNAME = @Prog_Name
 
--100.	What is the AVG salary for those whose software sales is more than 50,000/-.
Select 
	PNAME,
	Salary
From Programmer
Where PNAME In (Select PNAME  from Software where SCOST >50000)
--101.	How many packages were developed by students, who studied in institute that charge the lowest course fee?
Declare @Low_Cost int 
Set @Low_Cost = (Select Top 1 Course_Fee From Studies Order By  Course_Fee);

Select PNAME , count(*) #Packages From Software 
Where PName In (Select PNAME from Studies where Course_Fee=@Low_Cost)
Group By Pname 

--102.	How many packages were developed by the person who developed the cheapest package, where did HE/SHE study?
Select 
	Software.PNAME,
	Count(*) #Package_Develped,
	Studies.Institute
From Software Join Studies 
on Software.PNAME = Studies.PNAME 
where Software.PNAME = (Select  Top 1 PNAME from Software Order by DCOST)
Group By Software.PNAME, Studies.Institute

--103.	How many packages were developed by the female programmers earning more than the highest paid male programmer?
Declare @MAX_Sal  Int
Set @MAX_Sal = (Select Top 1 Salary from Programmer where Gender ='M' Order by Salary desc) 

Select 
	Programmer.PNAME,
	Count(*)
From Programmer Join Software
On   Programmer.PNAME =Software.PNAME
Where Salary > @MAX_Sal And Gender ='F'
Group By Programmer.PNAME 

--104.	How many packages are developed by the most experienced programmer form BDPS.
Select PNAME , Count(*) #Packages
From Software 
Where PName = (
Select Top 1 Studies.PNAME
From Programmer Join Studies
On	 Programmer.PNAME =Studies.PNAME
Where Institute = 'BDPS' Order by DOJ )
Group By PNAME

--105.	List the programmers (form the software table) and the institutes they studied.
Select 
	Distinct Software.PNAME,
	Studies.Institute
From Software Join Studies
On Software.PNAME = Studies.PNAME

--106.	List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF.


--107.	List the programmer names (from the programmer table) and No. Of Packages each has developed.
Select 
Programmer.PNAME,
count(Software.PNAME) #Packages
From Programmer Join Software 
On	 Programmer.PNAME = Software.PNAME
Group By Programmer.PNAME







                                             