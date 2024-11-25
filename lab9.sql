CREATE OR REPLACE FUNCTION increase_value(x INT)
RETURNS INT AS $$
BEGIN
RETURN x + 10;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION compare_numbers(a INT, b INT)
RETURNS TEXT AS $$
BEGIN
    IF a > b THEN
        RETURN 'Greater';
    ELSIF a = b THEN
        RETURN 'Equal';
ELSE
        RETURN 'Lesser';
END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION number_series(n INT)
RETURNS TEXT AS $$
DECLARE
i INT := 1;
    series_result TEXT := '';
BEGIN
    WHILE i <= n LOOP
        series_result := series_result || i || CASE WHEN i < n THEN ',' ELSE '' END;
        i := i + 1;
END LOOP;
RETURN series_result;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION find_employee(emp_name VARCHAR)
    RETURNS TABLE(id INT, name VARCHAR, salary NUMERIC) AS $$
BEGIN
    RETURN QUERY SELECT id, name, salary FROM employees WHERE name = emp_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION list_products(category_name VARCHAR)
    RETURNS TABLE(id INT, name VARCHAR, price NUMERIC, category VARCHAR) AS $$
BEGIN
    RETURN QUERY SELECT id, name, price, category FROM products WHERE category = category_name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION calculate_bonus(emp_id INT)
    RETURNS NUMERIC AS $$
DECLARE
    bonus_amount NUMERIC;
BEGIN
    SELECT salary * 0.1 INTO bonus_amount FROM employees WHERE id = emp_id;
    RETURN bonus_amount;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION update_salary(emp_id INT)
    RETURNS VOID AS $$
DECLARE
    bonus NUMERIC;
BEGIN
    bonus := calculate_bonus(emp_id);
    UPDATE employees SET salary = salary + bonus WHERE id = emp_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION complex_calculation(num_param INT, str_param VARCHAR)
    RETURNS TEXT AS $$
DECLARE
    numeric_result INT;
    string_result VARCHAR;
BEGIN
    -- Subblock 1: Numeric Computation
    numeric_result := num_param * 10;

    -- Subblock 2: String Manipulation
    string_result := str_param || '_processed';

    -- Combine results
    RETURN 'Number: ' || numeric_result || ', String: ' || string_result;
END;
$$ LANGUAGE plpgsql;
