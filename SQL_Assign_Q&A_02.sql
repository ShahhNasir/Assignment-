-- SECTION 1 — Database & Table Creation (Q1–Q20)

-- Q1. Create a database named company_db.
CREATE DATABASE IF NOT EXISTS company_db;

-- Q2. Select and use the company_db database.
USE company_db;

-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.
CREATE TABLE employees (
employee_id INT,
employee_name VARCHAR (100),
email_id VARCHAR (50),
salary DECIMAL (10,2),
city VARCHAR (30)
);

ALTER TABLE employees
RENAME COLUMN department TO department_id;

ALTER TABLE employees
MODIFY department_id INT;

-- Q4. Make employee_id the PRIMARY KEY.
ALTER TABLE employees
MODIFY employee_id INT PRIMARY KEY;

-- Q5. Make employee_name NOT NULL.
ALTER TABLE employees
MODIFY employee_name VARCHAR (100) NOT NULL;

-- Q6. Add a UNIQUE constraint to an email column.
ALTER TABLE employees
MODIFY email_id VARCHAR (50) UNIQUE;

-- Q7. Add a CHECK constraint so salary must be greater than 0.
ALTER TABLE employees
MODIFY salary DECIMAL(10,2) CHECK (salary > 0);

-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.
ALTER TABLE employees
MODIFY city VARCHAR (50) DEFAULT "Hyderabad";

-- Q9. Create a departments table with department_id, department_name, location, and budget.
CREATE TABLE departments (
department_id INT,
department_name VARCHAR(100),
location VARCHAR(100),
budget DECIMAL(10,2)
);

-- Q10. Make department_id the PRIMARY KEY in the departments table.
ALTER TABLE departments
ADD CONSTRAINT Pk PRIMARY KEY (department_id);

-- Q11. Create a projects table with project_id, project_name, department_id, and budget.
CREATE TABLE projects (
project_id INT,
project_name VARCHAR(100),
department_id INT,
budget DECIMAL(10,2)
);

SELECT * FROM projects;
INSERT INTO projects VALUES 
(1, "Sales Analytics",101, 200000),
(2, "Market Trends Analytics", 102, 200000),
(3, "HR Analytics", 104, 250000),
(4, "Finance Analytics", 105, 300000),
(5, "Healthcare Analytics", 106, 350000);

-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.

ALTER TABLE employees
ADD CONSTRAINT pk_fk_relation
FOREIGN KEY (department_id)
REFERENCES departments(department_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Q13. Insert one employee record.
INSERT INTO employees VALUES (01, 'John', 'John@gmail.com', 60000, 'Hyderabad', '2022-04-02', 101);

-- Q14. Insert five employee records in a single INSERT statement.
INSERT INTO employees
(employee_id, employee_name, email_id, salary, city, hire_date, department_id)
VALUES
(02, 'Bob', 'Bob@gmail.com', 60000, 'Mumbai', '2022-04-20', 102),
(03, 'Alice', 'Alice@gmail.com', 50000, 'Hyderabad', '2022-04-30', 103),
(04, 'Ali', 'Ali@gmail.com', 50000, 'Pune', '2022-09-20', 104),
(05, 'Chasey', 'Chasey@gmail.com', 40000, 'Delhi', '2022-10-20', 105),
(06, 'Jessy', 'Jessy@gmail.com', 30000, 'Mumbai', '2022-12-20', 106);

-- Q15. Insert a department record.
INSERT INTO departments VALUES (101, 'Data Science', 'Hyderabad', 500000);

-- Inserting 5 rows in departments
INSERT INTO departments
(department_id, department_name, location, budget)
VALUES
(102, 'Data Analytics', 'Delhi', 200000),
(103, 'Data Science', 'Hyderabad', 300000),
(104, 'Data Analytics', 'Delhi', 100000),
(105, 'Data Engineer', 'Delhi', 200000),
(106, 'AL/ML', 'Delhi', 400000);



-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
CREATE TABLE students (
student_id INT PRIMARY KEY,
student_name VARCHAR(100) NOT NULL,
email_id VARCHAR(50) UNIQUE,
country VARCHAR(50) DEFAULT 'India'
);

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.
CREATE TABLE attendance (
employee_id INT PRIMARY KEY,
attendance_date DATE,
status VARCHAR(20)
);

-- Q18. Create a table only if it does not already exist
CREATE TABLE IF NOT EXISTS employees;
CREATE TABLE IF NOT EXISTS customers (customer_id INT);

-- Q19. Describe or display the structure of the employees table.
DESC employees;

-- Q20. Drop a temporary table named temp_data if it exists.
DROP TABLE IF EXISTS temp_data;


-- 2. Basic SELECT & Filtering — Q21–45
USE company_db;
-- Q21. Display all columns from the employees table.
SELECT * FROM employees;

-- Q22. Display only employee_name and salary.
SELECT employee_name, salary FROM employees;

-- Q23. Display employees who live in Hyderabad.
SELECT * FROM employees WHERE city = 'Hyderabad';

-- Q24. Display employees whose salary is greater than 60000.
SELECT * FROM employees WHERE salary >= 60000;

-- Q25. Display employees whose salary is less than or equal to 50000.
SELECT * FROM employees WHERE salary <= 50000;

-- Q26. Display employees whose salary is between 50000 and 70000.
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;

-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
SELECT * FROM employees WHERE city IN ('Hyderabad', 'Banglore', 'Mumbai');

-- Q28. Display employees who do not live in Hyderabad.
SELECT * FROM employees WHERE NOT city = 'Hyderabad';

-- Q29. Display employees whose names start with 'A'.
SELECT * FROM employees WHERE employee_name LIKE 'A%';

-- Q30. Display employees whose names end with 'a'.
SELECT * FROM employees WHERE employee_name LIKE '%a';

-- Q31. Display employees whose names contain the letter 'i'.
SELECT * FROM employees WHERE employee_name LIKE '%i%';

-- Q32. Display employees whose department is NULL.
SELECT * FROM departments WHERE department_name IS NULL;

-- Q33. Display employees whose department is NOT NULL.
SELECT * FROM departments WHERE department_name IS NOT NULL;

-- Q34. Display employees hired after 2022-01-01.
SELECT * FROM employees WHERE hire_date ;

-- Q35. Display employees hired between two given dates.
SELECT * FROM employees WHERE hire_date BETWEEN '2022-04-02' AND '2022-10-20';

-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
SELECT * FROM employees WHERE salary > 50000 AND city = 'Hyderabad';

-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
SELECT * FROM employees WHERE salary > 70000 OR city = 'Hyderabad';

-- Q38. Display employees who are NOT in the HR department.
SELECT * FROM departments WHERE NOT department_name = 'HR';

-- Q39. Display distinct cities from the employees table.
SELECT DISTINCT city FROM employees;

-- Q40. Display distinct departments from the employees table.
SELECT DISTINCT department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;

-- Q41. Display employees sorted by salary in ascending order.
SELECT * FROM employees ORDER BY salary;

-- Q42. Display employees sorted by salary in descending order.
SELECT * FROM employees ORDER BY salary DESC;

-- Q43. Display employees sorted first by department and then by salary descending.
SELECT d.department_name, e.salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
ORDER BY d.department_name DESC , e.salary DESC;


-- Q44. Display the first 5 employees after sorting by employee_id.
SELECT * FROM employees ORDER BY employee_id LIMIT 5;

-- Q45. Display the top 3 highest-paid employees.
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 3. UPDATE, DELETE, ALTER & Basic Functions — Q46–65

-- Q46. Update the salary of one employee using employee_id.
UPDATE employees
SET salary = 70000 
WHERE employee_id = 1;

-- Q47. Increase the salary of all employees by 10 percent.
	SELECT salary * 1.1 FROM employees;
    
-- Q48. Increase the salary of employees in the Data Science department by 5000.
SELECT e.salary + 5000, d.department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE department_name = 'Data Science';

-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
UPDATE employees
SET city = 'Bengaluru'
WHERE city = 'Banglore';

-- Q50. Delete one employee using employee_id.
DELETE FROM employees
WHERE employee_id = 3;

-- Q51. Delete employees whose salary is below a specified amount.
DELETE FROM employees
WHERE salary < 30000;

-- Q52. Add an email column to the employees table.
ALTER TABLE employees
ADD COLUMN email VARCHAR(30) UNIQUE;

-- Q53. Add a phone_number column to the employees table.
ALTER TABLE employees
ADD COLUMN phone_number BIGINT;

-- Q54. Modify the length of the employee_name column.
ALTER TABLE employees
MODIFY employee_name VARCHAR(50);

-- Q55. Rename the city column to employee_city.
ALTER TABLE employees
RENAME COLUMN city TO city_name;

-- Q56. Drop the phone_number column.
ALTER TABLE employees
DROP COLUMN phone_number;

-- Q57. Display employee names in uppercase.
SELECT employee_name,  UPPER(employee_name) AS upper_case FROM employees;

-- Q58. Display employee names in lowercase.
SELECT employee_name, LOWER(employee_name) AS Lower_case FROM employees;

-- Q59. Display the length of every employee name.
SELECT employee_name, length(employee_name) AS lenth FROM employees;

-- Q60. Display the first three characters of every employee name.
SELECT substring(employee_name, 1, 3) FROM employees;

-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
SELECT employee_name, floor(salary) FROM employees;

-- Q62. Display the current date.
SELECT current_date();

-- Q63. Calculate how many years each employee has worked using hire_date.
SELECT employee_name, timestampdiff(year, hire_date, curdate()) AS worked_years FROM employees;

-- Q64. Replace NULL department values with 'Unassigned' in the query result.
SELECT coalesce(department_name,'unssigned') FROM departments;

-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
SELECT employee_name, salary,
CASE
WHEN salary < 40000 THEN 'Low'
WHEN salary BETWEEN 30000 AND 60000 THEN 'Median'
ELSE 'High'
END AS salary_category
FROM employees;

-- 4. Aggregate Functions, GROUP BY & HAVING — Q66–90

-- Q66. Find the total number of employees.
SELECT COUNT(*) FROM employees;

-- Q67. Find the total salary paid to all employees.
SELECT SUM(salary) FROM employees;

-- Q68. Find the average salary of all employees.
SELECT AVG(salary) FROM employees;

-- Q69. Find the highest salary.
SELECT MAX(salary) FROM employees;

-- Q70. Find the lowest salary.
SELECT MIN(salary) FROM employees;

-- Q71. Find the number of employees in Hyderabad.
SELECT COUNT(employee_id) FROM employees
WHERE city_name = 'Hyderabad';

-- Q72. Find the total salary paid to employees in Mumbai.
SELECT SUM(salary) FROM employees
WHERE city_name = 'Mumbai';

-- Q73. Find the average salary of employees in Bangalore.
SELECT AVG(salary) FROM employees
WHERE city_name = 'Bengaluru';

-- Q74. Find the number of employees in each department.
SELECT department_name, COUNT(*) AS Emp_count
FROM departments GROUP BY department_name;

-- Q75. Find the average salary in each department.
SELECT d.department_name, AVG(salary) AS Avg_salary
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
GROUP BY department_name;

-- Q76. Find the maximum salary in each department.
SELECT d.department_name, MAX(salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
GROUP BY department_name;

-- Q77. Find the minimum salary in each department.
SELECT d.department_name, MIN(salary) AS lowest_salary
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
GROUP BY department_name;

-- Q78. Find the total salary in each department.
SELECT d.department_name, SUM(salary) AS total_salary
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
GROUP BY department_name;

-- Q79. Find the number of employees in each city.
SELECT city_name, COUNT(*) AS emp_count
FROM employees GROUP BY city_name;

-- Q80. Find the average salary in each city.
SELECT city_name, AVG(salary) AS Avg_salary
FROM employees GROUP BY city_name;

-- Q81. Find departments having more than 5 employees.
SELECT department_name, COUNT(*) AS emp_count
FROM departments GROUP BY department_name
HAVING emp_count > 5;

-- Q82. Find departments whose average salary is greater than 60000.
SELECT department_name, AVG(salary) AS Avg_salary
FROM departments AS d
INNER JOIN
employees AS e
ON d.department_id = e.department_id
GROUP BY department_name
HAVING Avg_salary > 60000;

-- Q83. Find cities whose total salary is greater than 200000.
SELECT city_name, SUM(salary) AS total_salary
FROM employees
GROUP BY city_name
HAVING total_salary >  200000;

-- Q84. Find the department with the highest total salary.
SELECT department_name, MAX(salary) AS highest_salary
FROM departments AS d
INNER JOIN
employees AS e
ON d.department_id = e.department_id
GROUP BY department_name;

-- Q85. Find the department with the highest average salary.
SELECT d.department_name, MAX(e.salary) AS highest_avg_salary
FROM employees AS e 
INNER JOIN departments AS d
On e.department_id = d.department_id
GROUP BY department_name
HAVING highest_avg_salary > ( SELECT AVG(salary) FROM employees);

-- Q86. Display employee count and average salary for each department and city combination.
SELECT department_name,
COUNT(employee_id) AS emp_count, AVG(salary) AS Avg_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY department_name;

-- Q87. Find the difference between the maximum and minimum salary in each department.
SELECT max(salary) - MIN(salary) AS difference_salary FROM employees;


-- Q88. Find departments where the maximum salary is greater than 70000.
SELECT department_name, MAX(salary) AS highest_salary
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING highest_salary > 70000;

-- Q89. Find cities having at least 3 employees with salary above 60000.
SELECT city_name,
count(*) AS emp_count, salary
FROM employees
GROUP BY city_name
HAVING emp_count > 3 AND salary > 60000;

-- Q90. Find the total number of distinct departments and distinct cities.
SELECT COUNT(DISTINCT department_name ) AS dept_count , COUNT(DISTINCT city_name) AS city_count
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id;

-- 5. Constraints, Keys & Data Integrity — Q91–105
-- Q91. Create a products table with product_id as PRIMARY KEY.
CREATE TABLE products (product_id INT PRIMARY KEY );

-- Q92. Create a users table where email must be UNIQUE.
CREATE TABLE users (email VARCHAR(30) UNIQUE);

-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
CREATE TABLE orders (order_amount DECIMAL(10,2) CHECK (order_amount > 0));

-- Q94. Create a customers table where customer_name cannot be NULL.
CREATE TABLE customers_table (customer_name VARCHAR(50) NOT NULL);

-- Q95. Create a table with a DEFAULT status value of 'Active'.
CREATE TABLE activity (status VARCHAR(20) DEFAULT 'Active');

-- Q96. Insert a row that uses the DEFAULT value.
INSERT INTO activity (status) VALUES ('Inactive');

-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
INSERT INTO products (product_id) VALUES (1);
INSERT INTO products (product_id) VALUES (1);
-- Explanation : The PK is violated, becuase the the value should be unique or not null. It does not allow duplicates.

-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
INSERT INTO users (email) VALUES ('123@gmail.com');
INSERT INTO users (email) VALUES ('123@gmail.com');
-- Explanation : The UNIQUE Constraint is violated,
-- becuase the the value should be unique. It does not allow duplicates.

-- Q99. Create employees and departments with a FOREIGN KEY relationship.
CREATE TABLE emp_table(emp_id INT PRIMARY KEY, dept_id INT);
CREATE TABLE dept_table(dept_id INT PRIMARY KEY);
ALTER TABLE emp_table
ADD CONSTRAINT pk_fk_relationship
FOREIGN KEY (dept_id) 
REFERENCES dept_table (dept_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
INSERT INTO emp_table VALUES (1, 101);
INSERT INTO dept_table VALUES(101);

-- Q101. Attempt to insert an employee with a department_id that does not exist.
INSERT INTO emp_table VALUES (2,102);
-- Explanation : Error - CANNOT add or update a child row : a fk constraint fails

-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
ALTER TABLE emp_table
ADD COLUMN age INT CHECK ( age BETWEEN 18 AND 60);

-- Q103. Create a composite PRIMARY KEY using two columns.
CREATE TABLE student_course (
stu_id INT,
course_id INT,
PRIMARY KEY (stu_id, course_id)
);

-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
	CREATE TABLE attendance_table (
    e_id INT,
    att_date DATE,
    PRIMARY KEY (e_id, att_date));
    
-- Q105. Create a table with a named constraint and then identify its purpose.
CREATE TABLE named (
age INT CHECK ( age >= 18));
-- Explanation : The CHECK () Constraint ensures age should be equal to and above 18.

-- 6. JOINs Including Self Join — Q106–135

-- Q106. Display employee_name and department_name using an INNER JOIN.
SELECT e.employee_name, d.department_name
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id;

-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
SELECT e.employee_name, e.salary,  d.department_name, d.location
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id;

-- Q108. Find employees working in the Data Science department using a JOIN.
SELECT e.employee_name, e.salary,  d.department_name, d.location
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id
WHERE d.department_name = 'Data Science';

-- Q109. Find employees working in departments located in Hyderabad.
SELECT e.employee_name, e.salary,  d.department_name, d.location
FROM employees AS e
INNER JOIN departments AS d
On e.department_id = d.department_id
WHERE d.location = 'Hyderabad';

-- Q110. Display all employees even if they do not belong to any department.
SELECT e.employee_name, e.salary,  d.department_name, d.location
FROM employees AS e
LEFT JOIN departments AS d
On e.department_id = d.department_id;

-- Q111. Display all departments even if they have no employees.
SELECT d.department_name, e.employee_name
FROM departments AS d
LEFT JOIN employees AS e
On d.department_id = e.department_id ;

-- Q112. Find departments that currently have no employees.
SELECT d.department_name, e.employee_name
FROM departments AS d
LEFT JOIN employees AS e
On d.department_id = e.department_id
WHERE employee_id IS NULL;

-- Q113. Find employees who do not have a matching department.
SELECT e.employee_name, d.department_name
FROM employees AS e
LEFT JOIN departments AS d
On e.department_id = d.department_id
WHERE department_name IS NULL;

-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
SELECT d.department_name, COUNT(e.employee_id) 
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Q115. Find the average salary in each department using JOIN and GROUP BY.
SELECT d.department_name, AVG(e.salary) 
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY d.department_name;

-- Q116. Display each department with employee count including departments with zero employees.
SELECT d.department_name, COUNT(e.employee_id) AS emp_count
FROM departments AS d 
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q117. Display each department with total salary including departments with zero employees.
SELECT d.department_name, SUM(e.salary) AS emp_count
FROM departments AS d 
LEFT JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q118. Join departments with projects and display department_name and project_name.
SELECT d.department_name, p.project_name
FROM departments AS d 
INNER JOIN projects AS p
ON d.department_id = p.department_id;

-- Q119. Display employees, department names, and project names using appropriate joins.
SELECT e.employee_name, d.department_name, p.project_name
FROM employees AS e
INNER JOIN departments AS d 
ON e.department_id = d.department_id
INNER JOIN projects AS p
ON p.department_id = d.department_id ;

-- Q120. Find departments that have at least one project.
SELECT * 
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
WHERE p.project_id IS NOT NULL;

-- Q121. Find departments that have no projects.
SELECT * 
FROM departments AS d
LEFT JOIN projects AS p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;

-- Q122. Create an employee-manager relationship using manager_id in the employees table.

-- Importing the emp_data table , to perform following queries
SELECT * FROM emp_data;

ALTER TABLE emp_data
ADD CONSTRAINT self_referenced_key
FOREIGN KEY (manager_id)
REFERENCES emp_data (emp_id)
ON UPDATE CASCADE
ON DELETE CASCADE;

-- Q123. Using a SELF JOIN, display employee name and manager name.
SELECT e.emp_name AS employee_name,
m.emp_name AS manager_name
FROM emp_data AS e
JOIN emp_data AS m
ON e.manager_id = m.emp_id;

-- Q124. Using a SELF JOIN, display only employees who have managers.
SELECT e.emp_name AS employee_name
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id;

-- Q125. Using a SELF JOIN, display employees who do not have managers.
SELECT e.emp_name AS employee_name,
m.emp_name AS manager_name
FROM emp_data AS e
LEFT JOIN emp_data AS m
ON e.manager_id = m.emp_id
WHERE m.emp_name IS NULL;

-- Q126. Find all managers who manage at least one employee.
SELECT m.emp_name AS manager_name,
COUNT(DISTINCT e.emp_name) AS emp_count
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(DISTINCT e.emp_name) >= 1;

-- Q127. Count the number of employees reporting to each manager.
SELECT m.emp_name AS manager_name,
COUNT(DISTINCT e.emp_name) AS emp_count
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name;

-- Q128. Find managers who manage more than 3 employees.
SELECT m.emp_name AS manager_name,
COUNT(DISTINCT e.emp_name) AS emp_count
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id
GROUP BY m.emp_name
HAVING COUNT(DISTINCT e.emp_name) > 3;

-- Q129. Display employee, manager, and employee salary using a SELF JOIN.
SELECT e.emp_name AS employee_name,
e.salary AS emp_salary,
m.emp_name AS manager_name,
m.salary AS manager_salary
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id;

-- Q130. Find employees whose salary is greater than their manager's salary.
SELECT e.emp_name AS employee_name,
e.salary AS emp_salary,
m.emp_name AS manager_name,
m.salary AS manager_salary
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

-- Q131. Find employees who work in the same department as their manager.
SELECT e.emp_name AS employee_name,
e.dept_name AS emp_dept,
m.emp_name AS manager_name,
m.dept_name AS manager_dept
FROM emp_data AS e
INNER JOIN emp_data AS m
ON e.manager_id = m.emp_id
WHERE e.dept_name =  m.dept_name;

-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
SELECT e.employee_name ,
d.department_name 
FROM employees AS e
LEFT JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.department_name IS NULL;

-- Q133. Use multiple JOINs to display employee, department, and project information.

SELECT e.employee_name,
d.department_name,
p.project_name
FROM departments AS d
INNER JOIN employees AS e
ON e.department_id = d.department_id
INNER JOIN projects AS p
ON p.department_id = d.department_id;

-- Q134. Find the total project budget for each department.
SELECT d.department_name,
SUM(p.budget) AS project_budget
FROM departments AS d
INNER JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY department_name;

-- Q135. Find departments whose total project budget is greater than their department budget.
SELECT d.department_name,
SUM(p.budget) AS project_budget,
d.budget AS dept_budget
FROM departments AS d
INNER JOIN projects AS p
ON d.department_id = p.department_id
GROUP BY department_name, d.budget
HAVING SUM(p.budget) > d.budget;