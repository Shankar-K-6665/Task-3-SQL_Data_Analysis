CREATE DATABASE task3;
USE task3;
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(50),
  email VARCHAR(100),
  segment VARCHAR(30),
  region VARCHAR(30)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  order_date DATE,
  customer_id INT,
  total_amount DECIMAL(10,2),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Rahul', 'rahul@gmail.com', 'Regular', 'South'),
(2, 'Sneha', 'sneha@gmail.com', 'Premium', 'North'),
(3, 'Arjun', 'arjun@gmail.com', 'Regular', 'West');

INSERT INTO orders VALUES
(101, '2024-01-10', 1, 500),
(102, '2024-01-11', 1, 800),
(103, '2024-01-12', 2, 2000),
(104, '2024-01-13', 3, 300);

SELECT * FROM customers;

SELECT * FROM orders
WHERE total_amount > 500
ORDER BY total_amount DESC;

SELECT SUM(total_amount) AS total_revenue FROM orders;

SELECT c.region, COUNT(o.order_id) AS total_orders
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region;

SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) > 1000
);

CREATE VIEW revenue_view AS
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id;
SELECT * FROM revenue_view;
SELECT * FROM orders;

