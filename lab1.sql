CREATE DATABASE lab1;
CREATE TABLE users (
                       id SERIAL PRIMARY KEY,
                       firstname VARCHAR(50),
                       lastname VARCHAR(50)
);
ALTER TABLE users
    ADD COLUMN isadmin INTEGER;
ALTER TABLE users
    ALTER COLUMN isadmin TYPE BOOLEAN USING (isadmin::BOOLEAN);
ALTER TABLE users
    ALTER COLUMN isadmin SET DEFAULT false;
-- already done with SERIAL
CREATE TABLE tasks (
                       id SERIAL PRIMARY KEY,
                       name VARCHAR(50),
                       user_id INTEGER REFERENCES users(id)
);
DROP TABLE tasks;
DROP DATABASE lab1;
