SHOW DATABASES;
USE ecommerce;

-- INNER JOIN
SELECT
    s.sales_id,
    p.product_name,
    p.price,
    s.quantity,
    o.order_id,
    o.order_status
FROM Sales s
INNER JOIN Product p
    ON s.product_id = p.product_id
INNER JOIN Orders o
    ON s.order_id = o.order_id;


-- LEFT JOIN
SELECT
    p.product_id,
    p.product_name,
    p.price,
    s.sales_id,
    s.quantity
FROM Product p
LEFT JOIN Sales s
    ON p.product_id = s.product_id;


-- RIGHT JOIN
SELECT
    s.sales_id,
    s.quantity,
    p.product_id,
    p.product_name,
    p.price
FROM Sales s
RIGHT JOIN Product p
    ON s.product_id = p.product_id;


-- FULL OUTER JOIN
-- MySQL does not directly support FULL OUTER JOIN,
-- so LEFT JOIN + RIGHT JOIN are combined using UNION.

SELECT
    p.product_id,
    p.product_name,
    s.sales_id,
    s.quantity
FROM Product p
LEFT JOIN Sales s
    ON p.product_id = s.product_id

UNION

SELECT
    p.product_id,
    p.product_name,
    s.sales_id,
    s.quantity
FROM Product p
RIGHT JOIN Sales s
    ON p.product_id = s.product_id;


-- SELF JOIN
-- Finding products having the same stock

SELECT
    p1.product_name AS Product1,
    p2.product_name AS Product2,
    p1.stock
FROM Product p1
INNER JOIN Product p2
    ON p1.stock = p2.stock
    AND p1.product_id < p2.product_id;
