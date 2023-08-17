--- 1. Create a view named ‘customer_san_jose’ which comprises of only those customers who are from san jose

create view cust_sanjose
as
select * from customer where city = 'San Jose'

select * from cust_sanjose

--- 2. Inside a transaction, update the first name of the customer to Francis, where the last name is Jordan

select * from customer

insert into customer values (6,'Chris','Jordan','chris@gmail.com','Downing street','Oxford','OX',445577)

begin transaction
update customer set first_name = 'Francis' where last_name = 'Jordan'

select * from customer

--- a. Rollback the transaction

rollback transaction

select * from customer

--- b. Set the first name of customer to Alex, where the last name is Jordan

begin transaction
update customer set first_name = 'Alex' where last_name = 'Jordan'
commit transaction

select * from customer

--- 3. Inside a try catch block, divide 100 with 0, print the default error message.

declare @var1 int
declare @var2 int
begin try
set @var1 = 100
set @var2 = @var1/0
end try
begin catch
print error_message()
end catch