CREATE TABLE CUSTOMERS
(CUSTOMERID INT PRIMARY KEY, FIRSTNAME VARCHAR (25), LASTNAME VARCHAR (25), EMAILID VARCHAR (50), [ADDRESS] VARCHAR (100), CITY VARCHAR (25), STATE VARCHAR (50), ZIP INT)

SELECT * FROM CUSTOMERS

insert into CUSTOMERS values
(1,'Aman','Singh','amansingh@gmail.com','NCR','Delhi','Delhi',879879),
(3, 'Alex ', 'Subbarao','alex@gmial.com', 'navi mumbai ' ,'Mumbai','Maharastra',242465 ),
(4, 'Santakumar','McDen','santakumar@gmail.com', 'Cherapungi','Shillong' ,'Maghalaya', 783453),
(5, 'Lucida', 'Ivan', 'ivan@gmail.com','guwahati','Dispur','Assam',781076 ),
(8,'Gourav','sharma','gourav@gmail.com','San Jose','California','USA',678687);

-- Select only the ‘first_name’ and ‘last_name’ columns fromthe customer table
SELECT DISTINCT FIRSTNAME, LASTNAME
FROM CUSTOMERS;

-- Select those records where ‘first_name’ starts with “G” and city is ‘SanJose’
SELECT * FROM CUSTOMERS WHERE FIRSTNAME LIKE 'G%' AND ADDRESS='San Jose'

-- Select those records where Email has only ‘gmail’
SELECT * FROM CUSTOMERS WHERE EMAILIDe LIKE '%gmail%'

-- Select those records where the ‘last_name’ doesn't end with “A”
SELECT * FROM CUSTOMERS WHERE LASTNNAME NOT LIKE '%a'
