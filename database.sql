-- Java DB (Apache Derby)
-- Database name: student_profiles
-- Schema: APP

-- Optional: remove table if it already exists
DROP TABLE profiles;

CREATE TABLE profiles (
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    studentId VARCHAR(20),
    name VARCHAR(100),
    program VARCHAR(100),
    email VARCHAR(100),
    hobbies VARCHAR(200),
    intro VARCHAR(500)
);

-- Optional sample data
INSERT INTO profiles (studentId, name, program, email, hobbies, intro)
VALUES
('2024793277', 'MOHD IFFIAN', 'CDCS24', '2024793277@student.uitm.edu.my', 'Travel', 'Computer science student'),
('202477988', 'AHMAD', 'CSS250', '202477988@student.uitm.edu.my', 'Reading', 'Enjoys programming');
