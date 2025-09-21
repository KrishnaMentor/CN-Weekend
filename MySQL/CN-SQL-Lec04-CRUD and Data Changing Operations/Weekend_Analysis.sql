# You have to select the database.
/* USE bike_analysis;
SHOW TABLES;
SELECT * FROM Customers;

SELECT
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome
FROM Customers
LIMIT 10;
*/


# CREATE DATABASE <db_name>;
/*
	This is a multiline comment
    SELECT * FROM Customers;
*/
-- SELECT * FROM Customers;

CREATE DATABASE weekend_analysis;
-- SQL is 'not' a Case-Sensitive Language

-- SELECT Statement is used to Read the table.
USE weekend_analysis;
SELECT * FROM Customers;
SELECT
	FirstName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers;

SELECT * FROM Products;

-- WHERE CLAUSE To Apply Filter on Rows
/*
SYNTAX : 
	SELECT col1, col2, col3 .... 
	FROM TableName
    WHERE Condition;
*/

DESC Products;
DESCRIBE  Products;

-- Challenge 1 : Find the Product Details having ProductPrice > 1000.
SELECT 
	ProductName,
    ProductColor,
    ProductStyle,
    ProductPrice
FROM Products
WHERE ProductPrice > 1000 -- row filter
LIMIT 10; 

SELECT 
	DISTINCT Occupation
FROM Customers;

SELECT
	FirstName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE Occupation = 'Skilled Manual'
LIMIT 10;
	
-- I'm a LIC Agent, I wanted to sell the Policy to whom? 
-- ['Married'['M'],'Male' ['M'],'Professional',should be a HomeOwner]
SELECT 
	FirstName,
    MaritalStatus,
    Gender,
    Occupation,
    HomeOwner
FROM Customers
WHERE MaritalStatus = 'M'
AND Gender = 'M' 
AND Occupation = 'Professional'
AND HomeOwner = 'Y';

-- Create Our Own Table
/* Syntax: 
	CREATE TABLE <tb_name>(
		col_name data_type Constraints,
        col_name data_type Constraints,
        col_name data_type Constraints
    );
*/
-- PRIMARY KEY -> UNIQUE + NOT NULL
CREATE TABLE Students(
	stud_id int PRIMARY KEY AUTO_INCREMENT, -- Mandatory
	stud_name VARCHAR(50) NOT NULL, -- Mandatory
	email_address VARCHAR(50) NOT NULL,
    gender CHAR(1),
    phone_number int DEFAULT 0, -- 11 digit
    course VARCHAR(15)
);

DESCRIBE Students;
-- If stud_id was not intialised at start, by default it starts with 1.
-- Error Code: 1406. Data too long for column 'gender' at row 1

INSERT INTO students(stud_name, email_address, gender, course)
VALUES('Deepak Chhikara', 'deepak@gmail.com', 'M', 'Data Analyst');

SELECT * FROM students;

INSERT INTO students(stud_name, email_address, gender, course)
VALUES('Aditya Sharma', 'aditya.sharma@gmail.com', 'M', 'Data Science'),
('Ankita Dutta','ankita@yahoo.com','F','Data Engineer'),
('Nikhil', 'nikhil@outlook.in','M','AI Engineer');

SELECT * FROM Students;

DELETE FROM Students; -- Remove the data From Students; 

/* Error Code: 1175. You are using safe update mode and you tried to update a table 
without a WHERE that uses a KEY column.  To disable safe mode, toggle the option in 
Preferences -> SQL Editor and reconnect.
*/
SET SQL_SAFE_UPDATES = 0; -- Settings Changed

DELETE FROM Students; -- Remove all the data From Students; 

SELECT * FROM Students;

INSERT INTO students(stud_id ,stud_name, email_address, gender, course)
VALUES(729249,'Deepak Chhikara', 'deepak@gmail.com', 'M', 'Data Analyst');

SELECT * FROM students;

INSERT INTO students(stud_name, email_address, gender, course)
VALUES('Aditya Sharma', 'aditya.sharma@gmail.com', 'M', 'Data Science'),
('Ankita Dutta','ankita@yahoo.com','F','Data Engineer'),
('Nikhil', 'nikhil@outlook.in','M','AI Engineer');

USE weekend_analysis;
-- <> or != [Not Equal to]
 
-- Customers with more than 2 Children. '>'
SELECT 
	FirstName,
    LastName,
    TotalChildren
FROM Customers
WHERE TotalChildren > 2;

-- 626 row(s) returned

-- Find the Customers whose TotalChildren is not equal to 5 .... <> !=
SELECT 
	FirstName,
    LastName,
    TotalChildren
FROM Customers
WHERE TotalChildren != 5;
-- 1913 row(s) returned

SELECT 
	FirstName,
    LastName,
    TotalChildren
FROM Customers
WHERE TotalChildren <> 5;

-- Find the Customers who are Bachelors & Professionals
SELECT * FROM Customers;
SELECT 
	FirstName,
    LastName,
    EmailAddress,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel = 'Bachelors'
AND Occupation = 'Professional';
-- 196 row(s) returned

-- Find the Customers who are married but 0 TotalChildren
SELECT * FROM Customers;
DESC Customers;
SELECT 
	FirstName,
    LastName,
    MaritalStatus,
    TotalChildren
FROM Customers
WHERE MaritalStatus = 'M'
AND TotalChildren = 0
LIMIT 10;
-- 196 row(s) returned

-- Find the Customer either having 0 Children or a HomeOwner;
SELECT 
	FirstName,
    LastName,
    TotalChildren,
    HomeOwner
FROM Customers
WHERE TotalChildren = 0 OR 
HomeOwner = 'Y'
LIMIT 10;
-- 1809 row(s) returned

-- Product Tables
SELECT * FROM Products;
-- Find the ProductName with red/black Color having ProductPrice >= 1500 
SELECT
	ProductName,
    ProductColor,
    ProductPrice
FROM Products
WHERE (ProductColor = 'Red' OR ProductColor = 'Black')
AND ProductPrice >= 1500;
-- 20 row(s) returned

SELECT
	ProductName,
    ProductColor,
    ProductPrice
FROM Products
WHERE ProductColor IN ('Red','Black')
AND ProductPrice >= 1500;

-- Find the ProductName without red/black Color having ProductPrice >= 1500 
SELECT
	ProductName,
    ProductColor,
    ProductPrice
FROM Products
WHERE ProductColor NOT IN ('Red','Black')
AND ProductPrice >= 1500;

-- First Name of a Customer Starts with 'K'
SELECT * FROM Customers;
SELECT 
	FirstName,
    LastName,
    Gender
FROM Customers
WHERE FirstName LIKE 'k%';

-- First Name of a Customer Starts with 'K' and ends with 'a'
SELECT 
	FirstName,
    LastName,
    Gender
FROM Customers
WHERE FirstName LIKE 'k%a';
-- 25 row(s) returned

-- First Name of a Customer Starts with 'T'  and LastName ends with 'i'
SELECT 
	FirstName,
    LastName,
    Gender
FROM Customers
WHERE FirstName LIKE 'T%'
AND LastName LIKE '%i';

-- Find the customer LastName with 'A' in middle, then one character _ and 'G'  -> '%A_G'
SELECT 
	FirstName,
    LastName,
    Gender
FROM Customers
WHERE LastName LIKE '%A_G';

SELECT * FROM Products;
-- Find the ProductName where the Product SKU end with 'L' or start wit 'HL'
SELECT
	ProductName,
    ProductSKU
FROM Products
WHERE ProductSKU LIKE '%L'
OR ProductSKU LIKE 'HL%';
-- 14 row(s) returned


-- STARTSWITH - "X%"
-- ENDSWITH - "%X"
-- INBETWEEN - '%X%'
-- Single Characters - '_X%'

SELECT * FROM Products;
-- Find the ProductName where ProductSKU starts with 'TI' or 'ModelName' ends with 'W'
-- or  ProductName having Mountain Bike with '3 digit' CC engine. 

SELECT
	ProductName,
    ProductSKU,
    ModelName
FROM Products
WHERE ProductSKU LIKE 'TI%'
OR ModelName LIKE '%W'
OR ProductName LIKE 'Mountain-___%';

-- IN are useful when you have multiple OR Logic and to make the query easy to undestand 
-- we prefer 'IN' Operator -> [Same Column having multiple OR is easy to replace with 'IN'] 

SELECT * FROM Customers;
SELECT DISTINCT Occupation FROM Customers;
-- Professional
-- Management
-- Skilled Manual
-- Clerical
-- Manual

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation LIKE "Professional" OR 
Occupation LIKE "Management" OR
Occupation LIKE "Skilled Manual" OR
Occupation LIKE "Clerical" OR
Occupation LIKE "Manual";

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation = "Professional" OR 
Occupation = "Management" OR
Occupation = "Skilled Manual" OR
Occupation = "Clerical" OR
Occupation = "Manual";

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation IN ("Professional","Management","Skilled Manual","Clerical","Manual");

SELECT DISTINCT EducationLevel FROM Customers;

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    Occupation
FROM Customers
WHERE Occupation IN ("Professional","Management","Skilled Manual","Clerical","Manual");

-- 'Bachelors' , 'Graduate Degree'
SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel IN ('Bachelors' , 'Graduate Degree');
-- 1013 row(s) returned

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel NOT IN ('Partial College','High School','Partial High School');

-- Find the Customers Having EducationLevel = ['Bachelors','Graduate Degree'] 
-- AND Occupations = ['Professional', 'Management'] 
SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel NOT IN ('Partial College','High School','Partial High School')
AND Occupation IN ('Professional', 'Management') ;
-- 601 row(s) returned

SELECT 
	FirstName,
    LastName,
    EmailAddress,
    AnnualIncome,
    EducationLevel,
    Occupation
FROM Customers
WHERE EducationLevel IN ('Bachelors' , 'Graduate Degree')
AND Occupation IN ('Professional', 'Management') ;

-- BETWEEN
-- Find the Customer who are having Children Between 1 to 3.
SELECT * FROM Customers;
SELECT 
	FirstName,
    LastName,
    MaritalStatus,
    TotalChildren
FROM Customers
WHERE TotalChildren >= 1 AND TotalChildren <=3;
-- 1061 row(s) returned

SELECT 
	FirstName,
    LastName,
    MaritalStatus,
    TotalChildren
FROM Customers
WHERE TotalChildren BETWEEN 1 AND 3;

-- Find the Products Where the ProductPrice IS BETWEEN 1000 - 3000 
-- Where the ProductCategory = "Bikes"

SELECT * FROM Products WHERE ProductName LIKE "%Bike%";

SELECT * FROM Products WHERE ProductSKU LIKE 'BK%';

SELECT
	ProductName,
    ProductSKU,
    ProductColor,
    ProductPrice
FROM Products
WHERE ProductPrice BETWEEN 1000 AND 3000
AND ProductSKU LIKE 'BK%';
-- 44 row(s) returned

SELECT
	ProductName,
    ProductSKU,
    ProductColor,
    ProductPrice
FROM Products
WHERE ProductPrice BETWEEN 1000 AND 3000
AND ProductSKU LIKE 'BK%'
AND ProductColor IN ('Red', 'Silver','Black');
-- 23 row(s) returned

-- DISTINCT - Bringing a unique information from a single columns
SELECT * FROM Products;
-- ProductColor
SELECT DISTINCT ProductColor FROM Products;
-- ProductSize
SELECT DISTINCT ProductSize FROM Products;
-- ProductStyle
SELECT DISTINCT ProductStyle FROM Products;

-- Distinct Annual Income
SELECT DISTINCT AnnualIncome FROM Customers;

-- ORDER BY Column Name ASC/DESC
-- Sort the Products bases on their ProductCost in Descending Order.

SELECT 
	ProductName,
    ProductSKU,
    ProductColor,
    ProductCost
FROM Products
ORDER BY ProductCost ASC;

-- Customer_Name -> Asc And Total Children Desc
SELECT 
	FirstName,
    LastName,
    EmailAddress,
	TotalChildren
FROM Customers
ORDER BY TotalChildren DESC,
FirstName; -- ASC


SELECT 
	FirstName,
    LastName,
    EmailAddress,
	TotalChildren
FROM Customers
ORDER BY FirstName,TotalChildren DESC;

SELECT 
	FirstName, -- 1
    LastName, -- 2
    EmailAddress, -- 3
	TotalChildren -- 4
FROM Customers
ORDER BY 1,4 DESC;

-- CHALLENGE ON ORDER BY
-- Sort the Products Based on ProductSubcategoryKey ASC , ProductPrice DESC.
Select * FROM Products;
SELECT 
	ProductSubcategoryKey,
    ProductName,
    ProductPrice
FROM Products
ORDER BY ProductSubcategoryKey,
ProductPrice DESC;
-- 293 row(s) returned

SELECT 
	ProductSubcategoryKey, -- 1
    ProductName, -- 2
    ProductPrice -- 3
FROM Products
ORDER BY 1 ,3 DESC;

SELECT * FROM Customers;

-- =================================================================================
-- DOUBT DISCUSSION NOT A PART OF MAIN SESSION 
-- DESC Students;
DESC Students;
SELECT * FROM Students;
INSERT INTO students
VALUES(729253,'Soumya','soumya@gmail.com','F',987346,'Analytics');

ALTER TABLE Students
MODIFY COLUMN phone_number BIGINT;

INSERT INTO students
VALUES(729254,'Naveen','naveen@gmail.com','M',9873464823,'Analytics');

DESC Customers;

select ProductName, 
	   ModelName,
           ProductSKU,
           ProductSize,
           ProductColor
       -- ProductDescription -- How to comment out this one
from products 
where (ProductSKU Like "TI%" 
OR ModelName Like "%W" 
OR ProductName Like "Mountain-___%")
AND ProductColor IN ("Black","Silver","Yellow"); 
-- ===========================================================================
USE weekend_analysis;

-- Hint : Limit + Order BY
-- Find the Top 10 Products based on their Product Price
SELECT * FROM Products;
SELECT
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC -- Top to Bottom 
LIMIT 10;

-- Find the Bottom 15 Products based on their Product Cost
SELECT
	ProductName,
    ModelName,
    ProductColor,
    ProductCost
FROM Products
ORDER BY ProductCost -- By Default Ascending [Low to High] 
LIMIT 15;


-- Find the Top Products [11-20] based on their Product Price

SELECT
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC -- Top to Bottom 
LIMIT 10
OFFSET 10; -- Skips First 10 records


-- Find the Top Products [21-30] based on their Product Price

SELECT
	ProductName,
    ModelName,
    ProductColor,
    ProductPrice
FROM Products
ORDER BY ProductPrice DESC -- Top to Bottom 
LIMIT 10
OFFSET 20; -- Skips First 20 records

-- Find the Top [16-30] Parents based on their Total Children [Top To Bottom].
SELECT * FROM Customers;

SELECT
	FirstName,
    LastName,
    maritalStatus,
    Gender,
    TotalChildren
FROM Customers 
ORDER BY TotalChildren DESC
LIMIT 15
OFFSET 15;


-- ALIASES [Renaming the column name] With Combination of DISTINCT Keyword
SELECT
	DISTINCT EducationLevel AS Education,
    Occupation AS Occupations
FROM Customers;
-- 25 row(s) returned 

SELECT
	DISTINCT EducationLevel AS Education
FROM Customers;

SELECT * FROM Customers;

-- ALIASES [Renaming the Column Headers] [String Manipulation]
SELECT
	CONCAT_WS(' ',Prefix, FirstName, LastName) AS FullName ,
    EmailAddress,
    AnnualIncome,
    Occupation
FROM Customers;

-- CRUD Command 
CREATE TABLE Employees(
	EmployeeID INT AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Salary DECIMAL(10,2), -- 99999999.99 
	BirthDate DATE NOT NULL, -- YYYY-MM-DD
    Gender CHAR(1),
    IsActive BOOLEAN DEFAULT TRUE,
    PRIMARY KEY(EmployeeID)
);

DESC Employees;

INSERT INTO Employees(FirstName,LastName,Email,Salary,BirthDate,Gender)
VALUES('Pragya','Chowdhury','pragya@gmail.com',1000000,'1997-01-21','F');

SELECT * FROM Employees;

INSERT INTO Employees
VALUES(2,'Soumya','Upadhyay','Soumya@gmail.com',1000000,'1998-05-25','F',1),
(3,'Akshay','malik','aksmalik@gmail.com',7000000,'1997-04-19','M',1);

SELECT * FROM Employees;

-- Create a Duplicate Table For the CRUD [DML] [Data Manipulation Language] Experiment [Using Aliases 'AS']
CREATE TABLE CustomersDetails AS 
SELECT * FROM Customers; 

DESC Customers;
DESC CustomersDetails;

SELECT * FROM CustomersDetails;

-- DROP -> Drop the Table [Along With Structure] [DDL] [Data Defination Language]
-- DROP TABLE <TableName>
DROP TABLE CustomersDetails;

-- Create a Duplicate Table For the CRUD [DML] [Data Manipulation Language] 
-- Experiment [Using Aliases 'AS']
CREATE TABLE CustomersDetails AS 
SELECT 
	CustomerKey,
    FirstName,
    LastName,
    BirthDate AS 'DOB',
    MaritalStatus,
    Gender,
    EmailAddress,
    AnnualIncome,
    TotalChildren,
    EducationLevel,
    Occupation,
    HomeOwner
FROM Customers; 

DESCRIBE CustomersDetails;

SELECT * FROM CustomersDetails;

/*
	CREATE TABLE CustomersDetails AS 
	SELECT DISTINCT * FROM Customers;
*/

-- UPDATE COMMAND
/*
	UPDATE <TableName> 
	SET <ColumnName> = "Set_Value"
	WHERE <ColumnName> = 'Search_Value' [Location]
*/

-- Error Code: 1175. You are using safe update mode and you tried to update a table without a 
-- WHERE that uses a KEY column.  To disable safe mode, toggle the option in Preferences -> 
-- SQL Editor and reconnect.

SET SQL_SAFE_UPDATES = 0;

UPDATE CustomersDetails
SET TotalChildren = 3
WHERE CustomerKey = 11000;

SELECT * FROM CustomersDetails;

SELECT * FROM CustomersDetails WHERE LastName LIKE 'Huang';

UPDATE CustomersDetails
SET EmailAddress = 'huang@learnsector.com'
WHERE LastNAME LIKE '%Huang%';

SELECT * FROM CustomersDetails WHERE EducationLevel LIKE "%High%";

UPDATE CustomersDetails
SET EducationLevel = "High School"
WHERE EducationLevel LIKE "%High%";

-- 122 row(s) affected Rows matched: 464  Changed: 122  Warnings: 0


SELECT DISTINCT Gender FROM CustomersDetails;

-- Find The Gender with 'NA' and replace it to NULL [Missing Value] 
SELECT * FROM CustomersDetails WHERE Gender LIKE '%NA%';

UPDATE CustomersDetails
SET Gender = NULL
WHERE Gender LIKE '%NA%';

-- IS NULL - 18 records
SELECT * FROM CustomersDetails WHERE Gender IS NULL;

-- 2062-18 = 2044 records ['M','F']
SELECT * FROM CustomersDetails WHERE Gender IS NOT NULL; -- 2044 row(s) returned

-- "" [FILTER]
SELECT * FROM CustomersDetails WHERE AnnualIncome LIKE ""; -- 10 row(s) returned

-- DELETE Command
-- SYNTAX - DELETE FROM <TableName>; -- Delete All Records (**) [Dangerous]
-- DELETE FROM <TableName> WHERE <Location>

DELETE FROM CustomersDetails
WHERE AnnualIncome LIKE ""; -- 10 row(s) affected

SELECT * FROM CustomersDetails; -- 2052 row(s) returned

-- Delete the Customer Who are not a HomeOwner....

DELETE FROM CustomersDetails
WHERE HomeOwner LIKE '%N%';

SELECT * FROM CustomersDetails; -- 1498 row(s) returned

DELETE FROM Customers; -- All Records Deleted.....
SELECT * FROM Customers;
DESC Customers;
-- DROP [DDL] 
DROP TABLE Customers;
DESC Customers; 
-- Error Code: 1146. Table 'weekend_analysis.customers' doesn't exist

-- TRUNCATE [DDL] -> Data Flash Speed [Faster] [Rollback Doesn't Exist]
TRUNCATE TABLE CustomersDetails;
DESC CustomersDetails;
SELECT * FROM CustomersDetails;