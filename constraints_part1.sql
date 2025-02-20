drop table students cascade;
drop table courses cascade;
drop table enrollments cascade;

create table students
(
	StudentID serial primary key,
	StudentName varchar(100) not null,
	email varchar(100) unique not null,
	age int check (age between 15 and 25)
);

create table courses
(
	CourseID INT Primary Key,
	CourseName Varchar(50) not null,
	Credits int check (credits>0)
);

create table enrollments
(
	EnrollmentID serial Primary key,
	StudentID INT,
	CourseID INT,
	EnrollmentDate date not null,
	
	constraint fk_studentID foreign key(StudentID) references students(StudentID) on delete cascade,
	constraint fk_CourseID foreign key(CourseID) references courses (CourseID) on delete cascade
);

INSERT INTO Students (StudentName, email, age) VALUES

('John Doe', 'john.doe@example.com', 20),
('Jane Smith', 'jane.smith@example.com', 22),
('Alice Johnson', 'alice.j@example.com', 19),
('Bob Brown', 'bob.brown@example.com', 21),
('Charlie Davis', 'charlie.d@example.com', 18);

INSERT INTO courses (CourseName, Credits, CourseID) VALUES

('Mathematics', 4, 101),
('Physics', 3, 102),
('Chemistry', 3, 103),
('Biology', 3, 104),
('Computer Science', 4, 105);

INSERT INTO enrollments (StudentID, CourseID, EnrollmentDate) VALUES

(1, 101, '2023-10-01'),
(2, 101, '2023-10-02'),
(3, 102, '2023-10-03'),
(4, 103, '2023-10-04'),
(5, 104, '2023-10-05'),
(1, 105, '2023-10-06'),
(2, 102, '2023-10-07'),
(3, 103, '2023-10-08'),
(4, 104, '2023-10-09'),
(5, 105, '2023-10-10');

select * from enrollments

--TASK NO. 3--

select StudentName from students, courses, enrollments where 
students.StudentID=enrollments.StudentID
and
courses.CourseID=enrollments.CourseID
and
CourseName='Mathematics';

select CourseName, count(courses.CourseID) from courses, enrollments where
courses.CourseID=enrollments.CourseID
group by courses.CourseID;


--Task 4---
alter table students add column PhoneNumber varchar(15) unique;
select * from students;

alter table enrollments add constraint infuture check (EnrollmentDate <= CURRENT_DATE);

alter table students drop constraint students_email_key;


--Task 5--

alter table students drop constraint student_age_check;
alter table enrollments drop constraint fk_StudentID
