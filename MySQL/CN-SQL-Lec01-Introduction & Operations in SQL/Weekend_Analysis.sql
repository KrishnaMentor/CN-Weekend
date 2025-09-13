# You have to select the database.
USE bike_analysis;
SHOW TABLES;
SELECT * FROM Customers;

SELECT
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome
FROM Customers
LIMIT 10;