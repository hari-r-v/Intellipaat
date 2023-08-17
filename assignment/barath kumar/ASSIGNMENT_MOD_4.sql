-------------------------------------------------------------MODULE-4-------------------------------------------------

---1.Use the inbuilt functions and find the minimum, maximum and average amount from the orders table

	SELECT MAX(AMOUNT) MAX_AMOUNT,
	MIN(AMOUNT) MIN_AMOUNT, 
	AVG(AMOUNT) AVG_AMOUNT	
	FROM ORDERS


----2. Create a user-defined function, which will multiply the given number with 10

		CREATE FUNCTION MIO(@I INT)
		RETURNS INT
		AS BEGIN
		SET @I=@I*10
		RETURN @I
		END

		SELECT DBO.MIO(25)

		SELECT * ,DBO.MIO(AMOUNT) AS '10TIMES_OF_VALUE' FROM ORDERS

		DROP FUNCTION MIO


----3. Use the case statement to check if 100 is less than 200, greater than 200 or equal to 2oo and print the corresponding value
		
SELECT *
CASE
WHEN 100<200 THEN '100 IS LESS THAN 200'
WHEN 100>200 THEN '100 IS GREATER THAN 200'
ELSE '100 IS EQUAL TO 200'
END

SELECT *
CASE
WHEN AMOUNT<4000 THEN 'LESS AMOUNT'
WHEN AMOUNT>4000 THEN 'HIGH AMOUNT'
ELSE 'AVERAGE'
END AS RANGE
FROM ORDERS

----------------------END--------------------------------------------