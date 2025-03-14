CREATE TABLE student (
    id INTEGER PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    GPA NUMERIC(3,2) CHECK (GPA BETWEEN 0.00 AND 4.00)
);

INSERT INTO student (id, name, GPA) VALUES (1, 'Alice Johnson', 3.75);
INSERT INTO student (id, name, GPA) VALUES (2, 'Bob Smith', 3.20);
INSERT INTO student (id, name, GPA) VALUES (3, 'Charlie Brown', 2.85);
INSERT INTO student (id, name, GPA) VALUES (4, 'David Wilson', 3.90);
INSERT INTO student (id, name, GPA) VALUES (5, 'Emma Davis', 3.50);

--task1--
Do $$ 
Declare 
selected_student student%rowtype;
selected_student_id student.id%type=2;
begin
select * from student into selected_student where student.id=selected_student_id;

if not found then
raise notice 'the student with student id % does not exist',selected_student.id;
else
raise notice 'the student is found with the name %: ',selected_student.name;
end if;
end $$

--task 2--
do $$
declare

selected_student student%rowtype;
selected_student_id student.id%type = 2;

begin
select * from student into selected_student where student.GPA>3.00;

if found then
raise notice 'GOOD';
else
raise notice 'Bad';
end if;
end $$


--task 3--
do $$
declare
selected_student student%rowtype;
selected_student_id student.id%type=2;

begin
select * from student into selected_student where student.id=selected_student_id;
if found then
case
when selected_student.GPA>3.00 then raise notice 'good';

else
raise notice 'bad';
end case;
end if;
end $$
