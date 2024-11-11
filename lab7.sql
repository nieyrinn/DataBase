CREATE TABLE countries (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
                           id SERIAL PRIMARY KEY,
                           name VARCHAR(100) NOT NULL,
                           surname VARCHAR(100),
                           salary NUMERIC,
                           department_id INT
);

CREATE TABLE departments (
                             department_id SERIAL PRIMARY KEY,
                             budget NUMERIC
);

CREATE INDEX idx_countries_name ON countries (name);

SELECT * FROM countries WHERE name = 'string';

CREATE INDEX idx_employees_name_surname ON employees (name, surname);

SELECT * FROM employees WHERE name = 'string' AND surname = 'string';

CREATE UNIQUE INDEX idx_employees_salary_range ON employees (salary);

SELECT * FROM employees WHERE salary < 1000 AND salary > 5000;

CREATE INDEX idx_employees_name_substr ON employees ((substring(name from 1 for 4)));

SELECT * FROM employees WHERE substring(name from 1 for 4) = 'abcd';

CREATE INDEX idx_employees_departments_budget_salary
    ON employees (department_id, salary);
CREATE INDEX idx_departments_budget ON departments (budget);

SELECT * FROM employees e
                  JOIN departments d ON d.department_id = e.department_id
WHERE d.budget > 1000 AND e.salary < 6000;

SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'employees' OR tablename = 'countries' OR tablename = 'departments';
