CREATE DATABASE lab4;

CREATE TABLE Warehouses (
                            code INT PRIMARY KEY,
                            location VARCHAR(255),
                            capacity INT
);
CREATE TABLE Boxes (
                       code VARCHAR(4) PRIMARY KEY,
                       contents VARCHAR(255),
                       value REAL,
                       warehouse INT,
                       FOREIGN KEY (warehouse) REFERENCES Warehouses(code)
);
INSERT INTO Warehouses (code, location, capacity)
VALUES
    (1, 'Chicago', 3),
    (2, 'Chicago', 4),
    (3, 'New York', 7),
    (4, 'Los Angeles', 2),
    (5, 'San Francisco', 8);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES
    ('0MN7', 'Rocks', 180, 3),
    ('4H8P', 'Rocks', 250, 1),
    ('4RT3', 'Scissors', 190, 4),
    ('7G3H', 'Rocks', 200, 1),
    ('8JN6', 'Papers', 75, 1),
    ('8Y6U', 'Papers', 50, 3),
    ('9J6F', 'Papers', 175, 2),
    ('LL08', 'Rocks', 140, 4),
    ('P0H6', 'Scissors', 125, 1),
    ('P2T6', 'Scissors', 150, 2),
    ('TU55', 'Papers', 90, 5);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE value > 150;

SELECT DISTINCT contents FROM Boxes;

SELECT warehouse, COUNT(code) AS BoxCount
FROM Boxes
GROUP BY warehouse;

SELECT warehouse, COUNT(code) AS BoxCount
FROM Boxes
GROUP BY warehouse
HAVING COUNT(code) > 2;

INSERT INTO Warehouses (code, location, capacity)
VALUES (6, 'New York', 3);

INSERT INTO Boxes (code, contents, value, warehouse)
VALUES ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET value = value * 0.85
WHERE code = (
    SELECT code FROM Boxes
    ORDER BY value DESC
    LIMIT 1 OFFSET 2
);

DELETE FROM Boxes WHERE value < 150;

DELETE FROM Boxes
WHERE warehouse = (
    SELECT code FROM Warehouses WHERE location = 'New York'
)
RETURNING *;