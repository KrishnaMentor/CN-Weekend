CREATE DATABASE retailAnalytics;
USE retailAnalytics;

-- Renaming the Tables 
ALTER TABLE customer_profiles
RENAME TO customers;

ALTER TABLE product_inventory
RENAME TO products;

ALTER TABLE sales_transaction
RENAME TO sales;

DESC customers;
DESC products;
DESC sales;

-- ï»¿CustomerID -> CustomerID
-- ï»¿ProductID  -> ProductID
-- ï»¿TransactionID -> TransactionID

ALTER TABLE Customers
CHANGE ï»¿CustomerID CustomerID INT;

-- OR
ALTER TABLE Customers
RENAME COLUMN ï»¿CustomerID TO CustomerID;

ALTER TABLE Products
RENAME COLUMN ï»¿ProductID TO ProductID;

ALTER TABLE sales
RENAME COLUMN ï»¿TransactionID TO TransactionID;

-- Reading out all the dataset ....
SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Sales;

-- Challenge 1:
SELECT
	TransactionID,
    COUNT(*)
FROM Sales
GROUP BY TransactionID
HAVING COUNT(*) > 1;

CREATE TABLE sales_unique AS 
SELECT DISTINCT * FROM sales; -- 5000 row(s) affected Records: 5000

DROP TABLE sales;
ALTER TABLE sales_unique RENAME TO sales;