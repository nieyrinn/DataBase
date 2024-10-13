CREATE DATABASE lab5;

CREATE TABLE customers (
                           customer_id INT PRIMARY KEY,
                           cust_name VARCHAR(100),
                           city VARCHAR(100),
                           grade INT,
                           salesman_id INT
);

CREATE TABLE orders (
                        ord_no INT PRIMARY KEY,
                        purch_amt DECIMAL(10, 2),
                        ord_date DATE,
                        customer_id INT,
                        salesman_id INT,
                        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
                                                                             (3002, 'Nick Rimando', 'New York', 100, 5001),
                                                                             (3005, 'Graham Zusi', 'California', 200, 5002),
                                                                             (3001, 'Brad Guzan', 'London', NULL, 5005),
                                                                             (3004, 'Fabian Johns', 'Paris', 300, 5006),
                                                                             (3007, 'Brad Davis', 'New York', 200, 5001),
                                                                             (3009, 'Geoff Camero', 'Berlin', 100, 5003),
                                                                             (3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
                                                                               (70001, 150.5, '2012-10-05', 3005, 5002),
                                                                               (70009, 270.65, '2012-09-10', 3001, 5005),
                                                                               (70002, 65.26, '2012-10-05', 3002, 5001),
                                                                               (70004, 110.5, '2012-08-17', 3009, 5003),
                                                                               (70007, 948.5, '2012-09-10', 3005, 5002),
                                                                               (70005, 2400.6, '2012-07-27', 3007, 5001),
                                                                               (70008, 5760.0, '2012-09-10', 3002, 5001);
SELECT SUM(orders.purch_amt) from orders;

SELECT AVG(orders.purch_amt) from orders;

SELECT COUNT(customers.cust_name) from customers where cust_name is not NULL;

SELECT MIN(orders.purch_amt) from orders;

SELECT * FROM customers where cust_name LIKE '%b';

SELECT * FROM orders where customer_id in (SELECT customer_id from customers where city = 'New York');

SELECT * FROM customers where customer_id in (SELECT customer_id FROM orders where purch_amt > 10);

SELECT SUM(customers.grade) from customers;

SELECT * FROM customers where cust_name IS NOT NULL;

SELECT MAX(customers.grade) from customers;

