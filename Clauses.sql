CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Department VARCHAR(50),
    Salary INT
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary)
VALUES
(1, 'John', 'Doe', 'HR', 40000),
(2, 'Jane', 'Smith', 'IT', 50000),
(3, 'Alice', 'Johnson', 'HR', 45000),
(4, 'Bob', 'Brown', 'Finance', 60000),
(5, 'Charlie', 'Davis', 'IT', 55000),
(6, 'David', 'Wilson', 'Finance', 70000),
(7, 'Eve', 'Taylor', 'HR', 48000),
(8, 'Frank', 'Moore', 'IT', 52000),
(9, 'Grace', 'Lee', 'Finance', 65000),
(10, 'Henry', 'Clark','IT', 53000);

select Department from Employees group by Department;
--using group by alone without the aggregate functions is not useful because it would be the same as using distinct key word--
--the group by is used as it especially allows to perform operations in the table contents through aggregate function--
select distinct Department from Employees;

select Department, count(Department) as "Number of Employees" from Employees group by Department;

--TASK 2--
alter table Employees add column JoiningDate DATE;
select * From Employees; --checking if the new column has been added--

update Employees set JoiningDate='2023-01-15'where EmployeeID=1;
update Employees set JoiningDate='2023-02-10'where EmployeeID=2;
update Employees set JoiningDate='2023-01-15'where EmployeeID=3;
update Employees set JoiningDate='2023-03-05'where EmployeeID=4;
update Employees set JoiningDate='2023-02-10'where EmployeeID=5;
update Employees set JoiningDate='2023-03-05'where EmployeeID=6;
update Employees set JoiningDate='2023-01-15'where EmployeeID=7;
update Employees set JoiningDate='2023-02-10'where EmployeeID=8;
update Employees set JoiningDate='2023-03-05'where EmployeeID=9;
update Employees set JoiningDate='2023-02-10'where EmployeeID=10;
--TASK 3--
select Department, JoiningDate, count(Department) as "Number of Employees in DPT", count(JoiningDate) as "Number of Same Joining Date" from Employees group by Department, JoiningDate;
--its the same as--
select Department, JoiningDate, count(Department) as "Number of Employees in DPT" from Employees group by Department, JoiningDate;



select JoiningDate, sum(Salary) as totalSalary from Employees group by JoiningDate;

--Task 5--
select Department, sum(Salary) as totalSalary from Employees group by Department;
select Department, sum(Salary) as totalSalary from Employees group by Department having sum(Salary)>50000;


--Task 6--
select Salary from Employees order by Salary desc;

--Task 7--

select Department, Salary from Employees order by Department, Salary desc;

--TASK 8--

select Department,avg(Salary) as AverageSalary from Employees group by Department having avg(Salary)>30000 order by Department Desc
