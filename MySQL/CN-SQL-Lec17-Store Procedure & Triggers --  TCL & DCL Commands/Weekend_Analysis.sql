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

USE weekend_analysis;

CREATE TABLE Locations (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    PlaceInfo VARCHAR(100)
);
INSERT INTO Locations (PlaceInfo) VALUES
('Mumbai#Maharashtra@India'),
('Gorakhpur#UttarPradesh@India'),
('Bhopal#MadhyaPradesh@India'),
('Pune#Maharashtra@India'),
('Lucknow#UttarPradesh@India');
INSERT INTO Locations (PlaceInfo) VALUES
('Jaipur#Rajsthan@India'),
('Kolkata#WestBengal@India'),
('Kashmir#J&K@India'),
('Gurugram#Haryana@India');

SELECT * FROM Locations;
SELECT 
    PlaceInfo,
    SUBSTRING_INDEX(PlaceInfo, '#', 1) AS City,
    SUBSTR(PlaceInfo,1, INSTR(PlaceInfo, '#') - 1) AS City_Instr,
    
    SUBSTRING_INDEX(
		SUBSTRING_INDEX(PlaceInfo, '#', - 1),
	'@',1) AS State,
    SUBSTR(PlaceInfo,
        INSTR(PlaceInfo, '#') + 1,
        INSTR(PlaceInfo, '@') - INSTR(PlaceInfo, '#') - 1
	) AS City_Instr,
    
    SUBSTRING_INDEX(PlaceInfo, '@', - 1) AS Country,
    SUBSTR(PlaceInfo,INSTR(PlaceInfo, '@') + 1, 5) AS Country_Instr
FROM Locations;

-- CONSTRAINTS 

CREATE TABLE Users(
	ID INT NOT NULL,
    UserName VARCHAR(100) DEFAULT 'Unknown'
);

SHOW COLUMNS FROM Users;

INSERT INTO Users
VALUES('123','ShyamSundar');

SELECT * FROM Users;

INSERT INTO Users
VALUES('k123','ShyamSundar');

-- Error Code: 1366. Incorrect integer value: 'k123' for column 'ID' at row 1

INSERT INTO Users(ID,UserName)
VALUES(121, 'Paramjeet Kaur');

INSERT INTO Users(ID)
VALUES(122);

-- Error Code: 1136. Column count doesn't match value count at row 1

DESC Customers;

SELECT * FROM Customers;

-- PRIMARY KEY -> UNIQUE + NOT NULL

ALTER TABLE Customers
MODIFY COLUMN CustomerKey INT NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT pk_cust PRIMARY KEY(CustomerKey);

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

CREATE TABLE Orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customerKey)
);

DESC Orders;

-- CHECK CONSTRAINT
DESC Employees;

ALTER TABLE Employees
ADD COLUMN Age INT 
AFTER BirthDate;

ALTER TABLE Employees
ADD CONSTRAINT check_age CHECK (age >= 21);

SELECT * FROM Employees;

INSERT INTO Employees(FirstName, LastName, Email, Salary , BirthDate, Age)
VALUES('Rajat','Thakur', 'rajat.thakur@gmail.com',1000000.00 , '1994-05-25', 31);

INSERT INTO Employees(FirstName, LastName, Email, Salary , BirthDate, Age)
VALUES('Akshay','Malik', 'akshay.malik@gmail.com',1000000.00 , '2005-05-25', 20);

-- Error Code: 3819. Check constraint 'check_age' is violated.

-- FOREIGN KEY
DESC Products;

ALTER TABLE Products
ADD CONSTRAINT pk_productKey
PRIMARY KEY(ProductKey);

DESC Returns;

ALTER TABLE Returns 
ADD CONSTRAINT fk_productkey
FOREIGN KEY (ProductKey)
REFERENCES Products(ProductKey);


-- CHECK CONSTRAINTS
-- Check Constraints on Products Ensure ProductCost > 0.

DESC Products;

ALTER TABLE Products
ADD CONSTRAINT chk_positive_cost
CHECK (ProductCost > 0);

INSERT INTO Products(ProductKey , ProductCost)
VALUES(12121 , -999);

-- Error Code: 3819. Check constraint 'chk_positive_cost' is violated.


-- Check Constraint [Making Sure ReturnQuantity is not negative or zero]

DESC Returns;

ALTER TABLE Returns
ADD CONSTRAINT chk_return_qty
CHECK (ReturnQuantity > 0);

INSERT INTO Returns(ReturnQuantity)
VALUES(-1);

-- Error Code: 3819. Check constraint 'chk_return_qty' is violated.


-- Applying a check constraints on Gender [Valid Input] ['M'/'F']
-- Goal : Limit Gender to 'M' or 'F'

DESC Customers;

ALTER TABLE Customers
ADD CONSTRAINT chk_gender
CHECK (Gender IN ('M' , 'F')); 

SELECT DISTINCT Gender FROM Customers;

SELECT  
	Gender,
    COUNT(*) AS Gender_Count
FROM Customers
GROUP BY 1;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET Gender = 'M'
WHERE Gender = 'NA';

-- 18 row(s) affected Rows matched: 18  Changed: 18  Warnings: 0

INSERT INTO Customers(CustomerKey , Gender)
VALUES(12121, 'Male');
-- Error Code: 3819. Check constraint 'chk_gender' is violated.


-- INNER JOIN 
-- [ON Constraint p.k from one table JOIN f.k of another Table]

SELECT 
	t.SalesTerritoryKey,
	t.Continent,
    t.Country,
    t.Region,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Territories AS t
INNER JOIN Returns AS r
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3,4;

SELECT * FROM Returns;
SELECT DISTINCT TerritoryKey FROM Returns;

SELECT * FROM Territories;

-- LEFT JOIN 
SELECT 
	t.SalesTerritoryKey,
	t.Continent,
    t.Country,
    t.Region,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Territories AS t
LEFT JOIN Returns AS r
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3,4;


-- RIGHT JOIN 
SELECT 
	t.SalesTerritoryKey,
	t.Continent,
    t.Country,
    t.Region,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Territories AS t
RIGHT JOIN Returns AS r
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3,4;

-- In the above case right join will act as inner join


-- RIGHT JOIN 
SELECT 
	t.SalesTerritoryKey,
	t.Continent,
    t.Country,
    t.Region,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Returns As r
RIGHT JOIN Territories AS t
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3,4;

-- In the above case right join will act as Left join, just changing the order.

-- Find all Categories Names with Total Return Quantity 

SELECT
	pc.CategoryName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM ProductCategories AS pc
JOIN ProductSubcategories As ps
ON pc.ProductCategoryKey = ps.ProductCategoryKey -- ps & pc
JOIN Products AS p
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey -- ps * pc * p
JOIN Returns AS r
ON p.productKey = r.ProductKey
GROUP BY 1;

-- LEFT JOIN 
SELECT
	pc.CategoryName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM ProductCategories AS pc
LEFT JOIN ProductSubcategories As ps
ON pc.ProductCategoryKey = ps.ProductCategoryKey -- ps & pc
LEFT JOIN Products AS p
ON ps.ProductSubcategoryKey = p.ProductSubcategoryKey -- ps * pc * p
LEFT JOIN Returns AS r
ON p.productKey = r.ProductKey
GROUP BY 1;

SELECT * FROM ProductCategories;

SELECT * FROM ProductSubcategories WHERE ProductCategoryKey = 2;

-- =================================================================================
USE weekend_analysis;

-- RIGHT JOIN 
SELECT
	pc.CategoryName,
    SUM(r.ReturnQuantity) AS TotalReturns
FROM Returns r    
RIGHT JOIN Products p 
ON p.ProductKey = r.ProductKey
RIGHT JOIN ProductSubcategories ps
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
RIGHT JOIN ProductCategories pc
ON pc.ProductCategoryKey = ps.ProductCategoryKey
GROUP BY 1;

-- FULL JOIN 
SELECT t.* , r.*
FROM Territories t 
LEFT JOIN Returns r
ON t.SalesTerritoryKey = r.TerritoryKey
UNION ALL -- 3620 row(s) returned
SELECT t.* , r.*
FROM Territories t 
RIGHT JOIN Returns r
ON t.SalesTerritoryKey = r.TerritoryKey;


-- FULL JOIN 
SELECT t.* , r.*
FROM Territories t 
LEFT JOIN Returns r
ON t.SalesTerritoryKey = r.TerritoryKey
UNION -- 1811 row(s) returned
SELECT t.* , r.*
FROM Territories t 
RIGHT JOIN Returns r
ON t.SalesTerritoryKey = r.TerritoryKey;

-- UNION ALL VS UNION 
-- CTE [Common Table Expression]

WITH AllSales AS(
	SELECT * FROM Sales2015
	UNION ALL
	SELECT * FROM Sales2016
	UNION ALL
    SELECT * FROM Sales2017
)
SELECT * FROM AllSales; -- 56046 row(s) returned

-- SUBQUERY -- UNION

SELECT * 
FROM (
	SELECT * FROM Sales2015
	UNION
	SELECT * FROM Sales2016
	UNION
    SELECT * FROM Sales2017
) AS sales; -- 56046 row(s) returned

-- Find the name of the products bought by customers in all 3 years.
SELECT
	c.FullName AS CustomerName,
    p.ProductName,
    SUM(s.OrderQuantity) AS TotalOrders
FROM (
	SELECT * FROM Sales2015
	UNION
	SELECT * FROM Sales2016
	UNION
    SELECT * FROM Sales2017
) AS s
INNER JOIN Products p
ON p.ProductKey = s.ProductKey
INNER JOIN Customers c 
ON c.CustomerKey = s.CustomerKey
GROUP BY 1,2
HAVING TotalOrders >= 15
ORDER BY 3 DESC;


WITH AllSales AS (
	SELECT * FROM Sales2015
	UNION
	SELECT * FROM Sales2016
	UNION
    SELECT * FROM Sales2017
)
SELECT
	c.FullName AS CustomerName,
    p.ProductName,
    SUM(s.OrderQuantity) AS TotalOrders
FROM AllSales s
INNER JOIN Products p
ON p.ProductKey = s.ProductKey
INNER JOIN Customers c 
ON c.CustomerKey = s.CustomerKey
GROUP BY 1,2
HAVING TotalOrders >= 15
ORDER BY 3 DESC;


SELECT COUNT(*) FROM Products;

-- List ProductNames and ProductPrice that have never being returned.
SELECT
	ProductName,
    ProductPrice,
    r.ProductKey
FROM Products p
LEFT JOIN Returns r
ON p.ProductKey = r.ProductKey
WHERE r.ProductKey IS NULL; -- 169 row(s) returned

-- List the products that are sold in all 3 years.
-- Ensuring the products appear in all 3 tables.

SELECT 
	p.ProductName
FROM Products p 
WHERE p.ProductKey IN (SELECT DISTINCT ProductKey FROM Sales2015)
AND p.ProductKey IN (SELECT DISTINCT ProductKey FROM Sales2016)
AND p.ProductKey IN (SELECT DISTINCT ProductKey FROM Sales2017);

SELECT DISTINCT ProductKey FROM Sales2015;

-- Find the Top 10 Products that are most Returned.
SELECT
	p.ProductName,
    SUM(r.ReturnQuantity) AS TotalReturnQuantity
FROM Products p 
JOIN Returns r
ON p.ProductKey = r.ProductKey
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT
	ProductKey,
    ProductName,
    ProductCost,
    OrderQuantity
FROM Products p 
JOIN Sales2017 s 
ON p.ProductKey = s.ProductKey;
-- Error Code: 1052. Column 'ProductKey' in field list is ambiguous

-- CROSS JOIN 
-- Product Categories [4] VS ProductSubcategories Table [37]

SELECT COUNT(*) FROM ProductSubcategories; -- 37
SELECT COUNT(*) FROM ProductCategories; -- 4

SELECT * 
FROM ProductSubcategories
CROSS JOIN ProductCategories; -- 148 row(s) returned

-- SELF JOIN 
-- Find the Customers Pair who share the same last name
SELECT * FROM Customers;
SELECT 
	c1.CustomerKey AS Customer1_Id,
    c1.FullName AS Customer1_Name,
	c2.CustomerKey AS Customer2_Id,
    c2.FullName AS Customer2_Name,
    c1.LastName
FROM Customers c1
JOIN Customers c2
ON c1.LastName = c2.LastName
AND c1.CustomerKey < c2.CustomerKey; -- 11481 row(s) returned


-- Find the Customers with same BirthDate

SELECT 
	c1.CustomerKey AS Customer1_Id,
    c1.FullName AS Customer1_Name,
	c2.CustomerKey AS Customer2_Id,
    c2.FullName AS Customer2_Name,
    c1.DateOfBirth
FROM Customers c1
JOIN Customers c2
ON c1.DateOfBirth = c2.DateOfBirth
AND c1.CustomerKey < c2.CustomerKey;

-- IFNULL() , COALESCE()
SELECT * FROM Customers;

SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    IFNULL(AnnualIncome , 'Not Available') AS IncomeCateogory
FROM Customers;


SELECT 
	CustomerKey,
    FullName,
    IFNULL(Regions, 'No Region') AS Region,
    IFNULL(AnnualIncome , 'Not Available') AS IncomeCateogory
FROM Customers;

-- COALESCE()
SELECT 
	CustomerKey,
    FullName,
    COALESCE(AnnualIncome , 0) AS IncomeCateogory
FROM Customers;

-- Top 10 Products based on Total Revenue 

WITH AllSales AS(
	SELECT * FROM Sales2015
    UNION 
    SELECT * FROM Sales2016
    UNION 
    SELECT * FROM Sales2017
) -- 56046 row(s) returned
SELECT 
	p.ProductName,
    ROUND(SUM(s.OrderQuantity * p.ProductPrice),0) AS TotalRevenue,
    ROUND(SUM(s.OrderQuantity * p.ProductCost),0) AS TotalExpenses
FROM AllSales s
JOIN Products p 
ON p.ProductKey = s.ProductKey
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;


-- ============================= CASE STATEMENT ===========================================

/*
	SELECT column1,
       CASE
           WHEN condition1 THEN result1
           WHEN condition2 THEN result2
           ELSE default_result
       END AS alias_name
	FROM table_name;
*/

-- Create a new column 'Income_Category'-> Categorize the Customers with AnnualIncome
/* 
	CASES - <50k - 'Low Income'
		  - [50k - 100k] - 'Moderate Income'
          - > 100k - 'High Income'
*/
USE Weekend_analysis;

SELECT * FROM Customers;

SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    CASE
		WHEN AnnualIncome < 50000 THEN 'Low Income'
        WHEN AnnualIncome BETWEEN 50000 AND 100000 THEN 'Moderate Income'
        ELSE 'High Income'
    END AS Income_Category
FROM Customers;

-- Handling Null Cases
SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    CASE
		WHEN AnnualIncome IS NULL THEN 'No Income Defined'
		WHEN AnnualIncome < 50000 THEN 'Low Income'
        WHEN AnnualIncome BETWEEN 50000 AND 100000 THEN 'Moderate Income'
        ELSE 'High Income'
    END AS Income_Category
FROM Customers;

-- Create a new column name 'IncomeCategory' in Customer Table using Alter Command

DESC Customers;

ALTER TABLE Customers
ADD COLUMN IncomeCategory VARCHAR(100)
AFTER AnnualIncome;

-- UPDATE <IncomeCateogry> From Customers Table.
SELECT 
	CustomerKey,
    FullName,
    AnnualIncome,
    IncomeCategory
FROM Customers;

SET SQL_SAFE_UPDATES = 0;

UPDATE Customers
SET IncomeCategory = 
	CASE
		WHEN AnnualIncome IS NULL THEN 'No Income Defined'
		WHEN AnnualIncome < 50000 THEN 'Low Income'
        WHEN AnnualIncome BETWEEN 50000 AND 100000 THEN 'Moderate Income'
        ELSE 'High Income'
	END;
    
/*
	CONDITIONAL AGGREGATION WITH CASE SYNTAX:
    
    SELECT column,
       SUM(CASE WHEN condition THEN value ELSE 0 END) AS label
	FROM table
	GROUP BY column;
*/

-- Territory with Sales Table [Sales2017]
SELECT 
	TerritoryKey,
    OrderQuantity 
FROM Sales2017;

SELECT
	TerritoryKey,
    SUM(CASE WHEN OrderQuantity > 2 THEN OrderQuantity ELSE 0 END) AS High_Sales,
	SUM(CASE WHEN OrderQuantity BETWEEN 1 AND 2 THEN OrderQuantity ELSE 0 END) AS Moderate_Sales,
	SUM(CASE WHEN OrderQuantity < 1 THEN OrderQuantity ELSE 0 END) AS Low_Sales
FROM Sales2017
GROUP BY TerritoryKey;


SELECT
	TerritoryKey,
    SUM(CASE WHEN OrderQuantity = 3 THEN OrderQuantity ELSE 0 END) AS High_Sales,
	SUM(CASE WHEN OrderQuantity = 2 THEN OrderQuantity ELSE 0 END) AS Moderate_Sales,
	SUM(CASE WHEN OrderQuantity = 1 THEN OrderQuantity ELSE 0 END) AS Low_Sales
FROM Sales2017
GROUP BY TerritoryKey;


SELECT
	TerritoryKey,
    SUM(CASE WHEN OrderQuantity = 3 THEN OrderQuantity ELSE 0 END) AS High_Sales,
	SUM(CASE WHEN OrderQuantity = 2 THEN OrderQuantity ELSE 0 END) AS Moderate_Sales,
	SUM(CASE WHEN OrderQuantity = 1 THEN OrderQuantity ELSE 0 END) AS Low_Sales
FROM (
	SELECT * FROM Sales2015
    UNION 
    SELECT * FROM Sales2016
    UNION 
    SELECT * FROM Sales2017
) AS sub
GROUP BY TerritoryKey;

-- Challenge 1 : Segment the customers by Return Behaviour

SELECT 
	c.CustomerKey,
    c.FullName,
    SUM(COALESCE(r.ReturnQuantity,0)) AS TotalReturnQty,
    CASE
		WHEN SUM(COALESCE(r.ReturnQuantity,0)) > 5 THEN 'Frequent Returner'
        WHEN SUM(COALESCE(r.ReturnQuantity,0)) BETWEEN 1 AND 5 THEN 'Moderate Returner'
        ELSE 'Non Returner'
    END AS ReturnBehavior
FROM Customers c
LEFT JOIN Sales2015 s
ON c.CustomerKey = s.CustomerKey
LEFT JOIN Returns r 
ON r.ProductKey = s.ProductKey
GROUP BY 1,2; -- 2062 row(s) returned


-- Label Revenue by Category & Region
-- Calculate the Total Revenue per Category-Region Pair and tag them as Low, Moderate or High Revenue

-- >= 2Lakh -> High Revenue
-- >= 50k -> Moderate Revenue
-- ELSE 'Low Revenue'

SELECT
	pc.CategoryName,
    t.Region,
    ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue,
    CASE
		WHEN ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) > 200000 THEN 'High Revenue' 
		WHEN ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) > 50000 THEN 'Moderate Revenue'
        ELSE 'Low Revenue'
    END AS RevenueCategory
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Sales2017 s 
ON s.ProductKey = p.ProductKey 
JOIN Territories t
ON t.SalesTerritoryKey = s.TerritoryKey
GROUP BY 1,2;

-- Classify the CategoryName by its Return Volume 
-- Identify the Products with High, Moderate or Low Returns across regions and categories
-- >= 50 -> "High Returns"
-- >=25 -> ''Moderate Returns
-- Else [0-24] -> 'Low Returns'


SELECT
	pc.CategoryName,
    ps.SubCategoryName,
    t.Region,
    SUM(r.ReturnQuantity) AS TotalReturnQty,
    CASE
		WHEN SUM(r.ReturnQuantity) >= 50 THEN 'High Returns'
        WHEN SUM(r.ReturnQuantity) >= 25 THEN 'Moderate Returns'
        ELSE 'Low Returns'
    END AS ReturnCateogry
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Returns r 
ON r.ProductKey = p.ProductKey 
JOIN Territories t
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1,2,3;

-- Pivot Return Data by Region And Category
-- Show the total Return Quantity for each product category as columns by Regions.

SELECT * FROM ProductCategories;

SELECT 
	t.Region,
    SUM(CASE WHEN pc.CategoryName = 'Bikes' THEN r.returnQuantity ELSE 0 END ) AS BikeReturns,
    SUM(CASE WHEN pc.CategoryName = 'Clothing' THEN r.returnQuantity ELSE 0 END ) AS ClothingReturns,
    SUM(CASE WHEN pc.CategoryName = 'Accessories' THEN r.returnQuantity ELSE 0 END ) AS AccessoriesReturns,
    SUM(CASE WHEN pc.CategoryName = 'Components' THEN r.returnQuantity ELSE 0 END ) AS ComponentsReturns
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Returns r 
ON r.ProductKey = p.ProductKey 
JOIN Territories t
ON t.SalesTerritoryKey = r.TerritoryKey
GROUP BY 1;
	

-- Let's Explore the POWER OF CTE [Common Table Expression]

WITH Region_ReturnCategory AS (
	SELECT
		pc.CategoryName,
		ps.SubCategoryName,
		t.Region,
		SUM(r.ReturnQuantity) AS TotalReturnQty,
		CASE
			WHEN SUM(r.ReturnQuantity) >= 50 THEN 'High Returns'
			WHEN SUM(r.ReturnQuantity) >= 25 THEN 'Moderate Returns'
			ELSE 'Low Returns'
		END AS ReturnCateogry
	FROM ProductCategories pc 
	JOIN ProductSubcategories ps 
	ON pc.ProductCategoryKey = ps.ProductCategoryKey
	JOIN Products p
	ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN Returns r 
	ON r.ProductKey = p.ProductKey 
	JOIN Territories t
	ON t.SalesTerritoryKey = r.TerritoryKey
	GROUP BY 1,2,3
)
SELECT * FROM Region_ReturnCategory WHERE ReturnCateogry = 'High Returns';

-- CTE [Common Table Expression]

WITH AvgProductSubcategory AS (
	SELECT
		ProductSubcategoryKey,
		ROUND(AVG(ProductPrice),0) AS AvgPrice
	FROM Products 
	GROUP BY 1
)
SELECT 
	ProductKey, 
    ProductName, 
    ProductPrice,
    AvgPrice
FROM Products p
JOIN AvgProductSubcategory a 
ON p.ProductSubcategoryKey = a.ProductSubcategoryKey
WHERE ProductPrice > AvgPrice
ORDER BY ProductPrice DESC;

SELECT * FROM Products;

USE Weekend_analysis;
-- MULTIPLE CTE 
-- Calculate the total Returns and total sales for each productCategory.
Select
	pc.CategoryName,
	SUM(r.ReturnQuantity) AS TotalReturnQty
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Returns r 
ON r.ProductKey = p.ProductKey 
GROUP BY 1;

Select
	pc.CategoryName,
	ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Sales2017 s 
ON s.ProductKey = p.ProductKey 
GROUP BY 1;

With CategoryReturns AS (
	Select
		pc.CategoryName,
        SUM(r.ReturnQuantity) AS TotalReturnQty
	FROM ProductCategories pc 
	JOIN ProductSubcategories ps 
	ON pc.ProductCategoryKey = ps.ProductCategoryKey
	JOIN Products p
	ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN Returns r 
	ON r.ProductKey = p.ProductKey 
    GROUP BY 1
),
CategorySales AS (
	Select
		pc.CategoryName,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM ProductCategories pc 
	JOIN ProductSubcategories ps 
	ON pc.ProductCategoryKey = ps.ProductCategoryKey
	JOIN Products p
	ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN Sales2017 s 
	ON s.ProductKey = p.ProductKey 
    GROUP BY 1
)
SELECT 
	cr.CategoryName,
	cr.TotalReturnQty,
    cs.TotalRevenue
FROM CategoryReturns cr 
JOIN CategorySales cs
ON cr.CategoryName = cs.CategoryName
ORDER BY cs.TotalRevenue DESC;

/* SELECT * FROM CategoryReturns; 
-- Error Code: 1146. Table 'weekend_analysis.categoryreturns' doesn't exist
*/

-- WITHOUT CTE [Incorrect Insight]
Select
	pc.CategoryName,
	SUM(r.ReturnQuantity) AS TotalReturnQty,
	ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
FROM ProductCategories pc 
JOIN ProductSubcategories ps 
ON pc.ProductCategoryKey = ps.ProductCategoryKey
JOIN Products p
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN Returns r 
ON r.ProductKey = p.ProductKey 
JOIN Sales2017 s
ON s.ProductKey = p.ProductKey
GROUP BY 1
ORDER BY 3 DESC;

WITH AllSales AS (
	SELECT * FROM Sales2015
	UNION
	SELECT * FROM Sales2016
	UNION
	SELECT * FROM Sales2017
),
CategoryProfit AS (
	Select
		pc.CategoryName,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue,
        ROUND(SUM(p.ProductCost * s.OrderQuantity),0) AS TotalExpenses
	FROM ProductCategories pc 
	JOIN ProductSubcategories ps 
	ON pc.ProductCategoryKey = ps.ProductCategoryKey
	JOIN Products p
	ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
	JOIN AllSales s 
	ON s.ProductKey = p.ProductKey 
    GROUP BY 1
)
SELECT 
	*,
    (TotalRevenue - TotalExpenses) AS TotalProfit
FROM CategoryProfit;


-- ==================================  SUBQUERIES ==========================================
-- A Subquery is a query nested inside another query [Inner Query]. It returns data used by other query.
-- You can use that subquery in : [SELECT , FROM , WHERE , HAVING, JOIN]

-- Subquery in SELECT Clause
-- Show Each subcategories with its Average Product Cost

SELECT
	ps.SubcategoryName,
    (	
		SELECT 
			ROUND(AVG(ProductCost),0) AS AvgCost
		FROM Products p
		WHERE p.ProductSubcategoryKey = ps.ProductSubcategoryKey
    ) AS AvgProductCost
FROM ProductSubcategories ps;
    
 
SELECT
	ProductSubcategoryKey,
    ROUND(AVG(ProductCost),0) AS AvgCost
FROM Products
GROUP BY 1;

SELECT
	SubcategoryName
FROM ProductSubcategories;

SELECT
	ps.SubcategoryName,
	ROUND(AVG(ProductCost),0) AS AvgCost
FROM Products p
JOIN
ProductSubcategories ps
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
GROUP BY 1;

-- SUBQUERY IN FROM CLAUSE....
-- List the Top 10 Products By Total Revenue
SELECT
	p.ProductKey,
    p.ProductName,
    sub.TotalRevenue
FROM Products p , 
(
	SELECT
		s.ProductKey,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM Sales2017 s 
    JOIN Products p 
    ON p.ProductKey = s.ProductKey
    GROUP BY 1 -- 102 row(s) returned
) sub
WHERE p.ProductKey = sub.ProductKey
ORDER BY 3 DESC;


SELECT
	p.ProductKey,
	ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
FROM Sales2017 s 
JOIN Products p 
ON p.ProductKey = s.ProductKey
GROUP BY 1;

WITH SummaryTable AS (
	SELECT
		s.ProductKey,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM Sales2017 s 
    JOIN Products p 
    ON p.ProductKey = s.ProductKey
    GROUP BY 1
)
SELECT 
	p.ProductKey,
    p.ProductName,
    s.TotalRevenue
FROM Products p 
JOIN SummaryTable s
ON p.ProductKey = s.ProductKey
ORDER BY 3 DESC;

-- SUBQUERY IN WHERE CLAUSE ====================================== [V.Imp]
-- Applying the subquery for filtering the table....

-- Products that are returned more than 50 times.

SELECT
	ProductName,
    SUM(ReturnQuantity) As TotalReturns
FROM Products p 
JOIN Returns r
ON p.ProductKey = r.ProductKey
GROUP BY 1
ORDER BY 2 DESC;

SELECT
	p.ProductName,
    p.ProductColor,
    p.ProductPrice
FROM Products p 
WHERE (
	SELECT SUM(ReturnQuantity)
    FROM Returns r 
    WHERE p.ProductKey = r.ProductKey
) > 50;

-- Find the Products priced above their average p.price in productsubcategory.......
 
SELECT
	p.ProductName,
    p.ModelName,
    p.ProductPrice
FROM Products p
WHERE p.ProductPrice > (
	SELECT AVG(p2.ProductPrice)
    FROM Products p2
    WHERE p2.ProductSubcategoryKey = p.ProductSubcategoryKey
); -- 115 row(s) returned


SELECT * FROM Products;

SELECT
	ProductSubcategoryKey,
	Avg(ProductPrice) AS AvgPrice
FROM Products
GROUP BY ProductSubcategoryKey;

-- SUBQUERY IN HAVING CLAUSE ===============================================
-- Find the Products returned more than the average return quantity

SELECT
	p.ProductName,
    SUM(r.ReturnQuantity) as TotalReturnQty
FROM Products p 
JOIN Returns r
ON r.ProductKey = p.ProductKey
GROUP BY 1
HAVING SUM(r.ReturnQuantity) > (
	SELECT
		AVG(TotalReturnQty)
	FROM (
		SELECT
			SUM(ReturnQuantity) as TotalReturnQty
		FROM Returns 
        GROUP BY ProductKey
	) sub
); -- 34 row(s) returned


SELECT
	p.ProductName,
    SUM(r.ReturnQuantity) as TotalReturnQty
FROM Products p 
JOIN Returns r
ON r.ProductKey = p.ProductKey
GROUP BY 1; -- 124 row(s) returned

SELECT AVG(ReturnQuantity) FROM Returns; -- 1.0105

SELECT
	AVG(TotalReturnQty)
FROM (
	SELECT
		SUM(ReturnQuantity) as TotalReturnQty
	FROM Returns 
	GROUP BY ProductKey
) sub; -- 14.7 Avg

SELECT
	ProductKey,
	SUM(ReturnQuantity) as TotalReturnQty
FROM Returns 
GROUP BY ProductKey;



SELECT
	AVG(TotalReturnQty)
FROM (
	SELECT
		SUM(ReturnQuantity) as TotalReturnQty
	FROM Returns
) sub; -- 1828 [Not Recommended]

SELECT
	SUM(ReturnQuantity) as TotalReturnQty
FROM Returns;

-- SUBQUERY IN JOIN CLAUSE ================================================

-- Join regions with their total return Qty .......

SELECT 
	t.SalesTerritoryKey,
    t.Region,
    sub.TotalReturnQty
FROM Territories t 
JOIN(
	SELECT
		r.TerritoryKey,
        SUM(ReturnQuantity) AS TotalReturnQty
	FROM Returns r
    GROUP BY 1
) sub 
ON t.SalesTerritoryKey = sub.TerritoryKey
ORDER BY 3 DESC;


SELECT
	r.TerritoryKey,
	SUM(ReturnQuantity) AS TotalReturnQty
FROM Returns r
GROUP BY 1;

WITH TerritoryReturns AS (
	SELECT
		r.TerritoryKey,
        SUM(ReturnQuantity) AS TotalReturnQty
	FROM Returns r
    GROUP BY 1
)
SELECT 
	t.SalesTerritoryKey,
    t.Region,
    tr.TotalReturnQty
FROM Territories t 
JOIN TerritoryReturns tr
ON t.SalesTerritoryKey = tr.TerritoryKey;

-- ✅ Use nested & correlated subqueries for advanced querying

-- Products returned more than the average returned qty in their subcategory
USE weekend_analysis;
SELECT AVG(ReturnQuantity) FROM Returns;

SELECT
	p.ProductSubcategoryKey,
	AVG(r.ReturnQuantity) AS AvgReturnQty
FROM Products p
JOIN Returns r
ON p.ProductKey = r.ProductKey
GROUP BY 1;

Select
	p.ProductKey,
    p.ProductName,
    r.ReturnQuantity
FROM Products p
JOIN Returns r
ON p.ProductKey = r.ProductKey
WHERE r.ReturnQuantity > (
	SELECT 
		AVG(r2.ReturnQuantity)
	FROM Returns r2
    JOIN Products p2
    ON r2.ProductKey = p2.ProductKey
    WHERE p2.ProductSubcategoryKey = p.ProductSubcategoryKey
);

-- Nested  Subquery inside Subquery
-- Return the region with maximum return Quantity

SELECT 
	t.Region,
    sub.total_return_qty
FROM Territories t
JOIN (
	SELECT 
		r.TerritoryKey,
        SUM(r.ReturnQuantity) AS total_return_qty
	FROM Returns r
    GROUP BY 1
) sub
ON t.SalesTerritoryKey = sub.TerritoryKey
WHERE sub.total_return_qty = (
	SELECT
		MAX(total_return_qty)
		FROM (
			SELECT	SUM(r2.ReturnQuantity) AS total_return_qty
            FROM Returns r2
            GROUP BY r2.TerritoryKey
		)sub2
);

SELECT	
	SUM(r2.ReturnQuantity) AS total_return_qty
FROM Returns r2
GROUP BY r2.TerritoryKey;


SELECT 
	t.Region,
    sub.total_return_qty
FROM Territories t
JOIN (
	SELECT 
		r.TerritoryKey,
        SUM(r.ReturnQuantity) AS total_return_qty
	FROM Returns r
    GROUP BY 1
) sub
ON t.SalesTerritoryKey = sub.TerritoryKey
ORDER BY 2 DESC
LIMIT 1;

-- Un-Optimized Query

SELECT
	c.CustomerKey,
    c.FullName,
    SUM(s.OrderQuantity) As TotalOrderQty
FROM Customers c
JOIN Sales2015 s
ON c.CustomerKey = s.CustomerKey
GROUP BY 1,2 -- 644 row(s) returned

UNION ALL 

SELECT
	c.CustomerKey,
    c.FullName,
    SUM(s.OrderQuantity) As TotalOrderQty
FROM Customers c
JOIN Sales2016 s
ON c.CustomerKey = s.CustomerKey
GROUP BY 1,2 -- 1443 row(s) returned

UNION ALL 

SELECT
	c.CustomerKey,
    c.FullName,
    SUM(s.OrderQuantity) As TotalOrderQty
FROM Customers c
JOIN Sales2017 s
ON c.CustomerKey = s.CustomerKey
GROUP BY 1,2; -- 1299 row(s) returned
-- 3386 row(s) returned

-- Optimize Query
WITH CombinedSales AS (
	SELECT CustomerKey , OrderQuantity FROM Sales2015
    UNION ALL 
    SELECT CustomerKey , OrderQuantity FROM Sales2016
    UNION ALL 
    SELECT CustomerKey , OrderQuantity FROM Sales2017
),
TotalCustomerSales AS (
	SELECT CustomerKey , SUM(OrderQuantity) AS TotalSales
    FROM CombinedSales
    GROUP BY CustomerKey
)
SELECT 
	c.CustomerKey,
    c.FullName,
    t.TotalSales
FROM TotalCustomerSales t
JOIN Customers c 
ON c.CustomerKey = t.CustomerKey
ORDER BY 3 DESC; -- 2032 row(s) returned

SELECT * FROM Customers; -- 2062 row(s) returned

-- ============================ DATE MANIPULATION ================================================
-- SQL DATE Format -> 'YYYY-MM-DD' [Date Format]
-- SQL DATE Format -> 'YYYY-MM-DD HH:MM:SS' [DateTime Format]
-- DATE RANGE -> '1000-01-01' to '9999-12-31'

DESC Sales2015;
SELECT * FROM Sales2015;
-- 9/21/2001 -> m/dd/yyyy [f(x)] [Pattern : '%/%/%']
-- 12-05-2001 -> mm-dd-yyyy [f(x)] [Pattern : '__-__-____']

-- Event Table [Practice] - to get familiar with Date Handling 

CREATE TABLE Events(
	event_id INT AUTO_INCREMENT,
    event_name VARCHAR(50),
    event_date DATE,
    delivery_date DATE,
    PRIMARY KEY(event_id)
);

DESC Events;

INSERT INTO Events(event_name , event_date , delivery_date)
VALUES('ProjectX' , '2025-10-18' , '2025-10-18'),
('Zomato Land', '2025-12-25', '2025-10-25'),
('lollapalooza', '2025-03-06', '2025-03-07'),
('Tech Conference', '2025-03-15', '2025-03-10'),
('Music Festival', '2025-04-20', '2025-04-18'),
('Art Exhibition', '2025-05-05', '2025-05-03'),
('Coding Hackathon', '2025-06-12', '2025-06-12'),
('Startup Meetup', '2025-07-08', '2025-07-11'),
('Book Launch', '2025-08-14', '2025-08-12'),
('AI Workshop', '2025-09-25', '2025-09-27'),
('Food Carnival', '2025-10-30', '2025-11-01'),
('Charity Run', '2025-11-20', '2025-11-24');

SELECT * FROM Events;

-- CURRENT_DATE() -> Today's Date
SELECT CURRENT_DATE();

-- INSERT Command
INSERT INTO Events(event_name , event_date)
VALUES('ProjectZ' , CURRENT_DATE());

SELECT * FROM Events;

-- CURRENT_TIME 'HH:MM:SS' 
SELECT CURRENT_TIME();

DESC Events;
-- Challenge -> To add an event_time Columns
ALTER TABLE Events
ADD COLUMN event_time TIME;

INSERT INTO Events(event_name , event_date, event_time)
VALUES('Project_Alpha' , CURRENT_DATE() , CURRENT_TIME());

SELECT * FROM Events;

-- FORMAT 'YYYY-MM-DD HH:MM:SS' [Current_TimeStamp() , NOW()]
SELECT current_timestamp();

SELECT NOW();

-- Extract [Year,Month,Day] -- YYYY-MM-DD
SELECT YEAR('2025-10-18');
SELECT MONTH('2025-10-18');
SELECT DAY('2025-10-18');

SELECT EXTRACT(YEAR FROM Current_DATE());
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(DAY FROM CURRENT_TIMESTAMP());
SELECT EXTRACT(HOUR FROM NOW());
SELECT EXTRACT(MINUTE FROM NOW());
SELECT EXTRACT(SECOND FROM NOW());

SELECT 
	event_name,
    Year(event_date),
    MONTH(delivery_date),
    MONTHNAME(event_date),
    DAY(event_date)
FROM Events;

-- GROUP BY Based ON Month
SELECT 
    MONTH(event_date) As Month,
    COUNT(*) AS TotalEvent
FROM Events
GROUP BY 1;

-- DATE Arithmetic 
-- DATE_ADD() , DATE_SUB()

SELECT	
	DATE_ADD(CURRENT_DATE , INTERVAL 10 DAY),-- Today is 18th + 10 -> 28th
    DATE_SUB(CURRENT_DATE , INTERVAL 1 MONTH); -- Oct - 1 = Sept 
    
SELECT
	DATE_ADD(NOW() , INTERVAL 25 HOUR); -- 18th Oct 2025 13:06:36 + 25 hours
    

-- Chaining Intervals : 
SELECT
	DATE_ADD(DATE_ADD('2025-10-18 12:00:00' , INTERVAL 1 DAY) , INTERVAL 5 HOUR);
    
SELECT 
	DATE_ADD('2025-10-18 12:00:00' , INTERVAL 2 YEAR);
    
SELECT * FROM Events;

DESC Events;

SET SQL_SAFE_UPDATES = 0;
UPDATE Events
SET delivery_date = DATE_ADD(event_date , INTERVAL 2 DAY)
WHERE delivery_date IS NULL;

UPDATE Events
SET event_time = DATE_ADD(event_date , INTERVAL 17 HOUR)
WHERE event_time IS NULL;

SELECT * FROM Events;

SELECT
	event_id,
    event_name,
    event_date,
    delivery_date,
    DATEDIFF(event_date , delivery_date) AS delivery_dates
FROM Events;

-- DATE_FORMAT() [Refer Documentation]

SELECT DATE_FORMAT('2025-10-18' , '%M, %W - %d/%m/%Y' ) AS formatted_date;
-- MonthName , DayName - 'dd/mm/yyyy'

SELECT 
	DATE_FORMAT('2025-10-18 12:00:00' ,  'Venue : Hotel Lalit on %D %b %Y at %h noon') AS formatted_datetime;
-- 'Venue : Hotel Lalit on 18th Oct 2025 at 12 noon'

SELECT * FROM Events;

SELECT
	event_name,
    event_date,
    delivery_date,
    event_time,
    DATE_FORMAT(event_date , '%D-%b-%Y') AS formatted_event_date,
    DATE_FORMAT(delivery_date , '%D-%b-%Y') AS formatted_delivery_date,
	DATE_FORMAT(event_time , '%r') AS formatted_event_time
FROM Events;

-- STR_TO_DATE -> "YYYY-MM-DD"
SELECT 
	STR_TO_DATE('18th_Oct_2025' , '%D_%b_%Y') AS Formatted_date;
    
DESC Returns;
SELECT * FROM Returns;

-- CALENDAR TABLE CLEANING =========================================
-- Using STR_TO_DATE()

SELECT  * FROM Calendar; -- DATE [dd-mm-yyyy] [%d-%m-%Y] -> ['YYYY-MM-DD']

SELECT
	STR_TO_DATE(Date , '%d-%m-%Y') AS Calendar_date
FROM Calendar;

SELECT * FROM Calendar;

ALTER TABLE Calendar
ADD COLUMN calendar_date varchar(50);

SELECT * FROM Calendar;

UPDATE Calendar
SET calendar_date = STR_TO_DATE(Date , '%d-%m-%Y')
WHERE calendar_date IS NULL;

DESC Calendar;

ALTER TABLE Calendar
MODIFY COLUMN calendar_date DATE;

ALTER TABLE Calendar
DROP COLUMN Date;

-- ===================== DATE Manipulation ============================
-- DATE Cleaning
USE weekend_analysis;
DESC customers;

SELECT * FROM Customers;

SET SQL_SAFE_UPDATES = 0;
UPDATE Customers
SET DateofBirth = STR_TO_DATE(DateOfBirth , '%d/%m/%Y'); 

DESC Customers;

ALTER TABLE Customers
MODIFY COLUMN DateOfBirth DATE;

-- Returns [Date Cleaning]
DESC Returns;

SELECT * FROM Returns;

UPDATE Returns 
SET ReturnDate = STR_TO_DATE(ReturnDate , '%c/%e/%Y');

ALTER TABLE Returns
MODIFY COLUMN ReturnDate DATE; 

-- Sales-2015
DESC Sales2015;

SELECT * FROM Sales2015;

UPDATE Sales2015 
SET OrderDate = 
	CASE
		WHEN OrderDate Like '__-__-____' THEN STR_TO_DATE(OrderDate , '%m-%d-%Y')
        ELSE STR_TO_DATE(OrderDate , '%c/%d/%Y')
    END;

UPDATE Sales2015
SET StockDate = STR_TO_DATE(StockDate , '%m-%d-%Y')
WHERE StockDate LIKE '__-__-____';

UPDATE Sales2015
SET StockDate = STR_TO_DATE(StockDate , '%c/%d/%Y')
WHERE StockDate LIKE '%/%/%';

ALTER TABLE Sales2015
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDate DATE;

-- Sales2016  =============================

DESC Sales2016;

SELECT * FROM Sales2016 WHERE OrderDate LIKE '%/%/%'; -- 23935 row(s) returned

SELECT * FROM Sales2016 WHERE StockDate LIKE '%/%/%'; -- 23935 row(s) returned

UPDATE Sales2016
SET OrderDate = STR_TO_DATE(OrderDate , '%c/%e/%Y')
WHERE OrderDate LIKE '%/%/%';

UPDATE Sales2016
SET StockDate = STR_TO_DATE(StockDate , '%c/%e/%Y')
WHERE StockDate LIKE '%/%/%';

SELECT * FROM Sales2016;

ALTER TABLE Sales2016
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDate DATE;

-- ==================== Sales2017 ==============================================
DESC Sales2017;

SELECT * FROM Sales2017;

SELECT * FROM Sales2017 WHERE OrderDate LIKE '%/%/%'; -- 29481 row(s) returned

SELECT * FROM Sales2017 WHERE StockDate LIKE '%/%/%'; -- 29481 row(s) returned

UPDATE Sales2017
SET OrderDate = STR_TO_DATE(OrderDate , '%c/%e/%Y')
WHERE OrderDate LIKE '%/%/%';

UPDATE Sales2017
SET StockDate = STR_TO_DATE(StockDate , '%c/%e/%Y')
WHERE StockDate LIKE '%/%/%';

SELECT * FROM Sales2017;

ALTER TABLE Sales2017
MODIFY COLUMN OrderDate DATE,
MODIFY COLUMN StockDate DATE;

-- Challenge 1 : Total Return Qty by CategoryName for year 2017

SELECT
	pc.CategoryName,
    SUM(ReturnQuantity) AS TotalReturnQty
FROM Returns r
JOIN Products p
ON p.ProductKey = r.ProductKey
JOIN ProductSubcategories ps
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN ProductCategories pc
ON pc.ProductCategoryKey = ps.ProductCategoryKey
WHERE YEAR(ReturnDate) = 2017
GROUP BY 1;

-- Challenge 2 : Calculate the Sum of Return Qty per Year.

SELECT 
	YEAR(ReturnDate) AS Year,
    SUM(ReturnQuantity) AS TotalReturnQty
FROM Returns
GROUP BY 1;

-- Seasonal Sales Trends [Year/Month Wise for each CategoryName] for Sales2015/16/17
WITH AllSales AS (
	SELECT * FROM Sales2015
    UNION
    SELECT * FROM Sales2016
    UNION
    SELECT * FROM Sales2017
)
SELECT
	Year(s.OrderDate) AS Year,
    Month(s.OrderDate) AS Month,
    pc.CategoryName,
    SUM(s.OrderQuantity) AS TotalOrderQty
FROM AllSales s 
JOIN Products p 
ON p.ProductKey = s.ProductKey
JOIN ProductSubcategories ps
ON p.ProductSubcategoryKey = ps.ProductSubcategoryKey
JOIN ProductCategories pc
ON pc.ProductCategoryKey = ps.ProductCategoryKey
GROUP BY 1,2,3;
    
-- ========================= WINDOW FUNCTIONS ==============================
/* 
SELECT 
  window_function(...) OVER (
    PARTITION BY column_name
    ORDER BY column_name
    ROWS/RANGE ...
  ) AS result_column
FROM table_name;
*/


SELECT * FROM Sale;

-- Find the Cumulative Total Sum by SalesPerson

SELECT
	*,
    SUM(SaleAmount) OVER(
		PARTITION BY SalesPerson
        ORDER BY SaleDate
    ) AS CumulativeSalesPerPerson
FROM Sale;

SELECT
	SalesPerson,
    SUM(SaleAmount) AS TotalSales
FROM Sale
GROUP BY SalesPerson;

-- Rank() VS Dense_Rank()

SELECT 
	*,
    RANK() OVER(
	ORDER BY SaleAmount DESC
) AS SalesRank
FROM Sale;

SELECT 
	*,
    DENSE_RANK() OVER(
	ORDER BY SaleAmount DESC
) AS SalesRank
FROM Sale;


-- Find the 3 Days Moving Average Sales

SELECT
	*,
    AVG(SaleAmount) OVER(
	ORDER BY SaleDate
    ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
) AS MovingAverage
FROM Sale;


-- Find the 5 Days Moving Average Sales

SELECT
	*,
    AVG(SaleAmount) OVER(
	ORDER BY SaleDate
    ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
) AS MovingAverage
FROM Sale;

-- ======================== Income Difference from AvgIncome ==================
Use Weekend_Analysis;

SELECT  AVG(AnnualIncome) FROM Customers;

SELECT
	CustomerKey,
    FullName,
    AnnualIncome,
    AnnualIncome - AVG(AnnualIncome) OVER() AS Income_Diff_From_Avg
FROM Customers;


-- Find the maximum income based on Prefix

SELECT DISTINCT Prefix FROM Customers;

SELECT
	CustomerKey,
    Prefix,
    FullName,
    AnnualIncome,
    MAX(AnnualIncome) OVER(PARTITION BY Prefix) AS max_income_by_prefix
FROM Customers;


-- Find the maximum income based on Gender

SELECT DISTINCT Gender FROM Customers;

SELECT
	CustomerKey,
    FullName,
    Gender,
    AnnualIncome,
    MAX(AnnualIncome) OVER(PARTITION BY Gender) AS max_income_by_gender
FROM Customers;

-- Find the maximum income based on EducationLevel , Occupation

SELECT DISTINCT EducationLevel , Occupation FROM Customers; -- 25 row(s) returned

SELECT
	CustomerKey,
    FullName,
    EducationLevel,
    Occupation,
    AnnualIncome,
    MAX(AnnualIncome) OVER(PARTITION BY EducationLevel, Occupation) AS max_income_by_Edu_Occupation
FROM Customers;

-- CASE With Window Functions 
-- If the ProductCost = Max(ProductCost) Within each 'ProductSubcategory' -> Highest [Cost Category]
-- If the ProductCost = Min(ProductCost) Within each 'ProductSubcategory' -> Lowest [Cost Category]
-- Else : 'Medium'

SELECT
	ProductSubcategoryKey,
    ProductName,
    ProductCost,
    CASE
		WHEN ProductCost = Max(ProductCost) OVER(PARTITION BY ProductSubcategoryKey) THEN 'Highest'
        WHEN ProductCost = MIN(ProductCost) OVER(PARTITION BY ProductSubcategoryKey) THEN 'Lowest'
        ELSE 'Medium'
    END AS CostCategory
FROM Products;

SELECT 
	ProductSubcategoryKey,
	Max(ProductCost),
    MIN(ProductCost)
FROM Products
GROUP BY 1;


-- Rank the Customers [based on AnnualIncome] Partition By EducationLevel , Occupation

SELECT DISTINCT EducationLevel , Occupation FROM Customers; -- 25 row(s) returned

SELECT
	CustomerKey,
    FullName,
    EducationLevel,
    Occupation,
    AnnualIncome,
    DENSE_RANK() OVER(PARTITION BY EducationLevel, Occupation ORDER BY AnnualIncome DESC) AS IncomeRank
FROM Customers;

-- Rank the Customers with each MaritalStatus and order by BirthDate (oldest To Youngest). [Hint : Asc]

DESC Customers;
SELECT
	CustomerKey,
    FullName,
    MaritalStatus,
    DateOfBirth,
    DENSE_RANK() OVER(PARTITION BY MaritalStatus ORDER BY DateOfBirth) AS Age_Ranking
FROM Customers;

-- Rank the Product and create a category with a case statement 
-- where the productcost is being ranked based on ProductSubcategory

/*
	=1 Rank : [Top Rank] 
	<= 5 Rank : [Medium Rank]
    Else [Bottom Rank]
*/

SELECT
	ProductSubcategoryKey,
    ProductName,
    ProductCost,
    RANK() OVER(PARTITION BY ProductSubcategoryKey ORDER BY ProductCost DESC) AS ProductRank,
    CASE
		WHEN RANK() OVER(PARTITION BY ProductSubcategoryKey ORDER BY ProductCost DESC) = 1 THEN 'TopRank'
        WHEN RANK() OVER(PARTITION BY ProductSubcategoryKey ORDER BY ProductCost DESC) <= 5 THEN 'MediumRank'
        ELSE 'BottomRank'
    END AS CostCategory
FROM Products;

-- Same Above Code With CTE [Optimized]

WITH ProductRanking AS (
	SELECT
		ProductSubcategoryKey,
		ProductName,
		ProductCost,
		RANK() OVER(PARTITION BY ProductSubcategoryKey ORDER BY ProductCost DESC) AS ProductRank
	FROM Products
)
SELECT 
	* ,
    CASE
		WHEN ProductRank = 1 THEN 'TopRank'
        WHEN ProductRank <= 5 THEN 'MediumRank'
        ELSE 'BottomRank'
    END AS CostCategory
FROM ProductRanking;

-- ROW_NUMBER() -> Index [1 till the Partition Count] 

SELECT
	CustomerKey,
    FullName,
    EducationLevel,
    Occupation,
    AnnualIncome,
    ROW_NUMBER() OVER(PARTITION BY EducationLevel, Occupation ORDER BY AnnualIncome DESC) AS Row_Index
FROM Customers;	

-- ====================== LEAD() & LAG() ===============================
DESC Sale;

SELECT 
	*,
    LAG(SaleAmount) OVER (PARTITION BY Salesperson ORDER BY SaleDate) AS PreviousSale,
    LEAD(SaleAmount) OVER (PARTITION BY Salesperson ORDER BY SaleDate) AS NextSale
FROM Sale;

-- Challenge : 
SELECT * FROM Sales2015;

SELECT
	DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
    ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue,
    
    LAG(ROUND(SUM(p.ProductPrice * s.OrderQuantity),0))
    OVER(ORDER BY DATE_FORMAT(s.OrderDate , '%Y-%m')) AS PreviousMonthRevenue,
    
    LEAD(ROUND(SUM(p.ProductPrice * s.OrderQuantity),0))
    OVER(ORDER BY DATE_FORMAT(s.OrderDate , '%Y-%m')) AS NextMonthRevenue
    
FROM Sales2015 s 
JOIN Products p
ON p.ProductKey = s.ProductKey
GROUP BY 1
ORDER BY 1;

-- SAME CODE AS ABOVE USING CTE [Optimized]
WITH Understanding_Revenue AS (
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
    FROM Sales2015 s 
	JOIN Products p
	ON p.ProductKey = s.ProductKey
	GROUP BY 1
	ORDER BY 1
)
SELECT 
	*,
    LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS PreviousMonthRevenue,
    LEAD(TotalRevenue) OVER(ORDER BY YearMonth) AS NextMonthRevenue
FROM Understanding_Revenue;


-- Challenge - Adding SaleAmountChange in Above Table
WITH Understanding_Revenue AS (
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
    FROM Sales2015 s 
	JOIN Products p
	ON p.ProductKey = s.ProductKey
	GROUP BY 1
	ORDER BY 1
)
SELECT 
	*,
    LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS PreviousMonthRevenue,
    LEAD(TotalRevenue) OVER(ORDER BY YearMonth) AS NextMonthRevenue,
    TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS SaleAmountChange
FROM Understanding_Revenue;

-- Adding SalesTrend on the above query:

WITH Understanding_Revenue AS (
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
    FROM Sales2015 s 
	JOIN Products p
	ON p.ProductKey = s.ProductKey
	GROUP BY 1
	ORDER BY 1
)
SELECT 
	*,
    LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS PreviousMonthRevenue,
    LEAD(TotalRevenue) OVER(ORDER BY YearMonth) AS NextMonthRevenue,
    TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS SaleAmountChange,
    CASE
		WHEN TotalRevenue > LAG(TotalRevenue) OVER(ORDER BY YearMonth) THEN 'Increase'
		WHEN TotalRevenue < LAG(TotalRevenue) OVER(ORDER BY YearMonth) THEN 'Decrease'
        ELSE 'No Change'
    END AS SalesTrend
FROM Understanding_Revenue;

-- ALTERNATIVE Solution

WITH Understanding_Revenue AS (
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
    FROM Sales2015 s 
	JOIN Products p
	ON p.ProductKey = s.ProductKey
	GROUP BY 1
	ORDER BY 1
)
SELECT 
	*,
    LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS PreviousMonthRevenue,
    LEAD(TotalRevenue) OVER(ORDER BY YearMonth) AS NextMonthRevenue,
    TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS SaleAmountChange,
    CASE
		WHEN TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) > 0 THEN 'Increase'
		WHEN TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS SalesTrend
FROM Understanding_Revenue; 

-- ==================== WINDOW FUNCTIONS ==================
Use Weekend_Analysis;

-- =========== NTILE(Number of Buckets) OVER(ORDER BY columnName) ==================

-- SPLIT THE ProductPrice Columns in Quartile -> [4 Parts]

SELECT 
	ProductName,
    ProductPrice
FROM Products
ORDER BY ProductPrice;

SELECT 
	ProductName,
    ProductPrice,
    NTILE(4) OVER(ORDER BY ProductPrice) AS Price_Quartile
FROM Products;

-- Divide each month's total sales into 3 performance tiers (terciles) 
-- to categorise months as low, medium, or high-performing.

With MonthlySales AS(
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM Sales2017 s
    JOIN Products p
    ON s.ProductKey = p.ProductKey
    GROUP BY 1
    ORDER BY 1
)
SELECT 
	YearMonth,
    TotalRevenue,
    NTILE(3) OVER(ORDER BY TotalRevenue) AS sales_tercile
FROM MonthlySales;


-- ALL Sales 

With MonthlySales AS(
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM (
		SELECT * FROM Sales2015
        UNION
        SELECT * FROM Sales2016
        UNION 
        SELECT * FROM Sales2017
    ) s
    JOIN Products p
    ON s.ProductKey = p.ProductKey
    GROUP BY 1
    ORDER BY 1
)
SELECT 
	YearMonth,
    TotalRevenue,
    NTILE(3) OVER(ORDER BY TotalRevenue) AS sales_tercile
FROM MonthlySales;

-- ===================== OUTLIER DETECTION ==================
SELECT
	ProductPrice,
	NTILE(4) OVER (ORDER BY ProductPrice) AS Price_quartile
FROM Products;

-- Filter the Products lying within the lower bound and upper bound....
WITH Product_Stats AS (
	SELECT
		ProductPrice,
        NTILE(4) OVER (ORDER BY ProductPrice) AS Price_quartile
	FROM Products
),
quartiles AS (
	SELECT
		MAX(CASE WHEN Price_quartile = 1 THEN ProductPrice END) AS Q1,
		MAX(CASE WHEN Price_quartile = 3 THEN ProductPrice END) AS Q3
	FROM Product_Stats
),
iqr_bounds AS (
	SELECT
		Q1,
        Q3,
        Q3-Q1 AS IQR,
        Q1-(1.5*(Q3-Q1)) AS Lower_Bound,
		Q3+(1.5*(Q3-Q1)) AS Upper_Bound
	FROM quartiles
)
SELECT
	p.ProductKey,
    p.ProductName,
    p.ProductPrice
FROM Products p
JOIN iqr_bounds iqr
ON p.ProductPrice BETWEEN iqr.Lower_Bound AND iqr.Upper_Bound
ORDER BY ProductPrice;


-- Find the products which are either below the lower bound or above the upper bound [Outliers]

WITH Product_Stats AS (
	SELECT
		ProductPrice,
        NTILE(4) OVER (ORDER BY ProductPrice) AS Price_quartile
	FROM Products
),
quartiles AS (
	SELECT
		MAX(CASE WHEN Price_quartile = 1 THEN ProductPrice END) AS Q1,
		MAX(CASE WHEN Price_quartile = 3 THEN ProductPrice END) AS Q3
	FROM Product_Stats
),
iqr_bounds AS (
	SELECT
		Q1,
        Q3,
        Q3-Q1 AS IQR,
        Q1-(1.5*(Q3-Q1)) AS Lower_Bound,
		Q3+(1.5*(Q3-Q1)) AS Upper_Bound
	FROM quartiles
)
SELECT
	p.ProductKey,
    p.ProductName,
    p.ProductPrice
FROM Products p
JOIN iqr_bounds iqr
ON p.ProductPrice < iqr.Lower_Bound OR p.ProductPrice > iqr.Upper_Bound
ORDER BY ProductPrice; -- 16 row(s) returned

-- ==================== FIRST_VALUE () ==========================
-- 1. Find the customers who purchased each products based on the earliest date.

WITH first_Customer AS (
	SELECT 
		s.ProductKey,
		c.FullName,
		s.OrderDate,
		FIRST_VALUE(c.FullName) OVER(PARTITION BY s.ProductKey ORDER BY s.OrderDate) 
		AS FirstPurchase
	FROM Sales2015 s
	JOIN Customers c
	ON c.CustomerKey = s.CustomerKey
)
SELECT 
	DISTINCT ProductKey, FirstPurchase
FROM first_Customer;


-- ========================= LAST_VALUE() ===========================
-- Find the last region where each product was sold based on the latest order date?

SELECT
	s.ProductKey,
    t.Region,
    s.OrderDate,
    LAST_VALUE(t.Region) OVER(PARTITION BY s.ProductKey ORDER BY s.OrderDate
		RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS last_region_product_sold
FROM Sales2015 s
JOIN Territories t
ON s.TerritoryKey = t.SalesTerritoryKey;
    

-- ========================== NTH Value ==========================
-- From the Sales Record, Retrieve the 5th Customer from every product using Nth_value.

SELECT 
	s.ProductKey,
	c.FullName,
	s.OrderDate,
	NTH_VALUE(c.FullName , 5) OVER(PARTITION BY s.ProductKey ORDER BY s.OrderDate
    RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS FifthPurchase
FROM Sales2015 s
JOIN Customers c
ON c.CustomerKey = s.CustomerKey;

-- ========================= WINDOW FUNCTION - CHALLENGES =========================
/*
 🔶 Question 1: Avg Days Between Orders for Same Subcategory0
 🧩 Problem Statement :
 For each customer and product subcategory, calculate the average number of days
 between consecutive orders.
*/
WITH subcategory_orders AS (
	SELECT
		s.CustomerKey,
		p.ProductSubcategoryKey,
		s.OrderDate,
		LAG(s.OrderDate) OVER(PARTITION BY s.CustomerKey, p.ProductSubcategoryKey 
		ORDER BY s.OrderDate) AS PreviousDate
	FROM Products p
	JOIN Sales2017 s
	ON p.ProductKey = s.ProductKey -- 29481 row(s) returned
)
SELECT
	CustomerKey,
    ProductSubcategoryKey,
    ROUND(AVG(DATEDIFF(OrderDate , PreviousDate)),0) AS AvgOrderDays
FROM subcategory_orders
WHERE PreviousDate IS NOT NULL
GROUP BY 1,2
HAVING COUNT(*) > 1
ORDER BY 3 DESC; -- 832 row(s) returned

/*
	🔶 Question 2: Longest Out-of-Stock Duration
	🧩 Problem Statement :
	Find the product that remained out of stock for the longest time and 
	calculate how many days it was unavailable.
*/
WITH Stock_Changes AS (
	SELECT
		ProductKey,
        StockDate,
        LEAD(StockDate) OVER(PARTITION BY ProductKey ORDER BY StockDate) AS NextStockDate
	FROM Sales2017
)
SELECT 
	ProductKey, 
    MAX(DATEDIFF(NextStockDate,StockDate)) AS days_out_of_stock
FROM Stock_Changes
GROUP BY 1
ORDER BY 2 DESC;

-- Continue Challenges
/*
🔶 Question 3: Yearly Sales Trend with % Change
🧩 Problem Statement :
Show total sales per year and calculate the percentage growth or decline
from the previous year.
*/

USE Weekend_Analysis;

WITH Yearly_Sales AS(
	SELECT
		YEAR(s.OrderDate) AS year_part,
        ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
	FROM (
		SELECT * FROM Sales2015
        UNION ALL
        SELECT * FROM Sales2016
        UNION ALL
        SELECT * FROM Sales2017
    ) AS s
    JOIN Products p
    ON p.ProductKey = s.ProductKey
	GROUP BY 1
),
SalesTrends AS (
	SELECT 
		year_part,
        TotalRevenue,
        LAG(TotalRevenue) OVER (ORDER BY year_part) AS PrevRevenue 
	FROM Yearly_Sales
)
SELECT 
	year_part,
    TotalRevenue,
    ROUND((TotalRevenue - PrevRevenue)/PrevRevenue * 100 ,2) AS RevenueChangePercentage
From SalesTrends
WHERE PrevRevenue IS NOT NULL;
	

/*
🔶 Question 4: Row-wise Value Insights
🧩 Problem Statement :
For each sale, show the first, last, and third sale amount within its 
product's transaction history.
*/

SELECT 
	SaleID,
    SalesPerson,
    SaleAmount,
    SaleDate,
    FIRST_VALUE(SaleAmount) OVER(PARTITION BY SalesPerson ORDER BY SaleDate) AS first_sale_amount,
    
	LAST_VALUE(SaleAmount) OVER(PARTITION BY SalesPerson ORDER BY SaleDate
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sale_amount,
	
    NTH_VALUE(SaleAmount,3) OVER(PARTITION BY SalesPerson ORDER BY SaleDate
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS third_sale_amount
FROM Sale;

WITH AllSales AS (
	SELECT * FROM Sales2015
	UNION ALL
	SELECT * FROM Sales2016
	UNION ALL
	SELECT * FROM Sales2017
)
SELECT 
	s.OrderDate,
	s.CustomerKey,
    p.ProductPrice,
    FIRST_VALUE(p.ProductPrice) OVER(PARTITION BY s.CustomerKey ORDER BY s.OrderDate) AS first_sale_amount,
    
	LAST_VALUE(p.ProductPrice) OVER(PARTITION BY s.CustomerKey ORDER BY s.OrderDate
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sale_amount,
	
    NTH_VALUE(p.ProductPrice,3) OVER(PARTITION BY s.CustomerKey ORDER BY s.OrderDate
		ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS third_sale_amount
FROM AllSales s
JOIN Products p 
ON s.ProductKey = p.ProductKey; 

-- ========================= VIEWs =============================
/*
CREATE OR REPLACE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
*/

SELECT * FROM Customers; -- 2062 row(s) returned
CREATE OR REPLACE VIEW Children AS
SELECT 
	CustomerKey,
    FirstName,
    LastName,
    MaritalStatus,
    EmailAddress,
	Gender,
    AnnualIncome,
    TotalChildren
FROM Customers
WHERE TotalChildren > 3; -- 418 row(s) returned

SELECT * FROM Children;

CREATE OR REPLACE VIEW AllSales AS 
SELECT * FROM Sales2015
UNION ALL
SELECT * FROM Sales2016
UNION ALL
SELECT * FROM Sales2017;

SELECT * FROM AllSales; -- 56046 row(s) returned

CREATE OR REPLACE VIEW Trend_Analysis AS
WITH Understanding_Revenue AS (
	SELECT
		DATE_FORMAT(s.OrderDate , '%Y-%m') AS YearMonth,
		ROUND(SUM(p.ProductPrice * s.OrderQuantity),0) AS TotalRevenue
    FROM AllSales s 
	JOIN Products p
	ON p.ProductKey = s.ProductKey
	GROUP BY 1
	ORDER BY 1
)
SELECT 
	*,
    LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS PreviousMonthRevenue,
    LEAD(TotalRevenue) OVER(ORDER BY YearMonth) AS NextMonthRevenue,
    TotalRevenue - LAG(TotalRevenue) OVER(ORDER BY YearMonth) AS SaleAmountChange,
    CASE
		WHEN TotalRevenue > LAG(TotalRevenue) OVER(ORDER BY YearMonth) THEN 'Increase'
		WHEN TotalRevenue < LAG(TotalRevenue) OVER(ORDER BY YearMonth) THEN 'Decrease'
        ELSE 'No Change'
    END AS SalesTrend
FROM Understanding_Revenue;

SELECT * FROM Trend_Analysis;


-- ================================== INDEX =============================
DESC Customers;
SHOW INDEXES FROM Customers;

SELECT * FROM Customers; --  13057 & destiny57@learnsector.com

SELECT * FROM Customers WHERE EmailAddress = 'destiny57@learnsector.com'; -- 0.016 sec / 0.000 sec

SELECT * FROM Customers WHERE CustomerKey = 13057; -- 0.000 sec / 0.000 sec

CREATE UNIQUE INDEX idx_email
ON Customers(EmailAddress);

SHOW INDEXES FROM Customers;

SELECT * FROM Customers WHERE EmailAddress = 'destiny57@learnsector.com'; -- 0.000 sec / 0.000 sec

CREATE TABLE student_info (  
  studentid INT NOT NULL AUTO_INCREMENT,  
  name VARCHAR(45),  
  age VARCHAR(3),  
  mobile VARCHAR(20),  
  email VARCHAR(25),  
  PRIMARY KEY (studentid), -- Clustered Index
  UNIQUE KEY email_UNIQUE (email) -- Non-Clustured Index
);

DESC student_info;

SHOW INDEXES FROM Student_info;

CREATE TABLE Employee_Detail (    
    ID INT AUTO_INCREMENT PRIMARY KEY,     
    Name VARCHAR(45),     
    Email VARCHAR(45),    
    Phone VARCHAR(15),     
    City VARCHAR(25),  
    UNIQUE KEY unique_email (Email)  
);

DESC Employee_Detail;

SHOW INDEXES FROM Employee_Detail;

CREATE UNIQUE INDEX idx_email_phone 
ON Employee_Detail(Email,Phone); -- Composite Non-Clustured Index


INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES
('Amit Sharma', 'amit.sharma@example.com', '9876543210', 'Delhi'),
('Priya Mehta', 'priya.mehta@example.com', '9812345678', 'Mumbai'),
('Ravi Kumar', 'ravi.kumar@example.com', '9823456789', 'Bangalore'),
('Sneha Patel', 'sneha.patel@example.com', '9898989898', 'Ahmedabad'),
('Rahul Verma', 'rahul.verma@example.com', '9900112233', 'Chennai'),
('Neha Singh', 'neha.singh@example.com', '9876123456', 'Kolkata'),
('Vikas Gupta', 'vikas.gupta@example.com', '9988776655', 'Pune'),
('Anjali Nair', 'anjali.nair@example.com', '9765432189', 'Hyderabad'),
('Suresh Reddy', 'suresh.reddy@example.com', '9123456780', 'Hyderabad'),
('Meena Joshi', 'meena.joshi@example.com', '9345678901', 'Jaipur');


SELECT * FROM Employee_Detail;
INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES('Amit Sharma', 'amit123.sharma@example.com', '9876543210', 'Delhi');

INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES('Amit Sharma', 'amit.sharma@example.com', '9876543222', 'Delhi');
-- Error Code: 1062. Duplicate entry 'amit.sharma@example.com' for key 'employee_detail.unique_email'

-- DROP THE unique_email INDEX
DROP INDEX unique_email ON Employee_Detail;
SHOW INDEXES FROM Employee_Detail;

SELECT * FROM Employee_Detail;

INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES ('Suresh Reddy', 'suresh.reddy123@example.com', '9123456780', 'Hyderabad');

INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES ('Suresh Reddy', 'suresh.reddy123@example.com', '9123456781', 'Hyderabad');
-- Error Code: 1062. Duplicate entry 'suresh.reddy123@example.com-9123456781' for key 'employee_detail.idx_email_phone'


INSERT INTO Employee_Detail (Name, Email, Phone, City)
VALUES ('Suresh Reddy', 'suresh.reddy007@example.com', '9123499999', 'Hyderabad');


-- =================== DATA PARTITION ===========================
-- Range Partition 
CREATE TABLE Sales (
  cust_id INT NOT NULL,
  name VARCHAR(40),
  store_id VARCHAR(20) NOT NULL,
  bill_no INT NOT NULL,
  bill_date DATE NOT NULL PRIMARY KEY,
  amount DECIMAL(8,2) NOT NULL
)
PARTITION BY RANGE (YEAR(bill_date)) (
  PARTITION p0 VALUES LESS THAN (2016),
  PARTITION p1 VALUES LESS THAN (2017),
  PARTITION p2 VALUES LESS THAN (2018),
  PARTITION p3 VALUES LESS THAN (2020)
);

INSERT INTO Sales VALUES
(1, 'Mike', 'S001', 101, '2015-01-02', 125.56),
(2, 'Robert', 'S003', 103, '2015-01-25', 476.50),
(3, 'Peter', 'S012', 122, '2016-02-15', 335.00),
(4, 'Joseph', 'S345', 121, '2016-03-26', 787.00),
(5, 'Harry', 'S234', 132, '2017-04-19', 678.00),
(6, 'Stephen', 'S743', 111, '2017-05-31', 864.00),
(7, 'Jacson', 'S234', 115, '2018-06-11', 762.00),
(8, 'Smith', 'S012', 125, '2019-07-24', 300.00),
(9, 'Adam', 'S456', 119, '2019-08-02', 492.20);

SELECT * FROM Sales;

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Sales';

INSERT INTO Sales VALUES
(10, 'Omkar', 'S007', 199, '2016-01-22', 125.56),
(11, 'Deepak', 'S013', 122, '2015-11-29', 476.50),
(12, 'Paramjeet', 'S099', 121, '2016-02-25', 335.00);

-- LIST PARTITIONING
CREATE TABLE sales1 (
  sale_id INT,
  product_id INT,
  sale_date DATE,
  category VARCHAR(20),
  amount DECIMAL(10,2)
)
PARTITION BY LIST COLUMNS (category) (
  PARTITION p_electronics VALUES IN ('Electronics'),
  PARTITION p_clothing VALUES IN ('Clothing'),
  PARTITION p_furniture VALUES IN ('Furniture'),
  PARTITION p_books VALUES IN ('Books')
);


INSERT INTO sales1 (sale_id, product_id, sale_date, category, amount) 
VALUES 
(1, 101, '2024-01-01', 'Electronics', 199.99),
(2, 102, '2024-01-02', 'Clothing', 49.99),
(3, 103, '2024-01-03', 'Furniture', 299.99),
(4, 104, '2024-01-04', 'Books', 19.99),
(5, 105, '2024-01-05', 'Electronics', 499.99),
(6, 106, '2024-01-06', 'Clothing', 89.99),
(7, 107, '2024-01-07', 'Furniture', 1299.99),
(8, 108, '2024-01-08', 'Books', 9.99),
(9, 109, '2024-01-09', 'Electronics', 299.99),
(10, 110, '2024-01-10', 'Clothing', 59.99),
(11, 111, '2024-01-11', 'Furniture', 799.99),
(12, 112, '2024-01-12', 'Books', 14.99),
(13, 113, '2024-01-13', 'Electronics', 399.99),
(14, 114, '2024-01-14', 'Clothing', 109.99),
(15, 115, '2024-01-15', 'Furniture', 499.99),
(16, 116, '2024-01-16', 'Books', 24.99),
(17, 117, '2024-01-17', 'Electronics', 599.99),
(18, 118, '2024-01-18', 'Clothing', 79.99),
(19, 119, '2024-01-19', 'Furniture', 699.99),
(20, 120, '2024-01-20', 'Books', 29.99);

SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Sales1';


INSERT INTO sales1 (sale_id, product_id, sale_date, category, amount) 
VALUES 
(21, 101, '2024-01-01', 'Electronics', 199.99),
(22, 102, '2024-01-02', 'Clothing', 49.99),
(23, 103, '2024-01-03', 'Furniture', 299.99),
(24, 104, '2024-01-04', 'Books', 19.99),
(25, 105, '2024-01-05', 'Electronics', 499.99);


-- HASH PARTITIONING 

CREATE TABLE Stores (
  cust_name VARCHAR(40),
  bill_no VARCHAR(20) NOT NULL,
  store_id INT PRIMARY KEY NOT NULL,
  bill_date DATE NOT NULL,
  amount DECIMAL(8,2) NOT NULL
)
PARTITION BY HASH(store_id)
PARTITIONS 4;

INSERT INTO Stores (cust_name, bill_no, store_id, bill_date, amount) VALUES 
('Alice', 'B001', 1, '2024-01-01', 150.75),
('Bob', 'B002', 2, '2024-01-02', 200.00),
('Charlie', 'B003', 3, '2024-01-03', 99.99),
('David', 'B004', 4, '2024-01-04', 175.50),
('Eva', 'B005', 5, '2024-01-05', 250.00),
('Frank', 'B006', 6, '2024-01-06', 300.75),
('Grace', 'B007', 7, '2024-01-07', 80.25),
('Hannah', 'B008', 8, '2024-01-08', 120.50),
('Ivan', 'B009', 9, '2024-01-09', 450.00),
('Jack', 'B010', 10, '2024-01-10', 60.00),
('Karen', 'B011', 11, '2024-01-11', 110.75),
('Leo', 'B012', 12, '2024-01-12', 220.00),
('Mia', 'B013', 13, '2024-01-13', 330.50),
('Nathan', 'B014', 14, '2024-01-14', 55.00),
('Olivia', 'B015', 15, '2024-01-15', 95.25),
('Paul', 'B016', 16, '2024-01-16', 500.00);


SELECT TABLE_NAME, PARTITION_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.PARTITIONS
WHERE TABLE_NAME = 'Stores';

INSERT INTO Stores (cust_name, bill_no, store_id, bill_date, amount) VALUES 
('Rajat', 'B017', 17, '2024-01-17', 150.75),
('Shyam', 'B018', 18, '2024-01-18', 200.00);

INSERT INTO Stores (cust_name, bill_no, store_id, bill_date, amount) VALUES 
('Omkar', 'B019', 19, '2024-01-19', 150.75);

INSERT INTO Stores (cust_name, bill_no, store_id, bill_date, amount) VALUES 
('Naveen', 'B020', 20, '2024-01-20', 999.99);

-- ================== STORE PROCEDURE =====================
/*
	DELIMITER $$

	CREATE PROCEDURE procedure_name (
	  [IN | OUT | INOUT] param_name DATATYPE,
	  ...
	)
	BEGIN
	  -- Declaration section (optional)
	  -- Executable SQL statements ;
	END $$

	DELIMITER ;

*/
USE Weekend_analysis;

DROP TABLE Student_info;

CREATE TABLE student_info (
  stud_id INT PRIMARY KEY,
  stud_code INT,
  stud_name VARCHAR(50),
  subject VARCHAR(50),
  marks INT,
  phone VARCHAR(15)
);

INSERT INTO student_info() VALUES
(1, 101, 'Mark', 'English', 68, '3454569357'),
(2, 102, 'Joseph', 'Physics', 70, '9876543659'),
(3, 103, 'John', 'Maths', 70, '9765326975'),
(4, 104, 'Barack', 'Maths', 92, '87069873256'),
(5, 105, 'Rinky', 'Maths', 85, '6753159757'),
(6, 106, 'Adam', 'Science', 82, '79642256864'),
(7, 107, 'Andrew', 'Science', 83, '5674243579'),
(8, 108, 'Brayan', 'Science', 83, '7524316576'),
(9, 109, 'Alexandar', 'Biology', 67, '2347346438');


SELECT * FROM student_info;

DESC student_info;

-- SELECT * FROM student_info having marks > 70;

DELIMITER $$
CREATE PROCEDURE get_merit_student() 
BEGIN
	SELECT * FROM student_info WHERE marks > 70;
    SELECT COUNT(*) AS total_student FROM student_info;
END $$

DELIMITER ;

CALL get_merit_student();

SHOW PROCEDURE STATUS;

SHOW PROCEDURE STATUS WHERE Db = 'weekend_analysis';

-- DROP PROCEDURE get_merit_student;

DELIMITER $$
CREATE PROCEDURE get_merit_student() 
BEGIN
	SELECT * FROM student_info WHERE marks > 70;
    -- SELECT COUNT(*) AS total_student FROM student_info;
END $$

DELIMITER ;

CALL get_merit_student();

-- What if new students enrolled , does it show the marks of newly inserted records. 

INSERT INTO student_info() VALUES
(10, 110, 'Shyam', 'English', 91, '3454569357'),
(11, 111, 'Paramjeet', 'Physics', 77, '9876543659'),
(12, 112, 'Deepak', 'Maths', 59, '9765326975'),
(13, 113, 'Vaibhav', 'Maths', 97, '87069873256'),
(14, 114, 'Harisha', 'Maths', 85, '6753159757');


CALL get_merit_student();

-- Limit the number of records by taking an input var -> LIMIT Value;

DELIMITER $$
CREATE PROCEDURE get_student(IN var1 INT)
BEGIN
	SELECT * FROM student_info LIMIT var1;
END $$
DELIMITER ;

CALL get_student(); 
-- Error Code: 1318. Incorrect number of arguments for PROCEDURE weekend_analysis.get_student; expected 1, got 0

CALL get_student(5); 

CALL get_student(7); 

-- Let's take the input variables subject_name to apply filter.

DELIMITER $$

CREATE PROCEDURE get_student_by_subject(IN sub_name VARCHAR(25))
BEGIN
	SELECT stud_name , marks , subject
    FROM student_info
    WHERE subject = sub_name;
END $$



CALL get_student_by_subject('Maths')$$  -- // &&

DELIMITER ;

CALL get_student_by_subject('Physics');

-- ============================= OUT ==========================

-- Display the highest marks from students_info;

DELIMITER &&
CREATE PROCEDURE display_highest_marks(OUT highest_marks INT)
BEGIN
	SELECT MAX(marks) INTO highest_marks FROM student_info;
END &&

DELIMITER ;

CALL display_highest_marks(@marks);
SELECT @marks;

SELECT * FROM Student_info;

-- IN & OUT PARAMETER 

-- Calculate the Average Marks in a subject [subject IN , avg_marks OUT]

DELIMITER $$
CREATE PROCEDURE get_avg_marks(IN sub_name VARCHAR(25) , OUT avg_marks DECIMAL(5,2))
BEGIN
	SELECT 
		AVG(marks) INTO avg_marks 
	FROM student_info
    WHERE subject = sub_name;
END $$

DELIMITER ;

CALL get_avg_marks('Maths' , @avg_marks);
SELECT @avg_marks;

SELECT * FROM student_info;

SELECT
	Subject,
    AVG(Marks) AS avg_marks
FROM student_info
GROUP BY 1;

CALL get_avg_marks('Science' , @avg_marks);
SELECT @avg_marks;

-- =========================== INOUT ==================================
DELIMITER $$
CREATE PROCEDURE display_marks(INOUT var1 INT)
BEGIN
	SELECT marks into var1
    FROM student_info WHERE stud_id = var1;
END $$
DELIMITER ;

SET @score = 3;
CALL display_marks(@score);
SELECT @score;

SELECT * FROM student_info;

-- ========================= INOUT PARAMETER - Products ====================
-- Find the maximum ProductPrice of the provided ProductSubcateogoryKey as input

SELECT * FROM Products;

DELIMITER $$
CREATE PROCEDURE get_product_price_by_subcategory(INOUT var INT)
BEGIN
	SELECT MAX(ProductPrice) into var
    FROM Products WHERE ProductSubcategoryKey = var;
END $$
DELIMITER ;

SET @price = 2;
CALL get_product_price_by_subcategory(@price);
SELECT @price;

DROP PROCEDURE get_product_price_by_subcategory;


SELECT 
	ProductSubcategoryKey,
    MAX(ProductPrice) As MaxPrice
FROM Products
Group BY 1;




-- ================================= TRIGGERS ====================================
/*
	CREATE TRIGGER trigger_name
	{BEFORE | AFTER} {INSERT | UPDATE | DELETE}
	ON table_name
	FOR EACH ROW
	BEGIN
		-- SQL statements
	END;
*/

CREATE DATABASE trigger_analysis;

USE trigger_analysis;

CREATE TABLE student_info (
  stud_id    INT PRIMARY KEY,
  stud_code  INT UNIQUE,
  stud_name  VARCHAR(50),
  subject    VARCHAR(30),
  marks      INT CHECK (marks BETWEEN 0 AND 100),
  phone      VARCHAR(15)
);

INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) VALUES
( 1,101,'Mark','English',68,'3454569357'),
( 2,102,'Joseph','Physics',70,'9876543659'),
( 3,103,'John','Maths',70,'9765326975'),
( 4,104,'Barack','Maths',92,'87069873256'),
( 5,105,'Rinky','Maths',85,'6753159757'),
( 6,106,'Adam','Science',82,'79642256864'),
( 7,107,'Andrew','Science',83,'5674243579'),
( 8,108,'Brayan','Science',83,'7524316576'),
( 9,109,'Alexandar','Biology',67,'2347346438'),
(10,110,'Clara','Biology',74,'2342342345'),
(11,111,'Derek','English',59,'4564564560'),
(12,112,'Ella','English',91,'1231231234'),
(13,113,'Fiona','Physics',65,'9879879876'),
(14,114,'George','Physics',79,'3453453451'),
(15,115,'Helen','Maths',88,'2223334445'),
(16,116,'Ian','Science',95,'6667778880'),
(17,117,'Jane','Biology',57,'9998887776'),
(18,118,'Kyle','English',73,'1112223339'),
(19,119,'Liam','Maths',81,'8887776665'),
(20,120,'Mia','Physics',93,'4445556667');


SELECT * FROM Student_info;
DESC Student_info;

-- BEFORE INSERT TRIGGER [Rejecting the marks >100 or < 0]

DELIMITER $$
CREATE TRIGGER trg_before_insert_student
	BEFORE INSERT ON Student_info
	FOR EACH ROW
	BEGIN
		IF NEW.marks > 100 OR New.marks < 0 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Marks must be between 0 And 100';
		END IF;
	END $$
DELIMITER ;

SHOW TRIGGERS;

INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) 
VALUES (21, 121, 'Soumya', 'Maths', 111, '9910854433');

-- Error Code: 1644. Marks must be between 0 And 100

INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) 
VALUES (21, 121, 'Soumya', 'Maths', -11, '9910854433');

-- Error Code: 1644. Marks must be between 0 And 100

-- AFTER INSERT [Audit Log]
CREATE TABLE audit_log(
	log_id INT NOT NULL AUTO_INCREMENT,
    action ENUM('INSERT','UPDATE','DELETE'),
    stud_id INT,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(log_id)
);


DELIMITER $$
CREATE TRIGGER trg_after_insert_student
	AFTER INSERT ON Student_info
	FOR EACH ROW
	BEGIN
		INSERT INTO audit_log(action , stud_id)
        VALUES('INSERT' , NEW.stud_id);
	END $$
DELIMITER ;

SHOW TRIGGERS;

SELECT * FROM Audit_log;

-- INSERTING a New Record on Student_info
INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) 
VALUES (21, 121, 'Soumya', 'Maths', 99 , '9910854433');

SELECT * FROM Student_info;


INSERT INTO student_info (stud_id, stud_code, stud_name, subject, marks, phone) 
VALUES (22, 122, 'Rohit', 'Science', 88, '9890765432'),
(23, 123, 'Priya', 'English', 92, '9812345678'),
(24, 124, 'Amit', 'Maths', 85, '9876543210'),
(25, 125, 'Neha', 'History', 76, '9123456789'),
(26, 126, 'Arjun', 'Geography', 81, '9988776655'),
(27, 127, 'Meena', 'Maths', 95, '9001122334');

-- ========================== AFTER UPDATE ======================
USE trigger_analysis;

DELIMITER $$
CREATE TRIGGER trg_after_update_student
	AFTER UPDATE ON Student_info
	FOR EACH ROW
	BEGIN
		INSERT INTO audit_log(action , stud_id)
        VALUES('UPDATE' , NEW.stud_id);
	END $$
DELIMITER ;

SHOW TRIGGERS;

-- UPDATE the student_info will refelct the changes on Audit Log
SELECT * FROM Student_info;

UPDATE student_info
SET Marks = 95
WHERE stud_id = 4;

SELECT * FROM Audit_log;

-- +2 for Physics

SET SQL_SAFE_UPDATES = 0;
UPDATE student_info
SET Marks = Marks + 2
WHERE subject = 'Physics'; -- 4 records

SELECT * FROM Student_info WHERE Subject = 'Physics';

SELECT * FROM Audit_Log;

-- ========================== AFTER DELETE ======================

DELIMITER $$
CREATE TRIGGER trg_after_delete_student
	AFTER DELETE ON Student_info
	FOR EACH ROW
	BEGIN
		INSERT INTO audit_log(action , stud_id)
        VALUES('DELETE' , OLD.stud_id);
	END $$
DELIMITER ;

SHOW TRIGGERS;

-- DELETE the Record from Student_info and see the result on Audit Log.
DELETE FROM Student_info WHERE stud_id = 27;

-- ========================== BEFORE UPDATE ======================

DELIMITER $$
CREATE TRIGGER trg_before_update_no_marks_drop
	BEFORE UPDATE ON Student_info
	FOR EACH ROW
	BEGIN
		IF NEW.marks < Old.Marks THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Reducing Marks are not allowed.';
		END IF;
	END $$
DELIMITER ;

SHOW TRIGGERS;

UPDATE Student_Info
SET Marks = Marks - 2
WHERE Subject = 'Physics'; -- Error Code: 1644. Reducing Marks are not allowed.


-- ========================== BEFORE DELETE ======================

DELIMITER $$
CREATE TRIGGER trg_before_delete_high_performance
	BEFORE DELETE ON Student_info
	FOR EACH ROW
	BEGIN
		IF OLD.marks >= 90 THEN
			SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Can not Delete High Performing Students Data who are Scoring >=90';
		END IF;
	END $$
DELIMITER ;

SHOW TRIGGERS;

SELECT * FROM Student_Info;
DELETE FROM Student_Info WHERE Stud_id = 1;
SELECT * FROM Audit_Log;

DELETE FROM Student_Info WHERE Stud_id = 4;
-- Error Code: 1644. Can not Delete High Performing Students Data who are Scoring >=90

SELECT * FROM Student_info WHERE Subject = 'Physics';

DELETE FROM Student_Info WHERE Subject = 'Physics';
-- Error Code: 1644. Can not Delete High Performing Students Data who are Scoring >=90


-- ========================== AFTER UPDATE ======================
CREATE TABLE marks_history(
	history_id INT AUTO_INCREMENT PRIMARY KEY,
    stud_id INT ,
    old_marks INT,
    new_marks INT,
    changed_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER trg_after_update_marks
	AFTER UPDATE ON Student_info
	FOR EACH ROW
	BEGIN
		IF Old.Marks <> NEW.marks THEN
			INSERT INTO marks_history(stud_id , old_marks , new_marks)
            VALUES(OLD.stud_id , OLD.marks , NEW.marks);
		END IF;
	END $$
DELIMITER ;

SHOW TRIGGERS;


UPDATE Student_Info
SET Marks = Marks + 1
WHERE Subject = 'Maths'; 

SELECT * FROM Student_Info;

SELECT  * FROM marks_history;

SELECT  * FROM audit_log;

-- =================== QUICK CHALLENGE ON STORE PROCEDURE ======================

DELIMITER $$
CREATE PROCEDURE increase_marks_by_id(IN in_stud_id INT , INOUT new_marks INT)
BEGIN
	UPDATE Student_Info
    SET marks = marks + new_marks
    WHERE stud_id = in_stud_id;
    
    SELECT marks into new_marks
    FROM Student_Info
    WHERE stud_id = in_stud_id;
END $$
DELIMITER ;

SET @marks = 5;
CALL increase_marks_by_id(2 , @marks);
SELECT @marks;

-- ========================= TCL (Transaction Control Language) ======================= 
-- A[Atomicity] C[Consistency] I[Isolation] D[Durability]

START TRANSACTION;

USE Weekend_Analysis;

DESC Products;

SELECT * FROM Products; 

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(607, 'Tesla ModelX' , 9999.99);

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(608, 'Tesla ModelY' , 9999.99);

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(609, 'Tesla ModelZ' , 9999.99);

ROLLBACK;
COMMIT;

DELETE FROM Products WHERE ProductName = 'Tesla ModelZ';
-- It will reflect the result - because we are not under the 'Start Transaction' also by default 
-- Auto_Commit is 'ON', so nothing will happen on clicking 'Rollback' as it instantly commit the result.

-- AUTO_COMMIT 'OFF'
SET AUTOCOMMIT = 0; -- 'OFF'
-- SET AUTOCOMMIT = 1 -- 'ON' [By Default]

DELETE FROM Products WHERE ProductName = 'Tesla ModelY';
ROLLBACK;
COMMIT; 

SET AUTOCOMMIT = 1;
DELETE FROM Products WHERE ProductName = 'Tesla ModelX';

-- SAVEPOINT 
SELECT * FROM Products;
START TRANSACTION;

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(607, 'Tesla ModelX' , 9999.99);

SAVEPOINT modelX;

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(608, 'Tesla ModelY' , 9999.99);

SAVEPOINT modelY;

INSERT INTO Products(ProductKey , ProductName, ProductPrice)
VALUES(609, 'Tesla ModelZ' , 9999.99);

COMMIT;
ROLLBACK TO SAVEPOINT ModelX; -- It remove the ModelY and ModelZ
ROLLBACK TO SAVEPOINT ModelY; -- It remove the ModelZ
ROLLBACK; -- Full Undo



