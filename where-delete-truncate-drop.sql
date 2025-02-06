DROP TABLE employees;
DROP TABLE employees_backup;

CREATE TABLE employees (

employee_id SERIAL PRIMARY KEY,

first_name VARCHAR(50),

last_name VARCHAR(50),

department VARCHAR(50),

salary NUMERIC(10, 2),

manager_id INT,

hire_date DATE

);

INSERT INTO employees (first_name, last_name, department, salary, manager_id, hire_date)

VALUES

('John', 'Doe', 'Sales', 50000, NULL, '2020-01-15'),

('Jane', 'Smith', 'HR', 60000, 1, '2019-03-22'),

('Alice', 'Johnson', 'Sales', 55000, 1, '2021-07-10'),

('Bob', 'Brown', 'IT', 70000, NULL, '2018-11-05'),

('Charlie', 'Davis', 'IT', 65000, 4, '2022-02-18'),

('Eva', 'White', 'HR', 62000, 1, '2020-09-30');

SELECT * FROM employees;

---task1----
SELECT * FROM employees WHERE department = 'Sales';
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees WHERE hire_date > '2020-01-01';

---task2---
SELECT first_name, last_name, salary*0.10 AS bonus FROM employees;
SELECT * FROM employees where (salary + salary*0.10) > 70000;

----task3----
SELECT * FROM employees where department = 'IT' AND salary BETWEEN 60000 AND 70000;
SELECT * FROM employees where department = 'HR' OR salary > 60000;
SELECT * FROM employees where manager_id IS NULL;

----task4----
SELECT DISTINCT department from employees;
SELECT salary AS "Monthly Salary" FROM employees;
SELECT * FROM employees where manager_id IS NULL;

---task5---
UPDATE employees set salary = salary*1.1 WHERE department = 'HR';
UPDATE employees SET manager_id = 1 WHERE first_name = 'Charlie' AND last_name = 'Davis';

---task6-----
DELETE FROM employees where hire_date < '2020-01-01';
CREATE TABLE employees_backup AS SELECT * from employees;
TRUNCATE TABLE employees_backup;
DROP TABLE employees_backup;
