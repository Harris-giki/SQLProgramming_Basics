-- Creating the STUDENTS table if it doesn't already exist
CREATE TABLE IF NOT EXISTS STUDENTS (
    Regno INT UNIQUE NOT NULL PRIMARY KEY,  -- Unique registration number for each student
    StudentName VARCHAR(50) NOT NULL,       -- Name of the student (max length: 50 characters)
    Age INT NOT NULL                        -- Age of the student (cannot be NULL)
);

-- Creating the COURSES table to store course details
CREATE TABLE IF NOT EXISTS COURSES (
    CourseCode VARCHAR(50) UNIQUE NOT NULL PRIMARY KEY, -- Unique course code (e.g., CS232)
    CourseTitle VARCHAR(50) UNIQUE NOT NULL,           -- Course title (e.g., Database Management Systems)
    CreditHours INT                                    -- Number of credit hours for the course
);

-- Creating the ENROLLEDCOURSES table to track which students are enrolled in which courses
CREATE TABLE ENROLLEDCOURSES (
    StudentID INT UNIQUE NOT NULL,  -- Student's registration number (references STUDENTS table)
    CourseID VARCHAR(50) UNIQUE NOT NULL, -- Course code (references COURSES table)
    PRIMARY KEY (StudentID, CourseID),  -- Composite primary key to ensure unique enrollments
    FOREIGN KEY (StudentID) REFERENCES STUDENTS(Regno),
    FOREIGN KEY (CourseID) REFERENCES COURSES (CourseCode)
);

-- Inserting a sample student into the STUDENTS table
INSERT INTO STUDENTS (Regno, StudentName, Age) 
VALUES (2023428, 'Muhammad Haris', 19);

-- Inserting sample courses into the COURSES table
INSERT INTO COURSES (CourseCode, CourseTitle, CreditHours) 
VALUES ('CE222', 'COAL', 3);

INSERT INTO COURSES (CourseCode, CourseTitle, CreditHours) 
VALUES ('CS232', 'DBMS', 3);

INSERT INTO COURSES (CourseCode, CourseTitle, CreditHours) 
VALUES ('CS224', 'TOC', 3);

INSERT INTO COURSES (CourseCode, CourseTitle, CreditHours) 
VALUES ('ES205', 'Advance Linear Algebra', 3);

INSERT INTO COURSES (CourseCode, CourseTitle, CreditHours) 
VALUES ('HM221', 'Islamiat and Pakistan Studies', 3);

-- Retrieving all records from each table for verification
SELECT * FROM STUDENTS;
SELECT * FROM COURSES;
SELECT * FROM ENROLLEDCOURSES;  -- Currently empty since we haven't added enrollments yet

-- TODO: Insert data for enrolled courses later
-- INSERT INTO ENROLLEDCOURSES (StudentID, CourseID) VALUES (...);

-- Dropping the ENROLLEDCOURSES table if needed (CASCADE removes dependent constraints)
DROP TABLE ENROLLEDCOURSES CASCADE;

-- ========= ADDITIONAL TABLE MODIFICATIONS =========

-- Adding a new column 'BrilliantStudents' to STUDENTS table (for tracking top students)
ALTER TABLE STUDENTS ADD COLUMN BrilliantStudents VARCHAR(50) UNIQUE;

-- Removing the newly added 'BrilliantStudents' column
ALTER TABLE STUDENTS DROP COLUMN BrilliantStudents;

-- Renaming 'BrilliantStudents' column to 'HonihaarStudents'
ALTER TABLE STUDENTS RENAME COLUMN BrilliantStudents TO HonihaarStudents;

-- Renaming the entire STUDENTS table to 'GIKISTUDENTS'
ALTER TABLE STUDENTS RENAME TO GIKISTUDENTS;

-- Setting a default value for the 'BrilliantStudents' column (not applicable since it's removed earlier)
ALTER TABLE STUDENTS ALTER COLUMN BrilliantStudents SET DEFAULT 'Ammar Saleem';

-- Removing the default value from the 'BrillantStudents' column (note the typo in the original code)
ALTER TABLE STUDENTS ALTER COLUMN BrilliantStudents DROP DEFAULT;

-- Renaming the 'Regno' column to 'Registration' for better clarity
ALTER TABLE STUDENTS RENAME COLUMN Regno TO Registration;

-- Dropping the STUDENTS table (CASCADE will remove all dependencies)
DROP TABLE STUDENTS CASCADE;
