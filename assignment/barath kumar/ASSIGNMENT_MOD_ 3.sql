------DROP TABLE ORDERS

------1. Create an ‘Orders’ table which comprises of these columns: ‘order_id’,‘order_date’, ‘amount’, ‘customer_id’.----------

CREATE TABLE ORDERS
(ORDER_ID INT UNIQUE NOT NULL,
ORDER_DATE DATE,
AMOUNT DECIMAL(10,3),
CUSTOMER_ID INT PRIMARY KEY);

-----2. Insert 5 new records----------

INSERT INTO ORDERS VALUES (1,'2021-11-05',3500.00,005);
INSERT INTO ORDERS VALUES (2,'2012-10-25',4700.00,001),
(3,'2005-08-22',3250,002),(4,'2010-03-01',2100,003),
(5,'2022-04-24',2570,004);


SELECT * FROM ORDERS
SELECT * FROM CUSTOMERS
-----3. Make an inner join on ‘Customer’ and ‘Orders’ tables on the ‘customer_id’ column---------
SELECT * FROM ORDERS AS OD JOIN CUSTOMERS AS CS ON OD.CUSTOMER_ID=CS.CUSTOMERID

-----4. Make left and right joins on ‘Customer’ and ‘Orders’ tables on the‘customer_id’ ----------

SELECT * FROM ORDERS AS OD LEFT JOIN CUSTOMERS AS CS ON OD.CUSTOMER_ID=CS.CUSTOMERID

-----5. Make a full outer join on ‘Customer’ and ‘Orders’ table on the ‘customer_id’ column--------

SELECT * FROM ORDERS AS OD RIGHT JOIN CUSTOMERS AS CS ON OD.CUSTOMER_ID=CS.CUSTOMERID


-----6. Update the ‘Orders’ table and set the amount to be 100where‘customer_id’ is 3------

UPDATE ORDERS
SET AMOUNT = 100 WHERE CUSTOMER_ID=3;

--------------------------=================================----------------------------------


