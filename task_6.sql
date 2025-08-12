-- Category-wise Monthly Revenue & Order Volume
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(TransactionDate, '%d-%m-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(TransactionDate, '%d-%m-%Y')) AS month,
    ProductID, -- or replace with Category column if you have one
    SUM(CAST(REPLACE(REPLACE(TotalValue, '? ', ''), ',', '') AS DECIMAL(10,2))) AS monthly_revenue,
    COUNT(DISTINCT ï»¿TransactionID) AS order_volume
FROM tasks.ecommercetransactions
GROUP BY year, month, ProductID
ORDER BY year, month, monthly_revenue DESC;
SELECT 
    EXTRACT(YEAR FROM STR_TO_DATE(TransactionDate, '%d-%m-%Y')) AS year,
    EXTRACT(MONTH FROM STR_TO_DATE(TransactionDate, '%d-%m-%Y')) AS month,
    Category,
    SUM(CAST(REPLACE(REPLACE(TotalValue, '? ', ''), ',', '') AS DECIMAL(10,2))) AS monthly_revenue,
    COUNT(DISTINCT ï»¿TransactionID) AS order_volume
FROM tasks.ecommercetransactions
GROUP BY year, month, Category
ORDER BY year, month, monthly_revenue DESC;

