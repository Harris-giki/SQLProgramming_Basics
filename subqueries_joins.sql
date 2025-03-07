-- Creating the Student Table
CREATE TABLE Student (
    SID INT PRIMARY KEY,
    SNAME VARCHAR(100),
    Faculty VARCHAR(100)
);

-- Creating the Courses Table
CREATE TABLE Courses (
    CID INT PRIMARY KEY,
    CNAME VARCHAR(100),
    CreditHour INT
);

-- Creating the Enrollment Table
CREATE TABLE Enrollment (
    CID INT REFERENCES Courses(CID),
    SID INT REFERENCES Student(SID),
    Semester VARCHAR(20),
    PRIMARY KEY (CID, SID)
);

-- Inserting Sample Data into Student Table
INSERT INTO Student (SID, SNAME, Faculty) VALUES
(1, 'John Doe', 'Computer Science'),
(2, 'Jane Smith', 'Mathematics'),
(3, 'Alice Brown', 'Physics'),
(4, 'Bob Johnson', 'Chemistry'),
(5, 'Alice Smith', 'Electronics');

-- Inserting Sample Data into Courses Table
INSERT INTO Courses (CID, CNAME, CreditHour) VALUES
(101, 'Database Systems', 3),
(102, 'Calculus I', 4),
(103, 'Quantum Mechanics', 3),
(104, 'Organic Chemistry', 4);

-- Inserting Sample Data into Enrollment Table
INSERT INTO Enrollment (CID, SID, Semester) VALUES
(101, 1, 'Fall'),
(102, 2, 'Spring'),
(101, 3, 'Fall'),
(101, 4, 'Spring'),
(103, 1, 'Spring');

-- Query 1: Retrieve all students who are not enrolled in any course
SELECT S.SID, S.SNAME 
FROM Student S
LEFT JOIN Enrollment E ON S.SID = E.SID
WHERE E.SID IS NULL;

-- Query 2: Retrieve all courses that have no students enrolled
SELECT C.CID, C.CNAME 
FROM Courses C
LEFT JOIN Enrollment E ON C.CID = E.CID
WHERE E.CID IS NULL;

-- Query 3: List all students enrolled in Database System as well as Quantum Mechanics
SELECT S.SID, S.SNAME 
FROM Student S
WHERE S.SID IN (
    SELECT E.SID FROM Enrollment E WHERE E.CID = 101
) AND S.SID IN (
    SELECT E.SID FROM Enrollment E WHERE E.CID = 103
);

-- Query 4: List all students who are never enrolled in Calculus-I course
SELECT S.SID, S.SNAME 
FROM Student S
WHERE S.SID NOT IN (
    SELECT E.SID FROM Enrollment E WHERE E.CID = 102
);

-- Query 5: List all the courses that are offered in Fall as well as Spring semester
SELECT C.CID, C.CNAME 
FROM Courses C
WHERE C.CID IN (
    SELECT E.CID FROM Enrollment E WHERE E.Semester = 'Fall'
) AND C.CID IN (
    SELECT E.CID FROM Enrollment E WHERE E.Semester = 'Spring'
);
