-- Create a table called students
CREATE TABLE students (
    student_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    marks INT
);

-- Insert some sample data into students table
INSERT INTO students VALUES (1, 'Ali', 'Khan', 85);
INSERT INTO students VALUES (2, 'Sara', 'Ahmed', 92);
INSERT INTO students VALUES (3, 'Usman', 'Raza', 78);
-- Create a view that shows full name and grade category of each student
CREATE VIEW student_summary AS
SELECT 
    student_id,
    first_name || ' ' || last_name AS full_name,  -- Combine first and last name
    marks,
    
    -- Use CASE to assign a grade
    CASE 
        WHEN marks >= 90 THEN 'A'
        WHEN marks >= 80 THEN 'B'
        WHEN marks >= 70 THEN 'C'
        ELSE 'Fail'
    END AS grade
FROM students;
-- Select data from the view instead of writing the full query again
SELECT * FROM student_summary;
-- Rename the view to something else
ALTER VIEW student_summary RENAME TO student_report;
