CREATE DATABASE lab8;

CREATE TABLE salesman (
                          salesman_id SERIAL PRIMARY KEY,
                          name VARCHAR(100),
                          city VARCHAR(100),
                          commission DECIMAL(10, 2)
);

CREATE TABLE customers (
                           customer_id SERIAL PRIMARY KEY,
                           name VARCHAR(100),
                           city VARCHAR(100),
                           grade INT
);

CREATE TABLE orders (
                        order_id SERIAL PRIMARY KEY,
                        salesman_id INT REFERENCES salesman(salesman_id),
                        customer_id INT REFERENCES customers(customer_id),
                        amount DECIMAL(10, 2)
);

CREATE ROLE junior_dev LOGIN;

CREATE VIEW ny_salesmen AS
SELECT *
FROM salesman
WHERE city = 'New York';

CREATE VIEW order_details AS
SELECT o.order_id, s.name AS salesman_name, c.name AS customer_name
FROM orders o
         JOIN salesman s ON o.salesman_id = s.salesman_id
         JOIN customers c ON o.customer_id = c.customer_id;

GRANT ALL PRIVILEGES ON order_details TO junior_dev;

CREATE VIEW top_customers AS
SELECT *
FROM customers
WHERE grade = (SELECT MAX(grade) FROM customers);

GRANT SELECT ON top_customers TO junior_dev;

CREATE VIEW salesman_count_per_city AS
SELECT city, COUNT(*) AS salesman_count
FROM salesman
GROUP BY city;

CREATE VIEW salesman_with_multiple_customers AS
SELECT s.name AS salesman_name, COUNT(o.customer_id) AS customer_count
FROM salesman s
         JOIN orders o ON s.salesman_id = o.salesman_id
GROUP BY s.name
HAVING COUNT(o.customer_id) > 1;

CREATE ROLE intern;
GRANT junior_dev TO intern;
