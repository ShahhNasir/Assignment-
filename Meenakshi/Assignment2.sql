CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    hire_date DATE
);
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);
ALTER TABLE employees
MODIFY employee_name VARCHAR(50) NOT NULL;
ALTER TABLE employees
ADD email VARCHAR(100);
ALTER TABLE employees
ADD UNIQUE (email);
ALTER TABLE employees
ADD CHECK (salary > 0);
ALTER TABLE employees
ALTER city SET DEFAULT 'Hyderabad';
ALTER TABLE employees
MODIFY city VARCHAR(50) DEFAULT 'Hyderabad';
CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(50),
    budget DECIMAL(12,2)
);
ALTER TABLE departments
ADD PRIMARY KEY (department_id);
CREATE TABLE projects (
    project_id INT,
    project_name VARCHAR(100),
    department_id INT,
    budget DECIMAL(12,2)
);
ALTER TABLE employees
ADD department_id INT;
ALTER TABLE employees
ADD FOREIGN KEY (department_id)
REFERENCES departments(department_id);
INSERT INTO employees
(employee_id, employee_name, department, salary, city, hire_date)
VALUES
(1, 'Alice', 'HR', 60000, 'Hyderabad', '2023-01-10');
INSERT INTO employees
(employee_id, employee_name, department, salary, city, hire_date)
VALUES
(2, 'Bob', 'Finance', 70000, 'Mumbai', '2022-05-15'),
(3, 'Charlie', 'IT', 80000, 'Bangalore', '2021-08-20'),
(4, 'David', 'HR', 55000, 'Hyderabad', '2023-03-12'),
(5, 'Emma', 'Finance', 75000, 'Mumbai', '2022-11-05'),
(6, 'Frank', 'IT', 90000, 'Bangalore', '2020-06-18');
INSERT INTO departments
(department_id, department_name, location, budget)
VALUES
(1, 'HR', 'Hyderabad', 500000);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'Active'
);
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);
CREATE TABLE IF NOT EXISTS temp_data (
    id INT,
    name VARCHAR(50)
);
DESC employees;
DESCRIBE employees;
DROP TABLE IF EXISTS temp_data;
SELECT *
FROM employees;
SELECT employee_name, salary
FROM employees;
SELECT *
FROM employees
WHERE city = 'Hyderabad';
SELECT *
FROM employees
WHERE salary > 60000;
SELECT *
FROM employees
WHERE salary <= 50000;
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 70000;
SELECT *
FROM employees
WHERE city IN ('Hyderabad', 'Bangalore', 'Mumbai');
SELECT *
FROM employees
WHERE city NOT IN ('Hyderabad');
SELECT *
FROM employees
WHERE city <> 'Hyderabad';
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';
SELECT *
FROM employees
WHERE employee_name LIKE '%a';
SELECT *
FROM employees
WHERE employee_name LIKE '%i%';
SELECT *
FROM employees
WHERE department IS NULL;
SELECT *
FROM employees
WHERE department IS NOT NULL;
SELECT *
FROM employees
WHERE hire_date > '2022-01-01';
SELECT *
FROM employees
WHERE hire_date BETWEEN '2022-01-01' AND '2023-12-31';
SELECT *
FROM employees
WHERE salary > 50000
AND city = 'Hyderabad';
SELECT *
FROM employees
WHERE city = 'Hyderabad'
OR salary > 70000;
SELECT *
FROM employees
WHERE department <> 'HR';
SELECT DISTINCT city
FROM employees;
SELECT DISTINCT department
FROM employees;
SELECT *
FROM employees
ORDER BY salary ASC;
SELECT *
FROM employees
ORDER BY salary DESC;
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5;
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5;
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;
UPDATE employees
SET salary = 65000
WHERE employee_id = 1;
UPDATE employees
SET salary = salary * 1.10;
UPDATE employees
SET salary = salary + 5000
WHERE department = 'Data Science';
UPDATE employees
SET city = 'Bengaluru'
WHERE city = 'Bangalore';
DELETE FROM employees
WHERE employee_id = 5;
DELETE FROM employees
WHERE salary < 30000;
ALTER TABLE employees
ADD email VARCHAR(100);
ALTER TABLE employees
ADD phone_number VARCHAR(15);
ALTER TABLE employees
MODIFY employee_name VARCHAR(100);
ALTER TABLE employees
RENAME COLUMN city TO employee_city;
ALTER TABLE employees
DROP COLUMN phone_number;
SELECT UPPER(employee_name) AS employee_name
FROM employees;
SELECT LOWER(employee_name) AS employee_name
FROM employees;
SELECT employee_name, LENGTH(employee_name) AS name_length
FROM employees;
SELECT employee_name, SUBSTRING(employee_name, 1, 3) AS first_three
FROM employees;
SELECT employee_name, ROUND(salary, -3) AS rounded_salary
FROM employees;
SELECT CURDATE();
SELECT CURRENT_DATE();
SELECT employee_name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;
SELECT employee_name,
       COALESCE(department, 'Unassigned') AS department
FROM employees;
SELECT employee_name,
       salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary <= 70000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category
FROM employees;
SELECT COUNT(*) AS total_employees
FROM employees;
SELECT SUM(salary) AS total_salary
FROM employees;
SELECT AVG(salary) AS average_salary
FROM employees;
SELECT MAX(salary) AS highest_salary
FROM employees;
SELECT MIN(salary) AS lowest_salary
FROM employees;
SELECT COUNT(*) AS employee_count
FROM employees
WHERE city = 'Hyderabad';
SELECT SUM(salary) AS total_salary
FROM employees
WHERE city = 'Mumbai';
SELECT AVG(salary) AS average_salary
FROM employees
WHERE city = 'Bangalore';
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
HAVING SUM(salary) > 200000;
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) = (
    SELECT MAX(total_salary)
    FROM (
        SELECT SUM(salary) AS total_salary
        FROM employees
        GROUP BY department
    ) AS x
);
SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);
SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);
SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);
SELECT employee_name, salary
FROM employees
WHERE salary < (
    SELECT AVG(salary)
    FROM employees
);
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
SELECT MIN(salary) AS second_lowest
FROM employees
WHERE salary > (
    SELECT MIN(salary)
    FROM employees
);
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
SELECT employee_name, department, salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
);
SELECT employee_name, department, salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary
LIMIT 1;
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > (
    SELECT AVG(salary)
    FROM employees
);
SELECT employee_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE employee_name = 'Alice'
);
SELECT employee_name, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);
SELECT employee_name, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);
SELECT employee_name, department
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 3
);
SELECT employee_name, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);
SELECT salary, COUNT(*) AS employee_count
FROM employees
GROUP BY salary
HAVING COUNT(*) > 1;
SELECT e.employee_name,
       e.department,
       d.department_name,
       d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;
SELECT e.employee_name,
       e.department_id,
       d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;
SELECT d.department_name,
       e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;
SELECT e.employee_name,
       d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;
SELECT e.employee_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
HAVING COUNT(e.employee_id) > 5;
SELECT d.department_name,
       SUM(e.salary) AS total_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;
SELECT p.project_name,
       d.department_name
FROM projects p
JOIN departments d
ON p.department_id = d.department_id;
SELECT p.project_name,
       d.department_name
FROM projects p
LEFT JOIN departments d
ON p.department_id = d.department_id;
SELECT d.department_name
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;
SELECT d.department_name,
       SUM(p.budget) AS total_project_budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_name;
SELECT d.department_name,
       SUM(p.budget) AS total_project_budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_name
HAVING SUM(p.budget) > 500000;
SELECT project_name, budget
FROM projects
ORDER BY budget DESC
LIMIT 1;
SELECT project_name, budget
FROM projects
ORDER BY budget ASC
LIMIT 1;
SELECT COUNT(*) AS total_projects
FROM projects;
SELECT AVG(budget) AS average_budget
FROM projects;
SELECT SUM(budget) AS total_budget
FROM projects;
SELECT MAX(budget) AS highest_budget
FROM projects;
SELECT MIN(budget) AS lowest_budget
FROM projects;
SELECT project_name, budget
FROM projects
WHERE budget > (
    SELECT AVG(budget)
    FROM projects
);
SELECT project_name, budget
FROM projects
WHERE budget < (
    SELECT AVG(budget)
    FROM projects
);
SELECT MAX(budget) AS second_highest_budget
FROM projects
WHERE budget < (
    SELECT MAX(budget)
    FROM projects
);
SELECT department_id, SUM(budget) AS total_budget
FROM projects
GROUP BY department_id
ORDER BY total_budget DESC
LIMIT 1;
SELECT department_id, COUNT(*) AS project_count
FROM projects
GROUP BY department_id;
SELECT department_id, COUNT(*) AS project_count
FROM projects
GROUP BY department_id
HAVING COUNT(*) > 2;
SELECT d.department_name,
       COUNT(p.project_id) AS project_count
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_name
ORDER BY project_count DESC
LIMIT 1;
SELECT e.employee_name,
       d.department_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Hyderabad';
SELECT e.employee_name,
       d.department_name,
       d.budget
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.budget > 500000;
SELECT d.department_name,
       AVG(e.salary) AS average_salary,
       d.budget
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name, d.budget
HAVING AVG(e.salary) > d.budget / 10;
SELECT DISTINCT e.employee_name
FROM employees e
JOIN projects p
ON e.department_id = p.department_id;
SELECT DISTINCT d.department_name
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
JOIN projects p
ON d.department_id = p.department_id;
SELECT DISTINCT d.department_name
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
LEFT JOIN projects p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;
SELECT DISTINCT d.department_name
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Hyderabad'
);
SELECT *
FROM employees
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
);
SELECT *
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);
SELECT *
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
SELECT *
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department_id = d.department_id
);
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.department_name = 'HR'
);
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
    WHERE d.department_name = 'Finance'
);
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);
SELECT MAX(salary) AS third_highest
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);
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
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = e.department_id
);
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.*
FROM employees e
CROSS JOIN company_avg c
WHERE e.salary > c.avg_salary;
WITH dept_avg AS (
    SELECT department_id,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_avg;
