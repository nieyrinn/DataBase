CREATE DATABASE  lab4;

CREATE TABLE Warehouses (
                            WarehouseID INT PRIMARY KEY,
                            Location VARCHAR(100),
                            Capacity INT
);

CREATE TABLE Boxes (
                       BoxID INT PRIMARY KEY,
                       Code VARCHAR(10),
                       Contents VARCHAR(100),
                       Value DECIMAL(10, 2),
                       WarehouseID INT,
                       FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID)
);

INSERT INTO Warehouses (WarehouseID, Location, Capacity)
VALUES (1, 'Chicago', 3),
       (2, 'Los Angeles', 5),
       (3, 'San Francisco', 2);

INSERT INTO Boxes (BoxID, Code, Contents, Value, WarehouseID)
VALUES (1, 'A1B2', 'Toys', 100, 1),
       (2, 'C3D4', 'Books', 150, 2),
       (3, 'E5F6', 'Clothes', 250, 1),
       (4, 'G7H8', 'Electronics', 300, 3),
       (5, 'I9J0', 'Furniture', 180, 2);

INSERT INTO Warehouses (WarehouseID, Location, Capacity)
VALUES (4, 'New York', 3);

INSERT INTO Boxes (BoxID, Code, Contents, Value, WarehouseID)
VALUES (6, 'H5RT', 'Papers', 200, 2);

SELECT * FROM Warehouses;

SELECT * FROM Boxes WHERE Value > 150;

SELECT DISTINCT Contents FROM Boxes;

SELECT WarehouseID, COUNT(BoxID) AS BoxCount
FROM Boxes
GROUP BY WarehouseID;

SELECT WarehouseID, COUNT(BoxID) AS BoxCount
FROM Boxes
GROUP BY WarehouseID
HAVING COUNT(BoxID) > 2;

UPDATE Boxes
SET Value = Value * 0.85
WHERE BoxID = (
    SELECT BoxID FROM Boxes
    ORDER BY Value DESC
    LIMIT 1 OFFSET 2
);

DELETE FROM Boxes WHERE Value < 150;

DELETE FROM Boxes
WHERE WarehouseID = (
    SELECT WarehouseID FROM Warehouses WHERE Location = 'New York'
)
    RETURNING *;

