CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    course TEXT NOT NULL,
    age INTEGER NOT NULL,
    gender TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    score INTEGER NOT NULL,
    created_at DATE DEFAULT CURRENT_TIMESTAMP -- CURRENT_TIMESTAMP is a built in db function that automatically gives the current time
)

DROP TABLE students;

INSERT INTO students (name, course, age, gender, email, score) VALUES
("Peter Emu", "SD", 21, "Male", "peter@gmail.com", 95),
("Esther Wandera", "SD", 22, "Female", "esther@gmail.com", 96),
("Julius Mutinda", "PD", 24, "Male", "julius@gmail", 50),
("Moses Maina", "CS", 30, "Male", "moses@gmail.com", 32);

SELECT * FROM students;

-- Use where clause to narrow down the results
SELECT * FROM students WHERE gender = "Female";

-- get students above 60 which is the passmark
SELECT * FROM students WHERE score > 60;

-- order results
SELECT * FROM students ORDER BY score asc;

-- get top the top 3 students
SELECT * FROM students ORDER BY score DESC LIMIT 1;

-- getting values within a range
SELECT * FROM students WHERE score BETWEEN 40 AND 70;

-- patter matching (search) -> LIKE, ILIKE
SELECT * FROM users WHERE email_address LIKE '%es%'

-- Aggregations
SELECT avg(score) AS avg_score, sum(score) AS total_marks, max(score) as highest_score, min(score) as lowest_score FROM students;

SELECT count(id) AS female_count FROM students WHERE gender = 'Female';



