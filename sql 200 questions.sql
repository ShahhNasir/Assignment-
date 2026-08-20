drop database company_db;
-- Q1. Create a database
CREATE DATABASE company_db;


-- Q2. Select and use the database
USE company_db;


-- Q3–Q8. Create employees table with constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,              -- Q4
    employee_name VARCHAR(100) NOT NULL,      -- Q5
    department_id INT,                        -- for foreign key later
    salary DECIMAL(10,2) CHECK (salary > 0),  -- Q7
    city VARCHAR(50) DEFAULT 'Hyderabad',     -- Q8
    hire_date DATE,
    email VARCHAR(100) UNIQUE                 -- Q6
);

-- Q9–Q10. Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,            -- Q10
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12,2)
);

-- Q11. Create projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT,
    budget DECIMAL(12,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Q12. Add foreign key from employees.department_id to departments.department_id
ALTER TABLE employees
ADD CONSTRAINT fk_department FOREIGN KEY (department_id)
REFERENCES departments(department_id);


INSERT INTO employees (employee_id, employee_name, department_id, salary, city, hire_date, email)
VALUES (1, 'Ravi Kumar', 101, 50000, 'Hyderabad', '2026-08-01', 'ravi.kumar@example.com');

-- Q14. Insert five employee records in a single statement
INSERT INTO employees (employee_id, employee_name, department_id, salary, city, hire_date, email)
VALUES
(2, 'Anita Sharma', 102, 60000, 'Bengaluru', '2026-07-15', 'anita.sharma@example.com'),
(3, 'Suresh Reddy', 101, 45000, DEFAULT, '2026-06-20', 'suresh.reddy@example.com'),
(4, 'Priya Singh', 103, 70000, 'Mumbai', '2026-05-10', 'priya.singh@example.com'),
(5, 'Vikram Rao', 102, 55000, DEFAULT, '2026-04-05', 'vikram.rao@example.com'),
(6, 'Meena Joshi', 104, 48000, 'Delhi', '2026-03-25', 'meena.joshi@example.com');

-- Q15. Insert a department record
INSERT INTO departments (department_id, department_name, location, budget)
VALUES (101, 'IT', 'Hyderabad', 2000000);
INSERT INTO departments (department_id, department_name, location, budget)
VALUES
(102, 'Human Resources', 'Bangalore', 300000),
(103, 'Finance', 'Mumbai', 400000),
(104, 'Sales', 'Delhi', 450000),
(105, 'Marketing', 'Chennai', 350000);

I
-- Q16. Create students table with multiple constraints
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age > 0),
    city VARCHAR(50) DEFAULT 'Bidar'
);

-- Q17. Create attendance table
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- Q18. Create table only if not exists
CREATE TABLE IF NOT EXISTS training (
    training_id INT PRIMARY KEY,
    training_name VARCHAR(100)
);

-- Q19. Describe employees table (MySQL syntax)
DESCRIBE employees;

select employee_name from employees where city = 'hyderabad';
select employee_name from employees where salary > 50000 or salary <= 50000 or salary between 50000 and 70000;
select employee_name from employees where city in('hyderabad','banglore' or 'mumbai');
select employee_name from employees where city not in('hyderabad');
select employee_name from employees where employee_name  like ('a%') or ('%a');
select employee_name from employees where employee_name like ('%i%');
select employee_name from employees where department_id = '0';
select employee_name from employees where department_id > '0';
select employee_name from employees where hire_date > '2022-01-01';
select employee_name from employees where  hire_date between '2020-01-01'  and '2022-01-01';
select employee_name from employees where salary > 50000 and city = 'hyderabad';
select employee_name from employees where city = 'hyderabad' or salary > '70000';
SELECT e.employee_id,
       e.employee_name,
       d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
WHERE d.department_name <> 'HR';
select distinct city from employees;
select distinct department_id from employees;
select employee_name,salary from employees 
order by salary desc;
select employee_name,department_id ,salary from employees
order by department_id asc,salary desc;
select employee_name from employees
order by employee_id limit 5;
select employee_name from employees order by salary desc limit 3;

SET SQL_SAFE_UPDATES = 1;   
set sql_safe_updates = 0;

update employees
set salary = '60000'
where employee_id = '101';

update employees
set salary = salary + salary*0.1;
delete from employees
where employee_id = '101';

alter table employees
add column phone_no int not null;

alter table employees
drop  column phone_no  ;

alter table employees
rename column city to employee_city;

select upper(employee_name) upper from employees;
select lower(employee_name) from employees;

select length(employee_name) from employees;
select employee_name from employees
where employee_name like ('---%');
SELECT SUBSTRING(employee_name, 1, 3) AS FirstThreeChars
FROM Employees;

-- Q66. Total number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Q67. Total salary paid to all employees
SELECT SUM(salary) AS total_salary FROM employees;

-- Q68. Average salary of all employees
SELECT AVG(salary) AS average_salary FROM employees;

-- Q69. Highest salary
SELECT MAX(salary) AS highest_salary FROM employees;

-- Q70. Lowest salary
SELECT MIN(salary) AS lowest_salary FROM employees;

-- Q71. Number of employees in Hyderabad
SELECT COUNT(*) AS hyderabad_employees
FROM employees WHERE city = 'Hyderabad';

-- Q72. Total salary paid to employees in Mumbai
SELECT SUM(salary) AS mumbai_total_salary
FROM employees WHERE city = 'Mumbai';

-- Q73. Average salary of employees in Bangalore
SELECT AVG(salary) AS bangalore_avg_salary
FROM employees WHERE city = 'Bangalore';

-- Q74. Number of employees in each department
SELECT department, COUNT(*) AS employee_count
FROM employees GROUP BY department;

-- Q75. Average salary in each department
SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department;

-- Q76. Maximum salary in each department
SELECT department, MAX(salary) AS max_salary
FROM employees GROUP BY department;

-- Q77. Minimum salary in each department
SELECT department, MIN(salary) AS min_salary
FROM employees GROUP BY department;

-- Q78. Total salary in each department
SELECT department, SUM(salary) AS total_salary
FROM employees GROUP BY department;

-- Q79. Number of employees in each city
SELECT city, COUNT(*) AS employee_count
FROM employees GROUP BY city;

-- Q80. Average salary in each city
SELECT city, AVG(salary) AS avg_salary
FROM employees GROUP BY city;

-- Q81. Departments having more than 5 employees
SELECT department, COUNT(*) AS employee_count
FROM employees GROUP BY department
HAVING COUNT(*) > 5;

-- Q82. Departments whose average salary is greater than 60000
SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department
HAVING AVG(salary) > 60000;

-- Q83. Cities whose total salary is greater than 200000
SELECT city, SUM(salary) AS total_salary
FROM employees GROUP BY city
HAVING SUM(salary) > 200000;

-- Q84. Department with the highest total salary
SELECT department, SUM(salary) AS total_salary
FROM employees GROUP BY department
ORDER BY total_salary DESC LIMIT 1;

-- Q85. Department with the highest average salary
SELECT department, AVG(salary) AS avg_salary
FROM employees GROUP BY department
ORDER BY avg_salary DESC LIMIT 1;



-- Q88. Departments where max salary > 70000
SELECT department, MAX(salary) AS max_salary
FROM employees GROUP BY department
HAVING MAX(salary) > 70000;

-- Q89. Cities having at least 3 employees with salary above 60000
SELECT city, COUNT(*) AS high_salary_employees
FROM employees WHERE salary > 60000
GROUP BY city HAVING COUNT(*) >= 3;

-- Q90. Total number of distinct departments and distinct cities
SELECT COUNT(DISTINCT department) AS distinct_departments,
       COUNT(DISTINCT city) AS distinct_cities
FROM employees;



CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_amount DECIMAL(10,2) CHECK (order_amount > 0)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL
);


CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    status VARCHAR(20) DEFAULT 'Active'
);


INSERT INTO accounts (account_id) VALUES (1);

INSERT INTO products VALUES (1, 'Laptop', 50000);
INSERT INTO products VALUES (1, 'Phone', 30000); 
INSERT INTO users VALUES (1, 'abc@gmail.com', 'Uday');
INSERT INTO users VALUES (2, 'abc@gmail.com', 'Ravi');
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
INSERT INTO departments VALUES (101, 'HR');
INSERT INTO employees VALUES (1, 'Uday', 101); 


INSERT INTO employees VALUES (2, 'Ravi', 999); 

CREATE TABLE persons (
    person_id INT PRIMARY KEY,
    age INT CHECK (age BETWEEN 18 AND 60)
);

CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    PRIMARY KEY (employee_id, attendance_date)
);
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    age INT,
    CONSTRAINT age_check CHECK (age >= 18)
);







