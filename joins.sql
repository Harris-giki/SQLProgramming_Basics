-- Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    min_salary DECIMAL(10,2)
);
--Employee Table
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department_id INT, --Foreign key referencing department
    salary DECIMAL(10,2),
    Foreign key(department_id) references Department(department_id)	
);
-- Project Table
CREATE TABLE Project (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50),
    emp_id INT, -- Foreign key referencing Employee
    Foreign key(emp_id) references Employee (emp_id)
);

INSERT INTO Department (department_id, department_name, min_salary) VALUES
(1, 'HR', 40000),
(2, 'IT', 50000),
(3, 'Finance', 70000),
(4, 'Marketing', 45000);
 
-- Insert Sample Data
INSERT INTO Employee (emp_id, emp_name, department_id, salary) VALUES
(1, 'Alice', 1, 60000),
(2, 'Bob', 2, 75000),
(3, 'Charlie', 1, 50000),
(4, 'David', NULL, 55000),
(5, 'Eve', 3, 80000)

INSERT INTO Project (project_id, project_name, emp_id) VALUES
(1, 'Project A', 1),
(2, 'Project B', 2),
(3, 'Project C', 3),
(4, 'Project D', 5),
(5, 'Project E', NULL);

--task no.1--
select emp_name, department_name from Employee inner join Department on Employee.emp_id=Department.department_id;

--task no.2--
select * from Employee left join Department on Employee.emp_id=Department.department_id

--task no.3--
select * from Employee right join Department on Employee.emp_id=Department.department_id

--task no.4--
select * from Employee full outer join Department on Employee.emp_id=Department.department_id

--task no. 5--
select * from Project inner join Employee on Project.project_id=Employee.emp_id
