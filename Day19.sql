SHOW DATABASES;

DROP DATABASE IF EXISTS temple;

USE ecommerce;

-- GROUP BY
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;


-- GROUP BY with HAVING
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status
HAVING COUNT(*) > 2;


-- Use Vaishnavi database
USE Vaishnavi;

SHOW TABLES;

-- Delete all records from students table
TRUNCATE TABLE students;
