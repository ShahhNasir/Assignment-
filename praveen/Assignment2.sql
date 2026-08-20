
CREATE DATABASE IF NOT EXISTS company_db;
USE company_db;
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    budget DECIMAL(12,2)
);


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2) CHECK (salary > 0),
    city VARCHAR(50) DEFAULT 'Hyderabad',
    hire_date DATE,

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

INSERT INTO departments
(department_id, department_name, location, budget)
VALUES
(101, 'IT', 'Hyderabad', 1000000);


INSERT INTO employees
(employee_id, employee_name, email, department, department_id, salary, city, hire_date)
VALUES
(1, 'Praveen', 'praveen@gmail.com', 'IT', 101, 50000, DEFAULT, '2026-01-10');

INSERT INTO employees
(employee_id, employee_name, email, department, department_id, salary, city, hire_date)
VALUES
(2, 'Raj', 'raj@gmail.com', 'IT', 101, 45000, 'Hyderabad', '2026-02-15'),
(3, 'Arun', 'arun@gmail.com', 'IT', 101, 55000, 'Bangalore', '2026-03-01'),
(4, 'Kiran', 'kiran@gmail.com', 'IT', 101, 60000, 'Chennai', '2026-03-10'),
(5, 'Rahul', 'rahul@gmail.com', 'IT', 101, 48000, 'Pune', '2026-04-05'),
(6, 'Anil', 'anil@gmail.com', 'IT', 101, 52000, 'Mumbai', '2026-04-20');


CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget DECIMAL(12,2),

    FOREIGN KEY (department_id)
        REFERENCES departments(department_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Hyderabad'
);

CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS temp_data (
    id INT,
    data_value VARCHAR(100)
);

DESCRIBE employees;

DROP TABLE IF EXISTS temp_data;

SHOW TABLES;
SHOW CREATE TABLE projects;
ALTER TABLE projects
DROP FOREIGN KEY projects_ibfk_1;
SHOW CREATE TABLE employees;
SHOW CREATE TABLE students;

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM projects;
SELECT * FROM students;
SELECT * FROM attendance;
-- 2. Basic SELECT & Filtering (21–45)
-- Q21. Display all columns from the employees table.
select * from employees;
-- Q22. Display only employee_name and salary.
select employee_name,salary from employees;
-- Q23. Display employees who live in Hyderabad.
select employee_name,city from employees where city='Hyderabad';
-- Q24. Display employees whose salary is greater than 60000.
select employee_name,salary from employees where salary>60000;
-- Q25. Display employees whose salary is less than or equal to 50000.
select employee_name,salary from employees where salary<=50000;
-- Q26. Display employees whose salary is between 50000 and 70000.
select employee_name,salary from employees where salary  between 50000 and 70000;
-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
select employee_name,city from employees where city in ('Hyderabad','Bangalore','Mumbai');
-- Q28. Display employees who do not live in Hyderabad.
select employee_name from employees ;
-- Q29. Display employees whose names start with 'A'
select employee_name from employees where employee_name like 'A%';
-- Q30. Display employees whose names end with 'a'.
select employee_name from employees where employee_name like '%a';
-- Q31. Display employees whose names contain the letter 'i'.
select employee_name from employees where employee_name like '%i%';
-- Q32. Display employees whose department is NULL.
select department from employees where department is null;
-- Q33. Display employees whose department is NOT NULL.
select employee_name,department from employees where department is not null;
-- Q34. Display employees hired after 2022-01-01.
select employee_name,hire_date from employees where hire_date>'2022-01-01';
-- Q35. Display employees hired between two given dates.
select employee_name,hire_date from employees where hire_date between '2026-01-10' and '2026-04-05';
-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select employee_name,salary from employees where salary >50000 and city='Hyderabad';
-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select employee_name from employees where city='Hyderabad' or salary>70000;
-- Q38. Display employees who are NOT in the HR department.
select employee_name from employees where department not in ('HR');
-- Q39. Display distinct cities from the employees table.     
select distinct city from employees ; 
-- Q40. Display distinct departments from the employees table.
select distinct department from employees;
-- Q41. Display employees sorted by salary in ascending order.
select employee_name,salary from employees order by salary;
-- Q42. Display employees sorted by salary in descending order.
select employee_name,salary from employees order by salary desc;
-- Q43. Display employees sorted first by department and then by salary descending.
select department,salary from employees order by department,salary desc;
-- Q44. Display the first 5 employees after sorting by employee_id.
select employee_name from employees order by employee_id desc limit 5;
-- Q45. Display the top 3 highest-paid employees.
select employee_name,salary from employees order by salary desc limit 3;

-- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65)
-- Q46. Update the salary of one employee using employee_id.
update employees set salary='55000' where employee_id=2;
update employees set salary='60000' where employee_id=1;
-- Q47. Increase the salary of all employees by 10 percent.
update employees set salary=salary+(salary*0.10) ;
-- Q48. Increase the salary of employees in the Data Science department by 5000.
update employees set salary=salary+5000 where department = 'Datascience';
-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update employees set city='Bengaluru' where city='Bangalore';
-- Q50. Delete one employee using employee_id.
delete from employees where employee_id='5';
-- Q51. Delete employees whose salary is below a specified amount.
delete from employees where salary<45000;
-- Q52. Add an email column to the employees table.
alter table employees 
add email varchar(20);
-- Q53. Add a phone_number column to the employees table.
alter table employees 
add phone_number int;
-- Q54. Modify the length of the employee_name column.
alter table employees modify employee_name varchar(100);
-- Q55. Rename the city column to employee_city.
alter table employees rename column city to employee_city;
-- Q56. Drop the phone_number column.
alter table employees drop column phone_number;
-- Q57. Display employee names in uppercase.
select upper(employee_name) from employees;
-- Q58. Display employee names in lowercase
select lower(employee_name) from employees;
-- Q59. Display the length of every employee name.
select length(employee_name) from employees;
-- Q60. Display the first three characters of every employee name.
select left(employee_name,3) as first_three_char from employees;
-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select employee_name,salary, round(salary,-3) as round_figure from employees;
-- Q62. Display the current date.
select current_date();
-- Q63. Calculate how many years each employee has worked using hire_date.
select employee_name,hire_date, timestampdiff(month,hire_date,curdate()) as years_worked from employees;
-- Q64. Replace NULL department values with 'Unassigned' in the query result.
select employee_name, coalesce(department,'unassigned') from employees;
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
Select employee_name,salary,
       case
           when salary < 30000 THEN 'Low'
           when salary BETWEEN 30000 AND 60000 THEN 'Medium'
           else 'High'
       END AS salary_category
FROM employees;

-- 4. Aggregate Functions, GROUP BY & HAVING (66–90)
-- Q66. Find the total number of employees.
select count(employee_name) from employees;
-- Q67. Find the total salary paid to all employees.
select sum(salary) from employees;
-- Q68. Find the average salary of all employees.
select avg(salary) from employees;
-- Q69. Find the highest salary.
select max(salary) from employees;
-- Q70. Find the lowest salary.
select min(salary) from employees;
-- Q71. Find the number of employees in Hyderabad.
select count(employee_name) from employees where employee_city='Hyderabad';
-- Q72. Find the total salary paid to employees in Mumbai.
select  sum(salary),employee_city from employees group by employee_city having employee_city='Mumbai';
-- Q73. Find the average salary of employees in Bangalore.
select avg(salary),employee_city from employees where employee_city='Bangalore';
-- Q74. Find the number of employees in each department.
select count(employee_name),department from employees group by department;
-- Q75. Find the average salary in each department.
select avg(salary),department from employees group by department;
-- Q76. Find the maximum salary in each department.
select max(salary),department from employees group by department;
-- Q77. Find the minimum salary in each department.
select min(salary),department from employees group by department;
-- Q78. Find the total salary in each department.
select sum(salary),department from employees group by department;
-- Q79. Find the number of employees in each city.
select count(employee_name),employee_city from employees group by employee_city;
-- Q80. Find the average salary in each city.
select avg(salary),employee_city from employees group by employee_city;
-- Q81. Find departments having more than 5 employees.
select department from employees group by department having count(*)>0 ;
-- Q82. Find departments whose average salary is greater than 60000.
select department,avg(salary) from employees group by department having avg(salary)>60000;
-- Q83. Find cities whose total salary is greater than 200000.
select employee_city,sum(salary) from employees group by employee_city having sum(salary)>20000; 
-- Q84. Find the department with the highest total salary.
select department, max(salary) from employees group by department order by max(salary) desc limit 1;
-- Q85. Find the department with the highest average salary.
select department, avg(salary) from employees group by department order by avg(salary) desc limit 1;
-- Q86. Display employee count and average salary for each department and city combination.
select department,employee_city,count(employee_name),avg(salary) from employees group by department,employee_city;
-- Q87. Find the difference between the maximum and minimum salary in each department.
select department, max(salary),min(salary), max(salary)-min(salary) from employees group by department;
-- Q88. Find departments where the maximum salary is greater than 70000.
select department,max(salary) from employees group by department having max(salary)>70000;
-- Q89. Find cities having at least 3 employees with salary above 60000.
SELECT employee_city,COUNT(*) AS employee_count from employees
WHERE salary > 60000
GROUP BY employee_city
HAVING COUNT(*) >= 3;
-- Q90. Find the total number of distinct departments and distinct cities.
SELECT COUNT(DISTINCT department) AS total_departments,
       COUNT(DISTINCT city) AS total_cities
FROM employees;

-- 5. Constraints, Keys & Data Integrity (91–105)
-- Q91. Create a products table with product_id as PRIMARY KEY.
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);
-- Q92. Create a users table where email must be UNIQUE.
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100) UNIQUE
);
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10,2) CHECK (order_amount > 0)
);
-- Q94. Create a customers table where customer_name cannot be NULL.
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);
-- Q95. Create a table with a DEFAULT status value of 'Active'.
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Active'
);
-- Q96. Insert a row that uses the DEFAULT value.
INSERT INTO accounts (account_id, account_name)
VALUES (1, 'Praveen');
-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
INSERT INTO products (product_id, product_name, price)
VALUES (1, 'Laptop', 50000);
-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
INSERT INTO users (user_id, username, email)
VALUES (1, 'Praveen', 'praveen@gmail.com');
-- Q99. Create employees and departments with a FOREIGN KEY relationship.
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
INSERT INTO departments
VALUES
(1, 'IT'),
(2, 'HR');
-- Q101. Attempt to insert an employee with a department_id that does not exist.
INSERT INTO employees
VALUES (103, 'Arun', 5);
-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
CREATE TABLE people (
    person_id INT PRIMARY KEY,
    person_name VARCHAR(100),
    age INT CHECK (age BETWEEN 18 AND 60)
);
-- Q103. Create a composite PRIMARY KEY using two columns.
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE,
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
CREATE TABLE employees_details (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    age INT,
    
    CONSTRAINT chk_employee_age
    CHECK (age BETWEEN 18 AND 60)
);

-- 6. JOINs Including Self Join (106–135)
-- Q106. Display employee_name and department_name using an INNER JOIN.
select employee_name , department from employees as e 
inner join departments as d on e.department_id = d.department_id;
-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
select employee_name,salary,department,location from employees as e 
join departments as d on e.department_id = d.department_id;
-- Q108. Find employees working in the Data Science department using a JOIN.
select employee_name,department from employees as e 
inner join departments as d on e.department_id = d.department_id
where department='Datascience';
-- Q109. Find employees working in departments located in Hyderabad.
select employee_name,department,location from employees as E 
inner join departments as D on E.department_id=d.department_id
where location= 'Hyderabad';
-- Q110. Display all employees even if they do not belong to any department
select employee_name from employees as E left join departments as D on
E.department_id = D.department_id;
-- Q111. Display all departments even if they have no employees.
select department_name from departments as D left join employees as E 
on D.department_id=E.department_id;
-- Q112. Find departments that currently have no employees.
select employee_name,department_name from employees as E right join departments as D
on E.department_id = D.department_id
where employee_id is null;
-- Q113. Find employees who do not have a matching department.
select employee_name,department_name from employees as E left join departments as D
on E.department_id=D.department_id 
where department_name is null;
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
select count(employee_name) as employee_count ,department_name  from employees as E inner join departments as D 
on E.department_id = D.department_id
group by department_name;
-- Q115. Find the average salary in each department using JOIN and GROUP BY.
select avg(salary) as avg_salary,department_name from employees as E inner join departments as D 
on E.department_id = D.department_id
group by department_name;
-- Q116. Display each department with employee count including departments with zero employees.
select count(employee_name) as employee_count, department_name from departments as D
left join employees as E
on D.department_id = E.department_id
group by department_name;
-- Q117. Display each department with total salary including departments with zero employees.
select sum(salary) as Total_salary,department_name from departments as D left join employees as E
on D.department_id = E.department_id
group by department_name;
-- Q118. Join departments with projects and display department_name and project_name.
-- Q119. Display employees, department names, and project names using appropriate joins.
-- Q120. Find departments that have at least one project.
-- Q121. Find departments that have no projects.
-- Q122. Create an employee-manager relationship using manager_id in the employees table.
-- Q123. Using a SELF JOIN, display employee name and manager name.
-- Q124. Using a SELF JOIN, display only employees who have managers.
-- Q125. Using a SELF JOIN, display employees who do not have managers.
-- Q126. Find all managers who manage at least one employee.
-- Q127. Count the number of employees reporting to each manager.
-- Q128. Find managers who manage more than 3 employees.
-- Q129. Display employee, manager, and employee salary using a SELF JOIN.
-- SQL Practice Bank • Page 5
-- Q130. Find employees whose salary is greater than their manager's salary.
-- Q131. Find employees who work in the same department as their manager.
-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
-- Q133. Use multiple JOINs to display employee, department, and project information.
-- Q134. Find the total project budget for each department.
-- Q135. Find departments whose total project budget is greater than their department budget.

-- 7. Subqueries (136–155)
-- Q136. Find employees whose salary is greater than the overall average salary.
select employee_name,salary as avg_salary from employees where salary>
(select avg(salary) as avg_salary from employees);
-- Q137. Find the employee or employees with the highest salary using a subquery.
select max(salary) from employees where salary=(select max(salary) from employees);
-- Q138. Find the employee or employees with the lowest salary using a subquery.
select min(salary) from employees where salary=(select min(salary) from employees);
-- Q139. Find employees who earn the same salary as Alice.
select employee_name,salary from employees
where salary=(select employee_name from employees where employee_name='Arun');
-- Q140. Find employees who earn more than Alice.
select employee_name,salary from employees
where salary>(select salary from employees where employee_name='Arun');
-- Q141. Find employees working in the same department as Alice.
select employee_name,department from employees 
where department = (select department from employees where employee_name='Arun');
-- Q142. Find employees whose salary is greater than the average salary of their department.
select employee_name,salary from employees where salary >(select avg(salary),department from employees group by department );
-- Q143. Find employees whose salary is less than the average salary of their department.
select employee
-- Q144. Find the department with the highest average salary using a subquery.
-- Q145. Find departments whose average salary is greater than the company average salary.
-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.
-- Q148. Find departments that have at least one employee using EXISTS.
-- Q149. Find departments that have no employees using NOT EXISTS.
-- Q150. Find employees whose salary is greater than every employee in the HR department.
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
-- Q152. Find the second-highest distinct salary using a subquery.
-- Q153. Find the third-highest distinct salary using a subquery.
-- Q154. Find employees with the second-highest distinct salary.



