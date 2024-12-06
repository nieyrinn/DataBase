CREATE TABLE Books (
                       book_id SERIAL PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       author VARCHAR(255) NOT NULL,
                       price DECIMAL(10, 2) NOT NULL,
                       quantity INT NOT NULL
);

INSERT INTO Books (book_id, title, author, price, quantity)
VALUES
    (1, 'Database 101', 'A. Smith', 40.00, 10),
    (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
    (3, 'Advanced DB', 'C. Lee', 50.00, 5);

CREATE TABLE Customers (
                           customer_id INT PRIMARY KEY,
                           name VARCHAR(255) NOT NULL,
                           email VARCHAR(255) NOT NULL
);

INSERT INTO Customers (customer_id, name, email)
VALUES
    (101, 'John Doe', 'johndoe@example.com'),
    (102, 'Jane Doe', 'janedoe@example.com');

CREATE TABLE Orders (
                        order_id SERIAL PRIMARY KEY,
                        book_id INT NOT NULL,
                        customer_id INT NOT NULL,
                        order_date DATE NOT NULL,
                        quantity INT NOT NULL,
                        FOREIGN KEY (book_id) REFERENCES Books(book_id),
                        FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

BEGIN;
INSERT INTO Orders (book_id, customer_id, order_date, quantity)
VALUES (1, 101, CURRENT_DATE, 2);
UPDATE Books
SET quantity = quantity - 2
WHERE book_id = 1;
COMMIT;



BEGIN;
SELECT quantity FROM Books WHERE book_id = 3;
ROLLBACK;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
UPDATE Books
SET price = 45.00
WHERE book_id = 1;
COMMIT;


SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN;
SELECT price FROM Books WHERE book_id = 1;
COMMIT;


BEGIN;
UPDATE Customers
SET email = 'newemail@example.com'
WHERE customer_id = 101;
COMMIT;


SELECT * FROM Customers WHERE customer_id = 101;
