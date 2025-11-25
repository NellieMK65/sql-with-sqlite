CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    age INTEGER NOT NULL,
    phone_number TEXT NOT NULL UNIQUE,
    gender TEXT NOT NULL,
    email_address TEXT UNIQUE
);

ALTER TABLE users ADD COLUMN is_deleted BOOLEAN DEFAULT false;

-- create a single record
INSERT INTO users (name, age, phone_number, gender, email_address)
VALUES ("Jane Doe", 24, "0712345678", "Female", "jane@gmail.com");

INSERT INTO users (email_address, age, name, phone_number, gender)
VALUES ("john@gmail.com", 19, "John Doe", "0712345679", "Male");

INSERT INTO users (name, age, phone_number, gender)
VALUES ("Bradley Murimi", 18, "0712345677", "Male");

INSERT INTO users (name, age, phone_number, gender)
VALUES ("Nelson Munyua", "0712345676", 25, "Male");
-- when we accidentally provide wrong values (especially datatype wise), type coercion is going to happen

UPDATE users SET email_address = "bradley@gmail.com" WHERE id = 3;

UPDATE users SET age = 25, phone_number = "0712345676", email_address = "nelson@gmail.com" WHERE id = 5;

DELETE FROM users WHERE id = 2; --permanent deletion
-- soft deleting (deleted = true, deleted_at = "date when user deleted the record")
UPDATE users SET is_deleted = true WHERE id = 5;

SELECT * FROM users;

-- get users who have not deleted their accounts
SELECT * FROM users WHERE is_deleted = false;
SELECT * FROM users WHERE is_deleted = true;

SELECT avg(age) FROM users;

SELECT * FROM users WHERE age > 22 AND is_deleted = false;
