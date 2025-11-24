-- SQL -> Structured Query Language (used to manage relational databases)

/**
* Syntax (what is recommended) (mostly applied to tables and columns)
1. We mostly work in lowercase
2. Prefer using the snake_case naming convention
3. It is also good practice to end sql statements with semi-colons
*/
-- first_name js (string) -> python (str) -> db (text)

-- text, integer, date, blob,

-- Creating tables - CREATE TABLE table_name (columns) - must at least one columns
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT, -- it`s good to have unique identifier for each record
    name TEXT
);

-- table users (name, age, phone_number, gender, email_address)
CREATE TABLE users (
    name TEXT,
    age INTEGER,
    phone_number TEXT,
    gender TEXT,
    email_address TEXT
);

-- Modify tables using ALTER
ALTER TABLE users ADD COLUMN institution TEXT; -- add single column

ALTER TABLE users DROP COLUMN institution; -- drop single column

-- This will work in other dbs (like postgres, mysql) but sqlite is a bit limited
-- ALTER TABLE users
-- ADD COLUMN institution TEXT,
-- ADD COLUMN nationality TEXT,
-- ADD COLUMN occupation TEXT;

-- Also works in other dbs but not in sqlite
-- ALTER TABLE users
-- DROP COLUMN occupation,
-- DROP COLUMN nationality;

-- BEGIN TRANSACTION;
-- ALTER TABLE users DROP COLUMN occupation;
-- ALTER TABLE users DROP COLUMN nationality;
-- COMMIT;

-- Deleting an entire table
-- This is command to double check
DROP TABLE users;
DROP TABLE categories;

-- CRUD
-- 1. Create using the INSERT statement
INSERT INTO categories (name) VALUES ("Utilities");
INSERT INTO categories (name) VALUES ("Shopping");

-- Insert multiple values at a go
INSERT INTO categories (name) VALUES ("Shopping"), ("Rent"), ("Entertainment"),
("School"), ("Transport");

-- 2. Update records using UPDATE statement
UPDATE categories SET name = "Food"; -- an update operation without a where clause is executed on every row
-- it`s very rare to be updating every row but there might be use cases
UPDATE categories SET name = "Food" WHERE id = 9; -- this is the most common update operation

-- 3. Delete records
DELETE FROM categories; --very rare that we delete all row at a go which means most delete statements should
-- have a where clause too
DELETE FROM categories WHERE id = 13;

-- 4. SELECT - retrieve records from the db
SELECT * FROM categories;

-- How one can get sql injection and how to prevent them (prepared statements)
-- DATA INTEGRITY
-- QUERY MODIFIERS

-- Modeling Relationships
