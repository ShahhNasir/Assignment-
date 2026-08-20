CREATE DATABASE IF NOT EXISTS recent;
USE recent;

CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    salary INT,
    city VARCHAR(50),
    hire_date DATE
);

INSERT INTO  employees
(employee_id, employee_name, department_id, manager_id, salary, city, hire_date)
VALUES
(101, 'Alice', 10, 201, 60000, 'Hyderabad', '2022-01-15'),
(102, 'Bob', 20, 202, 55000, 'Bangalore', '2021-06-20'),
(103, 'Charlie', 10, 201, 70000, 'Hyderabad', '2020-03-10'),
(104, 'David', 30, 203, 50000, 'Mumbai', '2023-02-18'),
(105, 'Emma', 40, 204, 65000, 'Delhi', '2022-11-05'),
(106, 'Frank', NULL, 201, 45000, 'Hyderabad', '2024-01-10'),
(107, 'Grace', 20, 202, 58000, 'Bangalore', '2023-07-12'),
(108, 'Henry', 30, 203, 52000, 'Mumbai', '2021-09-25'),
(109, 'Irene', 10, 201, 72000, 'Hyderabad', '2019-05-14'),
(110, 'Jack', 50, NULL, 48000, 'Chennai', '2024-04-01');

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50),
    budget INT
);

INSERT INTO departments
(department_id, department_name, location, budget)
VALUES
(10, 'Data Science', 'Hyderabad', 500000),
(20, 'HR', 'Bangalore', 300000),
(30, 'Finance', 'Mumbai', 400000),
(40, 'Sales', 'Delhi', 450000),
(50, 'Marketing', 'Chennai', 350000),
(60, 'IT', 'Pune', 600000);

CREATE TABLE IF NOT EXISTS projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget INT
);

INSERT INTO projects
(project_id, project_name, department_id, budget)
VALUES
(1, 'AI Platform', 10, 250000),
(2, 'Recruitment System', 20, 150000),
(3, 'Fraud Detection', 30, 200000),
(4, 'Sales Dashboard', 40, 180000),
(5, 'Marketing Campaign', 50, 120000),
(6, 'Cloud Migration', 60, 300000);


-- Q1. Create a database named company_db.
create  database company_db ;
-- Q2. Select and use the company_db database.
use company_db ;
-- Q3 Create an employees table with employee_id, employee_name, department, salary, city, and hire_date
-- columns.
create table employee (
employee_id int ,
employee_name varchar(30),
department_id int,
salary int,
city varchar (50),
hire_date int
);
-- Q4. Make employee_id the PRIMARY KEY.
alter table employee
add primary key (employee_id);
-- Q5. Make employee_name NOT NULL.
alter table employee
modify employee_name varchar(100)not null;
-- Q6. Add a UNIQUE constraint to an email column.
alter table employee
add constraint unique_email unique (email) ;

-- Q7. Add a CHECK constraint so salary must be greater than 0.
alter table employee
add constraint check_salary 
check (salary>0) ;
-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.
alter table employee
alter city set default "hyderbad" ;
-- Q9. Create a departments table with department_id, department_name, location, and budget.
create table departments (
department_id int ,
department_name varchar(30),
location varchar(30),
budget int 
);

-- Q10. Make department_id the PRIMARY KEY in the departments table.
alter table department
add primary key (department_id);
-- Q11. Create a projects table with project_id, project_name, department_id, and budget.
create table project (
project_id int,
project_name varchar(30),
department_id int primary key,
budget int
);
-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.

-- Q13. Insert one employee record.
insert into employee  
(name,id)
values 
("sk",1) ;
-- Q14. Insert five employee records in a single INSERT statement.
insert into employee  
(name,id)
values 
("sk",1),
("kk",2),
("k",3),
("s",4),
("ks",5) ;

-- Q15. Insert a department record.
insert into department 
(name,id)
values
("dd",1);
-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
create table student (
std_id int primary key ,
std_name  varchar (30)not null,
std_email varchar(10) unique,
std_city varchar(30) default "hyderbad",
age int check (age>=18)
);

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.
create table attendance (
emp_id int primary key,
att_date int, 
status varchar(10)
);
-- Q18. Create a table only if it does not already exist.
create table if not exists sk (
empl_id int) ;
-- Q19. Describe or display the structure of the employees table.
select*from employees ;
-- Q20. Drop a temporary table named temp_data if it exists.
drop table if exists temp_data ;

-- Q21. Display all columns from the employees table.
select *from employee ;
-- Q22. Display only employee_name and salary.
select employee_name,salary
from employee;
-- Q23. Display employees who live in Hyderabad.
select employee_name
from employee
where city = "hyderbad" ;
-- Q24. Display employees whose salary is greater than 60000.
select salary
from employees
where salary > 60000 ;
-- Q25. Display employees whose salary is less than or equal to 50000.
select salary
from employees
where salary <= 50000 ;
-- Q26. Display employees whose salary is between 50000 and 70000.
select salary
from employees
where salary between 50000 and 70000 ;
-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
select employee
from employee
 where city in ("hyderbad" , "banglore" , "mumbai") ;
-- Q28. Display employees who do not live in Hyderabad.
select employee
from employee
where city !="hyderbad" ;
-- Q29. Display employees whose names start with 'A'.
select employee
from employee
where employee_name like 'A%';

-- Q30. Display employees whose names end with 'a'.
select *
from employee
where employee_name like '%a';
-- Q31. Display employees whose names contain the letter 'i'.
select *
from employee
where employee_name like '%i%';
-- Q32. Display employees whose department is NULL.
select *
from employee
where department = null ;

-- Q33. Display employees whose department is NOT NULL.
select *
from employee
where department is not null ;

-- Q34. Display employees hired after 2022-01-01.
select *
from employee
where hired > 2022-01-01 ;
-- Q35. Display employees hired between two given dates.
select *
from employee
where hired between '2022-01-01' and '2022-02-01'  ;
-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select *
from employee
where salary > 50000 
and city = "hyderabad" ;

-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select *
from employee
where city = "hyderbad" 
or salary > 70000 ;
-- Q38. Display employees who are NOT in the HR department.
select *
from employee
where department != "hr_dep" ;
-- Q39. Display distinct cities from the employees table.
select distinct cities 
from employees ;
-- Q40. Display distinct departments from the employees table.
select distinct department
from employees ;
-- Q41. Display employees sorted by salary in ascending order.
select *
from employee
order by salary asc ;
-- Q42. Display employees sorted by salary in descending order.
select *
from employee
order by salary desc ;
-- Q43. Display employees sorted first by department and then by salary descending.
select *
from department 
order by department asc,salary desc;

-- Q44. Display the first 5 employees after sorting by employee_id.
select *
from employee
order by employee_id 
limit 5 ;
-- Q45. Display the top 3 highest-paid employees
select *
from employee
order by salary desc
limit 3 ;
-- Q46. Update the salary of one employee using employee_id.
update employee_salary
set salary = "60000"
where employee_id = 1;

-- Q47. Increase the salary of all employees by 10 percent.
update employee_salary
set salary = salary*1.10 ;
-- Q48. Increase the salary of employees in the Data Science department by 5000.
UPDATE employees
SET salary = salary + 5000
WHERE department = 'Data Science';
-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
UPDATE employees
SET city = 'Bengaluru'
WHERE city = 'Bangalore';
-- Q50. Delete one employee using employee_id.
DELETE FROM employees
WHERE employee_id = 1;
-- Q51. Delete employees whose salary is below a specified amount.
DELETE FROM employees
WHERE salary < 40000;
-- Q52. Add an email column to the employees table.
ALTER TABLE employees
ADD email VARCHAR(100);
-- Q53. Add a phone_number column to the employees table.
ALTER TABLE employees
ADD phone_number VARCHAR(15);
-- Q54. Modify the length of the employee_name column.
ALTER TABLE employees
MODIFY employee_name VARCHAR(150) ;
-- Q55. Rename the city column to employee_city.
ALTER TABLE employees
RENAME COLUMN city TO employee_city;
-- Q56. Drop the phone_number column.
ALTER TABLE employees
DROP COLUMN phone_number;
-- Q57. Display employee names in uppercase.
SELECT UPPER(employee_name)
FROM employees;
-- Q58. Display employee names in lowercase.
SELECT lower(employee_name)
FROM employees;
-- Q59. Display the length of every employee name.
SELECT employee_name, LENGTH(employee_name)
FROM employees;
-- Q60. Display the first three characters of every employee name.
SELECT employee_name, LEFT(employee_name, 3)
FROM employees;
-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
SELECT employee_name, ROUND(salary, -3)
FROM employees;

-- Q62. Display the current date.
SELECT CURDATE();
-- Q63. Calculate how many years each employee has worked using hire_date.
SELECT employee_name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;

-- Q64. Replace NULL department values with 'Unassigned' in the query result.
SELECT employee_name,
       COALESCE(department, 'Unassigned') AS department
FROM employees;
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges
SELECT employee_name, salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary <= 70000 THEN 'Medium'
           ELSE 'High'
       END AS salary_level
FROM employees;
-- Q66. Find the total number of employees.
select count(*) as employee_count
from employees;
-- Q67. Find the total salary paid to all employees.
select sum(salary) as employee_sum
from employee ;
-- Q68. Find the average salary of all employees.
select avg(salary) as avg_salary
from employee ;
-- Q69. Find the highest salary.
select max(salary) as max_salary
from employee ;

-- Q70. Find the lowest salary.
select min(salary) as lowest_salary
from employee ;
-- Q71. Find the number of employees in Hyderabad.
select count(*) as employee_count
from employee
where city ="hyderbad" ;
-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary) as total_salary
from employee
where city = "mumnbai" ;
-- Q73. Find the average salary of employees in Bangalore.
select avg(salary) as avg_salary
from employee
where city = "bangalore" ;
-- Q74. Find the number of employees in each department.
select department , count(*) as employees_name
from employee
group by department ;
-- Q75. Find the average salary in each department.
select department ,avg(emp_salary) as avg_salary
from employee
group by department ;

-- Q76. Find the maximum salary in each department.
select department ,max(emp_salary) as max_salary
from employee
group by department ;
-- Q77. Find the minimum salary in each department.
select department ,min (emp_salary) as min_salary
from employee
group by department ;
-- Q78. Find the total salary in each department.
select department ,sum (emp_salary) as sum_salary
from employee
group by department ;
-- Q79. Find the number of employees in each city.
select city ,count(*) as employee_count
from employee
group by city;
-- Q80. Find the average salary in each city.
select city , avg(salary) as avg_salary
from employee
group by city ;
-- Q81. Find departments having more than 5 employees.
select department , count(*) employee_count
from employee
group by department
having count(*) > 5 ;
-- Q82. Find departments whose average salary is greater than 60000.
select department ,avg(salary) as avg_salary
from employee
group by department
having avg(salary) > 60000 ;
-- Q83. Find cities whose total salary is greater than 200000.
select cities , sum(salary) as sum_salary
from employee
group by cities 
having sum(salary) > 200000;
-- Q84. Find the department with the highest total salary.
select department ,max(salary) as max_salary
from employee
group by department 
order by sum(salary) desc 
limit 1; 
-- Q85. Find the department with the highest average salary
select department ,avg(salary) as avg_salary
from employee
group by department 
order by avg(salary) desc 
limit 1; 
-- Q86. Display employee count and average salary for each department and city combination.
SELECT department, city,
COUNT(*) AS employee_count,
AVG(salary) AS average_salary
FROM employees
GROUP BY department, city;
-- Q87. Find the difference between the maximum and minimum salary in each department.
SELECT department,
MAX(salary) - MIN(salary) AS salary_difference
FROM employees
GROUP BY department;
-- Q88. Find departments where the maximum salary is greater than 70000.
SELECT department, MAX(salary) AS maximum_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;
-- Q89. Find cities having at least 3 employees with salary above 60000.
SELECT city, COUNT(*) AS employee_count
FROM employees
WHERE salary > 60000
GROUP BY city
HAVING COUNT(*) >= 3;

-- Q90. Find the total number of distinct departments and distinct cities.

SELECT COUNT(DISTINCT department) AS distinct_departments,
COUNT(DISTINCT city) AS distinct_cities
FROM employees;


-- Q91. Create a products table with product_id as PRIMARY KEY.
create table prouduct (
proudct_id int primary key
);
-- Q92. Create a users table where email must be UNIQUE.
create table users (
user_email varchar(30) unique 
);
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
create table orders (
order_amount int ,
check (orders_amount > 0)
);
-- Q94. Create a customers table where customer_name cannot be NULL.
create table customers(
customer_name varchar(30) ,
check (customer_name !=null)
); 
-- Q95. Create a table with a DEFAULT status value of 'Active'.
create table my (
cus_name varchar(10),
 default cus_name  = "active")
);
-- Q96. Insert a row that uses the DEFAULT value.
insert into my(
(id,name)
values
);
-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
insert into products (product_id)
values (1);
insert into products (product_id)
values (1);
-- Error: Duplicate PRIMARY KEY
-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
insert into users (user_id, email)
values (1, 'abc@gmail.com');
insert into users (user_id, email)
values (2, 'abc@gmail.com');
-- Error: Duplicate UNIQUE email
-- Q99. Create employees and departments with a FOREIGN KEY relationship.
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES departments(department_id)
);
-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
INSERT INTO departments
VALUES (1, 'IT');
INSERT INTO employees
VALUES (1, 'Alice', 1);
-- Q101. Attempt to insert an employee with a department_id that does not exist.
INSERT INTO employees
VALUES (2, 'Bob', 99);
-- Error: FOREIGN KEY constraint fails
-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
ALTER TABLE customers
ADD CONSTRAINT check_age CHECK (age BETWEEN 18 AND 60);
-- Q103. Create a composite PRIMARY KEY using two columns.
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (employee_id, attendance_date)
);
-- Q105. Create a table with a named constraint and then identify its purpose.
CREATE TABLE employees_test (
    employee_id INT PRIMARY KEY,
    salary DECIMAL(10,2),
    CONSTRAINT check_salary CHECK (salary > 0)
);
-- Q106. Display employee_name and department_name using an INNER JOIN.
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
SELECT e.employee_name, e.salary,
       d.department_name, d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
-- Q108. Find employees working in the Data Science department using a JOIN.
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Data Science';
-- Q109. Find employees working in departments located in Hyderabad.
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Hyderabad';
-- Q110. Display all employees even if they do not belong to any department.
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
-- Q111. Display all departments even if they have no employees.
SELECT d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;
-- Q112. Find departments that currently have no employees.
SELECT d.department_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Q113. Find employees who do not have a matching department.
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
SELECT d.department_name,
COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
-- Q115. Find the average salary in each department using JOIN and GROUP BY.
SELECT d.department_name,
AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
-- Q116. Display each department with employee count including departments with zero employees.
SELECT d.department_name,
COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q117. Display each department with total salary including departments with zero employees.
SELECT d.department_name,
COALESCE(SUM(e.salary), 0) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
-- Q118. Join departments with projects and display department_name and project_name.
SELECT d.department_name, p.project_name
FROM departments d
JOIN projects p
ON d.department_id = p.department_id;
-- Q119. Display employees, department names, and project names using appropriate joins.
SELECT e.employee_name,
d.department_name,
p.project_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN projects p
ON d.department_id = p.department_id;
-- Q120. Find departments that have at least one project.
SELECT DISTINCT d.department_name
FROM departments d
JOIN projects p
ON d.department_id = p.department_id;
-- Q121. Find departments that have no projects.
SELECT d.department_name
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;
-- Q122. Create an employee-manager relationship using manager_id in the employees table.
ALTER TABLE employees
ADD manager_id INT;
-- Q123. Using a SELF JOIN, display employee name and manager name.
SELECT e.employee_name AS employee,
m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;
-- Q124. Using a SELF JOIN, display only employees who have managers.
SELECT e.employee_name AS employee,
m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

-- Q125. Using a SELF JOIN, display employees who do not have managers.
SELECT e.employee_name AS employee
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IS NULL;
-- Q126. Find all managers who manage at least one employee.
SELECT DISTINCT m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
-- Q127. Count the number of employees reporting to each manager.
SELECT m.employee_name AS manager,
COUNT(e.employee_id) AS employee_count
FROM employees m
JOIN employees e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name;
-- Q128. Find managers who manage more than 3 employees.
SELECT m.employee_name AS manager,
COUNT(e.employee_id) AS employee_count
FROM employees m
JOIN employees e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name
HAVING COUNT(e.employee_id) > 3;
-- Q129. Display employee, manager, and employee salary using a SELF JOIN.
SELECT e.employee_name AS employee,
m.employee_name AS manager,
e.salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
-- Q130. Find employees whose salary is greater than their manager's salary.
SELECT e.employee_name, e.salary,
m.employee_name AS manager,
m.salary AS manager_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
-- Q131. Find employees who work in the same department as their manager.
SELECT e.employee_name,
m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;
-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
-- Q133. Use multiple JOINs to display employee, department, and project information.
SELECT e.employee_name,
d.department_name,
p.project_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN projects p
ON d.department_id = p.department_id;
-- Q134. Find the total project budget for each department.
SELECT d.department_name,
SUM(p.budget) AS total_project_budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;
-- Q135. Find departments whose total project budget is greater than their department budget.
SELECT d.department_name,
SUM(p.budget) AS total_project_budget,
d.budget AS department_budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name, d.budget
HAVING SUM(p.budget) > d.budget;
-- Q136. Find employees whose salary is greater than the overall average salary.
SELECT *
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
-- Q137. Find the employee or employees with the highest salary using a subquery.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
-- Q138. Find the employee or employees with the lowest salary using a subquery.
SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);
-- Q139. Find employees who earn the same salary as Alice.
SELECT *
FROM employees
WHERE salary = (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Alice'
);
-- Q140. Find employees who earn more than Alice.
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE employee_name = 'Alice'
);

-- Q141. Find employees working in the same department as Alice.
SELECT *
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE employee_name = 'Alice'
);
-- Q142. Find employees whose salary is greater than the average salary of their department.
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
-- Q143. Find employees whose salary is less than the average salary of their department.
SELECT *
FROM employees e
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
-- Q144. Find the department with the highest average salary using a subquery.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM employees
        GROUP BY department
    ) 
);
-- Q145. Find departments whose average salary is greater than the company average salary.
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);

-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Hyderabad'
);
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);

-- Q148. Find departments that have at least one employee using EXISTS.
SELECT *
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
-- Q149. Find departments that have no employees using NOT EXISTS.
SELECT *
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
-- Q150. Find employees whose salary is greater than every employee in the HR department.
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'Finance'
);
-- Q152. Find the second-highest distinct salary using a subquery.
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);

-- Q153. Find the third-highest distinct salary using a subquery.
SELECT MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);
-- Q154. Find employees with the second-highest distinct salary.
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);
-- Q155. Use a correlated subquery to find employees earning above their department average.
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
-- Q156. Create a CTE containing employees whose salary is greater than 60000.
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;
-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.*
FROM employees e
CROSS JOIN company_avg c
WHERE e.salary > c.avg_salary;
-- Q158. Use a CTE to calculate average salary by department.
WITH dept_avg AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_avg;
-- Q159. Use a CTE to find departments with average salary greater than 60000.
WITH dept_avg AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_avg
WHERE average_salary > 60000;
-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.
WITH dept_stats AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
),
high_departments AS (
    SELECT *
    FROM dept_stats
    WHERE average_salary > 60000
)
SELECT *
FROM high_departments;

-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.
WITH city_salary AS (
    SELECT city, SUM(salary) AS total_salary
    FROM employees
    GROUP BY city
)
SELECT *
FROM city_salary
WHERE total_salary > 200000;
-- Q162. Use a CTE to find the highest salary in each department.
WITH dept_max AS (
    SELECT department, MAX(salary) AS highest_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_max;

-- Q163. Use a CTE to find employees earning above their department average.
WITH dept_avg AS (
    SELECT department, AVG(salary) AS average_salary
    FROM employees
    GROUP BY department
)
SELECT e.*
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.average_salary;
-- Q164. Use a CTE to rank employees by salary.
WITH ranked_employees AS (
    SELECT employee_name, salary,
           RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees;
-- Q165. Use a CTE to find the top 2 highest-paid employees.
WITH ranked_employees AS (
    SELECT employee_name, salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank <= 2;
-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.
WITH ranked_employees AS (
    SELECT employee_name, department, salary,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE rn = 1;
-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.
WITH ranked_employees AS (
    SELECT employee_name, department, salary,
           DENSE_RANK() OVER (
               PARTITION BY department
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked_employees
WHERE salary_rank = 2;
-- Q168. Create a CTE that joins employees and departments, then filter the result.
WITH employee_details AS (
    SELECT e.employee_name,
           e.salary,
           d.department_name
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
)
SELECT *
FROM employee_details
WHERE salary > 60000;

-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3
-- employees.
WITH dept_count AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_count
WHERE employee_count > 3;
-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.
WITH dept_salary AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
),
high_salary_dept AS (
    SELECT *
    FROM dept_salary
    WHERE total_salary > 200000
)
SELECT *
FROM high_salary_dept;
-- Q171. Assign a unique row number to all employees ordered by salary descending.
SELECT employee_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
-- Q172. Assign a row number to employees within each department ordered by salary descending.
SELECT employee_name, department, salary,
       ROW_NUMBER() OVER (
           PARTITION BY department
           ORDER BY salary DESC
       ) AS row_num
FROM employees;
-- Q173. Rank employees by salary using RANK().
SELECT employee_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
-- Q174. Rank employees by salary using DENSE_RANK().
SELECT employee_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.
SELECT employee_name, salary ,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number,
RANK() OVER (ORDER BY salary DESC) AS rank_number,
DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_number
FROM employees;
-- Q176. Display the company average salary beside every employee using AVG() OVER().
SELECT employee_name, salary,
       AVG(salary) OVER () AS company_average_salary
FROM employees;

-- Q177. Display the department average salary beside every employee using PARTITION BY.
SELECT employee_name, department, salary,
AVG(salary) OVER (
PARTITION BY department
       ) AS department_average_salary
FROM employees;
-- Q178. Calculate a running total of salary ordered by hire_date.
SELECT employee_name, hire_date, salary,
SUM(salary) OVER (
ORDER BY hire_date)
 AS running_total
FROM employees;

-- Q179. Use LAG() to display the previous employee's salary when ordered by hire_date.
SELECT employee_name, hire_date, salary,
LAG(salary) OVER (
ORDER BY hire_date)
 AS previous_salary
FROM employees;
-- Q180. Use LEAD() to display the next employee's salary when ordered by hire_date.
SELECT employee_name, hire_date, salary,
LEAD(salary) OVER (
ORDER BY hire_date)
 AS next_salary
FROM employees;

