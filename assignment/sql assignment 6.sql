
--1.Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose

create view customer_san_jose as 
select*from customer 
where city='sanjose';

--2.Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan
--a.Rollback the transaction
--b.Set the first name of customer to Alex, where the last name is Jordan
 select*from customer
insert into customer values ( 1 ,'jay','ram','jayram@gmail.com','pune','pune','maharastra',700723)

create transaction 
begin transaction customer
update customer set first_name='francis' where last_name ='jordan'
--a.Rollback the transaction
rollback transaction

--b.Set the first name of customer to Alex, where the last name is Jordan
BEGIN TRANSACTION
UPDATE CUSTOMER SET First_Name='Alex' WHERE Last_Name='jordan'
begin transaction 
update customer set first_name='alex' where last_name ='jordan'

--3.Inside a try catch block, divide 100 with 0, print the default error message

BEGIN TRY
BEGIN TRANSACTION
	UPDATE CUSTOMER SET CustomerID=108 WHERE 100/10=10
	COMMIT TRANSACTION
	PRINT'TRANSACTION COMMITED'
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION
		PRINT 'TRANSACTION ROLLED BACK'
END CATCH