/* Perform the following with help of the above database */

---Get all the details from the person table including email ID, phone number, and phone number type 

select p.*,pe.EmailAddress,phone.PhoneNumber,pt.Name from [Person].Person p inner join [Person].[EmailAddress] pe
on p.BusinessEntityID=pe.BusinessEntityID inner join [Person].[PersonPhone] phone
on p.BusinessEntityID=phone.BusinessEntityID inner join [Person].[PhoneNumberType] pt
on phone.PhoneNumberTypeID=pt.PhoneNumberTypeID

--- Get the details of the sales header order made in May 2011 

select * from sales.SalesOrderHeader where month(OrderDate)=5 and year(OrderDate)=2011

--- Get the details of the sales details order made in the month of May 2011 

select sod.* from sales.SalesOrderHeader as soh inner join sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID
where month(soh.orderdate)=5 and year(soh.orderdate)=2011

--- Get the total sales made in May 2011 

select sum(linetotal) as TotalSales from sales.SalesOrderDetail sod inner join sales.SalesOrderHeader as soh
on soh.SalesOrderID=sod.SalesOrderID
where month(soh.orderdate)=5 and year(soh.orderdate)=2011

--- Get the total sales made in the year 2011 by month order by increasing sales 

select datename(mm,orderdate) as Month_Name, sum(linetotal) as TotalSales from sales.SalesOrderDetail as sod inner join sales.SalesOrderHeader as soh
on soh.SalesOrderID=sod.SalesOrderID
where year(soh.orderdate)=2011
group by datename(mm,orderdate)
order by TotalSales

--- Get the total sales made to the customer with FirstName='Gustavo' and LastName ='Achong'

select * from sales.SalesPerson sp inner join person.person p
on sp.BusinessEntityID=p.BusinessEntityID
where FirstName ='Gustavo' and lastname='Achong'