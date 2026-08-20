create database company_db;
use company_db;

-- 1.) Database and Table Creation -----

-- Q1. Create a database named company_db.
-- Q2. Select and use the company_db database.
-- Q3. Create an employees table with employee_id, 
--      employee_name, department, salary, city, and hire_date columns.
-- Q4. Make employee_id the PRIMARY KEY.
-- Q5. Make employee_name NOT NULL.
-- Q6. Add a UNIQUE constraint to an email column.
-- Q7. Add a CHECK constraint so salary must be greater than 0.
-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.

-- =========================================================
-- Q3 to Q8. Create employees table (Child Table)
-- =========================================================

create table employees (
employee_id int primary key,
employee_name varchar(30) NOT NULL,
department varchar(30),
department_id int,
salary decimal(10,2) CHECK (salary > 0),
email varchar(30) unique,
city varchar(20) default "Hyderabad",
hire_date date,
 FOREIGN KEY (department_id) 
REFERENCES departments(department_id)
);

desc employees;

-- Q9. Create a departments table with department_id, department_name, location, and budget.
-- Q10. Make department_id the PRIMARY KEY in the departments table.

-- =========================================================
-- Q9 & Q10. Create departments table first (Parent Table)
-- =========================================================

create table departments (
department_id int primary key,
department_name varchar(30),
location varchar(50),
budget decimal(10,2)
);

desc departments;

-- Q11. Create a projects table with project_id, project_name, department_id, and budget.
-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.

-- =========================================================
-- Q11. Create projects table
-- =========================================================

create table project (
project_id int primary key,
project_name varchar(20),
department_id int,
budget decimal(12,2),
constraint fk_project foreign key (department_id)
references departments(department_id)
);

desc project;

-- =========================================================
--  Q13. Insert one employee record.
-- =========================================================

-- Step 1: Insert into parent table (departments) first to satisfy FK constraint

insert into departments (department_id,department_name,location,budget)
values (10, "IT", "Hyderabad", 500000);

-- Step 2: Insert employee record with explicit column names

insert into employees (employee_id,employee_name,department,department_id,salary,email,city,hire_date)
values (101, "Smruti", "IT", 10, 50000, "smruti@gmail.com", "Hyderabad", "2024-06-02");

select * from departments;

select * from employees;

-- =========================================================
--  Q14. Insert five employee records in a single INSERT statement.
--  Q15. Insert a department record.
-- =========================================================

insert into departments (department_id,department_name,location,budget)
values (20, "HR", "Chennai", 700000),          -- Q15 ----
(30,"Finance", "Bhubaneswar", 850000);

-- Q14 ------
insert into employees (employee_id,employee_name,department,department_id,salary,email,city,hire_date)
values (102, "Suman", "HR", 20, 74000, "suman@gmail.com", "Chennai", "2023-10-03"),
(103, "Prayas", "Finance", 30, 65000, "prayas@gmail.com", "Bhubaneswar", "2026-07-01"),
(104, 'Rohan Verma', 'Finance', 30, 58000.00, 'rohan.v@gmail.com', 'Hyderabad', '2024-03-10'),
(105, 'Ananya Iyer', 'IT', 10, 72000.00, 'ananya.i@gmail.com', 'Chennai', '2024-04-18'),
(106, 'Vikram Rao', 'HR', 20, 48000.00, 'vikram.r@gmail.com', 'Hyderabad', '2024-05-20');

-- =========================================================
-- Q16. Create a students table with 
--      PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
-- =========================================================

create table students (
student_id int primary key,
student_name varchar(20) NOT NULL,
email varchar(30) unique,
age int check (age >= 18),
city varchar(20) default ("Hyderabad")
);

desc students;

-- =========================================================
-- Q17. Create a table named attendance with employee_id, attendance_date, and status. 
-- =========================================================

create table attendance (
attendance_id int primary key,
attendance_date date not null,
employee_id int,
status varchar(10) CHECK (status in ('Present', 'Absent', 'Leave')),
CONSTRAINT fk_attendance_employee
 FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

desc attendance;

-- =========================================================
-- Q18. Create a table only if it does not already exist. 
-- =========================================================

create table only (
item_id int primary key,
item_name varchar(30) not null,
quantity int default 0
);

desc only;

-- =========================================================
-- Q19. Describe or display the structure of the employees table. 
-- =========================================================
desc employees;

-- =========================================================
-- Q20. Drop a temporary table named temp_data if it exists. 
-- =========================================================

drop table temp_data; 




-- 2. Basic SELECT & Filtering (21–45) -----------

-- =========================================================
-- Q21. Display all columns from the employees table. 
-- =========================================================

select * from employees;

 -- =========================================================
-- Q22. Display only employee_name and salary. 
-- =========================================================

select employee_name,salary from employees;

-- =========================================================
-- Q23. Display employees who live in Hyderabad. 
-- =========================================================

select * from employees where city = 'Hyderabad';

-- =========================================================
-- Q24. Display employees whose salary is greater than 60000.
-- =========================================================

select employee_name,salary from employees
where salary > 60000;

-- =========================================================
-- Q25. Display employees whose salary is less than or equal to 50000.
-- =========================================================

select employee_name,salary from employees
where salary >= 50000;

-- =========================================================
-- Q26. Display employees whose salary is between 50000 and 70000.
-- =========================================================

select employee_name,salary from employees
where salary between 50000 and 70000;

-- =========================================================
-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
-- =========================================================

select employee_name,city from employees
where city in ("Hyderabad","Chennai","Bhubaneswar");

-- =========================================================
-- Q28. Display employees who do not live in Hyderabad.
-- =========================================================

select employee_name,city from employees
where city != "Hyderabad";

-- =========================================================
-- Q29. Display employees whose names start with 'A'.
-- =========================================================

select employee_name from employees
where employee_name like'A%';

-- =========================================================
-- Q30. Display employees whose names end with 'a'.
-- =========================================================

select employee_name from employees
where employee_name like '%a';

-- =========================================================
-- Q31. Display employees whose names contain the letter 'i'.
-- =========================================================

select employee_name from employees
where employee_name like '%i%';

-- =========================================================
-- Q32. Display employees whose department is NULL.
-- =========================================================

select * from employees
where department is null;

-- =========================================================
-- Q33. Display employees whose department is NOT NULL.
-- =========================================================

select * from employees
where department is not null;

-- =========================================================
-- Q34. Display employees hired after 2022-01-01.
-- =========================================================

select * from employees
where hire_date > '2022-01-01';

-- =========================================================
-- Q35. Display employees hired between two given dates.
-- =========================================================

select * from employees
where hire_date between '2023-01-01' and '2023-12-31';

-- =========================================================
-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
-- =========================================================

select employee_name,salary,city from employees
where salary > 50000 and city = 'Hyderabad';

-- =========================================================
-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
-- =========================================================

select * from employees
where city = 'Hyderabad' or salary > 70000;

-- =========================================================
-- Q38. Display employees who are NOT in the HR department..
-- =========================================================

select * from employees
where department != 'HR';

-- =========================================================
-- Q39. Display distinct cities from the employees table.
-- =========================================================

select distinct city from employees;

-- =========================================================
-- Q40. Display distinct departments from the employees table.
-- =========================================================

select distinct department from employees;

-- =========================================================
-- Q41. Display employees sorted by salary in ascending order.
-- =========================================================

select employee_name,salary from employees
order by salary asc;

-- =========================================================
-- Q42. Display employees sorted by salary in descending order.
-- =========================================================

select employee_name,salary from employees
order by salary desc;

-- =========================================================
-- Q43. Display employees sorted first by department and then by salary descending.
-- =========================================================

select employee_name, department,salary from employees
order by department ,salary desc;

-- =========================================================
-- Q44. Display the first 5 employees after sorting by employee_id.
-- =========================================================

select * from employees
order by employee_id
limit 5;

-- =========================================================
-- Q45. Display the top 3 highest-paid employees.
-- =========================================================

select * from employees
order by salary desc
limit 3; 



-- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65) -------------------------

-- =========================================================
-- Q46. Update the salary of one employee using employee_id.
-- =========================================================

update employees
set salary = 75000
where employee_id = 103;
select * from employees;

-- =========================================================
-- Q47. Increase the salary of all employees by 10 percent.
-- =========================================================

update employees
set salary = salary * 1.10
where employee_id > 0;

-- =========================================================
-- Q48. Increase the salary of employees in the HR department by 5000.
-- =========================================================

set sql_safe_updates= 0; 

update employees
set salary = salary + 5000
where department = 'HR';

-- =========================================================
-- Q49. Change the city of all employees currently living in Chennai to Bengaluru.
-- =========================================================

update employees
set city = 'Bengaluru'
where city = 'Chennai';

-- =========================================================
-- Q50. Delete one employee using employee_id.
-- =========================================================

delete from employees
where employee_id = 106;

select * from employees;

-- =========================================================
-- Q51. Delete employees whose salary is below a specified amount.
-- =========================================================

delete from employees
where salary < 50000;

-- =========================================================
-- Q52. Add an email column to the employees table.
-- =========================================================

alter table employees
add column email varchar(20);

-- =========================================================
-- Q53. Add a phone_number column to the employees table.
-- =========================================================

alter table employees
add column phone_number int;

-- =========================================================
-- Q54. Modify the length of the employee_name column.
-- =========================================================

alter table employees
modify employee_name varchar(60);

-- =========================================================
-- Q55. Rename the city column to employee_city
-- =========================================================

alter table employees
rename column city to employee_city;

-- =========================================================
-- Q56. Drop the phone_number column.
-- =========================================================

alter table employees
drop column phone_number;

-- =========================================================
-- Q57. Display employee names in uppercase.
-- =========================================================

select upper(employee_name) from employees;

-- =========================================================
-- Q58. Display employee names in lowercase.
-- =========================================================

select lower(employee_name) as employee_name from employees;

-- =========================================================
-- Q59. Display the length of every employee name.
-- =========================================================

select length(employee_name) from employees;

-- =========================================================
-- Q60. Display the first three characters of every employee name.
-- =========================================================

select left(employee_name,3) from employees;

-- =========================================================
-- Q61. Display employee_name and salary rounded to the 
--       nearest thousand using an appropriate expression.
-- =========================================================
													-- How It Works
select employee_name, round(salary/1000) * 1000		-- Salary: 56,700
as rounded_salary 									-- 56,700 / 1000 = 56.7
from employees;										-- ROUND(56.7) = 57
													-- 57 * 1000 = 57,000
												
-- =========================================================
-- Q62. Display the current date.
-- =========================================================

select current_date();

-- =========================================================
-- Q63. Calculate how many years each employee has worked using hire_date.
-- =========================================================

select employee_name, timestampdiff(year,hire_date,curdate())
as years_worked from employees;			-- Use TIMESTAMPDIFF() with the YEAR unit SQL ------------

-- =========================================================
-- Q64. Replace NULL department values with 'Unassigned' in the query result.
-- =========================================================

select employee_name, ifnull(department, 'Unassigned')
as department from employees;

-- =========================================================
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
-- =========================================================

select employee_name,salary,
case when salary < 40000 then 'Low'
	when salary between 40000 and 80000 then 'Medium'
    else 'High'
end as salary_category
from employees;



-- 4. Aggregate Functions, GROUP BY & HAVING (66–90)

-- =========================================================
-- Q66. Find the total number of employees.
-- =========================================================

select count(employee_name) from employees;
	
-- =========================================================
-- Q67. Find the total salary paid to all employees.
-- =========================================================

select sum(salary) from employees;

-- =========================================================
-- Q68. Find the average salary of all employees.
-- =========================================================

select avg(salary) from employees;

-- =========================================================
-- Q69. Find the highest salary.
-- =========================================================

select max(salary) from employees;

-- =========================================================
-- Q70. Find the lowest salary.
-- =========================================================

select min(salary) from employees;

-- =========================================================
-- Q71. Find the number of employees in Hyderabad.
-- =========================================================


select * from employees;

select employee_city,count(*) from employees
group by employee_city
having employee_city = 'Hyderabad';

-- =========================================================
-- Q72. Find the total salary paid to employees in Hyderabad.
-- =========================================================

select sum(salary), employee_city from employees
where employee_city = 'Hyderabad'
group by employee_city;

-- =========================================================
-- Q73. Find the average salary of employees in Bangalore.
-- =========================================================

select avg(salary),employee_city from employees
group by employee_city
having employee_city = 'Bengaluru';

-- =========================================================
-- Q74. Find the number of employees in each department.
-- =========================================================

select count(employee_name),department from employees
group by department;

-- =========================================================
-- Q75. Find the average salary in each department.
-- =========================================================

select avg(salary), department from employees
group by department;

-- =========================================================
-- Q76. Find the maximum salary in each department.
-- =========================================================

select max(salary),department from employees
group by department;

-- =========================================================
-- Q77. Find the minimum salary in each department.
-- =========================================================

select min(salary),department from employees
group by department;

-- =========================================================
-- Q78. Find the total salary in each department.
-- =========================================================

select sum(salary),department from employees
group by department;

-- =========================================================
-- Q79. Find the number of employees in each city.
-- =========================================================

select count(employee_name),employee_city from employees
group by employee_city;

-- =========================================================
-- Q80. Find the average salary in each city.
-- =========================================================

select avg(salary),employee_city from employees
group by employee_city;

-- =========================================================
-- Q81. Find departments having more than 1 employees.
-- =========================================================

select count(employee_name) ,department from employees
group by department
having count(employee_name) > 1;

-- =========================================================
-- Q82. Find departments whose average salary is greater than 60000.
-- =========================================================

select avg(salary),department from employees
group by department
having avg(salary) > 60000;

-- =========================================================
-- Q83. Find cities whose total salary is greater than 100000.
-- =========================================================

select sum(salary),employee_city from employees
group by employee_city
having sum(salary) > 100000;

-- =========================================================
-- Q84. Find the department with the highest total salary.
-- =========================================================

select department,sum(salary) as total_sal from employees
group by department
having sum(salary)
order by total_sal desc
limit 1;

 -- =========================================================
-- Q85. Find the department with the highest average salary.
-- =========================================================

select department,avg(salary) as high_sal from employees
group by department
having avg(salary)
order by high_sal desc
limit 1;

-- =========================================================
-- Q86. Display employee count and average salary for each department and city combination.
-- =========================================================

select department, employee_city, count(*), round(avg(salary),2)
from employees
group by department, employee_city;

-- =========================================================
-- Q87. Find the difference between the maximum and minimum salary in each department.
-- =========================================================

select department, max(salary) - min(salary) as diff_salary
from employees
group by department;

-- =========================================================
-- Q88. Find departments where the maximum salary is greater than 70000.
-- =========================================================

select department, max(salary) from employees
group by department
having max(salary) > 70000;

-- =========================================================
-- Q89. Find cities having at least 2 employees with salary above 60000.
-- =========================================================

select employee_city, count(*) from employees
where salary > 60000
group by employee_city
having count(*) >= 2;

-- =========================================================
-- Q90. Find the total number of distinct departments and distinct cities.
-- =========================================================

select count(distinct department) + count(distinct employee_city) 
from employees;



-- 5. Constraints, Keys & Data Integrity (91–105) -------------------

-- =========================================================
-- Q91. Create a products table with product_id as PRIMARY KEY.
-- =========================================================

create table products (
product_id int primary key,
product_name varchar(30) not null,
price decimal(10,2),
quantity int
);

-- =========================================================
-- Q92. Create a users table where email must be UNIQUE.
-- =========================================================

create table users (
user_id int primary key,
user_name varchar(20) not null,
email varchar(30) unique,
address varchar(80)
);

-- =========================================================
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
-- =========================================================

create table orders (
order_id int primary key,
user_id varchar(20) not null,
order_amount decimal(10,2) not null check (order_amount > 0),
order_date timestamp default current_timestamp
);

-- =========================================================
-- Q94. Create a customers table where customer_name cannot be NULL.
-- =========================================================

create table customers (
customer_id int primary key,
customer_name varchar(20) not null,
email varchar(50),
phone_no varchar(20)
);

-- =========================================================
-- Q95. Create a table with a DEFAULT status value of 'Active'.
-- =========================================================

create table accounts (
acc_id int primary key,
acc_name varchar(20) not null,
statuss varchar(20) default 'Active'
);

-- =========================================================
-- Q96. Insert a row that uses the DEFAULT value.
-- =========================================================

insert into accounts (acc_id,acc_name,statuss) values 
(01,'Prayas Bibhab',default);

select * from accounts;

-- =========================================================
-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
-- =========================================================

insert into products (product_id,product_name, price)
values (101,'Laptop',75000);

insert into products (product_id,product_name,price)
values (101,'Phone',25000);

-- =========================================================
-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
-- =========================================================

insert into users (user_id,user_name,email,address)
values (11,'Smrutisneha','sneha@gmail.com','abcdefgh');

insert into users (user_id,user_name,email,address)
values (12,'Sneha Pradhan','sneha@gmail.com','ijklmnop');

-- =========================================================
-- Q99. Create employees and departments with a FOREIGN KEY relationship.
-- =========================================================

create table employees (
employee_id int primary key,
employee_name varchar(30) NOT NULL,
department varchar(30),
department_id int,
salary decimal(10,2) CHECK (salary > 0),
email varchar(30) unique,
city varchar(20) default "Hyderabad",
hire_date date,
 FOREIGN KEY (department_id) 
REFERENCES departments(department_id)
);

-- =========================================================
-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
-- =========================================================

INSERT INTO departments (department_id, department_name, location, budget) 
VALUES 
(1, 'Engineering', 'Building A', 500000.00),
(2, 'Human Resources', 'Building B', 150000.00),
(3, 'Finance', 'Building C', 300000.00);

select * from departments;

INSERT INTO employees (
    employee_id, 
    employee_name, 
    department, 
    department_id, 
    salary, 
    email, 
    employee_city, 
    hire_date
) 
VALUES 
(201, 'Sneha Pradhan', 'Engineering', 1, 75000.00, 'sneha@example.com', 'Hyderabad', '2024-01-15'),
(202, 'Rahul Sharma', 'Human Resources', 2, 50000.00, 'rahul@example.com', DEFAULT, '2023-06-20'),
(203, 'Pooja Verma', 'Finance', 3, 62000.00, 'pooja@example.com', 'Mumbai', '2022-11-10');

select * from employees;

-- =========================================================
-- Q101. Attempt to insert an employee with a department_id that does not exist.
-- =========================================================

INSERT INTO departments (department_id, department_name, location, budget) 
VALUES (999, 'Marketing', 'Building D', 200000.00);

INSERT INTO employees (
    employee_id, 
    employee_name, 
    department, 
    department_id, 
    salary, 
    email, 
    employee_city, 
    hire_date
) 
VALUES (
    204, 
    'Vikram Singh', 
    'Marketing', 
    999, 
    55000.00, 
    'vikram@gmail.com', 
    'Hyderabad', 
    '2024-03-01'
);

-- =========================================================
-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
-- =========================================================

alter table employees
add column age int check (age between 18 and 60);

-- =========================================================
-- Q103. Create a composite PRIMARY KEY using two columns.
-- =========================================================




-- =========================================================
-- Q104. Create an attendance table where employee_id and 
--        attendance_date together from a composite key.
-- =========================================================



-- =========================================================
-- Q105. Create a table with a named constraint and then identify its purpose.
-- =========================================================




-- 6. JOINs Including Self Join (106–135) ----------------------


-- =========================================================
-- Q106. Display employee_name and department_name using an INNER JOIN.
-- =========================================================

select * from employees;
select * from departments;

select employee_name,department_name from employees as e
inner join departments as d
on e.department_id = d.department_id;

-- =========================================================
-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
-- =========================================================

select employee_name,salary,department_name,location from employees as e
inner join departments as d
on e.department_id = d.department_id;

-- =========================================================
-- Q108. Find employees working in the IT department using a JOIN.
-- =========================================================

select employee_name,department_name from employees as e
inner join departments as d 
on e.department_id = d.department_id
where department_name = "IT";

-- =========================================================
-- Q109. Find employees working in departments located in Hyderabad.
-- =========================================================

select employee_name,department_name,location from employees as e
inner join departments as d
on e.department_id = d.department_id
where location = "Hyderabad";

-- =========================================================
-- Q110. Display all employees even if they do not belong to any department.
-- =========================================================

select employee_name,department_name from employees as e
left join departments as d
on e.department_id = d.department_id;

-- =========================================================
-- Q111. Display all departments even if they have no employees.
-- =========================================================

select employee_name, department from employees as e
left join departments as d
on e.department_id = d.department_id;

-- =========================================================
-- Q112. Find departments that currently have no employees.
-- =========================================================

select employee_name,department from employees as e
left join departments as d
on e.department_id = d.department_id
group by employee_name,department;

-- =========================================================
-- Q113. Find employees who do not have a matching department.
-- =========================================================

select employee_name,department from employees  as e
left join departments as d
on e.department_id = d.department_id
where d.department_id is null;

-- =========================================================
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
-- =========================================================

select d.department_id, 
		d.department_name, 
        count(employee_name) as total_emp
from departments as d
left join employees as e
on d.department_id = e.department_id
group by d.department_name, d.department_id;

-- =========================================================
-- Q115. Find the average salary in each department using JOIN and GROUP BY.
-- =========================================================

select d.department_id,
		d.department_name,
        avg(salary) as avg_sal
from departments as d
inner join employees as e
on d.department_id = e.department_id
group by d.department_id, d.department_name;

-- =========================================================
-- Q116. Display each department with employee count 
-- 			including departments with zero employees.
-- =========================================================

select department_name, count(employee_name) as total_emp
from departments as d
left join employees as e
on d.department_id = e.department_id
group by department_name;

-- =========================================================
-- Q117. Display each department with total salary including departments with zero employees.
-- =========================================================

select d.department_name, 
		d.employee_name, sum(salary) as tol_sal
from departments as d
left join employees as e
on d.department_id = e.department_id
group by d.department_name, d.employee_name;







