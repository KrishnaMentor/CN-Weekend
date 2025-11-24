CREATE DATABASE Ecom_analytics;

USE Ecom_analytics;

DESC Customers_india_adjusted;
DESC Order_Details_india_adjusted;
DESC Orders_india_adjusted;
DESC Products_india_adjusted;

ALTER TABLE Customers_india_adjusted
RENAME TO Customers;

ALTER TABLE Order_Details_india_adjusted
RENAME TO Order_Details;

ALTER TABLE Orders_india_adjusted
RENAME TO Orders;

ALTER TABLE Products_india_adjusted
RENAME TO Products;

SELECT * FROM Customers;
SELECT * FROM Order_Details;
SELECT * FROM Orders;
SELECT * FROM Products;

-- Challenge 2 : Market Segmentation Analysis

SELECT * FROM Customers;

SELECT
	Location,
    COUNT(Customer_id) AS number_of_customers
FROM Customers
GROUP BY Location
ORDER BY number_of_customers DESC
LIMIT 3;

-- Challenge 3 - Engagement Depth Analysis

SELECT * FROM Orders;

SELECT
	Customer_id,
	COUNT(Order_id) AS NumberOfOrders
FROM Orders 
GROUP BY Customer_id;

SELECT
	NumberOfOrders,
    COUNT(*) AS CustomerCount
FROM(
	SELECT
		Customer_id,
        COUNT(Order_id) AS NumberOfOrders
	FROM Orders 
    GROUP BY Customer_id
) AS CustomerOrders
GROUP BY NumberOfOrders 
ORDER BY NumberOfOrders ASC;

-- Challenge 4 : Purchase High-Value Products

SELECT * FROM Order_Details;

SELECT
	Product_id,
    AVG(quantity) AS AvgQuantity,
    SUM(quantity * price_per_unit) AS TotalRevenue
FROM Order_Details
GROUP BY product_id
HAVING AvgQuantity = 2
ORDER BY TotalRevenue DESC;

-- Challenge 5 : Category-Wise Customer Reach
SELECT
	p.Category,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM Products p
JOIN Order_Details od 
ON od.Product_id = p.Product_id
JOIN Orders o 
ON o.order_id = od.order_id
GROUP BY p.Category
ORDER BY unique_customers DESC;

-- Challenge 6 - Sales Trend Analysis
SELECT * FROM Orders;

WITH MonthlySales AS (
	SELECT
		DATE_FORMAT(order_date , '%Y-%m') AS Month,
        SUM(total_amount) AS TotalSales
	FROM Orders
    GROUP BY Month
)
SELECT 
	Month,
    TotalSales,
    ROUND((TotalSales - LAG(TotalSales) OVER(Order BY Month))
     / (LAG(TotalSales) OVER(Order BY Month)) * 100 , 2) AS PercentChange
FROM MonthlySales;

-- Challenge 7 - Average Order Value Fluctuation...

SELECT * FROM Orders;

WITH MonthlyOrderValue AS (
	SELECT
		DATE_FORMAT(order_date , '%Y-%m') AS Month,
        ROUND(AVG(total_amount),2) AS AverageOrderValue
	FROM Orders
    GROUP BY Month
)
SELECT 
	Month,
    AverageOrderValue,
    ROUND((AverageOrderValue - LAG(AverageOrderValue) OVER(Order BY Month))
     / (LAG(AverageOrderValue) OVER(Order BY Month)) * 100 , 2) AS ChangeInValue
FROM MonthlyOrderValue
ORDER BY ChangeInValue DESC;

-- Challenge 8 : Inventory Refresh Rate 

SELECT * FROM Order_Details;

SELECT
	Product_id,
    COUNT(order_id) AS SalesFrequency
FROM Order_Details
GROUP BY Product_id
ORDER BY SalesFrequency DESC 
LIMIT 5;

SELECT COUNT(*) FROM Customers;

-- Challenge 9 : Low Engagement Products
SELECT * FROM Orders;

SELECT
	p.product_id,
    p.Name,
    COUNT(DISTINCT o.customer_id) AS UniqueCustomerCount
FROM Products p
JOIN Order_Details od
ON p.product_id = od.product_id
JOIN Orders o
ON o.order_id = od.order_id
GROUP BY 1,2
HAVING UniqueCustomerCount < (SELECT COUNT(*) FROM Customers) * 0.4;

-- Challenge 10 : Customer Acquisition Trends

SELECT * FROM Orders;

WITH MonthlyNewCustomers AS (
	SELECT 
		Customer_id,
		DATE_FORMAT(Min(Order_Date) , '%Y-%m') AS FirstPurchaseMonth,
		COUNT(DISTINCT Customer_id) AS NewCustomers
	FROM Orders
	GROUP BY Customer_id
)
SELECT
	FirstPurchaseMonth,
    SUM(NewCustomers) AS TotalNewCustomers
FROM MonthlyNewCustomers
GROUP BY 1
ORDER BY 1;

-- Challenge 11 : Peak Sales Period Identification

SELECT * FROM Orders;

SELECT
	DATE_FORMAT(order_date , '%Y-%m') AS Month,
    SUM(total_amount) AS TotalSales
FROM Orders
GROUP BY Month
ORDER BY TotalSales DESC
LIMIT 3;