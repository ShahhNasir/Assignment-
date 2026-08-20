
-- 1–20. database & table creation


-- Q1. create a database named company_db.
create database company_db;


-- Q2. select and use the company_db database.
use company_db;


-- Q3. create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.
create table employees (employee_id int,
employee_name varchar(100),
department varchar(100),
salary decimal(10,2),
city varchar(100),
hire_date date);


-- Q4. make employee_id the primary key.
alter table employees add primary key (employee_id);


-- Q5. make employee_name not null.
alter table employees modify employee_name varchar(100) not null;


-- Q6. add a unique constraint to an email column.

-- add email column
alter table employees
add email varchar(100);

-- add unique constraint
alter table employees
add unique (email);

-- Q7. add a check constraint so salary must be greater than 0.
alter table employees add check (salary > 0);


-- Q8. add a default value of 'hyderabad' for the city column.
alter table employees alter city
set default 'hyderabad';


-- Q9. create a departments table with department_id, department_name, location, and budget.

create table departments (
department_id int,
department_name varchar(100),
location varchar(100),
budget decimal(12,2)
);

-- Q10. make department_id the primary key in the departments table.

alter table departments
add primary key (department_id);


-- Q11. create a projects table with project_id, project_name, department_id, and budget.
create table projects (project_id int,
project_name varchar(100),
department_id int,
budget decimal(12,2));


-- Q12. add a foreign key from employees.department_id to departments.department_id.

alter table employees
add constraint fk_employee_department
foreign key (department_id)
references departments(department_id);

-- Q13. insert one employee record.
insert into employees 
values (1, 'alice', 'hr', 55000, 'hyderabad', '2023-01-10');


-- Q14. insert five employee records in a single insert statement.
insert into employees 
values (2,'bob','finance',65000,'mumbai','2022-03-15'),
(3,'carol','data science',80000,'hyderabad','2021-07-20'),
(4,'david','hr',50000,'bangalore','2023-05-01'),
(5,'emma','finance',72000,'mumbai','2020-11-12'),
(6,'frank','data science',90000,'hyderabad','2022-08-18');


-- Q15. insert a department record.

insert into departments
values (1,'hr','hyderabad',500000);



-- Q16. create a students table with primary key, not null, unique, check, and default constraints.

create table students (
student_id int primary key,
student_name varchar(100) not null,
email varchar(150) unique,
age int check (age >= 18),
city varchar(100) default 'hyderabad'
);


-- Q17. create a table named attendance with employee_id, attendance_date, and status.
create table attendance (employee_id int,
attendance_date date,
status varchar(20));

-- Q18. create a table only if it does not already exist.
create table if not exists employees (employee_id int primary key,
employee_name varchar(100));

-- Q19. describe or display the structure of the employees table.
describe employees;


-- Q20. drop a temporary table named temp_data if it exists.
drop table if exists temp_data;

-- 21–45. basic select & filtering


-- Q21. display all columns from the employees table.
select * from employees;


-- Q22. display only employee_name and salary.
select employee_name, salary
from employees;


-- Q23. display employees who live in hyderabad.
select * from employees
where city = 'hyderabad';


-- Q24. display employees whose salary is greater than 60000.
select * from employees
where salary > 60000;


-- Q25. display employees whose salary is less than or equal to 50000.
select * from employees
where salary <= 50000;


-- Q26. display employees whose salary is between 50000 and 70000.
select * from employees
where salary between 50000 and 70000;


-- Q27. display employees who live in hyderabad, bangalore, or mumbai using in.
select * from employees
where city in ('hyderabad', 'bangalore', 'mumbai');


-- Q28. display employees who do not live in hyderabad.
select * from employees
where city <> 'hyderabad';


-- Q29. display employees whose names start with 'a'.
select * from employees
where employee_name like 'a%';


-- Q30. display employees whose names end with 'a'.
select * from employees
where employee_name like '%a';


-- Q31. display employees whose names contain the letter 'i'.
select * from employees
where employee_name like '%i%';


-- Q32. display employees whose department is null.
select * from employees
where department is null;


-- Q33. display employees whose department is not null.
select * from employees
where department is not null;


-- Q34. display employees hired after 2022-01-01.
select * from employees
where hire_date > '2022-01-01';


-- Q35. display employees hired between two given dates.
select * from employees
where hire_date between '2022-01-01' and '2023-12-31';


-- Q36. display employees with salaries greater than 50000 and who live in hyderabad.
select * from employees
where salary > 50000 and city = 'hyderabad';


-- Q37. display employees who live in hyderabad or earn more than 70000.
select * from employees
where city = 'hyderabad' or salary > 70000;


-- Q38. display employees who are not in the hr department.
select * from employees
where department <> 'hr' or department is null;



-- Q39. display distinct cities from the employees table.
select distinct city from employees;


-- Q40. display distinct departments from the employees table.
select distinct department
from employees;


-- Q41. display employees sorted by salary in ascending order.
select * from employees
order by salary asc;


-- Q42. display employees sorted by salary in descending order.
select * from employees
order by salary desc;


-- Q43. display employees sorted first by department and then by salary descending.
select * from employees
order by department asc, salary desc;


-- Q44. display the first 5 employees after sorting by employee_id.
select * from employees
order by employee_id
limit 5;


-- Q45. display the top 3 highest-paid employees.
select * from employees
order by salary desc
limit 3;


-- 46–65. update, delete, alter & basic functions


-- Q46. update the salary of one employee using employee_id.
update employees
set salary = 60000
where employee_id = 1;


-- Q47. increase the salary of all employees by 10 percent.
update employees
set salary = salary * 1.10;


-- Q48. increase the salary of employees in the data science department by 5000.
update employees
set salary = salary + 5000
where department = 'data science';


-- Q49. change the city of all employees currently living in bangalore to bengaluru.
update employees
set city = 'bengaluru'
where city = 'bangalore';


-- Q50. delete one employee using employee_id.
delete
from employees
where employee_id = 1;



-- Q51. delete employees whose salary is below a specified amount.
delete
from employees
where salary < 30000;


-- Q52. add an email column to the employees table.
alter table employees add email varchar(150);


-- Q53. add a phone_number column to the employees table.
alter table employees add phone_number varchar(20);


-- Q54. modify the length of the employee_name column.
alter table employees modify employee_name varchar(150);


-- Q55. rename the city column to employee_city.
alter table employees rename column city to employee_city;


-- Q56. drop the phone_number column.
alter table employees drop column phone_number;


-- Q57. display employee names in uppercase.
select upper(employee_name) as employee_name
from employees;



-- Q58. display employee names in lowercase.
select lower(employee_name) as employee_name
from employees;


-- Q59. display the length of every employee name.
select employee_name, length(employee_name) as name_length
from employees;


-- Q60. display the first three characters of every employee name.
select employee_name, left(employee_name, 3) as first_three_characters
from employees;


-- Q61. display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select employee_name, round(salary, -3) as rounded_salary
from employees;


-- Q62. display the current date.
select current_date() as current_date;


-- Q63. calculate how many years each employee has worked using hire_date.
select employee_name, timestampdiff(year, hire_date, current_date()) as years_worked
from employees;


-- Q64. replace null department values with 'unassigned' in the query result.
select employee_name, coalesce(department, 'unassigned') as department
from employees;


-- Q65. use case to label employees as low, medium, or high salary based on salary ranges.
select employee_name, salary,
case when salary < 50000 then 'low' when salary <= 70000 then 'medium' else 'high' end as salary_level
from employees;


-- 66–90. aggregate functions, group by & having


-- Q66. find the total number of employees.
select count(*) as total_employees
from employees;


-- Q67. find the total salary paid to all employees.
select sum(salary) as total_salary
from employees;


-- Q68. find the average salary of all employees.
select avg(salary) as average_salary
from employees;


-- Q69. find the highest salary.
select max(salary) as highest_salary
from employees;


-- Q70. find the lowest salary.
select min(salary) as lowest_salary
from employees;


-- Q71. find the number of employees in hyderabad.
select count(*) as hyderabad_employees
from employees
where city = 'hyderabad';


-- Q72. find the total salary paid to employees in mumbai.
select sum(salary) as mumbai_total_salary
from employees
where city = 'mumbai';


-- Q73. find the average salary of employees in bangalore.
select avg(salary) as bangalore_average_salary
from employees
where city = 'bangalore';



-- Q74. find the number of employees in each department.
select department, count(*) as employee_count
from employees
group by department;


-- Q75. find the average salary in each department.
select department, avg(salary) as average_salary
from employees
group by department;


-- Q76. find the maximum salary in each department.
select department, max(salary) as maximum_salary
from employees
group by department;


-- Q77. find the minimum salary in each department.
select department, min(salary) as minimum_salary
from employees
group by department;


-- Q78. find the total salary in each department.
select department, sum(salary) as total_salary
from employees
group by department;


-- Q79. find the number of employees in each city.
select city, count(*) as employee_count
from employees
group by city;


-- Q80. find the average salary in each city.
select city, avg(salary) as average_salary
from employees
group by city;


-- Q81. find departments having more than 5 employees.
select department, count(*) as employee_count
from employees
group by department
having count(*) > 5;


-- Q82. find departments whose average salary is greater than 60000.
select department, avg(salary) as average_salary
from employees
group by department
having avg(salary) > 60000;


-- Q83. find cities whose total salary is greater than 200000.
select city, sum(salary) as total_salary
from employees
group by city
having sum(salary) > 200000;


-- Q84. find the department with the highest total salary.
select department, sum(salary) as total_salary
from employees
group by department
order by total_salary desc
limit 1;


-- Q85. find the department with the highest average salary.
select department, avg(salary) as average_salary
from employees
group by department
order by average_salary desc
limit 1;


-- Q86. display employee count and average salary for each department and city combination.
select department, city, count(*) as employee_count, avg(salary) as average_salary
from employees
group by department, city;


-- Q87. find the difference between the maximum and minimum salary in each department.
select department, max(salary) - min(salary) as salary_difference
from employees
group by department;


-- Q88. find departments where the maximum salary is greater than 70000.
select department, max(salary) as maximum_salary
from employees
group by department
having max(salary) > 70000;


-- Q89. find cities having at least 3 employees with salary above 60000.
select city, count(*) as employees_above_60000
from employees
where salary > 60000
group by city
having count(*) >= 3;


-- Q90. find the total number of distinct departments and distinct cities.
select count(distinct department) as distinct_departments, count(distinct city) as distinct_cities
from employees;


-- 91–105. constraints, keys & data integrity


-- Q91. create a products table with product_id as primary key.
create table products (product_id int primary key);


-- Q92. create a users table where email must be unique.
create table users (user_id int primary key,
email varchar(150) unique);


-- Q93. create an orders table where order_amount must be greater than 0 using check.
create table orders (order_id int primary key,
order_amount decimal(12,2) check (order_amount > 0));


-- Q94. create a customers table where customer_name cannot be null.
create table customers (customer_id int primary key,
customer_name varchar(100) not null);


-- Q95. create a table with a default status value of 'active'.
create table accounts (account_id int primary key,
status varchar(20) default 'active');


-- Q96. insert a row that uses the default value.
insert into accounts (account_id)
values (1);


-- Q97. attempt to insert a duplicate primary key and explain which constraint is violated.
insert into products (product_id)
values (1); -- running another insert with product_id = 1 violates the primary key constraint


-- Q98. attempt to insert a duplicate unique email and explain which constraint is violated.
insert into users (user_id, email)
values (1, 'a@example.com'); -- inserting another row with the same email violates the unique constraint


-- Q99. create employees and departments with a foreign key relationship.
create table departments (department_id int primary key,
department_name varchar(100));
create table employees (employee_id int primary key,
employee_name varchar(100),
department_id int, foreign key (department_id) references departments(department_id));


-- Q100. insert valid parent and child records respecting the foreign key.
insert into departments (department_id, department_name)
values (1, 'hr');

insert into employees (employee_id, employee_name, department_id)
values (1, 'alice', 1);


-- Q101. attempt to insert an employee with a department_id that does not exist.
insert into employees (employee_id, employee_name, department_id)
values (2, 'bob', 999); -- fails because department_id 999 does not exist


-- Q102. add a check constraint to allow age only between 18 and 60.
alter table students add constraint chk_age check (age between 18 and 60);


-- Q103. create a composite primary key using two columns.
create table enrollment (student_id int,
course_id int, primary key (student_id, course_id));


-- Q104. create an attendance table where employee_id and attendance_date together form a composite key.
create table attendance (employee_id int,
attendance_date date,
status varchar(20), primary key (employee_id, attendance_date));



-- Q105. create a table with a named constraint and then identify its purpose.
create table employees (employee_id int,
salary decimal(10,2), constraint pk_employees primary key (employee_id), constraint chk_salary check (salary > 0));


-- 106–135. joins including self join


-- Q106. display employee_name and department_name using an inner join.
select employee_name, department_name
from employees as e 
inner join departments as d
on e.department_id = d.department_id;


-- Q107. display employee_name, salary, department_name, and location using a join.
select employee_name, salary, department_name, location
from employees as e
join departments as d
on e.department_id = d.department_id;


-- Q108. find employees working in the data science department using a join.
select e.employee_name
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name = 'data science';


-- Q109. find employees working in departments located in hyderabad.
select employee_name, department_name
from employees as e
join departments as d
on e.department_id = d.department_id
where d.location = 'hyderabad';


-- Q110. display all employees even if they do not belong to any department.
select employee_name, department_name
from employees as e 
left join departments as d
on e.department_id = d.department_id;


-- Q111. display all departments even if they have no employees.
select department_name, employee_name
from departments as d 
left join employees as e
on d.department_id = e.department_id;


-- Q112. find departments that currently have no employees.
select department_id, epartment_name
from departments as d 
left join employees as e
on d.department_id = e.department_id
where e.employee_id is null;


-- Q113. find employees who do not have a matching department.
select employee_name
from employees as e 
left join departments as d
on e.department_id = d.department_id
where d.department_id is null;


-- Q114. find the number of employees in each department using join and group by.
select d.department_name, count(e.employee_id) as employee_count
from departments as d 
left join employees as e
on d.department_id = e.department_id
group by d.department_id, d.department_name;


-- Q115. find the average salary in each department using join and group by.
select department_name, avg(salary) as average_salary
from departments as d 
left join employees as e
on d.department_id = e.department_id
group by d.department_id, d.department_name;


-- Q116. display each department with employee count including departments with zero employees.
select department_name, count(employee_id) as employee_count
from departments as d left
join employees as e
on d.department_id = e.department_id
group by d.department_id, d.department_name;


-- Q117. display each department with total salary including departments with zero employees.
select department_name, coalesce(sum(salary), 0) as total_salary
from departments as d
left join employees as e
on d.department_id = e.department_id
group by d.department_id, d.department_name;


-- Q118. join departments with projects and display department_name and project_name.
select department_name, project_name
from departments as d
join projects as p
on d.department_id = p.department_id;


-- Q119. display employees, department names, and project names using appropriate joins.
select employee_name, department_name, project_name from employees as e
join departments as d
on e.department_id = d.department_id left
join projects as p
on d.department_id = p.department_id;


-- Q120. find departments that have at least one project.
select distinct department_name from departments as d
join projects as p
on d.department_id = p.department_id;


-- Q121. find departments that have no projects.
select department_name from departments as d 
left join projects as p
on d.department_id = p.department_id
where p.project_id is null;


-- Q122. create an employee-manager relationship using manager_id in the employees table.
alter table employees add manager_id int;
alter table employees add constraint fk_manager foreign key (manager_id) references employees(employee_id);


-- Q123. using a self join, display employee name and manager name.
select employee_name as employee, employee_name as manager
from employees as e 
left join employees as m
on e.manager_id = m.employee_id;


-- Q124. using a self join, display only employees who have managers.
select employee_name as employee, employee_name as manager
from employees as e
join employees as m
on e.manager_id = m.employee_id;


-- Q125. using a self join, display employees who do not have managers.
select employee_name as employee
from employees as e 
left join employees as m
on e.manager_id = m.employee_id
where m.employee_id is null;


-- Q126. find all managers who manage at least one employee.
select distinct m.employee_id, m.employee_name
from employees as e
join employees as m
on e.manager_id = m.employee_id;


-- Q127. count the number of employees reporting to each manager.
select employee_id, employee_name, count(employee_id) as report_count
from employees as m
join employees as e
on e.manager_id = m.employee_id
group by m.employee_id, m.employee_name;


-- Q128. find managers who manage more than 3 employees.
select employee_id, employee_name, count(employee_id) as report_count
from employees as m
join employees as e
on e.manager_id = m.employee_id
group by m.employee_id, m.employee_name
having count(e.employee_id) > 3;


-- Q129. display employee, manager, and employee salary using a self join.
select employee_name as employee, employee_name as manager, salary as employee_salary
from employees as e
left join employees as m
on e.manager_id = m.employee_id;


-- Q130. find employees whose salary is greater than their manager's salary.
select employee_name, salary, employee_name as manager, salary as manager_salary
from employees as e
join employees as m
on e.manager_id = m.employee_id
where e.salary > m.salary;


-- Q131. find employees who work in the same department as their manager.
select employee_name, employee_name as manager, department_id
from employees as e
join employees as m
on e.manager_id = m.employee_id
where e.department_id = m.department_id;


-- Q132. use a left join to find unmatched rows between employees and departments.
select employee_name, department_name
from employees as e left
join departments as d
on e.department_id = d.department_id
where d.department_id is null;


-- Q133. use multiple joins to display employee, department, and project information.
select employee_name, department_name, project_name
from employees as e
join departments as d
on e.department_id = d.department_id left
join projects as p
on d.department_id = p.department_id;


-- Q134. find the total project budget for each department.
select department_name, coalesce(sum(budget), 0) as total_project_budget
from departments as d left
join projects as p
on d.department_id = p.department_id
group by d.department_id, d.department_name;


-- Q135. find departments whose total project budget is greater than their department budget.
select department_name, budget, sum(budget) as total_project_budget
from departments as d
join projects as p
on d.department_id = p.department_id
group by d.department_id, d.department_name, d.budget
having sum(p.budget) > d.budget;


-- 136–155. subqueries



-- Q136. find employees whose salary is greater than the overall average salary.
select * from employees
where salary > (select avg(salary)
from employees);


-- Q137. find the employee or employees with the highest salary using a subquery.
select * from employees
where salary = (select max(salary)
from employees);


-- Q138. find the employee or employees with the lowest salary using a subquery.
select * from employees
where salary = (select min(salary)
from employees);



-- Q139. find employees who earn the same salary as alice.
select * from employees
where salary = (select salary
from employees
where employee_name = 'alice'
limit 1);


-- Q140. find employees who earn more than alice.
select * from employees
where salary > (select salary
from employees
where employee_name = 'alice'
limit 1);


-- Q141. find employees working in the same department as alice.
select * from employees
where department_id = (select department_id
from employees
where employee_name = 'alice'
limit 1);


-- Q142. find employees whose salary is greater than the average salary of their department.
select * from employees as e
where salary > (select avg(salary)
from employees as x
where x.department_id = e.department_id);


-- Q143. find employees whose salary is less than the average salary of their department.
select * from employees as e
where salary < (select avg(salary)
from employees as x
where x.department_id = e.department_id);


-- Q144. find the department with the highest average salary using a subquery.
select department_id, avg(salary) as average_salary from employees
group by department_id
order by average_salary desc
limit 1;


-- Q145. find departments whose average salary is greater than the company average salary.
select department_id, avg(salary) as average_salary from employees
group by department_id
having avg(salary) > (select avg(salary)
from employees);


-- Q146. find employees who work in departments located in hyderabad using a subquery.
select * from employees
where department_id in (select department_id
from departments
where location = 'hyderabad');



-- Q147. find employees who do not belong to any existing department using not in or not exists.
select * from employees as e
where not exists (select 1
from departments as d
where d.department_id = e.department_id);


-- Q148. find departments that have at least one employee using exists.
select * from departments as d
where exists (select 1
from employees as e
where e.department_id = d.department_id);


-- Q149. find departments that have no employees using not exists.
select * from departments as d
where not exists (select 1
from employees as e
where e.department_id = d.department_id);


-- Q150. find employees whose salary is greater than every employee in the hr department.
select * from employees
where salary > all (select salary
from employees
where department_id = (select department_id
from departments
where department_name = 'hr'
limit 1));


-- Q151. find employees whose salary is greater than at least one employee in the finance department.
select * from employees
where salary > any (select salary
from employees
where department_id = (select department_id
from departments
where department_name = 'finance'
limit 1));


-- Q152. find the second-highest distinct salary using a subquery.
select max(salary) as second_highest_salary from employees
where salary < (select max(salary)
from employees);


-- Q153. find the third-highest distinct salary using a subquery.
select max(salary) as third_highest_salary from employees
where salary < (select max(salary) from employees
where salary < (select max(salary)
from employees));


-- Q154. find employees with the second-highest distinct salary.
select * from employees
where salary = (select max(salary)
from employees
where salary < (select max(salary)
from employees));


-- Q155. use a correlated subquery to find employees earning above their department average.
select * from employees as e
where salary > (select avg(salary)
from employees as x
where x.department_id = e.department_id);


-- 156–170. ctes — common table expressions


-- Q156. create a cte containing employees whose salary is greater than 60000.
with high_salary as (select * from employees
where salary > 60000) select * from high_salary;


-- Q157. use a cte to calculate the company average salary and display employees earning above it.
with company_avg as (select avg(salary) as avg_salary
from employees) select e.* from employees as e cross
join company_avg as c
where e.salary > c.avg_salary;


-- Q158. use a cte to calculate average salary by department.
with dept_avg as (select department_id, avg(salary) as avg_salary
from employees
group by department_id) select * from dept_avg;


-- Q159. use a cte to find departments with average salary greater than 60000.
with dept_avg as (select department_id, avg(salary) as avg_salary
from employees
group by department_id) select * from dept_avg
where avg_salary > 60000;


-- Q160. create two ctes: one for department statistics and one for high-paying departments.
with dept_stats as (select department_id, count(*) as employee_count, avg(salary) as avg_salary
from employees
group by department_id), high_depts as (select * from dept_stats
where avg_salary > 60000) select * from high_depts;


-- Q161. use a cte to calculate total salary by city and filter cities above a chosen threshold.
with city_salary as (select city, sum(salary) as total_salary
from employees
group by city) select * from city_salary
where total_salary > 200000;


-- Q162. use a cte to find the highest salary in each department.
with dept_max as (select department_id, max(salary) as max_salary
from employees
group by department_id) select * from dept_max;


-- Q163. use a cte to find employees earning above their department average.
with dept_avg as (select department_id, avg(salary) as avg_salary
from employees
group by department_id) select e.* from employees e
join dept_avg d
on e.department_id = d.department_id
where e.salary > d.avg_salary;


-- Q164. use a cte to rank employees by salary.
with ranked as (select e.*, rank() over (order by salary desc) as salary_rank
from employees e) select * from ranked;


-- Q165. use a cte to find the top 2 highest-paid employees.
with ranked as (select e.*, dense_rank() over (order by salary desc) as salary_rank
from employees e) select * from ranked
where salary_rank <= 2;


-- Q166. use a cte with row_number to find the highest-paid employee in each department.
with ranked as (select e.*, row_number() over (partition by department_id
order by salary desc) as rn
from employees e) select * from ranked
where rn = 1;


-- Q167. use a cte with dense_rank to find the second-highest salary in each department.
with ranked as (select *, dense_rank() over (partition by department_id
order by salary desc) as dr
from employees e) select * from ranked
where dr = 2;


-- Q168. create a cte that joins employees and departments, then filter the result.
with employee_data as (select employee_name, salary, department_name
from employees as e
join departments as d
on e.department_id = d.department_id) select * from employee_data;


-- Q169. create a cte containing departments with employee counts and filter departments with more than 3 employees.
with dept_counts as (select department_id, count(*) as employee_count
from employees
group by department_id) select * from dept_counts
where employee_count > 3;


-- Q170. create multiple dependent ctes where the second cte uses the first cte.
with dept_avg as (select department_id, avg(salary) as avg_salary
from employees
group by department_id), high_depts as (select * from dept_avg
where avg_salary > 60000) select * from high_depts;


