CREATE DATABASE company_db;
USE company_db;
CREATE TABLE employees (
    employee_id INT,
    employee_name VARCHAR(100),
    department_id INT,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    hire_date DATE
);
ALTER TABLE employees
ADD PRIMARY KEY (employee_id);

ALTER TABLE employees
MODIFY employee_name VARCHAR(100) NOT NULL;

-- Q6
ALTER TABLE employees
ADD email VARCHAR(100) UNIQUE;

-- Q7
ALTER TABLE employees
ADD CONSTRAINT chk_salary CHECK (salary > 0);

-- Q8
ALTER TABLE employees
ALTER city SET DEFAULT 'Hyderabad';

-- Q9

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100),
    location VARCHAR(100),
    budget DECIMAL(12,2)
);

ALTER TABLE departments
ADD PRIMARY KEY (department_id);



-- Q11
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    department_id INT,
    budget DECIMAL(12,2)
);

-- Q12
ALTER TABLE employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

SELECT * FROM departments;
-- Q13
INSERT INTO employees
(employee_id, employee_name, department_id, department, salary, city, hire_date)
VALUES
(1, 'Alice', 10, 'IT', 65000, 'Hyderabad', '2023-01-10');

-- Q14
INSERT INTO employees
(employee_id, employee_name, department_id, department, salary, city, hire_date)
VALUES
(2, 'Bob', 20, 'HR', 55000, 'Bangalore', '2022-05-15'),
(3, 'Charlie', 10, 'IT', 75000, 'Mumbai', '2021-06-20'),
(4, 'David', 30, 'Finance', 60000, 'Hyderabad', '2023-03-12'),
(5, 'Eva', 20, 'HR', 80000, 'Bangalore', '2020-09-01');

-- Q15
INSERT INTO departments
(department_id, department_name, location, budget)
VALUES
(10, 'IT', 'Hyderabad', 500000);

-- Q16
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Hyderabad'
);

-- Q17
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

-- Q18
CREATE TABLE IF NOT EXISTS temp_data (
    id INT
);

-- Q19
DESC employees;

-- Q20
DROP TABLE IF EXISTS temp_data;

-- Q21
SELECT * FROM employees;

-- Q22
SELECT employee_name, salary
FROM employees;

-- Q23
SELECT *
FROM employees
WHERE city = 'Hyderabad';

-- Q24
SELECT *
FROM employees
WHERE salary > 60000;

-- Q25
SELECT *
FROM employees
WHERE salary <= 50000;

-- Q26
SELECT *
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

-- Q27
SELECT *
FROM employees
WHERE city IN ('Hyderabad', 'Bangalore', 'Mumbai');

-- Q28
SELECT *
FROM employees
WHERE city <> 'Hyderabad';

-- Q29
SELECT *
FROM employees
WHERE employee_name LIKE 'A%';

-- Q30
SELECT *
FROM employees
WHERE employee_name LIKE '%a';

-- Q31
SELECT *
FROM employees
WHERE employee_name LIKE '%i%';

-- Q32
SELECT *
FROM employees
WHERE department IS NULL;

-- Q33
SELECT *
FROM employees
WHERE department IS NOT NULL;

-- Q34
SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

-- Q35
SELECT *
FROM employees
WHERE hire_date BETWEEN '2022-01-01' AND '2024-01-01';

-- Q36
SELECT *
FROM employees
WHERE salary > 50000
AND city = 'Hyderabad';

-- Q37
SELECT *
FROM employees
WHERE city = 'Hyderabad'
OR salary > 70000;

-- Q38
SELECT *
FROM employees
WHERE department <> 'HR';

-- Q39
SELECT DISTINCT city
FROM employees;

-- Q40
SELECT DISTINCT department
FROM employees;

-- Q41
SELECT *
FROM employees
ORDER BY salary ASC;

-- Q42
SELECT *
FROM employees
ORDER BY salary DESC;

-- Q43
SELECT *
FROM employees
ORDER BY department ASC, salary DESC;

-- Q44
SELECT *
FROM employees
ORDER BY employee_id
LIMIT 5;

-- Q45
SELECT *
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- Q46
UPDATE employees
SET salary = 70000
WHERE employee_id = 1;

-- Q47
UPDATE employees
SET salary = salary * 1.10;

-- Q48
UPDATE employees
SET salary = salary + 5000
WHERE department = 'Data Science';

-- Q49
UPDATE employees
SET city = 'Bengaluru'
WHERE city = 'Bangalore';

-- Q50
DELETE FROM employees
WHERE employee_id = 1;

-- Q51
DELETE FROM employees
WHERE salary < 40000;

-- Q52
ALTER TABLE employees
ADD email VARCHAR(100);

-- Q53
ALTER TABLE employees
ADD phone_number VARCHAR(20);

-- Q54
ALTER TABLE employees
MODIFY employee_name VARCHAR(150);

-- Q55
ALTER TABLE employees
RENAME COLUMN city TO employee_city;

-- Q56
ALTER TABLE employees
DROP COLUMN phone_number;

-- Q57
SELECT UPPER(employee_name)
FROM employees;

-- Q58
SELECT LOWER(employee_name)
FROM employees;

-- Q59
SELECT employee_name, LENGTH(employee_name)
FROM employees;

-- Q60
SELECT employee_name, LEFT(employee_name, 3)
FROM employees;

-- Q61
SELECT employee_name,
       ROUND(salary, -3) AS rounded_salary
FROM employees;

-- Q62
SELECT CURRENT_DATE();

-- Q63
SELECT employee_name,
       TIMESTAMPDIFF(YEAR, hire_date, CURDATE()) AS years_worked
FROM employees;

-- Q64
SELECT employee_name,
       COALESCE(department, 'Unassigned') AS department
FROM employees;

-- Q65
SELECT employee_name, salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary <= 70000 THEN 'Medium'
           ELSE 'High'
       END AS salary_level
FROM employees;

-- Q66
SELECT COUNT(*) AS total_employees
FROM employees;

-- Q67
SELECT SUM(salary) AS total_salary
FROM employees;

-- Q68
SELECT AVG(salary) AS average_salary
FROM employees;

-- Q69
SELECT MAX(salary) AS highest_salary
FROM employees;

-- Q70
SELECT MIN(salary) AS lowest_salary
FROM employees;

-- Q71
SELECT COUNT(*) AS hyderabad_employees
FROM employees
WHERE city = 'Hyderabad';

-- Q72
SELECT SUM(salary) AS mumbai_salary
FROM employees
WHERE city = 'Mumbai';

-- Q73
SELECT AVG(salary) AS bangalore_average
FROM employees
WHERE city = 'Bangalore';

-- Q74
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- Q75
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- Q76
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- Q77
SELECT department, MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- Q78
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- Q79
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city;

-- Q80
SELECT city, AVG(salary) AS average_salary
FROM employees
GROUP BY city;

-- Q81
SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

-- Q82
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;

-- Q83
SELECT city, SUM(salary) AS total_salary
FROM employees
GROUP BY city
HAVING SUM(salary) > 200000;

-- Q84
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

-- Q85
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC
LIMIT 1;

-- Q86
SELECT department, city,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department, city;

-- Q87
SELECT department,
       MAX(salary) - MIN(salary) AS salary_difference
FROM employees
GROUP BY department;

-- Q88
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department
HAVING MAX(salary) > 70000;

-- Q89
SELECT city, COUNT(*) AS employee_count
FROM employees
WHERE salary > 60000
GROUP BY city
HAVING COUNT(*) >= 3;

-- Q90
SELECT COUNT(DISTINCT department) AS departments,
       COUNT(DISTINCT city) AS cities
FROM employees;

-- Q91
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100)
);

-- Q92
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- Q93
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10,2) CHECK (order_amount > 0)
);

-- Q94
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

-- Q95
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Active'
);

-- Q96
INSERT INTO accounts(account_id)
VALUES (1);

-- Q97
INSERT INTO products(product_id, product_name)
VALUES (1, 'Laptop');

INSERT INTO products(product_id, product_name)
VALUES (1, 'Mouse');

-- Q98
INSERT INTO users(user_id, email)
VALUES (1, 'a@gmail.com');

INSERT INTO users(user_id, email)
VALUES (2, 'a@gmail.com');

-- Q99
CREATE TABLE departments2 (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employees2 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments2(department_id)
);

-- Q100
INSERT INTO departments2
VALUES (1, 'IT');

INSERT INTO employees2
VALUES (101, 'Alice', 1);

-- Q101
INSERT INTO employees2
VALUES (102, 'Bob', 999);

-- Q102
ALTER TABLE employees
ADD CONSTRAINT chk_age CHECK (age BETWEEN 18 AND 60);

-- Q103
CREATE TABLE student_courses (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);

-- Q104
CREATE TABLE attendance2 (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (employee_id, attendance_date)
);

-- Q105
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    amount DECIMAL(10,2),
    CONSTRAINT chk_payment_amount CHECK (amount > 0)
);

-- Q106
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id;

-- Q107
SELECT e.employee_name, e.salary,
       d.department_name, d.location
FROM employees e
JOIN departments d
ON e.department_id = d.department_id;

-- Q108
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_name = 'Data Science';

-- Q109
SELECT e.*
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
WHERE d.location = 'Hyderabad';

-- Q110
SELECT e.employee_name, d.department_name
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id;

-- Q111
SELECT d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id;

-- Q112
SELECT d.*
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

-- Q113
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Q114
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q115
SELECT d.department_name,
       AVG(e.salary) AS average_salary
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q116
SELECT d.department_name,
       COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q117
SELECT d.department_name,
       COALESCE(SUM(e.salary), 0) AS total_salary
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Q118
SELECT d.department_name, p.project_name
FROM departments d
JOIN projects p
ON d.department_id = p.department_id;

-- Q119
SELECT e.employee_name,
       d.department_name,
       p.project_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN projects p
ON d.department_id = p.department_id;

-- Q120
SELECT DISTINCT d.*
FROM departments d
JOIN projects p
ON d.department_id = p.department_id;

-- Q121
SELECT d.*
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
WHERE p.project_id IS NULL;

-- Q122
ALTER TABLE employees
ADD manager_id INT;

ALTER TABLE employees
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id)
REFERENCES employees(employee_id);

-- Q123
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- Q124
SELECT e.employee_name AS employee,
       m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

-- Q125
SELECT e.employee_name AS employee
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.manager_id IS NULL;

-- Q126
SELECT DISTINCT m.employee_id,
       m.employee_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

-- Q127
SELECT m.employee_name AS manager,
       COUNT(e.employee_id) AS employee_count
FROM employees m
JOIN employees e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name;

-- Q128
SELECT m.employee_name AS manager,
       COUNT(e.employee_id) AS employee_count
FROM employees m
JOIN employees e
ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name
HAVING COUNT(e.employee_id) > 3;

-- Q129
SELECT e.employee_name AS employee,
       m.employee_name AS manager,
       e.salary
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.employee_id;

-- Q130
SELECT e.employee_name,
       e.salary,
       m.employee_name AS manager,
       m.salary AS manager_salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

-- Q131
SELECT e.employee_name,
       m.employee_name AS manager
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.department_id = m.department_id;

-- Q132
SELECT e.*
FROM employees e
LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE d.department_id IS NULL;

-- Q133
SELECT e.employee_name,
       d.department_name,
       p.project_name
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
LEFT JOIN projects p
ON d.department_id = p.department_id;

-- Q134
SELECT d.department_name,
       COALESCE(SUM(p.budget), 0) AS total_project_budget
FROM departments d
LEFT JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name;

-- Q135
SELECT d.department_name,
       SUM(p.budget) AS project_budget,
       d.budget AS department_budget
FROM departments d
JOIN projects p
ON d.department_id = p.department_id
GROUP BY d.department_id, d.department_name, d.budget
HAVING SUM(p.budget) > d.budget;

-- Q156
WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 60000
)
SELECT *
FROM high_salary;

-- Q157
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary
    FROM employees
)
SELECT e.*
FROM employees e
CROSS JOIN company_avg c
WHERE e.salary > c.avg_salary;

-- Q158
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_avg;

-- Q159
WITH dept_avg AS (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_avg
WHERE avg_salary > 60000;

-- Q160
WITH dept_stats AS (
    SELECT department,
           COUNT(*) AS employee_count,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_dept AS (
    SELECT *
    FROM dept_stats
    WHERE avg_salary > 60000
)
SELECT *
FROM high_dept;

-- Q161
WITH city_salary AS (
    SELECT city, SUM(salary) AS total_salary
    FROM employees
    GROUP BY city
)
SELECT *
FROM city_salary
WHERE total_salary > 200000;

-- Q162
WITH dept_max AS (
    SELECT department,
           MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_max;

-- Q163
WITH employee_avg AS (
    SELECT *,
           AVG(salary) OVER(PARTITION BY department_id) AS dept_avg
    FROM employees
)
SELECT *
FROM employee_avg
WHERE salary > dept_avg;

-- Q164
WITH ranked AS (
    SELECT *,
           RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked;

-- Q165
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER(ORDER BY salary DESC) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 2;

-- Q166
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn = 1;

-- Q167
WITH ranked AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked
WHERE salary_rank = 2;

-- Q168
WITH emp_dept AS (
    SELECT e.*, d.department_name
    FROM employees e
    JOIN departments d
    ON e.department_id = d.department_id
)
SELECT *
FROM emp_dept;

-- Q169
WITH dept_count AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT *
FROM dept_count
WHERE employee_count > 3;

-- Q170
WITH dept_salary AS (
    SELECT department,
           AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_departments AS (
    SELECT *
    FROM dept_salary
    WHERE avg_salary > 60000
)
SELECT *
FROM high_departments;

WITH ranked AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked
WHERE salary_rank <= 3;

-- Q171
SELECT employee_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- Q172
SELECT employee_name,
       department,
       salary,
       ROW_NUMBER() OVER(
           PARTITION BY department
           ORDER BY salary DESC
       ) AS row_num
FROM employees;

-- Q173
SELECT employee_name,
       salary,
       RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q174
SELECT employee_name,
       salary,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q175
SELECT employee_name,
       salary,
       ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_rank,
       RANK() OVER(ORDER BY salary DESC) AS rank_value,
       DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank_value
FROM employees;

-- Q176
SELECT employee_name,
       salary,
       AVG(salary) OVER() AS company_avg
FROM employees;

-- Q177
SELECT employee_name,
       department,
       salary,
       AVG(salary) OVER(
           PARTITION BY department
       ) AS department_avg
FROM employees;

-- Q178
SELECT employee_name,
       hire_date,
       salary,
       SUM(salary) OVER(
           ORDER BY hire_date
       ) AS running_total
FROM employees;

-- Q179
SELECT employee_name,
       hire_date,
       salary,
       LAG(salary) OVER(
           ORDER BY hire_date
       ) AS previous_salary
FROM employees;

-- Q180
SELECT employee_name,
       hire_date,
       salary,
       LEAD(salary) OVER(
           ORDER BY hire_date
       ) AS next_salary
FROM employees;

WITH ranked AS (
    SELECT *,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees
)
SELECT *
FROM ranked
WHERE salary_rank <= 3;

WITH x AS (
    SELECT *,
           AVG(salary) OVER(
               PARTITION BY department_id
           ) AS dept_avg
    FROM employees
),
y AS (
    SELECT *,
           ABS(salary - dept_avg) AS difference
    FROM x
)
SELECT *
FROM y
WHERE difference = (
    SELECT MIN(difference)
    FROM y y2
    WHERE y2.department_id = y.department_id
);

WITH ranked AS (
    SELECT department_id,
           salary,
           DENSE_RANK() OVER(
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
),
salary_values AS (
    SELECT department_id,
           MAX(CASE WHEN rnk = 1 THEN salary END) AS highest_salary,
           MAX(CASE WHEN rnk = 2 THEN salary END) AS second_salary
    FROM ranked
    GROUP BY department_id
)
SELECT department_id,
       highest_salary - second_salary AS difference
FROM salary_values;

WITH x AS (
    SELECT *,
           AVG(salary) OVER(
               PARTITION BY department_id
           ) AS dept_avg,
           AVG(salary) OVER() AS company_avg
    FROM employees
)
SELECT e.employee_name,
       e.salary,
       m.employee_name AS manager_name
FROM x e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary
AND e.dept_avg > e.company_avg;

WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY hire_date ASC
           ) AS first_rn,
           ROW_NUMBER() OVER(
               PARTITION BY department_id
               ORDER BY hire_date DESC
           ) AS latest_rn
    FROM employees
)
SELECT department_id,
       MAX(CASE WHEN first_rn = 1 THEN employee_name END) AS first_employee,
       MAX(CASE WHEN latest_rn = 1 THEN employee_name END) AS latest_employee
FROM ranked
GROUP BY department_id;