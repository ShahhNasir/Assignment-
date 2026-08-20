-- SQL Assignment 200 QUESTIONS

DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

-- 1. Database & Table Creation (1-20)

-- Q1
CREATE DATABASE IF NOT EXISTS company_db;

-- Q2
USE company_db;

-- Q3-Q8
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    department_id INT,
    salary DECIMAL(12,2) CHECK (salary > 0),
    city VARCHAR(100) DEFAULT 'Hyderabad',
    hire_date DATE
);

-- Q4
-- employee_id is PRIMARY KEY in employees.

-- Q5
-- employee_name is NOT NULL in employees.

-- Q6
ALTER TABLE employees ADD COLUMN email VARCHAR(255) UNIQUE;

-- Q7
-- salary > 0 is enforced by CHECK.

-- Q8
-- city defaults to Hyderabad.

-- Q9
CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(14,2)
);

INSERT IGNORE INTO departments (department_id, department_name, location, budget)
VALUES
(1, 'HR', 'Hyderabad', 300000),
(2, 'Finance', 'Bangalore', 500000),
(3, 'Data Science', 'Hyderabad', 800000);

-- Q10
-- department_id is PRIMARY KEY in departments.

-- Q11
CREATE TABLE IF NOT EXISTS projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    department_id INT,
    budget DECIMAL(14,2)
);

-- Q12
ALTER TABLE employees
    ADD CONSTRAINT fk_employee_department
    FOREIGN KEY (department_id) REFERENCES departments(department_id);


INSERT INTO projects (project_id, project_name, department_id, budget)
VALUES
(101, 'HR Portal', 1, 350000),
(102, 'Payroll System', 2, 200000),
(103, 'AI Analytics', 3, 900000);

-- Q13
INSERT INTO employees
(employee_id, employee_name, department, department_id, salary, city, hire_date, email)
VALUES
(1, 'Alice', 'HR', 1, 65000, 'Hyderabad', '2022-03-15', 'alice@example.com');

-- Q14
INSERT INTO employees
(employee_id, employee_name, department, department_id, salary, city, hire_date, email)
VALUES
(2, 'Bob', 'Finance', 2, 72000, 'Bangalore', '2021-07-10', 'bob@example.com'),
(3, 'Cara', 'Data Science', 3, 85000, 'Mumbai', '2023-01-20', 'cara@example.com'),
(4, 'David', 'HR', 1, 58000, 'Hyderabad', '2020-11-05', 'david@example.com'),
(5, 'Esha', 'Finance', 2, 61000, 'Bangalore', '2022-09-12', 'esha@example.com');

-- Q15
INSERT INTO departments (department_id, department_name, location, budget)
VALUES (4, 'Sales', 'Mumbai', 400000);

-- Q16
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE,
    age INT CHECK (age >= 18),
    status VARCHAR(20) DEFAULT 'Active'
);

-- Q17
CREATE TABLE IF NOT EXISTS attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

-- Q18
CREATE TABLE IF NOT EXISTS temp_data (
    id INT
);

-- Q19
SHOW COLUMNS FROM employees;

-- Q20
DROP TEMPORARY TABLE IF EXISTS temp_data;

-- 2. Basic SELECT & Filtering (21-45)

-- Q21
SELECT * FROM employees;

-- Q22
SELECT employee_name, salary FROM employees;

-- Q23
SELECT * FROM employees WHERE city = 'Hyderabad';

-- Q24
SELECT * FROM employees WHERE salary > 60000;

-- Q25
SELECT * FROM employees WHERE salary <= 50000;

-- Q26
SELECT * FROM employees WHERE salary BETWEEN 50000 AND 70000;

-- Q27
SELECT * FROM employees
WHERE city IN ('Hyderabad', 'Bangalore', 'Mumbai');

-- Q28
SELECT * FROM employees
WHERE city <> 'Hyderabad';

-- Q29
SELECT * FROM employees WHERE employee_name LIKE 'A%';

-- Q30
SELECT * FROM employees WHERE employee_name LIKE '%a';

-- Q31
SELECT * FROM employees WHERE employee_name LIKE '%i%';

-- Q32
SELECT * FROM employees WHERE department IS NULL;

-- Q33
SELECT * FROM employees WHERE department IS NOT NULL;

-- Q34
SELECT * FROM employees WHERE hire_date > '2022-01-01';

-- Q35
SELECT * FROM employees
WHERE hire_date BETWEEN '2021-01-01' AND '2023-12-31';

-- Q36
SELECT * FROM employees
WHERE salary > 50000 AND city = 'Hyderabad';

-- Q37
SELECT * FROM employees
WHERE city = 'Hyderabad' OR salary > 70000;

-- Q38
SELECT e.*
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name <> 'HR' OR d.department_name IS NULL;

-- Q39
SELECT DISTINCT city FROM employees;

-- Q40
SELECT DISTINCT department FROM employees;

-- Q41
SELECT * FROM employees ORDER BY salary ASC;

-- Q42
SELECT * FROM employees ORDER BY salary DESC;

-- Q43
SELECT * FROM employees ORDER BY department ASC, salary DESC;

-- Q44
SELECT * FROM employees ORDER BY employee_id LIMIT 5;

-- Q45
SELECT * FROM employees ORDER BY salary DESC LIMIT 3;

-- 3. UPDATE, DELETE, ALTER & Basic Functions (46-65)

-- Q46
UPDATE employees
SET salary = 70000
WHERE employee_id = 1;

-- Q47
UPDATE employees
SET salary = salary * 1.10
WHERE employee_id >= 1;

-- Q48
UPDATE employees
SET salary = salary + 5000
WHERE employee_id > 0
  AND department = 'Data Science';

-- Q49
UPDATE employees
SET city = 'Bengaluru'
WHERE employee_id > 0
  AND city = 'Bangalore';

-- Q50
DELETE FROM employees
WHERE employee_id = 999;

-- Q51
DELETE FROM employees
WHERE employee_id > 0
  AND salary < 30000;

-- Q52
SELECT 'email column already created in Q6.' AS answer;

-- Q53
ALTER TABLE employees ADD COLUMN phone_number VARCHAR(20);

-- Q54
ALTER TABLE employees MODIFY employee_name VARCHAR(200) NOT NULL;

-- Q55
ALTER TABLE employees RENAME COLUMN city TO employee_city;

-- Q56
ALTER TABLE employees DROP COLUMN phone_number;

-- Q57
SELECT UPPER(employee_name) AS employee_name FROM employees;

-- Q58
SELECT LOWER(employee_name) AS employee_name FROM employees;

-- Q59
SELECT employee_name, LENGTH(employee_name) AS name_length
FROM employees;

-- Q60
SELECT employee_name, LEFT(employee_name, 3) AS first_three_chars
FROM employees;

-- Q61
SELECT employee_name, ROUND(salary, -3) AS salary_rounded
FROM employees;

-- Q62
SELECT CURRENT_DATE() AS today;

-- Q63
SELECT employee_name,
       TIMESTAMPDIFF(YEAR, hire_date, CURRENT_DATE()) AS years_worked
FROM employees;

-- Q64
SELECT employee_name,
       COALESCE(department, 'Unassigned') AS department
FROM employees;

-- Q65
SELECT employee_name, salary,
       CASE
           WHEN salary < 50000 THEN 'Low'
           WHEN salary <= 75000 THEN 'Medium'
           ELSE 'High'
       END AS salary_level
FROM employees;

-- 4. Aggregate Functions, GROUP BY & HAVING (66-90)

-- Q66
SELECT COUNT(*) AS total_employees FROM employees;

-- Q67
SELECT SUM(salary) AS total_salary FROM employees;

-- Q68
SELECT AVG(salary) AS average_salary FROM employees;

-- Q69
SELECT MAX(salary) AS highest_salary FROM employees;

-- Q70
SELECT MIN(salary) AS lowest_salary FROM employees;

-- Q71
SELECT COUNT(*) AS hyderabad_employees
FROM employees
WHERE employee_city = 'Hyderabad';

-- Q72
SELECT SUM(salary) AS mumbai_total_salary
FROM employees
WHERE employee_city = 'Mumbai';

-- Q73
SELECT AVG(salary) AS bangalore_average_salary
FROM employees
WHERE employee_city IN ('Bangalore', 'Bengaluru');

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
SELECT employee_city, COUNT(*) AS employee_count
FROM employees
GROUP BY employee_city;

-- Q80
SELECT employee_city, AVG(salary) AS average_salary
FROM employees
GROUP BY employee_city;

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
SELECT employee_city, SUM(salary) AS total_salary
FROM employees
GROUP BY employee_city
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
SELECT department, employee_city,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department, employee_city;

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
SELECT employee_city, COUNT(*) AS high_paid_count
FROM employees
WHERE salary > 60000
GROUP BY employee_city
HAVING COUNT(*) >= 3;

-- Q90
SELECT COUNT(DISTINCT department) AS distinct_departments,
       COUNT(DISTINCT employee_city) AS distinct_cities
FROM employees;

-- 5. Constraints, Keys & Data Integrity (91-105)

-- Q91
CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY
);

-- Q92
CREATE TABLE IF NOT EXISTS users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255) UNIQUE
);

-- Q93
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(12,2) CHECK (order_amount > 0)
);

-- Q94
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

-- Q95
CREATE TABLE IF NOT EXISTS account_status (
    id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Active'
);

-- Q96
INSERT INTO account_status (id) VALUES (1);

-- Q97
-- Attempted duplicate PRIMARY KEY:
-- INSERT INTO products (product_id) VALUES (1), (1);
SELECT 'Duplicate PRIMARY KEY violates the PRIMARY KEY constraint.' AS explanation;

-- Q98
-- Attempted duplicate UNIQUE email:
-- INSERT INTO users (user_id, email) VALUES (1, 'a@example.com');
-- INSERT INTO users (user_id, email) VALUES (2, 'a@example.com');
SELECT 'Duplicate email violates the UNIQUE constraint.' AS explanation;

-- Q99
CREATE TABLE IF NOT EXISTS employee_department_fk (
    employee_id INT PRIMARY KEY,
    department_id INT,
    CONSTRAINT fk_ed_department
        FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Q100
INSERT INTO employee_department_fk (employee_id, department_id)
VALUES (1, 1);

-- Q101
-- This would fail because department_id = 999 does not exist:
-- INSERT INTO employee_department_fk (employee_id, department_id)
-- VALUES (999, 999);
SELECT 'Invalid department_id violates the FOREIGN KEY constraint.' AS explanation;

-- Q102
ALTER TABLE customers
ADD COLUMN age INT CHECK (age BETWEEN 18 AND 60);

-- Q103
CREATE TABLE IF NOT EXISTS course_enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);

-- Q104
CREATE TABLE IF NOT EXISTS attendance_composite (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (employee_id, attendance_date)
);

-- Q105
CREATE TABLE IF NOT EXISTS named_constraint_demo (
    id INT PRIMARY KEY,
    age INT,
    CONSTRAINT chk_named_age CHECK (age >= 18)
);
SELECT 'chk_named_age ensures age is at least 18.' AS explanation;

-- 6. JOINs Including Self Join (106-135)

-- Q106
SELECT e.employee_name, d.department_name
FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id;

-- Q107
SELECT e.employee_name, e.salary, d.department_name, d.location
FROM employees e
JOIN departments d ON d.department_id = e.department_id;

-- Q108
SELECT e.*
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.department_name = 'Data Science';

-- Q109
SELECT e.*
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.location = 'Hyderabad';

-- Q110
SELECT e.employee_id, e.employee_name, e.salary, d.department_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id;

-- Q111
SELECT d.department_id, d.department_name, e.employee_name
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id;

-- Q112
SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
WHERE e.employee_id IS NULL;

-- Q113
SELECT e.employee_id, e.employee_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
WHERE d.department_id IS NULL;

-- Q114
SELECT d.department_id, d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q115
SELECT d.department_id, d.department_name, AVG(e.salary) AS average_salary
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q116
SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q117
SELECT d.department_name, COALESCE(SUM(e.salary), 0) AS total_salary
FROM departments d
LEFT JOIN employees e ON e.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q118
SELECT d.department_name, p.project_name
FROM departments d
JOIN projects p ON p.department_id = d.department_id;

-- Q119
SELECT e.employee_name, d.department_name, p.project_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
LEFT JOIN projects p ON p.department_id = d.department_id;

-- Q120
SELECT DISTINCT d.department_id, d.department_name
FROM departments d
JOIN projects p ON p.department_id = d.department_id;

-- Q121
SELECT d.department_id, d.department_name
FROM departments d
LEFT JOIN projects p ON p.department_id = d.department_id
WHERE p.project_id IS NULL;

-- Q122
ALTER TABLE employees ADD COLUMN manager_id INT;
ALTER TABLE employees
    ADD CONSTRAINT fk_employee_manager
    FOREIGN KEY (manager_id) REFERENCES employees(employee_id);

-- Sample manager relationships so Q123-Q135 and Q184/Q199 are meaningful.
UPDATE employees
SET manager_id = 1
WHERE employee_id IN (2, 3);

UPDATE employees
SET manager_id = 2
WHERE employee_id = 5;

-- Q123
SELECT e.employee_name AS employee_name,
       m.employee_name AS manager_name
FROM employees e
LEFT JOIN employees m ON m.employee_id = e.manager_id;

-- Q124
SELECT e.employee_name AS employee_name,
       m.employee_name AS manager_name
FROM employees e
JOIN employees m ON m.employee_id = e.manager_id;

-- Q125
SELECT e.employee_name
FROM employees e
WHERE e.manager_id IS NULL;

-- Q126
SELECT DISTINCT m.employee_id, m.employee_name
FROM employees e
JOIN employees m ON m.employee_id = e.manager_id;

-- Q127
SELECT m.employee_id, m.employee_name,
       COUNT(e.employee_id) AS direct_reports
FROM employees m
JOIN employees e ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name;

-- Q128
SELECT m.employee_id, m.employee_name,
       COUNT(e.employee_id) AS direct_reports
FROM employees m
JOIN employees e ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name
HAVING COUNT(e.employee_id) > 3;

-- Q129
SELECT e.employee_name AS employee_name,
       m.employee_name AS manager_name,
       e.salary AS employee_salary
FROM employees e
LEFT JOIN employees m ON m.employee_id = e.manager_id;

-- Q130
SELECT e.employee_name, e.salary, m.employee_name AS manager_name, m.salary AS manager_salary
FROM employees e
JOIN employees m ON m.employee_id = e.manager_id
WHERE e.salary > m.salary;

-- Q131
SELECT e.employee_name, m.employee_name AS manager_name
FROM employees e
JOIN employees m ON m.employee_id = e.manager_id
WHERE e.department_id = m.department_id;

-- Q132
SELECT e.*
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
WHERE d.department_id IS NULL;

-- Q133
SELECT e.employee_name, d.department_name, p.project_name
FROM employees e
LEFT JOIN departments d ON d.department_id = e.department_id
LEFT JOIN projects p ON p.department_id = d.department_id;

-- Q134
SELECT d.department_name, COALESCE(SUM(p.budget), 0) AS total_project_budget
FROM departments d
LEFT JOIN projects p ON p.department_id = d.department_id
GROUP BY d.department_id, d.department_name;

-- Q135
SELECT d.department_name,
       d.budget AS department_budget,
       SUM(p.budget) AS total_project_budget
FROM departments d
JOIN projects p ON p.department_id = d.department_id
GROUP BY d.department_id, d.department_name, d.budget
HAVING SUM(p.budget) > d.budget;

-- 7. Subqueries (136-155)

-- Q136
SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

-- Q137
SELECT *
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- Q138
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);

-- Q139
SELECT *
FROM employees
WHERE salary = (
    SELECT salary FROM employees
    WHERE employee_name = 'Alice'
    LIMIT 1
);

-- Q140
SELECT *
FROM employees
WHERE salary > (
    SELECT salary FROM employees
    WHERE employee_name = 'Alice'
    LIMIT 1
);

-- Q141
SELECT *
FROM employees
WHERE department_id = (
    SELECT department_id FROM employees
    WHERE employee_name = 'Alice'
    LIMIT 1
);

-- Q142
SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- Q143
SELECT e.*
FROM employees e
WHERE e.salary < (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- Q144
SELECT department, avg_salary
FROM (
    SELECT department, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
) x
WHERE avg_salary = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM employees
        GROUP BY department
    ) y
);

-- Q145
SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > (SELECT AVG(salary) FROM employees);

-- Q146
SELECT *
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE location = 'Hyderabad'
);

-- Q147
SELECT e.*
FROM employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);

-- Q148
SELECT d.*
FROM departments d
WHERE EXISTS (
    SELECT 1 FROM employees e
    WHERE e.department_id = d.department_id
);

-- Q149
SELECT d.*
FROM departments d
WHERE NOT EXISTS (
    SELECT 1 FROM employees e
    WHERE e.department_id = d.department_id
);

-- Q150
SELECT *
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);

-- Q151
SELECT *
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'Finance'
);

-- Q152
SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

-- Q153
SELECT MAX(salary) AS third_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees)
);

-- Q154
SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (SELECT MAX(salary) FROM employees)
);

-- Q155
SELECT e.*
FROM employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department_id = e.department_id
);

-- 8. CTEs — Common Table Expressions (156-170)

-- Q156
WITH high_paid AS (
    SELECT * FROM employees WHERE salary > 60000
)
SELECT * FROM high_paid;

-- Q157
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary FROM employees
)
SELECT e.*, c.avg_salary
FROM employees e
CROSS JOIN company_avg c
WHERE e.salary > c.avg_salary;

-- Q158
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM dept_avg;

-- Q159
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, a.avg_salary
FROM dept_avg a
JOIN departments d ON d.department_id = a.department_id
WHERE a.avg_salary > 60000;

-- Q160
WITH dept_stats AS (
    SELECT department_id, COUNT(*) AS employee_count, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
),
high_paying AS (
    SELECT * FROM dept_stats WHERE avg_salary > 60000
)
SELECT * FROM high_paying;

-- Q161
WITH city_salary AS (
    SELECT employee_city, SUM(salary) AS total_salary
    FROM employees
    GROUP BY employee_city
)
SELECT * FROM city_salary
WHERE total_salary > 200000;

-- Q162
WITH dept_max AS (
    SELECT department_id, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
)
SELECT * FROM dept_max;

-- Q163
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department_id
)
SELECT e.*
FROM employees e
JOIN dept_avg a ON a.department_id = e.department_id
WHERE e.salary > a.avg_salary;

-- Q164
WITH ranked AS (
    SELECT e.*,
           RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees e
)
SELECT * FROM ranked;

-- Q165
WITH ranked AS (
    SELECT e.*,
           ROW_NUMBER() OVER (ORDER BY salary DESC, employee_id) AS rn
    FROM employees e
)
SELECT * FROM ranked
WHERE rn <= 2;

-- Q166
WITH ranked AS (
    SELECT e.*,
           ROW_NUMBER() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC, employee_id
           ) AS rn
    FROM employees e
)
SELECT * FROM ranked
WHERE rn = 1;

-- Q167
WITH ranked AS (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees e
)
SELECT * FROM ranked
WHERE salary_rank = 2;

-- Q168
WITH employee_dept AS (
    SELECT e.employee_id, e.employee_name, e.salary,
           d.department_name, d.location
    FROM employees e
    JOIN departments d ON d.department_id = e.department_id
)
SELECT *
FROM employee_dept
WHERE salary > 60000;

-- Q169
WITH dept_counts AS (
    SELECT department_id, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_counts
WHERE employee_count > 3;

-- Q170
WITH first_cte AS (
    SELECT * FROM employees WHERE salary > 60000
),
second_cte AS (
    SELECT department_id, AVG(salary) AS avg_salary
    FROM first_cte
    GROUP BY department_id
)
SELECT * FROM second_cte;

-- 9. Window Functions (171-180)

-- Q171
SELECT employee_id, employee_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC, employee_id) AS row_num
FROM employees;

-- Q172
SELECT employee_id, employee_name, department_id, salary,
       ROW_NUMBER() OVER (
           PARTITION BY department_id
           ORDER BY salary DESC, employee_id
       ) AS dept_row_num
FROM employees;

-- Q173
SELECT employee_id, employee_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q174
SELECT employee_id, employee_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;

-- Q175
SELECT employee_id, employee_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC, employee_id) AS row_number_value,
       RANK() OVER (ORDER BY salary DESC) AS rank_value,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_value
FROM employees;

-- Q176
SELECT employee_id, employee_name, salary,
       AVG(salary) OVER () AS company_average_salary
FROM employees;

-- Q177
SELECT employee_id, employee_name, department_id, salary,
       AVG(salary) OVER (PARTITION BY department_id) AS department_average_salary
FROM employees;

-- Q178
SELECT employee_id, employee_name, hire_date, salary,
       SUM(salary) OVER (
           ORDER BY hire_date, employee_id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM employees;

-- Q179
SELECT employee_id, employee_name, hire_date, salary,
       LAG(salary) OVER (ORDER BY hire_date, employee_id) AS previous_salary
FROM employees;

-- Q180
SELECT employee_id, employee_name, hire_date, salary,
       LEAD(salary) OVER (ORDER BY hire_date, employee_id) AS next_salary
FROM employees;

-- 10. Hard SQL Challenge Questions (181-200)

-- Q181
WITH ranked AS (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees e
)
SELECT *
FROM ranked
WHERE salary_rank <= 3;

-- Q182
WITH x AS (
    SELECT e.*,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employees e
),
y AS (
    SELECT x.*,
           ABS(salary - dept_avg) AS difference
    FROM x
)
SELECT *
FROM y
WHERE difference = (
    SELECT MIN(y2.difference)
    FROM y y2
    WHERE y2.department_id = y.department_id
);

-- Q183
WITH ranked AS (
    SELECT department_id, salary,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS rnk
    FROM employees
),
top_two AS (
    SELECT department_id,
           MAX(CASE WHEN rnk = 1 THEN salary END) AS highest_salary,
           MAX(CASE WHEN rnk = 2 THEN salary END) AS second_highest_salary
    FROM ranked
    GROUP BY department_id
)
SELECT department_id,
       highest_salary - second_highest_salary AS difference
FROM top_two
WHERE second_highest_salary IS NOT NULL;

-- Q184
WITH dept_avg AS (
    SELECT department_id, AVG(salary) AS dept_avg
    FROM employees
    GROUP BY department_id
),
company_avg AS (
    SELECT AVG(salary) AS company_avg
    FROM employees
)
SELECT e.employee_id, e.employee_name, e.salary
FROM employees e
JOIN employees m ON m.employee_id = e.manager_id
JOIN dept_avg da ON da.department_id = e.department_id
CROSS JOIN company_avg ca
WHERE e.salary > m.salary
  AND da.dept_avg > ca.company_avg;

-- Q185
WITH ranked AS (
    SELECT e.*,
           ROW_NUMBER() OVER (
               PARTITION BY department_id ORDER BY hire_date ASC, employee_id
           ) AS first_rn,
           ROW_NUMBER() OVER (
               PARTITION BY department_id ORDER BY hire_date DESC, employee_id
           ) AS last_rn
    FROM employees e
)
SELECT department_id,
       MAX(CASE WHEN first_rn = 1 THEN employee_name END) AS first_employee,
       MAX(CASE WHEN last_rn = 1 THEN employee_name END) AS latest_employee
FROM ranked
GROUP BY department_id;

-- Q186
SELECT department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 50000;

-- Q187
WITH company_avg AS (
    SELECT AVG(salary) AS avg_salary FROM employees
)
SELECT e.department_id,
       SUM(CASE WHEN e.salary > c.avg_salary THEN 1 ELSE 0 END) / COUNT(*) AS pct_above_company_avg
FROM employees e
CROSS JOIN company_avg c
GROUP BY e.department_id
HAVING SUM(CASE WHEN e.salary > c.avg_salary THEN 1 ELSE 0 END) / COUNT(*) >= 0.70;

-- Q188
WITH gaps AS (
    SELECT employee_id, employee_name, hire_date,
           LAG(hire_date) OVER (ORDER BY hire_date, employee_id) AS prev_hire_date
    FROM employees
)
SELECT employee_id, employee_name, hire_date, prev_hire_date,
       DATEDIFF(hire_date, prev_hire_date) AS gap_days
FROM gaps
WHERE prev_hire_date IS NOT NULL
ORDER BY gap_days DESC
LIMIT 1;

-- Q189
WITH x AS (
    SELECT e.*,
           LAG(salary) OVER (
               PARTITION BY department_id
               ORDER BY hire_date, employee_id
           ) AS previous_department_salary
    FROM employees e
)
SELECT *
FROM x
WHERE previous_department_salary IS NOT NULL
  AND salary > previous_department_salary;

-- Q190
WITH dept_inequality AS (
    SELECT department_id,
           MAX(salary) - MIN(salary) AS salary_inequality
    FROM employees
    GROUP BY department_id
)
SELECT *
FROM dept_inequality
ORDER BY salary_inequality DESC
LIMIT 1;

-- Q191
WITH x AS (
    SELECT e.*,
           COUNT(*) OVER (
               PARTITION BY department_id, salary
           ) AS same_salary_count
    FROM employees e
)
SELECT *
FROM x
WHERE same_salary_count > 1;

-- Q192
WITH ranked AS (
    SELECT e.*,
           DENSE_RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_rank
    FROM employees e
)
SELECT *
FROM ranked
WHERE salary_rank = 3;

-- Q193
WITH employee_totals AS (
    SELECT department_id, SUM(salary) AS total_employee_salary
    FROM employees
    GROUP BY department_id
),
project_totals AS (
    SELECT department_id, SUM(budget) AS total_project_budget
    FROM projects
    GROUP BY department_id
)
SELECT e.department_id,
       e.total_employee_salary,
       p.total_project_budget,
       e.total_employee_salary - p.total_project_budget AS difference
FROM employee_totals e
JOIN project_totals p ON p.department_id = e.department_id
WHERE e.total_employee_salary > p.total_project_budget;

-- Q194
WITH x AS (
    SELECT e.*,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employees e
)
SELECT x.*
FROM x
WHERE x.salary > x.dept_avg
  AND NOT EXISTS (
      SELECT 1
      FROM projects p
      WHERE p.department_id = x.department_id
  );

-- Q195
WITH ranked AS (
    SELECT e.*,
           ROW_NUMBER() OVER (
               PARTITION BY department_id ORDER BY salary DESC, employee_id
           ) AS rn_high,
           ROW_NUMBER() OVER (
               PARTITION BY department_id ORDER BY salary ASC, employee_id
           ) AS rn_low,
           AVG(salary) OVER (PARTITION BY department_id) AS dept_avg
    FROM employees e
)
SELECT department_id,
       MAX(CASE WHEN rn_high = 1 THEN employee_name END) AS highest_paid_employee,
       MAX(CASE WHEN rn_low = 1 THEN employee_name END) AS lowest_paid_employee,
       MAX(dept_avg) AS department_average
FROM ranked
GROUP BY department_id;

-- Q196
WITH ranked AS (
    SELECT e.*,
           NTILE(5) OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS salary_bucket
    FROM employees e
)
SELECT *
FROM ranked
WHERE salary_bucket = 1;

-- Q197
WITH ranked AS (
    SELECT department_id,
           salary,
           ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary) AS rn,
           COUNT(*) OVER (PARTITION BY department_id) AS cnt
    FROM employees
)
SELECT department_id,
       AVG(salary) AS median_salary
FROM ranked
WHERE rn IN (FLOOR((cnt + 1) / 2), FLOOR((cnt + 2) / 2))
GROUP BY department_id;

-- Q198
WITH x AS (
    SELECT e.*,
           AVG(salary) OVER (
               ORDER BY hire_date, employee_id
               ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
           ) AS avg_salary_before
    FROM employees e
)
SELECT *
FROM x
WHERE avg_salary_before IS NOT NULL
  AND salary > avg_salary_before;

-- Q199
SELECT m.employee_id,
       m.employee_name,
       m.salary AS manager_salary,
       SUM(e.salary) AS direct_reports_salary,
       SUM(e.salary) - m.salary AS difference
FROM employees m
JOIN employees e ON e.manager_id = m.employee_id
GROUP BY m.employee_id, m.employee_name, m.salary
HAVING SUM(e.salary) > m.salary;

-- Q200
WITH report AS (
    SELECT e.*,
           RANK() OVER (ORDER BY salary DESC) AS company_salary_rank,
           RANK() OVER (
               PARTITION BY department_id
               ORDER BY salary DESC
           ) AS department_salary_rank,
           AVG(salary) OVER (PARTITION BY department_id) AS department_average,
           LAG(salary) OVER (ORDER BY hire_date, employee_id) AS previous_salary,
           LEAD(salary) OVER (ORDER BY hire_date, employee_id) AS next_salary
    FROM employees e
)
SELECT employee_id,
       employee_name,
       salary,
       company_salary_rank,
       department_salary_rank,
       department_average,
       salary - department_average AS difference_from_department_average,
       previous_salary,
       next_salary
FROM report
ORDER BY employee_id;