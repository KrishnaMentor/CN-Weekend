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

USE weekend_analysis;
DROP TABLE CustomersDetails;

-- ADD COLUMN [ALTER Command]
DESC Customers;
-- Adding a Country Column into Customers

-- Adding at the end of the Table 
ALTER TABLE Customers
ADD COLUMN Country VARCHAR(50);

DESC Customers;

SELECT * FROM Customers;

SET SQL_SAFE_UPDATES = 0;
-- Update Country to China Where CustomerKey = 11000
UPDATE Customers
SET Country = "China"
WHERE CustomerKey = 11000;

UPDATE Customers
SET Country = "Japan"
WHERE Country IS NULL;

INSERT INTO Customers(Country)
VALUES('South Korea');

-- Add a Column at Specific Position
ALTER TABLE Customers
ADD COLUMN Regions VARCHAR(50)
AFTER EmailAddress;

-- Change Column Data Type:
ALTER TABLE Customers
MODIFY COLUMN EmailAddress VARCHAR(100)
AFTER MaritalStatus;

-- RENAME COLUMN old_col_name TO new_col_name 
ALTER TABLE Customers
RENAME COLUMN BirthDate To DateOfBirth;

-- Delete (DROP) Columns:
ALTER TABLE Customers
DROP COLUMN MyUnknownColumn;

-- DESCRIBE 
DESC Customers;
DESCRIBE Customers;
SHOW COLUMNS FROM Customers;

-- ========================================================================================================
-- ============================================String Operations ===========================================

-- LENGTH [Characters Length]

SELECT 
	EmailAddress,
    LENGTH(EmailAddress) AS "email length"
FROM Customers;

-- LENGTH(NULL) -> returns NULL

-- TRIM(), LTRIM(), RTRIM()

SELECT TRIM(BOTH 'x' FROM 'xxxxxxCODING NINJAS xxxxxxxx') AS trimmed_strings;
SELECT TRIM(BOTH '-' FROM '------ CODING NINJAS') AS trimmed_strings;
SELECT TRIM(BOTH 'x' FROM '------ CODING NINJAS') AS trimmed_strings;
SELECT TRIM(BOTH 'x' FROM '------ CODING xxxxx NINJAS') AS trimmed_strings;
SELECT TRIM('*' FROM '******** CODING NINJAS ********') AS trimmed_strings;
SELECT TRIM('#' FROM TRIM('*' FROM '******** CODING NINJAS ########')) AS trimmed_strings;

-- LTRIM
SELECT LTRIM('     CODING NINJAS       ') AS trimmed_strings;

-- RTRIM
SELECT RTRIM('     CODING NINJAS       ') AS trimmed_strings;

-- CONCAT
SELECT * FROM Customers;

SELECT 
	FirstName,
    LastName,
	CONCAT(FirstName , ' ', LastName) As FullName
FROM Customers;

DESC Customers;

ALTER TABLE Customers
ADD COLUMN FullName Varchar(100)
AFTER LastName;

SELECT 
	FirstName,
    LastName,
    FullName
From Customers;

UPDATE Customers
SET FullName = CONCAT(FirstName, ' ' , LastName);
-- 2062 row(s) affected Rows matched: 2063  Changed: 2062  Warnings: 0

-- DROP the FirstName & LastName Column
ALTER TABLE Customers
DROP COLUMN FirstName;

ALTER TABLE Customers
DROP COLUMN LastName;

ALTER TABLE Customers
DROP COLUMN FirstName,
DROP COLUMN LastName;

DESC Customers;

SELECT * FROM Customers;

-- ADD Column FirstName & LastName into Customers
ALTER TABLE Customers
ADD COLUMN FirstName VARCHAR(50)
AFTER Prefix;

ALTER TABLE Customers
ADD COLUMN LastName VARCHAR(50)
AFTER FirstName;

DESC Customers;

SELECT
	FirstName,
    LastName,
    FullName
FROM Customers;

-- Update the FirstName , LastName By Extracting From FullName
-- Hint : Use Substring_index

UPDATE Customers
SET FirstName = SUBSTRING_INDEX(FullName, ' ' , 1);

UPDATE Customers
SET LastName = SUBSTRING_INDEX(FullName, ' ' , -1);

-- UPPER() -> Convert the string Columns into UpperCase
SELECT 
	EmailAddress,
    UPPER(EmailAddress) AS Email
FROM Customers;

SELECT 
	ProductName,
    ModelName,
    UPPER(ProductColor) AS Color
FROM Products;

-- LOWER() -> transform the string columns into lower case
SELECT * FROM Customers;
SELECT
	FirstName,
    LastName,
    FullName,
    Lower(FullName) AS customer_name
FROM Customers;

-- RIGHT -- Extracted From Right
-- Syntax : Right(str, no_of_characters)

SELECT 
	EmailAddress,
	RIGHT(EmailAddress,4) -- .com
FROM Customers;

SELECT 
	EmailAddress,
	RIGHT(EmailAddress,15) AS Domain_Name -- learnsector.com
FROM Customers;

-- LEFT -> Extract From Start
-- Syntax : Left(str[str_column], no_of_characters)

SELECT 
	ProductSKU,
    LEFT(ProductSKU,2) AS Category_abbreviation
FROM Products;

SELECT * FROM Customers;

-- LPAD()
SELECT
	Phone_number,
    LPAD(Phone_number , 10 , '0') AS New_Phone_number
FROM Customers;

-- RPAD()
SELECT
	Phone_number,
    RPAD(Phone_number , 10 , '0') AS New_Phone_number
FROM Customers;

-- LPAD() -> (+91) - 5 length
SELECT
	Phone_number,
    LPAD(Phone_number , 15 , '(+91)00') AS New_Phone_number
FROM Customers;



-- RPAD() -> Concat (+91) [5 Length] -> Rpad [0] at the end
SELECT
	Phone_number,
    CONCAT(
		'(+91)',
		RPAD(Phone_number , 10 , '0') 
	) AS New_Phone_number 
FROM Customers;

-- REVERSE()

SELECT REVERSE("Hello World") AS Reversed_string;

SELECT 
	FirstName,
    REVERSE(FirstName) AS Reversed_FirstName
FROM Customers;

-- Palindrome 
SELECT 
	FirstName,
    REVERSE(FirstName) AS Reversed_FirstName,
    CONCAT(FirstName, REVERSE(FirstName)) AS Palindrome_str
FROM Customers;

-- Session - Strings & Aggregation Functions

USE weekend_analysis;

-- REPLACE [Replace all instances of a substring]

SELECT * FROM Products;

SELECT 
	Replace(ProductStyle, 0, 'N/A') as ProductStyle 
FROM Products;

SELECT 
	DISTINCT ProductStyle
FROM Products;

-- AnnualIncome $70,000 -> $70k
SELECT DISTINCT AnnualIncome FROM Customers;

SELECT
	CONCAT(REPLACE(AnnualIncome,',000',''), 'k') AS formatted_income
FROM Customers;

SELECT
	REPLACE(AnnualIncome,',000','k') AS formatted_income
FROM Customers;

-- Clean the AnnualIncome Column and transform to integer data type
SELECT * FROM Customers;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET AnnualIncome = REPLACE(REPLACE(AnnualIncome , '$',''),',','');

-- OR
/*
	UPDATE Customers
	SET AnnualIncome = REPLACE(AnnualIncome , '$' , '');

	UPDATE Customers
	SET AnnualIncome = REPLACE(AnnualIncome , ',' , '');
*/

UPDATE Customers
SET AnnualIncome = NULL 
WHERE AnnualIncome = '';

DESC Customers;

ALTER TABLE Customers
MODIFY COLUMN AnnualIncome INT;

-- SUBSTRING 
-- SYNTAX : SUBSTR() OR SUBSTRING('str',start_idx,length_of_characters)

SELECT 
	SUBSTRING("Hello World" ,1,5) AS substr; -- having 11 length
    
SELECT 
	SUBSTR("Coding Ninja", 4,5);
    
SELECT 
	SUBSTRING("Hello World" ,-5,5) AS substr; -- 'World'
    
SELECT 
	SUBSTRING("Hello World" ,-11,50) AS substr; -- 'Hello World'
    
SELECT 
	SUBSTRING("Hello World" ,-9,5) AS substr; -- 'llo W'
    
SELECT * FROM Products;

SELECT 
	ProductKey,
    SUBSTR(ProductSKU,1,7) AS Product_SKU,
    ProductColor
FROM Products;

-- INSTR [Find the Substring Position]

SELECT * FROM Customers;

SELECT
	EmailAddress,
    INSTR(EmailAddress, '@') AS at_position
FROM Customers;

-- AGGREGATION WITH GROUP BY
/*
	SELECT col1, col2, AggFunc(col3)
	FROM <TableName>
    GROUP BY <col1>,<col2>
*/

-- Find the Total Customers Counts.
SELECT
	COUNT(*) AS TotalCounts
FROM Customers;

SELECT
	COUNT(CustomerKey) AS TotalCounts
FROM Customers;

SELECT DISTINCT Occupation FROM Customers;

SELECT 
	COUNT(DISTINCT Occupation) AS Unique_Occupation_Count 
FROM Customers;

-- SS Challenge --
SELECT * FROM Customers;

SELECT
	Occupation,
    COUNT(CustomerKey) AS Total_People
FROM Customers
GROUP BY Occupation
ORDER BY Total_People DESC;

SELECT
	Occupation,
    COUNT(CustomerKey) AS Total_People
FROM Customers
GROUP BY 1
ORDER BY 2 DESC;

-- SUM 
SELECT * FROM Products;

-- Find the TotalPrice and TotalCost of Products
SELECT 
	CAST(SUM(ProductPrice) AS DECIMAL(8,2))AS TotalPrice,
    ROUND(SUM(ProductCost),2) AS TotalCost
FROM Products;

-- Find the Gross Profit of all Products;
SELECT 
    ROUND(SUM(ProductPrice - ProductCost),2) AS GrossProfit
FROM Products;

SELECT 
    ROUND(SUM(ProductPrice) - SUM(ProductCost) , 2) AS GrossProfit
FROM Products;

# x(2+5) = 2x + 5x = 7x

-- AVERAGE [AVG]
SELECT
	ROUND(AVG(ProductCost),2) AS AvgCost,
    ROUND(AVG(ProductPrice),2) AS AvgPrice
FROM Products;

SELECT * FROM Customers;
-- Find the Average AnnualIncome based on Gender
-- Hint : Group By['Gender'] & Agg['AnnualIncome']

SELECT
	Gender,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(CustomerKey) AS Total_Count
FROM Customers
GROUP BY Gender
ORDER BY AvgIncome DESC;

-- Average Income based on occupation or EducationLevel
SELECT * FROM Customers;

SELECT
	Occupation,
    EducationLevel,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(*) AS TotalCount
FROM Customers
GROUP BY Occupation , EducationLevel
ORDER BY AvgIncome DESC;

-- Product Table [Find the AvgProfit based on each ProductColor]
SELECT * FROM Products;

SELECT
	ProductColor,
    ROUND(AVG(ProductPrice) - AVG(ProductCost) ,2) AS AvgProfit
FROM Products
GROUP BY 1
ORDER BY 2 DESC;

SELECT
	ProductColor,
    ABS(ROUND(AVG(ProductCost) - AVG(ProductPrice) ,2)) AS AvgProfit
FROM Products
GROUP BY 1
ORDER BY 2 DESC;


-- MIN() & MAX()
SELECT * FROM Customers;
-- Find the Max_children / Min_children w.r.t MaritalStatus & Gender

SELECT DISTINCT MaritalStatus FROM Customers; # 2

SELECT
	MaritalStatus,
    Gender,
    MAX(TotalChildren) AS Max_Children
FROM Customers
GROUP BY 1,2;

SELECT * FROM Products;
-- Find the Top 5 ProductName having max ProductPrice. 

SELECT
	ProductName,
    MAX(ProductPrice) AS Max_Price
FROM Products
GROUP BY ProductName
ORDER BY Max_Price DESC
LIMIT 5;

-- max. income by education/occupation
SELECT * FROM Customers;

SELECT
	EducationLevel,
    Occupation,
    MAX(AnnualIncome) AS Max_Income,
    MIN(AnnualIncome) AS Min_Income
FROM Customers
GROUP BY 1,2;

-- GROUP_CONCAT
/*
	SYNTAX : 
		SELECT GROUP_CONCAT(column_name SEPARATOR ',')
		FROM Table_Name;
*/

SELECT * FROM ProductCategories;

SELECT GROUP_CONCAT(CategoryName) AS Categories
FROM ProductCategories;

-- Occupation - 5 unique
SELECT DISTINCT Occupation FROM Customers;

SELECT
	GROUP_CONCAT(DISTINCT Occupation) AS Unique_Occupations
FROM Customers;

-- Territories
SELECT  * FROM Territories;

SELECT DISTINCT COUNTRY FROM Territories;

SELECT GROUP_CONCAT(DISTINCT Country) AS Unique_country
FROM Territories;

-- HAVING CLAUSE
SELECT * FROM Customers;

SELECT
	Occupation,
    EducationLevel,
    ROUND(AVG(AnnualIncome),0) AS AvgIncome,
    COUNT(*) AS TotalCount
FROM Customers
WHERE Occupation IN ('Management','Professional')
GROUP BY Occupation , EducationLevel
HAVING AvgIncome > 75000
ORDER BY AvgIncome DESC;
