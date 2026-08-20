
# Database & Table Creation (1–20)
#Q1. Create a database named company_db.
create database companydb;

#Q2. Select and use the company_db database.
use companydb;

#Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.
create table employees
(
e_id int primary key,
e_name varchar(30),
dep varchar(20),
salary int,
city varchar(20),
hire_date date
);

#Q4. Make employee_id the PRIMARY KEY.
create table employees
(
e_id int primary key,
e_name varchar(30),
dep varchar(20),
salary int,
city varchar(20),
hire_date date
);

#Q5. Make employee_name NOT NULL.
alter table  employees
modify  e_name varchar(100) not null;

#Q6. Add a UNIQUE constraint to an email column.
alter table employees
add column email varchar(70) unique;

#Q7. Add a CHECK constraint so salary must be greater than 0.
alter table  employees
add constraint chk_salary check (salary > 0);

#Q8. Add a DEFAULT value of 'Hyderabad' for the city column.
alter table  employees
modify city varchar(20) default 'Hyderabad';

#Q9. Create a departments table with department_id, department_name, location, and budget.
create table dep_table
(
d_id int,
d_name varchar(20),
location varchar(20),
budget int 
);

#Q10. Make department_id the PRIMARY KEY in the departments table.
alter table dep_table
modify d_id int primary key;

#Q11. Create a projects table with project_id, project_name, department_id, and budget.
create table projects
(
p_id int,
p_name varchar(25),
d_id int,
budget int
);

#Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.
alter table employees
add constraint fk_emp_dep_id 
foreign key (d_id)
references dep_table(d_id);

#Q13. Insert one employee record.
insert into employees
(e_id, e_name, dep, salary, city, hire_date, email)
values
(01, 'Riya', 'AI', 30000, 'Delhi',  '2026-06-26', 'r@gmail.com');

#14. Insert five employee records in a single INSERT statement.
insert into employees
(e_id, e_name, dep, salary, city, hire_date, email)
values
(02, 'Ziya', 'AI', 90000,'Delhi', '2026-03-26','z@gmail.com'),
(03, 'Liya', 'ML', 80000,'Hyderabad','2026-07-26','l@gmail.com'),
(04, 'Viya', 'DS', 70000,'Vizag', '2026-05-25', 'v@gmail.com'),
(05, 'Giya', 'SE', 60000, 'Hyderabad','2025-06-17','g@gmail.com'),
(06, 'Jiya', 'BD', 50000, 'Delhi','2024-04-18','j@gmail.com');

#Q15. Insert a department record.
insert  into dep_table
(d_id, d_name,location, budget )
values
(01, 'Data Science', 'Hyd', 50000),
(02, 'AI', 'Vizag', 90000);

#Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
create table student_table
(
s_id int primary key,
s_name varchar(30) not null,
class int,
email varchar(30) unique, 
grade int check (grade>0) default 0
);

#Q17. Create a table named attendance with employee_id, attendance_date, and status.
create table attendance
(
e_id int,
a_date date,
status varchar(30)
);

#Q18. Create a table only if it does not already exist.
create table  if not exists attendance
(
e_id int,
a_date date,
status varchar(30)
);

#Q19. Describe or display the structure of the employees table.
describe employees;

#Q20. Drop a temporary table named temp_data if it exists.
drop table if exists temp_data;

#2. Basic SELECT & Filtering (21–45)
-- Q21. Display all columns from the employees table.
select * from employees;

-- Q22. Display only employee_name and salary.
select e_name, salary from employees;

-- Q23. Display employees who live in Hyderabad.
select * from employees
where city = 'Hyderabad';

-- Q24. Display employees whose salary is greater than 60000.
select * from employees
where salary > 60000;

-- Q25. Display employees whose salary is less than or equal to 50000.
select * from employees
where salary < 50000;

-- Q26. Display employees whose salary is between 50000 and 70000.
select * from employees
where salary  between 50000 and 70000;

-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
select * from employees
where city in ('Hyderabad', 'Banglore', 'Mumbai');

-- Q28. Display employees who do not live in Hyderabad.
select * from employees
where city <>'Hyderabad';

-- SQL Practice Bank • Page 1
-- Q29. Display employees whose names start with 'A'.
select * from employees
where e_name like 'A%';

-- Q30. Display employees whose names end with 'a'.
select * from employees
where e_name like '%a';

-- Q31. Display employees whose names contain the letter 'i'.
select * from employees
where e_name like '%i%';

-- Q32. Display employees whose department is NULL.
select * from employees
where dep is null;

-- Q33. Display employees whose department is NOT NULL.
select * from employees
where dep is  not null;

-- Q34. Display employees hired after 2022-01-01.
select * from employees
where hire_date = '2022-01-01';

-- Q35. Display employees hired between two given dates.
select * from employees
where hire_date  between '2026-03-26' and '2026-07-26';

-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select * from employees
where salary > 50000
and city = 'Hyderabad';

-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select * from employees
where city = 'Hyderabad'
or salary > 70000;

-- Q38. Display employees who are NOT in the HR department.
select * from employees
where dep <> 'HR';

-- Q39. Display distinct cities from the employees table.
select distinct  city
from employees;

-- Q40. Display distinct departments from the employees table.
select distinct  dep
from employees;

-- Q41. Display employees sorted by salary in ascending order.
select salary from employees
order by salary asc;

-- Q42. Display employees sorted by salary in descending order.
select salary from employees
order by salary desc;

-- Q43. Display employees sorted first by department and then by salary descending.
select salary, dep from employees
order by dep asc, salary desc;

-- Q44. Display the first 5 employees after sorting by employee_id.
select e_name, e_id from employees
order by e_id  asc
limit 5;

-- Q45. Display the top 3 highest-paid employees.
select e_name,dep, salary from employees
order by  salary desc
limit 3;

-- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65)
-- Q46. Update the salary of one employee using employee_id.
update employees
set salary = 95000
where e_id = 2;

-- Q47. Increase the salary of all employees by 10 percent.
update employees
set salary = salary * 1.10
where e_id>0;

-- Q48. Increase the salary of employees in the Data Science department by 5000.
update employees
set salary = salary+5000
where dep = 'Data Science'
and e_id > 0;

-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update employees
set city = 'Bengaluru'
where city = 'Banglore'
and e_id > 0;

-- Q50. Delete one employee using employee_id.
delete from  employees
where e_id = 5;

-- Q51. Delete employees whose salary is below a specified amount.
delete from employees
where salary < 60000
and e_id>0;

-- Q52. Add an email column to the employees table.
alter table employees
add column email varchar(50);

-- Q53. Add a phone_number column to the employees table.
alter table employees
add column ph_num varchar(50);

-- Q54. Modify the length of the employee_name column.
alter table  employees
modify column e_name varchar(100);

-- Q55. Rename the city column to employee_city.
alter table  employees
rename column city to e_city;

-- Q56. Drop the phone_number column.
alter table employees
drop column ph_num;

-- Q57. Display employee names in uppercase.
select lower(e_name) from employees;

-- Q58. Display employee names in lowercase.
select upper(e_name) from employees;

-- Q59. Display the length of every employee name.
select length(e_name) from employees;

-- Q60. Display the first three characters of every employee name.
select e_name, left(e_name, 3)
from employees;

-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
 select e_name, salary,
 round(salary/1000)*1000
 from employees;
 
-- Q62. Display the current date.
select e_name, curdate() from employees;

-- SQL Practice Bank • Page 2
-- Q63. Calculate how many years each employee has worked using hire_date.
select hire_date, e_name,
timestampdiff(year, hire_date, curdate())  as years_worked
from employees;

-- Q64. Replace NULL department values with 'Unassigned' in the query result.
select e_name,
ifnull(dep, 'unassigned')
from employees;

-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
select e_name, salary,
case 
    when salary < 30000 then  'low'
    when salary <= 60000 then 'medium'
    else 'high'
    end as salary_level
    from employees;
    
    -- 4. Aggregate Functions, GROUP BY & HAVING (66–90)
-- Q66. Find the total number of employees.
select dep from employees
group by dep;

-- Q67. Find the total salary paid to all employees.
select salary from employees
group by salary;

-- Q68. Find the average salary of all employees.
select dep, avg(salary), count(*)
from employees
group by dep;

-- Q69. Find the highest salary.
select dep, max(salary) from employees
where salary>90000
group by dep;

-- Q70. Find the lowest salary.
select dep, min(salary) from employees
group by dep;

-- Q71. Find the number of employees in Hyderabad.
select e_city,count(*)  as emp_count
from employees
where e_city='Hyderabad';

-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary)
from employees
where e_city = 'Mumbai';

-- Q73. Find the average salary of employees in Bangalore.
select avg(salary)
from employees
where e_city = 'Banglore';

-- Q74. Find the number of employees in each department.
select dep, count(*)
from employees
group by dep;

-- Q75. Find the average salary in each department.
select dep, avg(salary),count(*)
from employees
group by dep;

-- Q76. Find the maximum salary in each department.
select dep, max(salary),count(*)
from employees
group by dep;

-- Q77. Find the minimum salary in each department.
select dep, min(salary),count(*)
from employees
group by dep;

-- Q78. Find the total salary in each department.
select dep, sum(salary),count(*)
from employees
group by dep;

-- Q79. Find the number of employees in each city.
select e_city,count(*)
from employees
group by e_city;

-- Q80. Find the average salary in each city.
select e_city, avg(salary),count(*)
from employees
group by e_city;

-- Q81. Find departments having more than 5 employees.
select dep,count(*)
from employees
group by dep
having count(*)>5;

-- Q82. Find departments whose average salary is greater than 60000.
select dep, avg(salary), count(*)
from employees
group by dep
having count(*)<60000;

-- Q83. Find cities whose total salary is greater than 200000.
select dep, sum(salary), count(*)
from employees
group by dep
having count(*)<20000;

-- Q84. Find the department with the highest total salary.
select dep, sum(salary), count(*)
from employees
group by dep 
order by sum(salary) desc
limit 2;

-- Q85. Find the department with the highest average salary.
select dep, avg(salary), count(*)
from employees
group by dep 
order by avg(salary) desc
limit 1;

-- Q86. Display employee count and average salary for each department and city combination.
select dep, e_city, count(*) as employee_count, avg(salary)
from employees
group by dep, e_city;

-- Q87. Find the difference between the maximum and minimum salary in each department.
select dep, max(salary)-min(salary) 
from employees
group by dep;

-- Q88. Find departments where the maximum salary is greater than 70000.
select dep, max(salary)
from employees
group by dep
having max(salary)< 70000;

-- Q89. Find cities having at least 3 employees with salary above 60000.
select e_city, count(*) from employees
where salary>60000
group by e_city
having count(*) >3;

-- Q90. Find the total number of distinct departments and distinct cities.
select count(distinct dep) as total_departments,
count(distinct e_city) as total_cities 
from employees;

-- 5. Constraints, Keys & Data Integrity (91–105)
-- Q91. Create a products table with product_id as PRIMARY KEY.
create table products
(
p_id int primary key
);

-- Q92. Create a users table where email must be UNIQUE.
create table users
(
email varchar(30)
);
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
create table orders
(
ord_amount int check ( ord_amount>0) default 0
);

-- Q94. Create a customers table where customer_name cannot be NULL
create table customers
(
cx_name varchar(30) not null
);

-- Q95. Create a table with a DEFAULT status value of 'Active'.
create table cement
(
status varchar(25) default 'active'
);
-- SQL Practice Bank • Page 3
-- Q96. Insert a row that uses the DEFAULT value.
insert into cement (status)
values ('default');

-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
insert into products (p_id)
values (01);
# The PRIMARY KEY constraint is violated because duplicate primary key value 1 already exists in the products table.

-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
alter table products
add column email varchar(50) 
unique;

insert into products (p_id, email)
value (1, 'x@gmail.com'),
(2, 'y@gmail.com');
# The UNIQUE constraint on the email column is violated because x@gmail.com already exists.

-- Q99. Create employees and departments with a FOREIGN KEY relationship.
create table emp
(
e_id int primary key,
e_dep varchar(20),
e_name varchar(40)
);
create table depart
(
d_id int primary key,
dep varchar(20),
d_name varchar(30),
foreign key (d_id)
references emp(e_id)
);
insert into emp values
(01,'HR', 'Varsha'),
(02, 'AI', 'Harsha');
insert into depart values
(01,'ML', 'Zayn'),
(02, 'UX', 'Zain');

-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
create table emp
(
e_id int primary key,
e_dep varchar(20),
e_name varchar(40)
);
create table depart
(
d_id int primary key,
dep varchar(20),
d_name varchar(30),
foreign key (d_id)
references emp(e_id)
);
insert into emp values
(01,'HR', 'Varsha'),
(02, 'AI', 'Harsha');
insert into depart values
(01,'ML', 'Zayn'),
(02, 'UX', 'Zain');

-- Q101. Attempt to insert an employee with a department_id that does not exist.
insert into emp values
(03, 'Sales Manager', 'Ajay'),
(04, 'TL', 'TL', 'Vijay');
insert into depart values
(03,'ML', 'Zayn'),
(99,'Manager', 'Siri');

-- Q102. Add a CHECK constraint to allow age only between 18 and 60
-- Q103. Create a composite PRIMARY KEY using two columns.
-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
-- Q105. Create a table with a named constraint and then identify its purpose.

-- 6. JOINs Including Self Join (106–135)
-- Q106. Display employee_name and department_name using an INNER JOIN.
select e_name,d_name
from emp
inner join depart
on emp.e_name = depart.d_name;

-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
Create table location
(
    location_id int,
    location Varchar(30)
);
Insert into location Values
(1, 'Hyderabad'),
(2, 'Bangalore'),
(3, 'Chennai');

Alter table depart
Add location_id int;
select e_name, salary, d_name, location
from emp as e
inner join depart as d
on e.e_id = d.d_id
inner join location as l
on d.location_id = l.location_id;


-- Q108. Find employees working in the Data Science department using a JOIN.
select e_name, d.dep
from emp as e
inner join depart as d
on e.e_id = d.d_id
where d.dep= 'Data Science';

-- Q109. Find employees working in departments located in Hyderabad.
select e_name, e.dep
from emp as e
inner join depart as d
on e.e_id= d.d_id
where d.location_id = 'Hyderabad';

-- Q110. Display all employees even if they do not belong to any department.
select e_name, e.dep
from emp as e
left join depart as d
on e.dep= d.dep;

-- Q111. Display all departments even if they have no employees.
select e_name, e.dep
from depart as d
left join emp as e
on d.d_id = e.dep;

-- Q112. Find departments that currently have no employees.
Select d.d_name
From depart as d
left join  emp as e
on  d.d_id = e.dep;

-- Q113. Find employees who do not have a matching department.
select d.d_name
from depart as d
right join  emp as e
on  d.d_id = e.dep
where d.d_id is null;

-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
select d.d_name, count(e.e_id)
from emp as e
inner join depart as d
on e.dep = d.d_id
group by d.d_name;

-- Q115. Find the average salary in each department using JOIN and GROUP BY.
select d.d_name, avg(salary), count(e.e_id)
from emp as e
inner join depart as d
on e.dep = d.dep
group by d.d_name;
-- Q116. Display each department with employee count including departments with zero employees.
select  d.d_name, count(e.e_id)
from  depart as d
inner join emp as e
on d.d_id = e.dep
group by d.d_name;

-- Q117. Display each department with total salary including departments with zero employees.
select  d.d_name, sum(salary),count(e.e_id)
from  depart as d
left join emp as e
on d.d_id = e.dep
group by d.d_name;
-- Q118. Join departments with projects and display department_name and project_name.
create table projects
(
p_name varchar(30),
pdep_name varchar (30) 
);
insert into projects values
('Design', 'SQL'),
('Palo', 'Python');

select d.d_name, p.p_name
from projects as p
Inner join   depart as d
on p.pdep_name = d.d_name;

-- Q119. Display employees, department names, and project names using appropriate joins.
select e.e_name, d.d_name, p.p_name
from emp as e
inner join  depart as d
on e.dep = d.d_id
inner join projects as p
on p.pdep_name = d.d_name;

-- Q120. Find departments that have at least one project.
select d.d_name, p.p_name
from projects as p
Inner join   depart as d
on p.pdep_name = d.d_name;

-- Q121. Find departments that have no projects.
select d.d_name, p.p_name
from projects as p
left join   depart as d
on p.pdep_name = d.d_name
where p.p_name is null;

-- Q122. Create an employee-manager relationship using manager_id in the employees table.
create table manager
(
e_id int null,
mngr_id int null,
emp_name varchar(25),
mngr_name varchar(25),
salary int,
department_name varchar(25),
dep_id int,
proj_name varchar(30),
proj_budget int,
dep_budget int
);

insert into manager values
(111, 108, 'Visha', 'Vishal', 25000, 'DataScience', 1211, 'DSL', 50000, 500000),
(121, 121, 'Isha', 'Raghu', 35000, 'DataScienist', 1212, 'ML', 60000, 600000),
(131, 108, 'Risha', 'Vishal', 45000, 'DataScience', 1211, 'DSL', 50000, 500000),
(141, 125, 'Vishva', 'Sneha', 25000, 'Data Analyst', 1215, 'Analyse', 40000, 400000),
(125,135, 'Vishvani', 'Sneha', 35000, 'Data Analyst', 1215, 'Analyse', 40000, 400000);

select e.emp_name as employee,
       m.mngr_name as manager
from manager as e
left join  manager as m
on e.mngr_id = m.e_id;

-- Q123. Using a SELF JOIN, display employee name and manager name.
select e.emp_name as employee,
       m.mngr_name as manager
from manager as e
left join  manager as m
on e.mngr_id = m.e_id;


-- Q124. Using a SELF JOIN, display only employees who have managers.
select e.emp_name as employee,
       m.mngr_name as manager
from manager as e
left join  manager as m
on e.mngr_id = m.e_id
where m.emp_name is not null;

-- Q125. Using a SELF JOIN, display employees who do not have managers.
select e.emp_name as employee,
       m.mngr_name as manager
from manager as e
left join  manager as m
on e.mngr_id = m.e_id
where m.emp_name is null;

-- Q126. Find all managers who manage at least one employee.
select m.mngr_name as manager
from manager as e
inner join  manager as m
on e.mngr_id = m.e_id;

-- Q127. Count the number of employees reporting to each manager.
select m.mngr_name as manager, count(e.e_id) as employee_count
from manager as e
inner join manager as m
on e.mngr_id = m.e_id
group by m.mngr_name;

-- Q128. Find managers who manage more than 3 employees.
select m.mngr_name as m, count(e.e_id) as employee_count
from manager as e
inner join manager as m
on e.mngr_id = m.e_id
group by m.mngr_name
having count(e.e_id) >3;

-- Q129. Display employee, manager, and employee salary using a SELF JOIN
select e.emp_name as  employee,m.mngr_name as m,  e.salary as emp_salary
from manager as e
left join manager as m
on e.mngr_id = m.e_id;

-- SQL Practice Bank • Page 4
-- Q130. Find employees whose salary is greater than their manager's salary.
select e.emp_name as  employee,m.mngr_name as m,  e.salary as emp_salary
from manager as e
left join manager as m
on e.mngr_id = m.e_id
where e.salary > m.salary;

-- Q131. Find employees who work in the same department as their manager.
select e.emp_name as  employee, m.mngr_name as m
from manager as e
left join manager as m
on e.mngr_id = m.e_id
where e.dep_id = m.dep_id;

-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
select e.e_name, e.dep
from emp as e
left join depart as d
on e.dep = d.d_id
where d.d_id is null;

-- Q133. Use multiple JOINs to display employee, department, and project information.
select e.e_name as employee,
       d.d_name as department,
       p.p_name as project
from emp as e
inner join depart as d
on  e.dep = d.d_id
inner join projects as p
on p.pdep_name = d.d_name;

-- Q134. Find the total project budget for each department.
DESCRIBE projects;
select department_name,
       sum(proj_budget) as total_project_budget
from manager
group by department_name;
-- Q135. Find departments whose total project budget is greater than their department budget.
select department_name,
       sum(proj_budget) as total_project_budget
from manager
group by department_name
having SUM(proj_budget)> max(dep_budget);

-- 7. Subqueries (136–155)
-- Q136. Find employees whose salary is greater than the overall average salary.
select e_name, salary
from emp
where salary > (
    select avg(salary)
    from emp
);
-- Q137. Find the employee or employees with the highest salary using a subquery.
select e_name, salary
from emp
where salary < 
		(select max(salary)
        from emp
        );

-- Q138. Find the employee or employees with the lowest salary using a subquery.
select e_name, salary
from emp
where salary < 
		(select min(salary)
        from emp
        );
-- Q139. Find employees who earn the same salary as Alice.
select employee_name, salary
from company.`new data`
 where salary =  (select salary
        from company.`new data`
		where employee_name = 'Alice'		
        );
-- Q140. Find employees who earn more than Alice.
select employee_name, salary
from company.`new data`
 where salary > (select salary
        from company.`new data`
		where employee_name = 'Alice'		
        );
-- Q141. Find employees working in the same department as Alice.
select employee_name, salary, department
from company.`new data`
 where department =  (select department
        from company.`new data`
		where employee_name = 'Alice'		
        );
        
-- Q142. Find employees whose salary is greater than the average salary of their department.
select employee_name, salary
from company.`new data` as e
where salary > (select avg(salary)
             from  company.`new data` as e1
            where e1.department = e.department 
			);

-- Q143. Find employees whose salary is less than the average salary of their department.
select employee_name, salary
from company.`new data` as e
where salary < (select avg(salary)
             from  company.`new data` as e1
            where e1.department = e.department 
			);
            
-- Q144. Find the department with the highest average salary using a subquery.
select department, AVG(salary) as  avg_salary
from company.`new data` 
group by department
having AVG(salary) =  (select max(avg_salary)
             from  
             (
             select AVG(salary) as avg_salary
             from company.`new data`
             group by department 
             ) as x
			);
            
-- Q145. Find departments whose average salary is greater than the company average salary.
select department, avg(salary)
from company.`new data`
group by department
having avg(salary) > 
               ( select avg(salary)
               from company.`new data`
               );
               
-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
select employee_name, department 
from company.`new data`
where department in ( select department
from company.`new data`
where city = 'Hyderabad'
 );
               
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS
select d.d_name
from depart as d
where not exists (
    select 1
    from company.`new data` as e
    where e.department = d.d_name
);


-- Q148. Find departments that have at least one employee using EXISTS.
SELECT DISTINCT e.department
FROM company.`new data` AS e
WHERE EXISTS (
    SELECT 1
    FROM companydb.`new data` AS e2
    WHERE e2.department = e.department
);
-- Q149. Find departments that have no employees using NOT EXISTS.
SELECT d.d_name
FROM depart AS d
WHERE NOT EXISTS (
    SELECT 1
    FROM company.`new data` AS e
    WHERE e.department = d.d_name
);
-- Q150. Find employees whose salary is greater than every employee in the HR department.
SELECT employee_name, salary
FROM company.`new data`
WHERE salary > (
    SELECT MAX(salary)
    FROM company.`new data`
    WHERE department = 'HR'
);
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
SELECT employee_name, salary
FROM company.`new data`
WHERE salary > (
    SELECT MIN(salary)
    FROM company.`new data`
    WHERE department = 'Finance'
);
-- Q152. Find the second-highest distinct salary using a subquery.
SELECT MAX(salary)
FROM company.`new data`
WHERE salary < (
    SELECT MAX(salary)
    FROM company.`new data`
);
-- Q153. Find the third-highest distinct salary using a subquery.
SELECT MAX(salary)
FROM company.`new data`
WHERE salary < (
    SELECT MAX(salary)
    FROM company.`new data`
    WHERE salary < (
        SELECT MAX(salary)
        FROM company.`new data`
    )
);
-- Q154. Find employees with the second-highest distinct salary
SELECT employee_name, salary
FROM company.`new data`
WHERE salary = (
    SELECT MAX(salary)
    FROM company.`new data`
    WHERE salary < (
        SELECT MAX(salary)
        FROM company.`new data`
    )
);
-- Q155. Use a correlated subquery to find employees earning above their department average.
SELECT e.employee_name,
       e.department,
       e.salary
FROM company.`new data` AS e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM company.`new data` AS e2
    WHERE e2.department = e.department
);
-- 8. CTEs — Common Table Expressions (156–170)
-- Q156. Create a CTE containing employees whose salary is greater than 60000
with high_salary as
(
select salary
from company.`new data` 
where salary>60000
)
select*
from high_salary;

-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.
WITH company_avg AS
(
    SELECT AVG(salary) AS avg_salary
    FROM company.`new data`
)
SELECT employee_name, salary
FROM company.`new data`
WHERE salary > (SELECT avg_salary FROM company_avg);

-- Q158. Use a CTE to calculate average salary by department.
WITH avg_salary AS
(
    SELECT department,
           AVG(salary) AS average_salary
    FROM company.`new data`
    GROUP BY department
)
SELECT *
FROM avg_salary;
-- Q159. Use a CTE to find departments with average salary greater than 60000.
WITH dept_avg AS
(
    SELECT department, AVG(salary) AS avg_salary
    FROM company.`new data`
    GROUP BY department
)
SELECT department, avg_salary
FROM dept_avg
WHERE avg_salary > 60000;
-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.
WITH dept_stats AS
(
    SELECT 
        department,
        COUNT(*) AS employee_count,
        AVG(salary) AS avg_salary,
        MAX(salary) AS max_salary,
        MIN(salary) AS min_salary
    FROM company.`new data`
    GROUP BY department
),
high_paying_depts AS
(
    SELECT department, avg_salary
    FROM dept_stats
    WHERE avg_salary > 60000
)
SELECT *
FROM high_paying_depts;
-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.
-- Q162. Use a CTE to find the highest salary in each department.
-- SQL Practice Bank • Page 5
-- Q163. Use a CTE to find employees earning above their department average.
-- Q164. Use a CTE to rank employees by salary.
-- Q165. Use a CTE to find the top 2 highest-paid employees.
-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.
-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.
-- Q168. Create a CTE that joins employees and departments, then filter the result.
-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3
-- employees.
-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.
-- 9. Window Functions (171–180)
-- Q171. Assign a unique row number to all employees ordered by salary descending.
-- Q172. Assign a row number to employees within each department ordered by salary descending.
-- Q173. Rank employees by salary using RANK().
-- Q174. Rank employees by salary using DENSE_RANK().
-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.
-- Q176. Display the company average salary beside every employee using AVG() OVER().
-- Q177. Display the department average salary beside every employee using PARTITION BY.
-- Q178. Calculate a running total of salary ordered by hire_date.
-- Q179. Use LAG() to display the previous employee's salary when ordered by hire_date.
-- Q180. Use LEAD() to display the next employee's salary when ordered by hire_date.

-- 10. Hard SQL Challenge Questions (181–200)
-- Q181. Find the top 3 highest-paid employees in every department, including ties if appropriate. Hint: Compare
select * from companydb.employees
where salary >70000
limit 3;
	
-- ROW_NUMBER, RANK, and DENSE_RANK before choosing one.
-- Q182. Find the employee whose salary is closest to the average salary of their department. Hint: Calculate
-- department average with a window function, then compare absolute differences.
-- Q183. For every department, find the difference between its highest-paid and second-highest distinct salary. Hint:
-- Use DENSE_RANK in a CTE.
-- Q184. Find employees whose salary is higher than their manager and whose department average salary is also
-- above the company average. Hint: Combine SELF JOIN, window/aggregate logic, and a CTE.
-- Q185. Find the first employee hired in each department and the most recently hired employee in each department.
-- Hint: Use two rankings ordered in opposite directions.
-- Q186. Find departments where every employee earns more than 50000. Hint: Think about MIN(salary) or NOT
-- EXISTS.
-- Q187. Find departments where at least 70 percent of employees earn above the company average salary. Hint:
-- Use conditional aggregation and a company-average CTE.
-- Q188. Find the longest consecutive hiring-date gap between employees when ordered by hire_date. Hint: Use
-- LAG() and date difference logic.
-- SQL Practice Bank • Page 6
-- Q189. Find employees whose salary increased relative to the previous employee in their department when ordered
-- by hire_date. Hint: PARTITION BY department with LAG().
-- Q190. Find the department with the largest salary inequality, measured as maximum salary minus minimum salary.
-- Hint: Aggregate first, then rank the result.
-- Q191. Find employees who share their salary with another employee in the same department. Hint: GROUP BY
-- department and salary, or use a window COUNT().
-- Q192. Find the third-highest distinct salary in each department and return all employees who earn it. Hint:
-- DENSE_RANK plus a CTE.
-- Q193. Find departments whose total employee salary exceeds their project budget, and return the difference. Hint:
-- Aggregate employee salary and project budget separately before joining.
-- Q194. Find employees who belong to departments with no projects but earn above their department average. Hint:
-- Combine NOT EXISTS with a window calculation.
-- Q195. Return one row per department containing the employee with the highest salary, the employee with the
-- lowest salary, and the department average. Hint: Use conditional aggregation after ranking.
-- Q196. Find employees who are in the top 20 percent of salaries within their department. Hint: Investigate NTILE(5)
-- or percentile-related window logic supported by your SQL database.
-- Q197. Find the median salary in each department. Hint: The exact syntax depends on your SQL database;
-- consider ROW_NUMBER plus counts if percentile functions are unavailable.
-- Q198. Find employees whose salary is greater than the average salary of all employees hired before them. Hint:
-- This requires a running window frame or correlated logic.
-- Q199. Find managers whose direct reports collectively earn more than the manager and identify the difference.
-- Hint: SELF JOIN, GROUP BY, and aggregation.
-- Q200. Create a report showing for every employee: company salary rank, department salary rank, department
-- average, difference from department average, previous salary by hire date, and next salary by hire date. Hint: Use
-- multiple window functions in one SELECT or organize them with a CTE.
