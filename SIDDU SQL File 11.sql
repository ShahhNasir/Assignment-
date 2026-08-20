-- Q1. Create a database named company_db.

CREATE DATABASE company_db;

-- Q2. Select and use the company_db database.

USE company_db;
-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.

CREATE TABLE employees (
 employee_id INT,
 employee_name VARCHAR(100),
 department VARCHAR(50),
 salary DECIMAL(10,2),
 city VARCHAR(50),
 hire_date DATE
);
-- Q4. Make employee_id the PRIMARY KEY.

CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(100),
 department VARCHAR(50),
 salary DECIMAL(10,2),
 city VARCHAR(50),
 hire_date DATE
);
-- Q5. Make employee_name NOT NULL.

CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(100) NOT NULL,
 department VARCHAR(50),
 salary DECIMAL(10,2),
 city VARCHAR(50),
 hire_date DATE
);
-- Q6. Add a UNIQUE constraint to an email column.
ALTER TABLE employees ADD email VARCHAR(100) UNIQUE;

-- Q7. Add a CHECK constraint so salary must be greater than 0.
ALTER TABLE employees ADD CONSTRAINT chk_salary CHECK (salary > 0);

-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.

-- MySQL
ALTER TABLE employees
MODIFY city VARCHAR(50) DEFAULT 'Hyderabad';
-- Q9. Create a departments table with department_id, department_name, location, and budget.

CREATE TABLE departments (
 department_id INT,
 department_name VARCHAR(100),
 location VARCHAR(100),
 budget DECIMAL(12,2)
);
-- Q10. Make department_id the PRIMARY KEY in the departments table.

ALTER TABLE departments ADD PRIMARY KEY (department_id);
-- Q11. Create a projects table with project_id, project_name, department_id, and budget.

CREATE TABLE projects (
 project_id INT PRIMARY KEY,
 project_name VARCHAR(100),
 department_id INT,
 budget DECIMAL(12,2)
);
-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.

ALTER TABLE employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);
-- Q13. Insert one employee record.

INSERT INTO employees
(employee_id, employee_name, department, salary, city, hire_date)
VALUES
(1, 'Alice', 'HR', 50000, 'Hyderabad', '2023-01-15');
-- Q14. Insert five employee records in a single INSERT statement.

INSERT INTO employees
(employee_id, employee_name, department, salary, city, hire_date)
VALUES
(2, 'Bob', 'Finance', 60000, 'Bangalore', '2022-05-10'),
(3, 'Charlie', 'IT', 75000, 'Mumbai', '2021-08-20'),
(4, 'David', 'HR', 55000, 'Hyderabad', '2023-03-12'),
(5, 'Emma', 'Data Science', 85000, 'Bangalore', '2022-11-05'),
(6, 'Frank', 'IT', 70000, 'Mumbai', '2020-06-18');
-- Q15. Insert a department record.

INSERT INTO departments (department_id, department_name, location, budget) VALUES (1, 'HR', 'Hyderabad', 500000);
-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULTconstraints.

CREATE TABLE students (
 student_id INT PRIMARY KEY,
 student_name VARCHAR(100) NOT NULL,
 email VARCHAR(100) UNIQUE,
 age INT CHECK (age >= 18),
 city VARCHAR(50) DEFAULT 'Hyderabad'
);
-- Q17. Create a table named attendance with employee_id, attendance_date, and status.

CREATE TABLE attendance (employee_id INT, attendance_date DATE, status VARCHAR(20));
-- Q18. Create a table only if it does not already exist.

CREATE TABLE IF NOT EXISTS temp_data (id INT, name VARCHAR(100));
-- Q19. Describe or display the structure of the employees table.
DESCRIBE employees;
-- Q20. Drop a temporary table named temp_data if it exists.

DROP TABLE IF EXISTS temp_data;
-- Q21. Display all columns from the employees table.

SELECT * FROM employees;
-- Q22. Display only employee_name and salary.

SELECT employee_name, salary FROM employees;
-- Q23. Display employees who live in Hyderabad.

SELECT * FROM employees WHERE city = 'Hyderabad';
-- Q24. Display employees whose salary is greater than 60000.

SELECT * FROM employees WHERE salary > 60000;
-- Q25. Display employees whose salary is less than or equal to 50000.

SELECT * FROM employees WHERE salary <= 50000;
-- Q26. Display employees whose salary is between 50000 and 70000.

SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;
-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.

SELECT * FROM employees WHERE city IN ('Hyderabad', 'Bangalore', 'Mumbai');
-- Q28. Display employees who do not live in Hyderabad.

SELECT * FROM employees WHERE city <> 'Hyderabad';
-- Q29. Display employees whose names start with 'A'.

SELECT * FROM employees WHERE employee_name LIKE 'A%';
-- Q30. Display employees whose names end with 'a'.

SELECT * FROM employees WHERE employee_name LIKE '%a';
-- Q31. Display employees whose names contain the letter 'i'.

SELECT * FROM employees WHERE employee_name LIKE '%i%';
-- Q32. Display employees whose department is NULL.

SELECT * FROM employees WHERE department IS NULL;
-- Q33. Display employees whose department is NOT NULL.

SELECT * FROM employees WHERE department IS NOT NULL;
-- Q34. Display employees hired after 2022-01-01.

SELECT * FROM employees WHERE hire_date > '2022-01-01';
-- Q35. Display employees hired between two given dates.

SELECT * FROM employees WHERE hire_date BETWEEN '2022-01-01' AND '2023-12-31';
-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.

SELECT * FROM employees WHERE salary > 50000 AND city = 'Hyderabad';
-- Q37. Display employees who live in Hyderabad OR earn more than 70000.

SELECT * FROM employees WHERE city = 'Hyderabad' OR salary > 70000;
-- Q38. Display employees who are NOT in the HR department.

SELECT * FROM employees WHERE department <> 'HR';
-- Q39. Display distinct cities from the employees table.

SELECT DISTINCT city FROM employees;
-- Q40. Display distinct departments from the employees table.

SELECT DISTINCT department FROM employees;
-- Q41. Display employees sorted by salary in ascending order.

SELECT * FROM employees ORDER BY salary ASC;
-- Q42. Display employees sorted by salary in descending order.

SELECT * FROM employees ORDER BY salary DESC;
-- Q43. Display employees sorted first by department and then by salary descending.

SELECT * FROM employees ORDER BY department ASC, salary DESC;
-- Q44. Display the first 5 employees after sorting by employee_id.

SELECT * FROM employees ORDER BY employee_id LIMIT 5;
-- Q45. Display the top 3 highest-paid employees.

SELECT * FROM employees ORDER BY salary DESC LIMIT 3;
-- Q46. Update the salary of one employee using employee_id.

UPDATE employees SET salary = 65000 WHERE employee_id = 1;
-- Q47. Increase the salary of all employees by 10 percent.

UPDATE employees SET salary = salary * 1.10;
-- Q48. Increase the salary of employees in the Data Science department by 5000.

UPDATE employees SET salary = salary + 5000 WHERE department = 'Data Science';
-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.

UPDATE employees SET city = 'Bengaluru' WHERE city = 'Bangalore';
-- Q50. Delete one employee using employee_id.

DELETE FROM employees WHERE employee_id = 6;
-- Q51. Delete employees whose salary is below a specified amount.

DELETE FROM employees WHERE salary < 40000;
-- Q52. Add an email column to the employees table.

ALTER TABLE employees ADD email VARCHAR(100);
-- Q53. Add a phone_number column to the employees table.

ALTER TABLE employees ADD phone_number VARCHAR(15);
-- Q54. Modify the length of the employee_name column.

ALTER TABLE employees MODIFY employee_name VARCHAR(150);
-- Q55. Rename the city column to employee_city.

ALTER TABLE employees RENAME COLUMN city TO employee_city;
-- Q56. Drop the phone_number column.

ALTER TABLE employees DROP COLUMN phone_number;
-- Q57. Display employee names in uppercase.

SELECT UPPER(employee_name) AS employee_name FROM employees;
-- Q58. Display employee names in lowercase.

SELECT LOWER(employee_name) AS employee_name FROM employees;
-- Q59. Display the length of every employee name.

SELECT employee_name, LENGTH(employee_name) AS name_length FROM employees;
-- Q60. Display the first three characters of every employee name.

SELECT employee_name, LEFT(employee_name, 3) AS first_three_characters FROM employees;
-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.

SELECT employee_name, ROUND(salary, -3) AS rounded_salary FROM employees;
-- Q62. Display the current date.

SELECT CURRENT_DATE;
-- Q63. Calculate how many years each employee has worked using hire_date.

SELECT employee_name, TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked FROM employees;
-- Q64. Replace NULL department values with 'Unassigned' in the query result.

SELECT employee_name, COALESCE(department, 'Unassigned') AS department FROM employees;
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.

SELECT employee_name, salary,
 CASE
 WHEN salary < 50000 THEN 'Low'
 WHEN salary <= 70000 THEN 'Medium'
 ELSE 'High'
 END AS salary_category
FROM employees;
-- Q66. Find the total number of employees.

SELECT COUNT(*) AS total_employees FROM employees;
-- Q67. Find the total salary paid to all employees.

SELECT SUM(salary) AS total_salary FROM employees;
-- Q68. Find the average salary of all employees.

SELECT AVG(salary) AS average_salary FROM employees;
-- Q69. Find the highest salary.

SELECT MAX(salary) AS highest_salary FROM employees;
-- Q70. Find the lowest salary.

SELECT MIN(salary) AS lowest_salary FROM employees;
-- Q71. Find the number of employees in Hyderabad.

SELECT COUNT(*) AS total_employees FROM employees WHERE city = 'Hyderabad';
-- Q72. Find the total salary paid to employees in Mumbai.

SELECT SUM(salary) AS total_salary FROM employees WHERE city = 'Mumbai';
-- Q73. Find the average salary of employees in Bangalore.

SELECT AVG(salary) AS average_salary FROM employees WHERE city = 'Bangalore';
-- Q74. Find the number of employees in each department.

SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department;
-- Q75. Find the average salary in each department.

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department;
-- Q76. Find the maximum salary in each department.

SELECT department, MAX(salary) AS maximum_salary FROM employees GROUP BY department;
-- Q77. Find the minimum salary in each department.

SELECT department, MIN(salary) AS minimum_salary FROM employees GROUP BY department;
-- Q78. Find the total salary in each department.

SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department;
-- Q79. Find the number of employees in each city.

SELECT city, COUNT(*) AS employee_count FROM employees GROUP BY city;
-- Q80. Find the average salary in each city.

SELECT city, AVG(salary) AS average_salary FROM employees GROUP BY city;
-- Q81. Find departments having more than 5 employees.

SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department HAVING COUNT(*) > 5;
-- Q82. Find departments whose average salary is greater than 60000.

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department 
HAVING AVG(salary) > 60000;
-- Q83. Find cities whose total salary is greater than 200000.

SELECT city, SUM(salary) AS total_salary FROM employees GROUP BY city 
HAVING SUM(salary) > 200000;
-- Q84. Find the department with the highest total salary.

SELECT department, SUM(salary) AS total_salary FROM employees GROUP BY department 
ORDER BY total_salary DESC LIMIT 1;
-- Q85. Find the department with the highest average salary.

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department 
ORDER BY average_salary DESC LIMIT 1;
-- Q86. Display employee count and average salary for each department and city combination.

SELECT department, city, COUNT(*) AS employee_count, AVG(salary) AS average_salary FROM employees 
GROUP BY department, city;
-- Q87. Find the difference between the maximum and minimum salary in each department.

SELECT department, MAX(salary) - MIN(salary) AS salary_difference FROM employees GROUP BY department;
-- Q88. Find departments where the maximum salary is greater than 70000.

SELECT department, MAX(salary) AS maximum_salary FROM employees GROUP BY department HAVING MAX(salary) > 70000;
-- Q89. Find cities having at least 3 employees with salary above 60000.

SELECT city, COUNT(*) AS employee_count FROM employees WHERE salary > 60000 GROUP BY city HAVING COUNT(*) >= 3;
-- Q90. Find the total number of distinct departments and distinct cities.

SELECT COUNT(DISTINCT department) AS distinct_departments, COUNT(DISTINCT city) AS distinct_cities FROM employees;
-- Q91. Create a products table with product_id as PRIMARY KEY.

CREATE TABLE products (product_id INT PRIMARY KEY, product_name VARCHAR(100), price DECIMAL(10,2));
-- Q92. Create a users table where email must be UNIQUE.

CREATE TABLE users (user_id INT PRIMARY KEY, user_name VARCHAR(100), email VARCHAR(100) UNIQUE);
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.

CREATE TABLE orders (order_id INT PRIMARY KEY, order_amount DECIMAL(10,2) CHECK (order_amount > 0));
-- Q94. Create a customers table where customer_name cannot be NULL.

CREATE TABLE customers (customer_id INT PRIMARY KEY, customer_name VARCHAR(100) NOT NULL);
-- Q95. Create a table with a DEFAULT status value of 'Active'.

CREATE TABLE accounts (account_id INT PRIMARY KEY, account_name VARCHAR(100), status VARCHAR(20) DEFAULT 'Active');
-- Q96. Insert a row that uses the DEFAULT value.

INSERT INTO accounts (account_id, account_name) VALUES (1, 'Sai');
-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.

INSERT INTO products (product_id, product_name, price)
VALUES (1, 'Laptop', 60000);
INSERT INTO products (product_id, product_name, price)
VALUES (1, 'Mobile', 30000);
-- The second INSERT violates the PRIMARY KEY constraint.
-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.

INSERT INTO users (user_id, user_name, email)
VALUES (1, 'Rahul', 'rahul@gmail.com');
INSERT INTO users (user_id, user_name, email)
VALUES (2, 'Arun', 'rahul@gmail.com');
-- The second INSERT violates the UNIQUE constraint.
-- Q99. Create employees and departments with a FOREIGN KEY relationship
CREATE TABLE departments (
 department_id INT PRIMARY KEY,
 department_name VARCHAR(100)
);
CREATE TABLE employees (
 employee_id INT PRIMARY KEY,
 employee_name VARCHAR(100),
 department_id INT,
 FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.

INSERT INTO departments (department_id, department_name)
VALUES (1, 'IT');
INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (101, 'Rahul', 1);
-- Q101. Attempt to insert an employee with a department_id that does not exist.

INSERT INTO employees (employee_id, employee_name, department_id)
VALUES (102, 'Arun', 99);
-- Violates the FOREIGN KEY constraint if department 99 does not exist.
-- Q102. Add a CHECK constraint to allow age only between 18 and 60.

CREATE TABLE people (person_id INT PRIMARY KEY, person_name VARCHAR(100), age INT CHECK (age BETWEEN 18 AND 60));
-- Q103. Create a composite PRIMARY KEY using two columns.

CREATE TABLE student_courses (student_id INT, course_id INT, PRIMARY KEY (student_id, course_id));
-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.

CREATE TABLE attendance (employee_id INT, attendance_date DATE, status VARCHAR(20), PRIMARY KEY (employee_id, attendance_date));
-- Q105. Create a table with a named constraint and then identify its purpose.

CREATE TABLE employees_test (employee_id INT PRIMARY KEY, employee_name VARCHAR(100), salary DECIMAL(10,2), 
CONSTRAINT chk_employee_salary CHECK (salary > 0));
-- Q106. Display employee_name and department_name using an INNER JOIN.

SELECT e.employee_name, d.department_name FROM employees e 
INNER JOIN departments d ON e.department_id = d.department_id;
-- Q107. Display employee_name, salary, department_name, and location using a JOIN.

SELECT e.employee_name, e.salary, d.department_name, d.location FROM employees e 
JOIN departments d ON e.department_id = d.department_id;
-- Q108. Find employees working in the Data Science department using a JOIN.

SELECT e.employee_name FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
WHERE d.department_name = 'Data Science';
-- Q109. Find employees working in departments located in Hyderabad.

SELECT e.employee_name FROM employees e 
JOIN departments d ON e.department_id = d.department_id
 WHERE d.location = 'Hyderabad';
-- Q110. Display all employees even if they do not belong to any department.

SELECT e.employee_name, d.department_name FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id;
-- Q111. Display all departments even if they have no employees.

SELECT d.department_name, e.employee_name FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id;
-- Q112. Find departments that currently have no employees.

SELECT d.department_id, d.department_name FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
WHERE e.employee_id IS NULL;
-- Q113. Find employees who do not have a matching department.

SELECT e.employee_id, e.employee_name FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id 
WHERE d.department_id IS NULL;
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.

SELECT d.department_name, COUNT(e.employee_id) AS employee_count FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;
-- Q115. Find the average salary in each department using JOIN and GROUP BY.

SELECT d.department_name, AVG(e.salary) AS average_salary FROM departments d 
JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;
-- Q116. Display each department with employee count including departments with zero employees.

SELECT d.department_name, COUNT(e.employee_id) AS employee_count FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;
-- Q117. Display each department with total salary including departments with zero employees.

SELECT d.department_name, COALESCE(SUM(e.salary), 0) AS total_salary FROM departments d 
LEFT JOIN employees e ON d.department_id = e.department_id 
GROUP BY d.department_id, d.department_name;
-- Q118. Join departments with projects and display department_name and project_name.

SELECT d.department_name, p.project_name FROM departments d 
JOIN projects p ON d.department_id = p.department_id;
-- Q119. Display employees, department names, and project names using appropriate joins.

SELECT e.employee_name, d.department_name, p.project_name FROM employees e 
JOIN departments d ON e.department_id = d.department_id 
JOIN projects p ON d.department_id = p.department_id;
-- Q120. Find departments that have at least one project.

SELECT DISTINCT d.department_id, d.department_name FROM departments d 
JOIN projects p ON d.department_id = p.department_id;
-- Q121. Find departments that have no projects.

SELECT d.department_id, d.department_name FROM departments d 
LEFT JOIN projects p ON d.department_id = p.department_id 
WHERE p.project_id IS NULL;
-- Q122. Create an employee-manager relationship using manager_id in the employees table.

ALTER TABLE employees ADD manager_id INT; 
ALTER TABLE employees ADD CONSTRAINT fk_manager FOREIGN KEY (manager_id) 
REFERENCES employees(employee_id);
-- Q123. Using a SELF JOIN, display employee name and manager name.

SELECT e.employee_name AS employee, m.employee_name AS manager FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.employee_id;
-- Q124. Using a SELF JOIN, display only employees who have managers.

SELECT e.employee_name AS employee, m.employee_name AS manager FROM employees e 
INNER JOIN employees m ON e.manager_id = m.employee_id;
-- Q125. Using a SELF JOIN, display employees who do not have managers.

SELECT e.employee_name AS employee FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.employee_id 
WHERE e.manager_id IS NULL;
-- Q126. Find all managers who manage at least one employee.

SELECT DISTINCT m.employee_id, m.employee_name FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id;
-- Q127. Count the number of employees reporting to each manager.

SELECT m.employee_id, m.employee_name, COUNT(e.employee_id) AS employee_count FROM employees m 
JOIN employees e ON e.manager_id = m.employee_id GROUP BY m.employee_id, m.employee_name;
-- Q128. Find managers who manage more than 3 employees.

SELECT m.employee_id, m.employee_name, COUNT(e.employee_id) AS employee_count FROM employees m 
JOIN employees e ON e.manager_id = m.employee_id GROUP BY m.employee_id, m.employee_name 
HAVING COUNT(e.employee_id) > 3;
-- Q129. Display employee, manager, and employee salary using a SELF JOIN.

SELECT e.employee_name AS employee, m.employee_name AS manager, e.salary FROM employees e 
LEFT JOIN employees m ON e.manager_id = m.employee_id;
-- Q130. Find employees whose salary is greater than their managers salary.
SELECT e.employee_name AS employee, e.salary AS employee_salary, m.employee_name 
AS manager, m.salary AS manager_salary FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id WHERE e.salary > m.salary;
-- Q131. Find employees who work in the same department as their manager.

SELECT e.employee_name AS employee, m.employee_name AS manager, e.department_id FROM employees e 
JOIN employees m ON e.manager_id = m.employee_id WHERE e.department_id = m.department_id;
-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.

SELECT e.employee_id, e.employee_name, e.department_id FROM employees e 
LEFT JOIN departments d ON e.department_id = d.department_id WHERE d.department_id IS NULL;
-- Q133. Use multiple JOINs to display employee, department, and project information.

SELECT e.employee_name, d.department_name, p.project_name, p.budget FROM employees e 
JOIN departments d ON e.department_id = d.department_id JOIN projects p ON d.department_id = p.department_id;
-- Q134. Find the total project budget for each department.

SELECT d.department_name, SUM(p.budget) AS total_project_budget FROM departments d 
JOIN projects p ON d.department_id = p.department_id GROUP BY d.department_id, d.department_name;
-- Q135. Find departments whose total project budget is greater than their department budget.

SELECT d.department_name, d.budget AS department_budget, SUM(p.budget) AS total_project_budget FROM departments d 
JOIN projects p ON d.department_id = p.department_id GROUP BY d.department_id, d.department_name, d.budget 
HAVING SUM(p.budget) > d.budget;
-- Q136. Find employees whose salary is greater than the overall average salary.

SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees);
-- Q137. Find the employee or employees with the highest salary using a subquery.

SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees);
-- Q138. Find the employee or employees with the lowest salary using a subquery.

SELECT * FROM employees WHERE salary = (SELECT MIN(salary) FROM employees);
-- Q139. Find employees who earn the same salary as Alice.

SELECT * FROM employees WHERE salary = (SELECT salary FROM employees WHERE employee_name = 'Alice');
-- Q140. Find employees who earn more than Alice.

SELECT * FROM employees WHERE salary > (SELECT salary FROM employees WHERE employee_name = 'Alice');
-- Q141. Find employees working in the same department as Alice.

SELECT * FROM employees WHERE department = (SELECT department FROM employees WHERE employee_name = 'Alice');
-- Q142. Find employees whose salary is greater than the average salary of their department.

SELECT * FROM employees e WHERE salary > (SELECT AVG(salary) FROM employees WHERE department = e.department);
-- Q143. Find employees whose salary is less than the average salary of their department.

SELECT * FROM employees e WHERE salary < (SELECT AVG(salary) FROM employees WHERE department = e.department);
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
 ) AS department_averages
);
-- Q145. Find departments whose average salary is greater than the company average salary.

SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department HAVING AVG(salary) > 
(SELECT AVG(salary) FROM employees);
-- Q146. Find employees who work in departments located in Hyderabad using a subquery.

SELECT * FROM employees WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'Hyderabad');
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.

SELECT e.* FROM employees e WHERE NOT EXISTS (SELECT 1 FROM departments d WHERE d.department_id = e.department_id);
-- Q148. Find departments that have at least one employee using EXISTS.

SELECT d.* FROM departments d WHERE EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
-- Q149. Find departments that have no employees using NOT EXISTS.

SELECT d.* FROM departments d WHERE NOT EXISTS (SELECT 1 FROM employees e WHERE e.department_id = d.department_id);
-- Q150. Find employees whose salary is greater than every employee in the HR department.

SELECT * FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department = 'HR');
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.

SELECT * FROM employees WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'Finance');
-- Q152. Find the second-highest distinct salary using a subquery.

SELECT MAX(salary) AS second_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees);
-- Q153. Find the third-highest distinct salary using a subquery.

SELECT MAX(salary) AS third_highest_salary FROM employees WHERE salary < (SELECT MAX(salary) FROM employees WHERE salary < 
(SELECT MAX(salary) FROM employees));
-- Q154. Find employees with the second-highest distinct salary.

SELECT * FROM employees WHERE salary = (SELECT MAX(salary) FROM employees WHERE salary < (SELECT MAX(salary) FROM employees));
-- Q155. Use a correlated subquery to find employees earning above their department average.

SELECT e.* FROM employees e WHERE e.salary > (SELECT AVG(e2.salary) FROM employees e2 WHERE e2.department = e.department);
-- Q156. Create a CTE containing employees whose salary is greater than 60000.

WITH high_salary_employees AS (SELECT * FROM employees WHERE salary > 60000) SELECT * FROM high_salary_employees;
-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.

WITH company_average AS (SELECT AVG(salary) AS average_salary FROM employees) SELECT e.* FROM employees e 
CROSS JOIN company_average c WHERE e.salary > c.average_salary;
-- Q158. Use a CTE to calculate average salary by department.

WITH department_average AS (SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department) 
SELECT * FROM department_average;
-- Q159. Use a CTE to find departments with average salary greater than 60000.

WITH department_average AS (SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department) 
SELECT * FROM department_average WHERE average_salary > 60000;
-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.

WITH department_statistics AS (
 SELECT department, COUNT(*) AS employee_count,
 AVG(salary) AS average_salary, SUM(salary) AS total_salary
 FROM employees
 GROUP BY department
),
high_paying_departments AS (
 SELECT * FROM department_statistics
 WHERE average_salary > 60000
)
SELECT * FROM high_paying_departments;
-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.

WITH city_salary AS (SELECT city, SUM(salary) AS total_salary FROM employees GROUP BY city) 
SELECT * FROM city_salary WHERE total_salary > 200000;
-- Q162. Use a CTE to find the highest salary in each department.

WITH department_salary AS (SELECT department, MAX(salary) AS highest_salary FROM employees GROUP BY department) 
SELECT * FROM department_salary;
-- Q163. Use a CTE to find employees earning above their department average.

WITH department_average AS (SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department) 
SELECT e.* FROM employees e 
JOIN department_average d 
ON e.department = d.department 
WHERE e.salary > d.average_salary;
-- Q164. Use a CTE to rank employees by salary.

WITH ranked_employees AS (SELECT employee_id, employee_name, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM employees) 
SELECT * FROM ranked_employees;
-- Q165. Use a CTE to find the top 2 highest-paid employees.

WITH ranked_employees AS (SELECT employee_id, employee_name, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num FROM employees) 
SELECT * FROM ranked_employees WHERE row_num <= 2;
-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.

WITH ranked_employees AS (SELECT employee_id, employee_name, department, salary, 
ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS row_num FROM employees) 
SELECT * FROM ranked_employees WHERE row_num = 1;
-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.

WITH ranked_employees AS (SELECT employee_id, employee_name, department, salary, DENSE_RANK() 
OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank FROM employees) 
SELECT * FROM ranked_employees WHERE salary_rank = 2;
-- Q168. Create a CTE that joins employees and departments, then filter the result.

WITH employee_department AS (SELECT e.employee_id, e.employee_name, e.salary, d.department_name, d.location FROM employees e 
JOIN departments d ON e.department_id = d.department_id) 
SELECT * FROM employee_department WHERE location = 'Hyderabad';
-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3 employees.

WITH department_counts AS (SELECT department, COUNT(*) AS employee_count FROM employees GROUP BY department) 
SELECT * FROM department_counts WHERE employee_count > 3;
-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.

WITH department_salary AS (SELECT department, AVG(salary) AS average_salary FROM employees GROUP BY department), 
high_paying_departments AS 
(SELECT * FROM department_salary WHERE average_salary > 60000) SELECT * FROM high_paying_departments;
-- Q171. Assign a unique row number to all employees ordered by salary descending.

SELECT employee_id, employee_name, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num FROM employees;
-- Q172. Assign a row number to employees within each department ordered by salary descending.

SELECT employee_id, employee_name, department, salary, ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS 
row_num FROM employees;
-- Q173. Rank employees by salary using RANK().

SELECT employee_id, employee_name, salary, RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM employees;
-- Q174. Rank employees by salary using DENSE_RANK().

SELECT employee_id, employee_name, salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM employees;
-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.

SELECT employee_name, salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_number_rank, RANK() 
OVER (ORDER BY salary DESC) AS rank_value, DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_value FROM employees;
-- Q176. Display the company average salary beside every employee.

SELECT employee_name, salary, AVG(salary) OVER () AS company_average_salary FROM employees;
-- Q177. Display the department average salary beside every employee.

SELECT employee_name, department, salary, AVG(salary) OVER (PARTITION BY department) AS department_average_salary FROM employees;
-- Q178. Calculate a running total of salary ordered by hire_date.

SELECT employee_name, hire_date, salary, SUM(salary) 
OVER (ORDER BY hire_date ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 
running_total FROM employees;
-- Q179. Use LAG() to display the previous employees salary when ordered by hire_date.

SELECT employee_name, hire_date, salary, LAG(salary) OVER (ORDER BY hire_date) AS previous_salary FROM employees;
-- Q180. Use LEAD() to display the next employees  salary when ordered by hire_date.

SELECT employee_name, hire_date, salary, LEAD(salary) OVER (ORDER BY hire_date) AS next_salary FROM employees;
-- Q181. Find the top 3 highest-paid employees in every department, including ties if appropriate.

WITH ranked_employees AS (SELECT employee_id, employee_name, department, salary, DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank FROM employees) SELECT * FROM ranked_employees WHERE salary_rank <= 3;
-- Q182. Find the employee whose salary is closest to the average salary of their department.

WITH employee_average AS (SELECT employee_id, employee_name, department, salary, AVG(salary) 
OVER (PARTITION BY department) AS department_average FROM employees), ranked AS 
(SELECT *, ABS(salary - department_average) AS difference, ROW_NUMBER() 
OVER (PARTITION BY department 
ORDER BY ABS(salary - department_average)) AS rn FROM employee_average) 
SELECT * FROM ranked WHERE rn = 1;
-- Q183. For every department, find the difference between its highest-paid and second-highest distinct salary.

WITH ranked_salaries AS (
 SELECT department, salary,
 DENSE_RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
 FROM employees
),
department_salaries AS (
 SELECT department,
 MAX(CASE WHEN salary_rank = 1 THEN salary END) AS highest_salary,
 MAX(CASE WHEN salary_rank = 2 THEN salary END) AS second_highest_salary
 FROM ranked_salaries
 GROUP BY department
)
SELECT department, highest_salary, second_highest_salary,
 highest_salary - second_highest_salary AS salary_difference
FROM department_salaries;
-- Q184. Find employees whose salary is higher than their manager and whose department average salary is also above the company average.

WITH department_average AS (
 SELECT department_id, AVG(salary) AS department_avg
 FROM employees GROUP BY department_id
),
company_average AS (
 SELECT AVG(salary) AS company_avg FROM employees
)
SELECT e.employee_name, e.salary, m.employee_name AS manager_name, da.department_avg
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
JOIN department_average da ON e.department_id = da.department_id
CROSS JOIN company_average ca
WHERE e.salary > m.salary AND da.department_avg > ca.company_avg;
-- Q185. Find the first employee hired in each department and the most recently hired employee in each department.
WITH ranked_employees AS (
 SELECT employee_id, employee_name, department, hire_date,
 ROW_NUMBER() OVER (PARTITION BY department ORDER BY hire_date ASC) AS first_employee,
 ROW_NUMBER() OVER (PARTITION BY department ORDER BY hire_date DESC) AS latest_employee
 FROM employees
)
SELECT department,
 MAX(CASE WHEN first_employee = 1 THEN employee_name END) AS first_employee,
 MAX(CASE WHEN latest_employee = 1 THEN employee_name END) AS latest_employee
FROM ranked_employees
GROUP BY department;
-- Q186. Find departments where every employee earns more than 50000.

SELECT department FROM employees GROUP BY department HAVING MIN(salary) > 50000;
-- Q187. Find departments where at least 70 percent of employees earn above the company average salary.

WITH company_average AS (
 SELECT AVG(salary) AS average_salary FROM employees
),
department_percentage AS (
 SELECT e.department,
 100.0 * SUM(CASE WHEN e.salary > ca.average_salary THEN 1 ELSE 0 END) / COUNT(*) AS percentage_above_average
 FROM employees e CROSS JOIN company_average ca
 GROUP BY e.department
)
SELECT * FROM department_percentage WHERE percentage_above_average >= 70;
-- Q188. Find the longest consecutive hiring-date gap between employees when ordered by hire_date.

WITH hire_dates AS (
 SELECT employee_name, hire_date,
 LAG(hire_date) OVER (ORDER BY hire_date) AS previous_hire_date
 FROM employees
),
date_gaps AS (
 SELECT employee_name, hire_date, previous_hire_date,
 DATEDIFF(hire_date, previous_hire_date) AS gap_days
 FROM hire_dates
 WHERE previous_hire_date IS NOT NULL
)
SELECT * FROM date_gaps ORDER BY gap_days DESC LIMIT 1;
-- Q189. Find employees whose salary increased relative to the previous employee in their department when ordered by hire_date.

WITH salary_comparison AS (
 SELECT employee_id, employee_name, department, hire_date, salary,
 LAG(salary) OVER (PARTITION BY department ORDER BY hire_date) AS previous_salary
 FROM employees
)
SELECT * FROM salary_comparison WHERE salary > previous_salary;
-- Q190. Find the department with the largest salary inequality, measured as maximum salary minus minimum salary.

SELECT department, MAX(salary) - MIN(salary) AS salary_difference FROM employees GROUP BY department 
ORDER BY salary_difference DESC LIMIT 1;
-- Q191. Find employees who share their salary with another employee in the same department.

SELECT * FROM employees e WHERE EXISTS 
(SELECT 1 FROM employees e2 WHERE e2.department = e.department AND e2.salary = e.salary AND e2.employee_id <> e.employee_id);
-- Q192. Find the third-highest distinct salary in each department and return all employees who earn it.

WITH ranked_employees AS (SELECT employee_id, employee_name, department, salary, DENSE_RANK() 
OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank FROM employees) 
SELECT * FROM ranked_employees WHERE salary_rank = 3;
-- Q193. Find departments whose total employee salary exceeds their project budget, and return the difference.

WITH employee_salary AS (
 SELECT department_id, SUM(salary) AS total_employee_salary
 FROM employees GROUP BY department_id
),
project_budget AS (
 SELECT department_id, SUM(budget) AS total_project_budget
 FROM projects GROUP BY department_id
)
SELECT d.department_name, es.total_employee_salary, pb.total_project_budget,
 es.total_employee_salary - pb.total_project_budget AS difference
FROM departments d
JOIN employee_salary es ON d.department_id = es.department_id
JOIN project_budget pb ON d.department_id = pb.department_id
WHERE es.total_employee_salary > pb.total_project_budget;
-- Q194. Find employees who belong to departments with no projects but earn above their department average.

WITH employee_average AS (
 SELECT employee_id, employee_name, department_id, salary,
 AVG(salary) OVER (PARTITION BY department_id) AS department_average
 FROM employees
)
SELECT e.*
FROM employee_average e
WHERE e.salary > e.department_average
 AND NOT EXISTS (
 SELECT 1 FROM projects p WHERE p.department_id = e.department_id
 );
-- Q195. Return one row per department containing the employee with the highest salary, the employee with the lowest salary, 
-- and the department average.

WITH ranked_employees AS (
 SELECT employee_name, department, salary,
 AVG(salary) OVER (PARTITION BY department) AS department_average,
 ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary DESC) AS highest_rank,
 ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary ASC) AS lowest_rank
 FROM employees
)
SELECT department,
 MAX(CASE WHEN highest_rank = 1 THEN employee_name END) AS highest_paid_employee,
 MAX(CASE WHEN lowest_rank = 1 THEN employee_name END) AS lowest_paid_employee,
 MAX(department_average) AS department_average
FROM ranked_employees
GROUP BY department;
-- Q196. Find employees who are in the top 20 percent of salaries within their department.

WITH salary_groups AS (SELECT employee_id, employee_name, department, salary, NTILE(5) 
OVER (PARTITION BY department ORDER BY salary DESC) AS salary_group FROM employees) 
SELECT * FROM salary_groups WHERE salary_group = 1;
-- Q197. Find the median salary in each department.

WITH ranked_salaries AS (
 SELECT department, salary,
 ROW_NUMBER() OVER (PARTITION BY department ORDER BY salary) AS row_num,
 COUNT(*) OVER (PARTITION BY department) AS total_count
 FROM employees
)
SELECT department, AVG(salary) AS median_salary
FROM ranked_salaries
WHERE row_num IN (
 FLOOR((total_count + 1) / 2),
 FLOOR((total_count + 2) / 2)
)
GROUP BY department;
-- Q198. Find employees whose salary is greater than the average salary of all employees hired before them.

SELECT e.employee_id, e.employee_name, e.hire_date, e.salary FROM employees e WHERE e.salary > 
(SELECT AVG(e2.salary) FROM employees e2 WHERE e2.hire_date < e.hire_date);
-- Q199. Find managers whose direct reports collectively earn more than the manager and identify the
-- difference.

SELECT m.employee_id, m.employee_name AS manager_name, m.salary AS manager_salary, SUM(e.salary) AS reports_total_salary, SUM(e.salary) - 
m.salary AS difference FROM employees m 
JOIN employees e ON e.manager_id = m.employee_id 
GROUP BY m.employee_id, m.employee_name, m.salary 
HAVING SUM(e.salary) > m.salary;
-- Q200. Create a report showing for every employee: company salary rank, department salary rank,
-- department average, difference from department average, previous salary by hire date, and next salary
-- by hire date.

SELECT employee_id, employee_name, department, salary,
 RANK() OVER (ORDER BY salary DESC) AS company_salary_rank,
 RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS department_salary_rank,
 AVG(salary) OVER (PARTITION BY department) AS department_average,
 salary - AVG(salary) OVER (PARTITION BY department) AS difference_from_department_average,
 LAG(salary) OVER (PARTITION BY department ORDER BY hire_date) AS previous_salary,
 LEAD(salary) OVER (PARTITION BY department ORDER BY hire_date) AS next_salary
FROM employees;