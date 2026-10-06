CREATE DATABASE ecommerce;
SHOW DATABASES;
USE ecommerce;

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0)
);

DESC Product;

INSERT INTO Product (product_id, product_name, price, stock)
VALUES
(1, 'Gaming Laptop', 62000.00, 18),
(2, 'iPhone', 70000.00, 12),
(3, 'Wireless Earbuds', 1800.00, 45),
(4, 'Mechanical Keyboard', 3500.00, 25),
(5, 'Wireless Mouse', 950.00, 55),
(6, 'Fitness Band', 2800.00, 30),
(7, 'Android Tablet', 22000.00, 14),
(8, 'Portable Speaker', 4200.00, 28);


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    sales DECIMAL(10,2) NOT NULL DEFAULT 0 CHECK (sales >= 0),
    order_status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (order_status IN ('Pending', 'Completed', 'Cancelled'))
);

DESC Orders;

INSERT INTO Orders (order_id, sales, order_status)
VALUES
(201, 62000.00, 'Completed'),
(202, 70000.00, 'Completed'),
(203, 3600.00, 'Pending'),
(204, 7000.00, 'Completed'),
(205, 2800.00, 'Cancelled'),
(206, 22000.00, 'Completed'),
(207, 8400.00, 'Completed'),
(208, 5400.00, 'Pending');


CREATE TABLE Sales (
    sales_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1 CHECK (quantity > 0),

    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

DESC Sales;

INSERT INTO Sales (sales_id, product_id, order_id, quantity)
VALUES
(1, 1, 201, 1),
(2, 2, 202, 1),
(3, 3, 203, 2),
(4, 4, 204, 2),
(5, 6, 205, 1),
(6, 7, 206, 1),
(7, 8, 207, 2),
(8, 3, 208, 3);


CREATE TABLE Returns (
    return_id INT PRIMARY KEY,
    order_id INT NOT NULL UNIQUE,
    return_reason VARCHAR(200) DEFAULT 'Not specified',
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

DESC Returns;

INSERT INTO Returns (return_id, order_id, return_reason)
VALUES
(1, 205, 'Product not working'),
(2, 202, 'Customer requested replacement'),
(3, 207, 'Wrong item delivered');
