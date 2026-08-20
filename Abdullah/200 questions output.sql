
#==================================================1. Database & Table Creation (1–20) ===================================================================

#Q1. Create a database named company_db.
create database company_db;

#Q2. Select and use the company_db database.
use company_db;

#Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date column.
create table employees 
(
employee_id varchar(10),
employee_name varchar(20),
department varchar(20),
salary int,
city varchar(20),
hire_Date date
);

/*
Q4. Make employee_id the PRIMARY KEY.
Q5. Make employee_name NOT NULL.
 already done in create table */
 
#Q6. Add a UNIQUE constraint to an email column.
alter table employees add employee_email varchar(30);

#Q7. Add a CHECK constraint so salary must be greater than 0
alter table employees add constraint check (Salary > 0);

#Q8. Add a DEFAULT value of 'Hyderabad' for the city column.
alter table employees modify city varchar(30) default 'Hyderabad';

#Q9. Create a departments table with department_id, department_name, location, and budget.
create table departments
(
department_id int,
department_name varchar(30),
location varchar(30),
budget int
);

#Q10. Make department_id the PRIMARY KEY in the departments table.
alter table departments add primary key (department_id);

#Q11. Create a projects table with project_id, project_name, department_id, and budget.
create table projects
(
project_id int primary key,
project_name varchar(30),
department_id int,
budget int
);

#Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.
alter table projects add constraint fk_dept 
foreign key (department_id) references departments(department_id);

#Q13. Insert one employee record.
insert into employees values
('101', 'nasir','nasir123@gmail.com', 'Data Science', 60000, 'Hyderabad', '2025-8-15');

#Q14. Insert five employee records in a single INSERT statement.
insert into employees values
(102, 'khan','kahan123@gmail.com', 'HR', 55000, 'Bangalore', '2021-06-20'),
(103, 'riya','riay@gmail.com', 'Data Science', 70000, 'Hyderabad', '2020-03-10'),
(104, 'sneha','sneha123@gmail.com','Finance', 50000, 'Mumbai', '2023-02-18'),
(105, 'mohsin','mohsin123@gmail.com', 'Sales', 65000, 'Delhi', '2022-11-05'),
(106, 'affan','affan123@gmail.com', 'HR', 45000, 'Hyderabad', '2024-01-10');

#Q15. Insert a department record.
insert into departments values (10, 'Data Science', 'Hyderabad', 500000);

#Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
create table students
(
student_id int primary key,
student_name varchar(30) not null,
email varchar(40) unique,
age int check (age >= 18),
city varchar(20) default 'Hyderabad'
);

#Q17. Attendance table
create table attendance
(
employee_id int,
attendance_date date,
status varchar(20)
);

-- Q18. Create table only if not exists
create table if not exists attendance
(
employee_id int,
attendance_date date,
status varchar(20)
); #1050 table'attendence already exist

-- Q19. Describe employees table structure
desc employees;

-- Q20. Drop temp table if exists
drop table if exists temp_data;

#==================================================2. Basic SELECT & Filtering (21–45) ===================================================================

-- Q21. Display all columns
select * from employees;

-- Q22. Only employee_name and salary
select employee_name, salary from employees;

-- Q23. Employees who live in Hyderabad
select * from employees where city = 'Hyderabad';

-- Q24. Salary greater than 60000
select * from employees where salary > 60000;

-- Q25. Salary less than or equal to 50000
select * from employees where salary <= 50000;

-- Q26. Salary between 50000 and 70000
select * from employees where salary between 50000 and 70000;

-- Q27. Live in Hyderabad, Bangalore, or Mumbai using IN
select * from employees where city in ('Hyderabad', 'Bangalore', 'Mumbai');

-- Q28. Do NOT live in Hyderabad
select * from employees where city != 'Hyderabad';

-- Q29. Names start with 'A'
select * from employees where employee_name like 'A%';

-- Q30. Names end with 'a'
select * from employees where employee_name like '%a';

-- Q31. Names contain the letter 'i'
select * from employees where employee_name like '%i%';

-- Q32. Department is NULL
select * from employees where department is null;

-- Q33. Department is NOT NULL
select * from employees where department is not null;

-- Q34. Hired after 2022-01-01
select * from employees where hire_date > '2024-01-01';

-- Q35. Hired between two given dates
select * from employees where hire_date between '2023-01-01' and '2026-12-31';

-- Q36. Salary > 50000 AND live in Hyderabad
select * from employees where salary > 50000 and city = 'Hyderabad';

-- Q37. Live in Hyderabad OR earn more than 70000
select * from employees where city = 'Hyderabad' or salary > 70000;

-- Q38. NOT in HR department
select * from employees where department != 'HR';

-- Q39. Distinct cities
select distinct city from employees;

-- Q40. Distinct departments
select distinct department from employees;

-- Q41. Sorted by salary ascending
select * from employees order by salary asc;

-- Q42. Sorted by salary descending
select * from employees order by salary desc;

-- Q43. Sorted by department, then salary descending
select * from employees order by department, salary desc;

-- Q44. First 3 employees after sorting by employee_id
select * from employees order by employee_id limit 3;

-- Q45. Top 3 highest-paid employees
select * from employees order by salary desc limit 3;

#===================================3. UPDATE, DELETE, ALTER & Basic Functions (46–65) =======================================
-- Q46. Update salary of one employee
update employees set salary = 65000 where employee_id = '101';

-- Q47. Increase all salaries by 10%
SET SQL_SAFE_UPDATES = 0;
UPDATE employees SET salary = salary * 1.10;
SET SQL_SAFE_UPDATES = 1;


-- Q48. Increase Data Science dept salary by 5000 (temprory safe update off)
SET SQL_SAFE_UPDATES = 0;
update employees set salary = salary + 5000 where department = 'Data Science';
SET SQL_SAFE_UPDATES = 1;

-- Q49. Change Bangalore to Bengaluru (permenent safe update off)
update employees set city = 'Bengaluru' where city = 'Bangalore';

-- Q50. Delete one employee
delete from employees where employee_id = '106';

-- Q51. Delete employees below specified salary
delete from employees where salary < 45000;

-- Q52. Add email column
alter table employees add email varchar(40);

-- Q53. Add phone_number column
alter table employees add phone_num int;
alter table employees modify column phone_num bigint;

-- Q54. Modify length of employee_name column
alter table employees modify column employee_name varchar(40);

-- Q55. Rename city to employee_city
alter table employees rename column city to employee_city;

-- Q56. Drop phone_number column
alter table employees drop phone_num;

-- Q57. Names in uppercase
select upper(employee_name) from employees;

-- Q58. Names in lowercase
select lower(employee_name) from employees;

-- Q59. Length of every employee name
select employee_name, length(employee_name) from employees;

-- Q60. First three characters of every name (nasir to nas (first 3 character )
select employee_name, substring(employee_name, 1, 3) from employees;

-- Q61. Salary rounded to nearest thousand
select employee_name, round(salary, -3) from employees;

-- Q62. Current date
select curdate();

-- Q63. Years worked (using hire_date)
select employee_name, timestampdiff(year, hire_date, curdate()) as years_worked from employees;

-- Q64. Replace NULL department with 'Unassigned'(threre's no null department)
select employee_name, coalesce(department, 'Unassigned') as department from employees;


-- Q65. CASE - Low/Medium/High salary labels
select employee_name, salary,
case
    when salary < 58000 then 'Low'
    when salary between 50000 and 70000 then 'Medium'
    else 'High'
end as salary_category
from employees;

#===================================4. Aggregate Functions, GROUP BY & HAVING (66–90) =======================================
-- Q66. Find the total number of employees.
select count(*) from employees;

-- Q67. Find the total salary paid to all employees.
select sum(salary) from employees ;

-- Q68. Find the average salary of all employees.
select avg(Salary) from employees;

-- Q69. Find the highest salary.
select max(salary) from employees;

-- find the min salary
select min(salary) from employees;

-- Q71. Find the number of employees in Hyderabad.
select employee_city, count(employee_name) from employees where employee_city ="hyderabad" group by employee_city ;

-- Q72. Total salary paid to employees in Mumbai
SELECT SUM(salary) AS total_salary FROM employees WHERE employee_city = 'Mumbai';

-- Q73. Average salary of employees in Bangalore
SELECT AVG(salary) AS average_salary FROM employees WHERE employee_city = 'Bengaluru';

-- Q74. Number of employees in each department
SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;

-- Q75. Find the average salary in each department.
select department,avg(salary) as avg_sal from employees group by department;

-- Q76. Maximum salary in each department
SELECT department, MAX(salary) AS maximum_salary FROM employees GROUP BY department;

-- Q77. Minimum salary in each department
SELECT department, MIN(salary) AS minimum_salary FROM employees GROUP BY department;

-- Q78. Total salary in each department
SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;

-- Q79. Number of employees in each city
SELECT employee_city, COUNT(*) AS employee_count FROM employees GROUP BY employee_city;

-- Q80. Average salary in each city
SELECT employee_city, AVG(salary) AS average_salary FROM employees GROUP BY employee_city;

-- Q81. Departments having more than 5 employees
SELECT department,COUNT(*) AS employee_count FROM employees GROUP BY department HAVING COUNT(*) >= 2;

-- Q82. Departments whose average salary is greater than 60000
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department 
HAVING AVG(salary) > 60000;

-- Q83. Cities whose total salary is greater than 200000
SELECT employee_city, SUM(salary) AS total_salary FROM employees GROUP BY employee_city HAVING SUM(salary) > 70000;

-- Q84. Department with the highest total salary
SELECT department,SUM(salary) AS total_salary FROM employees GROUP BY department ORDER BY total_salary DESC
LIMIT 1;

-- Q85. Department with the highest average salary
SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department 
ORDER BY average_salary DESC LIMIT 2;

-- Q86. Employee count and average salary for each department and city combination
SELECT department, employee_city, COUNT(*) AS employee_count, AVG(salary) AS average_salary FROM employees
GROUP BY department, employee_city;

-- Q87. Difference between maximum and minimum salary in each department
SELECT department, MAX(salary) - MIN(salary) AS salary_difference FROM employees
GROUP BY department;

-- Q88. Departments where maximum salary is greater than 70000
SELECT department,MAX(salary) AS maximum_salary FROM employees GROUP BY department HAVING MAX(salary) > 70000;

-- Q89. Cities having at least 3 employees
-- whose salary is above 60000
SELECT employee_city,COUNT(*) AS high_salary_employee_count FROM employees WHERE salary > 60000 
GROUP BY employee_city HAVING COUNT(*) >= 2;

-- Q90. Total number of distinct departments and distinct cities
SELECT COUNT(DISTINCT department) AS total_departments,
COUNT(DISTINCT employee_city) AS total_cities
FROM employees;

#===================================5. Constraints, Keys & Data Integrity (91–105)=======================================

-- Q91. Create a products table with product_id as PRIMARY KEY.
create table product 
(
product_id int primary key,
product_name varchar(30),
product_Des varchar(23)
);

-- Q92. Create a users table where email must be UNIQUE.
create table users 
(
user_id int primary key,
user_name varchar(40),
user_email varchar(30) unique
);

-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
create table orders
(
order_id int primary key,
order_name varchar(23),
order_amount int check (order_amount >=50)
);

-- Q94. Create a customers table where customer_name cannot be NULL.
create table customers 
(
cust_id int primary key,
cust_name varchar(30) not null,
amount int check (amount >= 500)
);

-- Q95. Create a table with a DEFAULT status value of 'Active'.
create table loans
(
loan_id varchar (12),
loan_person varchar (34),
loan_status varchar(29) default"active"
);

-- Q96. Insert a row that uses the DEFAULT value.
insert into loans values
("L001","abdullah",300000 ,default);
select *from loans;
alter table loans add column loan_amount int;
insert into loans values
("L002","nasir" ,400000,default);

-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
insert into product values
(
1,"laptop","Lenovo slim 3 ipad 3"
);
insert into product values
(
1,"mobile","samsung S25 Ultra"  #duplicate entry "1" for key product primary
);

-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
insert into users values
(
1,"abdullah","abdullah123@gmail.com"
);
insert into users values
(
2,"nasir","abdullah123@gmail.com" #duplicate entry "abdullah123@gmail.com for key users user_email (unique)
);

-- Q99. Create employees and departments with a FOREIGN KEY relationship.
CREATE TABLE departmentss (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);
CREATE TABLE employeess (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    CONSTRAINT fk_employee_department
        FOREIGN KEY (department_id)
        REFERENCES departmentss(department_id)
);

-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
INSERT INTO departmentss VALUES 
(101, 'Data Analytics');

INSERT INTO employeess VALUES
 (1, 'Abdullah', 101,23);

--  Q101. Attempt to insert an employee with a department_id that does not exist.
INSERT INTO employeess VALUES
 (2, 'nasir', 999); #Cannot add or update a child row: 

-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
ALTER TABLE employeess
ADD COLUMN age INT;

ALTER TABLE employeess
ADD CONSTRAINT chk_employee_age
CHECK (age BETWEEN 18 AND 60);

INSERT INTO employeess (employee_id, employee_name, department_id, age)
VALUES (3, 'Ali', 101, 17); #chk_employee_Age is voilated

-- Q103. Create a composite PRIMARY KEY using two columns.
CREATE TABLE employee_skills (
    employee_id INT,
    skill_name VARCHAR(100),
    PRIMARY KEY (employee_id, skill_name)
);
INSERT INTO employee_skills (employee_id, skill_name)
VALUES
(1, 'SQL'),
(1, 'Python'),
(2, 'SQL');

INSERT INTO employee_skills (employee_id, skill_name)
VALUES (1, 'SQL'); # duplicate entry sql for key emoloyee_Skill primary 

-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
CREATE TABLE attendancee (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (employee_id, attendance_date) #(used AI for this )
);
INSERT INTO attendancee (employee_id, attendance_date, status)
VALUES
(1, '2026-08-15', 'Present'),
(1, '2026-08-16', 'Absent'),
(2, '2026-08-15', 'Present');

INSERT INTO attendancee (employee_id, attendance_date, status)
VALUES (1, '2026-08-15', 'Present'); #duplicate entry
-- Q105. Create a table with a named constraint and then identify its purpose
CREATE TABLE orderss (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_amount DECIMAL(10,2),

    CONSTRAINT chk_order_amount
    CHECK (order_amount > 0)
);
drop table orderss;
drop table attendancee;
drop table departmentss;
drop table employeess;
drop table  product;
drop table users;
drop table loans;
drop table employee_skills;
drop table orders;
drop table customers;

DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

use company_db;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    budget DECIMAL(12, 2) NOT NULL
);
INSERT INTO departments
    (department_id, department_name, location, budget)
VALUES
    (101, 'Data Science', 'Hyderabad', 600000),
    (102, 'HR', 'Mumbai', 250000),
    (103, 'Finance', 'Bengaluru', 400000),
    (104, 'IT', 'Hyderabad', 850000),
    (105, 'Marketing', 'Delhi', 300000),
    (106, 'Operations', 'Chennai', 200000);
    SELECT * FROM departments;
    
    CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT NULL,
    manager_id INT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    city VARCHAR(100),
    hire_date DATE,

    CONSTRAINT fk_emp_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id),

    CONSTRAINT fk_emp_manager
        FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);
INSERT INTO employees
    (employee_id, employee_name, department_id, manager_id, salary, city, hire_date)
VALUES
    (1, 'Aisha Khan', 101, NULL, 95000, 'Hyderabad', '2020-01-15'),
    (2, 'Ravi Kumar', 102, NULL, 80000, 'Mumbai', '2019-06-10'),
    (3, 'Priya Sharma', 103, NULL, 90000, 'Bengaluru', '2018-09-20'),
    (4, 'Imran Ali', 104, NULL, 100000, 'Hyderabad', '2017-03-12'),
    (5, 'Neha Verma', 105, NULL, 85000, 'Delhi', '2021-05-18');
    INSERT INTO employees
    (employee_id, employee_name, department_id, manager_id, salary, city, hire_date)
VALUES
    (6, 'Abdullah Hamed', 101, 1, 70000, 'Hyderabad', '2023-01-10'),
    (7, 'Sara Ahmed', 101, 1, 68000, 'Hyderabad', '2022-07-25'),
    (8, 'Kiran Patel', 101, 1, 62000, 'Bengaluru', '2024-02-15'),
    (9, 'Nasir Khan', 102, 2, 55000, 'Mumbai', '2022-04-05'),
    (10, 'Meera Singh', 102, 2, 52000, 'Mumbai', '2023-08-19'),
    (11, 'Arjun Rao', 103, 3, 75000, 'Bengaluru', '2021-11-30'),
    (12, 'Fatima Noor', 103, 3, 68000, 'Hyderabad', '2022-12-11'),
    (13, 'Vikram Das', 104, 4, 88000, 'Hyderabad', '2020-10-09'),
    (14, 'Pooja Reddy', 104, 4, 72000, 'Hyderabad', '2023-03-21'),
    (15, 'Sameer Shah', 104, 4, 65000, 'Mumbai', '2024-01-08'),
    (16, 'Anjali Gupta', 105, 5, 60000, 'Delhi', '2022-06-14'),
    (17, 'Rahul Jain', 105, 5, 58000, 'Delhi', '2023-09-17'),
    (18, 'Zoya Malik', NULL, NULL, 50000, 'Hyderabad', '2024-05-01');
SELECT * FROM employees;

CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    budget DECIMAL(12, 2) NOT NULL,

    CONSTRAINT fk_project_department
        FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);
INSERT INTO projects
    (project_id, project_name, department_id, budget)
VALUES
    (201, 'Customer Churn Prediction', 101, 350000),
    (202, 'Sales Forecast Dashboard', 101, 200000),
    (203, 'Recruitment Automation', 102, 180000),
    (204, 'Annual Budget Planning', 103, 500000),
    (205, 'Cloud Migration', 104, 600000),
    (206, 'Cyber Security Upgrade', 104, 350000),
    (207, 'Social Media Campaign', 105, 250000);
    SELECT * FROM projects;
    # used AI for data insertion 
#===================================6.JOINs Including Self Join (106–135)=======================================

-- Q106. Display employee_name and department_name using an INNER JOIN.
select employee_name,department_name from employees as e
inner join departments as d
on e.department_id = d.department_id;

-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
select employee_name,salary ,department_name,location from employees as e
left join departments as d
on e.department_id = d.department_id;

-- Q108. Find employees working in the Data Science department using a JOIN.
select employee_name,department_name from employees as e 
inner join departments as d
on e.department_id = d.department_id 
where department_name ="data science";

-- Q109. Find employees working in departments located in Hyderabad.
select employee_name,department_name,location from employees as e
left join departments as d
on e.department_id = d.department_id
where location ="Hyderabad";

-- Q110. Display all employees even if they do not belong to any department.
select *from employees as e
left join departments as d
on e.department_id = d.department_id;

-- Q111. Display all departments even if they have no employees.
select *from departments as d
left join employees as e
on d.department_id = e.department_id;

-- Q112. Find departments that currently have no employees.
select department_name from departments as d
left join employees as e
on d.department_id = e.department_id
where employee_name is null;

-- Q113. Find employees who do not have a matching department.
select e.employee_name,e.employee_id, d.department_id from employees as e
left join departments as d
on e.department_id = d.department_id
where department_name is null;

-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
select department_name,count(employee_id)  from employees as e
left join departments as d
on e.department_id = d.department_id
group by department_name;

-- Q115. Find the average salary in each department using JOIN and GROUP BY.
select department_name,avg(salary)  from employees as e
left join departments as d
on e.department_id = d.department_id
group by department_name;

-- Q116. Display each department with employee count including departments with zero employees.
select department_name,count(employee_id)  from employees as e
right join departments as d
on e.department_id = d.department_id
group by d.department_name, d.department_id;

-- Q117. Display each department with total salary including departments with zero employees.
select department_name ,sum(salary) from employees as e
right join departments as d
on e.department_id = d.department_id
group by d.department_name, d.department_id;

-- Q118. Join departments with projects and display department_name and project_name.
select department_name , project_name from departments as d
left join projects as p
on d.department_id = p.department_id;

-- Q119. Display employees, department names, and project names using appropriate joins.
select *, d.department_name, p.project_name from employees as e #we can use only employee_name also 
inner join departments as d 
on e. department_id = d.department_id
inner join projects as p
on d.department_id = p.department_id ;

-- Q120. Find departments that have at least one project.
SELECT DISTINCT department_name FROM departments AS d
inner join projects AS p
ON d.department_id = p.department_id;

-- Q121. Find departments that have no projects.
SELECT department_name FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;

-- Q123. Using a SELF JOIN, display employee name and manager name.
SELECT e.employee_name AS employee_name, m.employee_name AS manager_name
FROM employees AS e
left JOIN employees AS m
ON e.manager_id = m.employee_id;

-- Q124. Using a SELF JOIN, display only employees who have managers.
select e.employee_name as emp_name , m.employee_name as manger_name
from employees as e
inner join employees as m
ON e.manager_id = m.employee_id;

-- Q125. Using a SELF JOIN, display employees who do not have managers.
SELECT e.employee_id, e.employee_name FROM employees AS e
LEFT JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE m.employee_id IS NULL;

-- Q126. Find all managers who manage at least one employee.
select distinct m.employee_id, m.employee_name as manager_name from employees as e
inner join employees as m
on e.manager_id = m.employee_id;

-- Q127. Count the number of employees reporting to each manager.
select m.employee_id,m.employee_name as manager_name , count(e.employee_name) as emp_count
from employees as e
inner join employees as m
on e.manager_id = m.employee_id
group by m.employee_id, m.employee_name;

-- Q128. Find managers who manage more than 3 employees.
SELECT m.employee_id, m.employee_name AS manager_name, COUNT(e.employee_id) AS employee_count
FROM employees AS e
INNER JOIN employees AS m
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name
HAVING COUNT(e.employee_id) >= 3;

-- Q129. Display employee, manager, and employee salary using a SELF JOIN.
select e.employee_name as emp_name ,m.employee_name as manager_name,e.salary 
from employees as e
inner join employees as m
on e.manager_id = m.employee_id;

-- Q130. Find employees whose salary is greater than their manager's salary.
select e.employee_name as emp_name, e.salary as emp_sal,m.employee_name AS manager_name, m.salary as man_sal 
from employees as e
inner join employees as m
on e.manager_id = m.employee_id
where e.salary > m.salary;

-- Q131. Find employees who work in the same department as their manager.
select e.employee_name as emp_name ,m.employee_name as manger_name, e.department_id 
from employees as e
inner join employees as m
on e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;

-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
SELECT e.employee_id, e.employee_name,e.department_id
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Q133. Use multiple JOINs to display employee, department, and project information.
SELECT e.employee_name, d.department_name, p.project_name, p.budget AS project_budget
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN projects AS p
ON d.department_id = p.department_id;

-- Q134. Find the total project budget for each department.
SELECT d.department_name,COALESCE(SUM(p.budget), 0) AS total_project_budget
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;

-- Q135. Find departments whose total project budget is greater than their department budget
select d.department_name,SUM(p.budget) AS total_project_budget ,d.budget AS department_budget
FROM departments AS d
inner JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name, d.budget
having sum(p.budget) > d.budget;

#===================================7. Subqueries (136–155)=======================================
-- Q136. Find employees whose salary is greater than the overall average salary.
SELECT employee_id,employee_name,salary FROM employees
where salary >( select avg(salary ) from employees);

-- Q137. Find the employee or employees with the highest salary using a subquery.
select employee_name,salary from employees
where salary = (Select max(salary) from employees);

-- Q138. Find the employee or employees with the lowest salary using a subquery.
select employee_name,salary from employees
where salary =(select min(Salary) from employees);

-- Q139. Find employees who earn the same salary as Alice.
select employee_name,salary from employees
where salary = (select salary from employees where employee_name = "Nasir Khan");

-- Q140. Find employees who earn more than Alice.
select employee_name,salary from employees
where salary > (select salary from employees where employee_name = "Nasir Khan");

-- Q141. Find employees working in the same department as Alice.
SELECT employee_name, department_id FROM employees
WHERE department_id = (SELECT department_id FROM employees WHERE employee_name = 'Nasir Khan');

-- Q142. Find employees whose salary is greater than the average salary of their department.
 select e.employee_name ,e.salary,e.department_id from employees as e
 where e.salary > (select avg(e2.Salary) from employees as e2 where e2.department_id = e.department_id);

-- Q143. Find employees whose salary is less than the average salary of their department.
select e.employee_name ,e.salary,e.department_id from employees as e
 where e.salary < (select avg(e2.Salary) from employees as e2 where e2.department_id = e.department_id);

-- Q144. Find the department with the highest average salary using a subquery.
SELECT department_id,AVG(salary) AS avg_salary FROM employees
GROUP BY department_id
HAVING AVG(salary) = (SELECT MAX(avg_sal)FROM (SELECT AVG(salary) AS avg_sal FROM employees GROUP BY department_id) AS t);

-- Q145. Find departments whose average salary is greater than the company average salary.
SELECT department_id, AVG(salary) AS avg_salary FROM employees
GROUP BY department_id
HAVING AVG(salary) > ( SELECT AVG(salary) FROM employees);

-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
select employee_name ,department_id,city from employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'Hyderabad');

-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.
SELECT employee_name,department_id FROM employees
WHERE department_id NOT IN ( SELECT department_id FROM departments );

-- Q148. Find departments that have at least one employee using EXISTS.
SELECT department_name FROM departments d
WHERE EXISTS (SELECT 1 FROM employees e
WHERE e.department_id = d.department_id);

-- Q149. Find departments that have no employees using NOT EXISTS.
SELECT department_name FROM departments d
WHERE not EXISTS (SELECT 1 FROM employees e
WHERE e.department_id = d.department_id);

-- Q150. Find employees whose salary is greater than every employee in the HR department.
SELECT employee_name,salary FROM employees
WHERE salary > (SELECT MAX(e2.salary) FROM employees e2
JOIN departments d 
ON e2.department_id = d.department_id
WHERE d.department_name = 'HR');

-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
SELECT employee_name, salary FROM employees
WHERE salary > ( SELECT MIN(e2.salary) FROM employees e2
JOIN departments d ON e2.department_id = d.department_id
WHERE d.department_name = 'Finance'
);

-- Q152. Find the second-highest distinct salary using a subquery.
SELECT MAX(salary) AS second_highest_salary FROM employees
WHERE salary < ( SELECT MAX(salary)  FROM employees);

-- Q153. Find the third-highest distinct salary using a subquery.
SELECT MAX(salary) AS third_highest_salary FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees));

-- Q154. Find employees with the second-highest distinct salary.
SELECT employee_name, salary FROM employees
WHERE salary = (SELECT MAX(salary)FROM employees
WHERE salary < (SELECT MAX(salary)FROM employees));

-- Q155. Use a correlated subquery to find employees earning above their department average
SELECT e.employee_name, e.salary, e.department_id FROM employees e
WHERE e.salary > (SELECT AVG(e2.salary) FROM employees e2
WHERE e2.department_id = e.department_id);

#===================================8. CTEs — Common Table Expressions (156–170)==============================
-- 156. Create a CTE containing employees whose salary is greater than 60000.
with higher_Salary as
(
select employee_id,employee_name ,salary,department_id from employees
where salary > 60000
)
select *from higher_salary;

-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.
with company_avg_sal as 
(
select avg(Salary) as avg_sal from employees
)
SELECT e.employee_id, e.employee_name, e.salary, c.avg_sal FROM employees e
CROSS JOIN company_avg_sal c
WHERE e.salary > c.avg_sal;

-- Q158. Use a CTE to calculate average salary by department.
WITH dept_avg_salary AS 
(
SELECT department_id, AVG(salary) AS avg_salary FROM employees
GROUP BY department_id
)
SELECT *FROM dept_avg_salary;

-- Q159. Use a CTE to find departments with average salary greater than 60000.
with avg_salary_department as 
(
select department_id,avg(salary ) as avg_salaryyy from employees
group by department_id
having avg(Salary ) > 60000
)
select *From avg_salary_department;

-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.
WITH dept_stats AS 
(
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary,SUM(salary) AS total_salary FROM employees
GROUP BY department_id
),
high_paying_depts AS
 (
SELECT * FROM dept_stats
WHERE avg_salary > 60000
)
SELECT *
FROM high_paying_depts;

-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.
with city_total_salary as 
(
select city,sum(salary ) as total_salary from employees 
group by city
having city ="Hyderabad"
)
select *From  city_total_salary
WHERE total_salary > 200000;  -- choose your threshold

-- Q162. Use a CTE to find the highest salary in each department.
with highest_salary as
(
select department_id ,max(Salary)from employees
group by department_id
)
select*from highest_salary;

-- Q163. Use a CTE to find employees earning above their department average.
with more_earning as 
(
SELECT department_id,AVG(salary) AS avg_salary FROM employees
GROUP BY department_id
)
SELECT e.employee_id, e.employee_name,e.salary, e.department_id, d.avg_salary FROM employees e
JOIN more_earning d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

-- Q164. Use a CTE to rank employees by salary.
WITH ranked_employees AS 
(
SELECT employee_id, employee_name,salary,RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees
)
SELECT *
FROM ranked_employees;

-- Q165. Use a CTE to find the top 2 highest-paid employees.
with top_two as
(
select employee_name,department_id , max(salary) from employees
group by employee_id
order by max(salary) desc
limit 2
)
select*From top_two; 

-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.
WITH ranked_by_dept AS 
(
SELECT employee_id,employee_name,salary,department_id,ROW_NUMBER() 
OVER (PARTITION BY department_id ORDER BY salary DESC)AS rn FROM employees
)
SELECT employee_id, employee_name,salary, department_id fROM ranked_by_dept
WHERE rn = 1;

-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.
WITH ranked_by_dept AS 
(
SELECT employee_id,employee_name,salary,department_id,DENSE_RANK()
OVER (PARTITION BY department_id ORDER BY salary DESC) AS dr FROM employees
)
SELECT employee_id,employee_name,salary,department_id, dr AS salary_rank_in_dept FROM ranked_by_dept
WHERE dr = 2;

-- Q168. Create a CTE that joins employees and departments, then filter the result.
WITH emp_dept AS
 (
SELECT e.employee_id,e.employee_name,e.salary,e.department_id,d.department_name, d.location FROM employees e
JOIN departments d
ON e.department_id = d.department_id
)
SELECT *FROM emp_dept
WHERE location = 'Hyderabad' AND salary > 60000;

-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3 employees.
WITH dept_counts AS
 (
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
 GROUP BY d.department_id, d.department_name
)
SELECT * FROM dept_counts
WHERE employee_count > 3;

-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.
WITH dept_stats AS 
(
SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary, SUM(salary) AS total_salary FROM employees
GROUP BY department_id
),
high_paying_depts AS (
SELECT * FROM dept_stats
WHERE avg_salary > 60000
)
SELECT *FROM high_paying_depts;









