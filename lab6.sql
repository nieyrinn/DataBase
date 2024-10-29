CREATE DATABASE lab6;
CREATE TABLE Locations (
                           location_id SERIAL PRIMARY KEY,
                           street_address VARCHAR(25),
                           postal_code VARCHAR(12),
                           city VARCHAR(12),
                           state_province VARCHAR(12)
);

CREATE TABLE Departments (
                             department_id SERIAL PRIMARY KEY,
                             department_name VARCHAR(50) UNIQUE,
                             budget INTEGER,
                             location_id INTEGER REFERENCES Locations
);

CREATE TABLE Employees (
                           employee_id SERIAL PRIMARY KEY,
                           first_name VARCHAR(50),
                           last_name VARCHAR(50),
                           email VARCHAR(50),
                           phone_number VARCHAR(20),
                           salary INTEGER,
                           department_id INTEGER REFERENCES Departments
);
SELECT Employees.first_name, Employees.last_name, Employees.department_id, Departments.department_name
FROM Employees
         JOIN Departments ON Employees.department_id = Departments.department_id;

SELECT Employees.first_name, Employees.last_name, Employees.department_id, Departments.department_name
FROM Employees
         JOIN Departments ON Employees.department_id = Departments.department_id
WHERE Employees.department_id IN (80, 40);

SELECT Employees.first_name, Employees.last_name, Departments.department_name, Locations.city, Locations.state_province
FROM Employees
         JOIN Departments ON Employees.department_id = Departments.department_id
         JOIN Locations ON Departments.location_id = Locations.location_id;

SELECT Departments.department_name
FROM Departments
         LEFT JOIN Employees ON Departments.department_id = Employees.department_id
GROUP BY Departments.department_name;

SELECT Employees.first_name, Employees.last_name, Employees.department_id, Departments.department_name
FROM Employees
         LEFT JOIN Departments ON Employees.department_id = Departments.department_id;
