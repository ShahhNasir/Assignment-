-- 1. Database & Table Creation (1–20).

-- Q1. Create a database named company_db.

create database  employee_data;

-- Q2. Select and use the company_db database.alter

use employee_data;

-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date column.

select * from data_n;

-- Q4. Make employee_id the PRIMARY KEY.

alter table data_n add primary key (emolyee_id);

-- Q5. Make employee_name NOT NULL.

alter table data_n modify employee_name varchar(30) not null;

-- Q6. Add a UNIQUE constraint to an email column.

alter table data_n add email_id varchar(50) unique;

-- Q7. Add a CHECK constraint so salary must be greater than 0.

alter table data_n add constraint check_salry check (salary > 0);

---- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.

alter table data_n modify city varchar(30) default "HYderabad";

-- Q9. Create a departments table with department_id, department_name, location, and budget.

create table department_data(department_id int,departmnet_name varchar(30),location varchar(30),budget decimal(12,2));

-- Q10. Make department_id the PRIMARY KEY in the departments table

alter table department_data add primary key (department_id);

-- Q11. Create a projects table with project_id, project_name, department_id, and budget

create table project (project_id int primary key,project_name varchar(30), department_id int,budget decimal(12,2));

-- Q12. Add a FOREIGN KEY from project.department_id to departments.department_id

alter table project add constraint foreign key(department_id) references department_data(department_id);

-- Q13. Insert one department record.
-- Q14. Insert five employee records in a single INSERT statement

insert into department_data values 
(101,'HR','Hyderabad',50000),
(102,'Manager','Delhi',75000),
(103,'Data Engineer','Banglore',55000),
(104,'Developer','Patna',45000),
(105,'GM','Chandigarh',58000);

-- Q15. Insert a project record.

insert into project values 
(001,'Website Development',101,450000),
(002,'Cloud Computing',102,554000),
(003,'AI Chatbot',104,45210),
(004,'App DEvelopment',105,458575),
(005,'Business Analysis',103,754585);

-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.

create table student (stu_id int primary key,stu_name varchar(30) not null,email_id varchar(50) unique, age int check(age >= 18),
status varchar(20) default 'Active');

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.

create table attendance (employee_id int, attendance_date date, status varchar(20));

-- Q18. Create a table only if it does not already exist

create table if not exists temp_data(id int);

-- Q19. Describe or display the structure of the employees table

describe data_n;

-- Q20. Drop a temporary table named temp_data if it exists.

drop table if exists temp_data;

-- Q21. Display all columns from the employees table.

select * from data_n;

-- Q22. Display only employee_name and salary

select employee_name, salary from data_n;

-- Q23. Display employees who live in Hyderabad.

select employee_name,city from data_n where city="Hyderabad";

--  Display employees whose salary is greater than 60000.

select employee_name,salary from data_n  where salary > 60000;

-- Q25. Display employees whose salary is less than or equal to 50000.

select employee_name,salary from data_n where salary <= 50000;

-- Q26. Display employees whose salary is between 50000 and 70000.

select employee_name,salary from data_n where salary between 50000 and 70000;

-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN

select employee_name,city from data_n where city in ("Hyderabad","Bangalore","Mumbai");

-- Q28. Display employees who do not live in Hyderabad.

select employee_name,city from data_n where city <> 'Hyderabad';

-- Q29. Display employees whose names start with 'A'.

select employee_name from data_n where employee_name like "A%";

-- Q30. Display employees whose names end with 'a'.

select employee_name from data_n where employee_name like "%a";

-- Q31. Display employees whose names contain the letter 'i'.

select * from data_n where employee_name like "%i";

-- Q32. Display employees whose department is NULL.

select * from data_n where department is null;

-- Q33. Display employees whose department is NOT NULL.

select * from data_n where department is not null;

-- Q34. Display employees hired after 2022-01-01.

select employee_name,hire_date from data_n where hire_date  > '2022-01-01';

-- Q35. Display employees hired between two given dates.

select employee_name,hire_date from data_n where hire_date between '2021-01-01' and '20230-12-31';

-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.

select employee_name,salary,city from data_n where salary > 50000 and city="Hyderabad";

-- Q37. Display employees who live in Hyderabad OR earn more than 70000

select employee_name,salary,city from data_n where salary > 70000 and city="Hyderabad";

-- Q38. Display employees who are NOT in the HR department

select employee_name,department from data_n where department <> "HR" or department is null;

-- Q39. Display distinct cities from the employees table.

select distinct city from data_n;

-- Q40. Display distinct departments from the employees table.

select distinct department,city from data_n;

-- Q41. Display employees sorted by salary in ascending order.

select employee_name,salary from data_n order by salary asc;

-- Q42. Display employees sorted by salary in descending order.

select employee_name,salary from data_n order by salary desc;

-- Q43. Display employees sorted first by department and then by salary descending.

select department,salary from data_n order by department,salary desc;

-- Q44. Display the first 5 employees after sorting by employee_id.

select * from data_n order by employee_id asc limit 5;

-- Q45. Display the top 3 highest-paid employees.

select employee_name,salary from data_n order by  salary desc limit 3;

-- Q46. Update the salary of one employee using employee_id.

update data_n set salary =75000 where employee_id=1;

-- Q47. Increase the salary of all employees by 10 percent.

update data_n set salary = salary *1.10;

-- Q48. Increase the salary of employees in the Data Science department by 5000.

update data_n set salary = salary + 5000 where department= "Data Science";

-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.

update data_n set city="Bangluru" where city="Bangalore";

-- Q50. Delete one employee using employee_id.

delete from data_n where employee_id=1;


-- Q51. Delete employees whose salary is below a specified amount.

delete from data_n where salary < 50000;


-- Q52. Add an email column to the employees table.

alter table data_n add email_id varchar (50) unique;

-- Q53. Add a phone_number column to the employees table.

alter table data_n add phone_number varchar(15);


-- Q54. Modify the length of the employee_name column.

alter table data_n modify employee_name varchar(50);


-- Q55. Rename the city column to employee_city.

alter table data_n rename column city to employee_city;


-- Q56. Drop the phone_number column.

alter table data_n drop column phone_number;


-- Q57. Display employee names in uppercase.

select upper(employee_name) from data_n;


-- Q58. Display employee names in lowercase.

select lower(employee_name) from data_n;


-- Q59. Display the length of every employee name.

select employee_name,length(employee_name) as name_length from data_n;


-- Q60. Display the first three characters of every employee name.

select employee_name,left(employee_name,3) as first_three_characters from data_n;


-- Q61. Display employee_name and salary rounded to the nearest thousand.

select employee_name,round(salary,-3) as rounded_salary from data_n;


-- Q62. Display the current date.

select curdate();


-- Q63. Calculate how many years each employee has worked using hire_date.

select employee_name,
timestampdiff(year,hire_date,curdate()) as years_worked
from data_n;


-- Q64. Replace NULL department values with 'Unassigned' in the query result.

select employee_name,
coalesce(department,'Unassigned') as department
from data_n;


-- Q65. Use CASE to label employees as Low, Medium, or High salary.

select employee_name,salary,
case
    when salary < 50000 then 'Low'
    when salary between 50000 and 70000 then 'Medium'
    else 'High'
end as salary_level
from data_n;

-- Q66. Find the total number of employees.

select count(*) as total_employees
from data_n;


-- Q67. Find the total salary paid to all employees.

select sum(salary) as total_salary
from data_n;


-- Q68. Find the average salary of all employees.

select avg(salary) as average_salary
from data_n;


-- Q69. Find the highest salary.

select max(salary) as highest_salary
from data_n;


-- Q70. Find the lowest salary.

select min(salary) as lowest_salary
from data_n;


-- Q71. Find the number of employees in Hyderabad.

select count(*) as total_employees
from data_n
where employee_city='Hyderabad';


-- Q72. Find the total salary paid to employees in Mumbai.

select sum(salary) as total_salary
from data_n
where employee_city='Mumbai';


-- Q73. Find the average salary of employees in Bangalore.

select avg(salary) as average_salary
from data_n
where employee_city='Bangalore';


-- Q74. Find the number of employees in each department.

select department,count(*) as employee_count
from data_n
group by department;


-- Q75. Find the average salary in each department.

select department,avg(salary) as average_salary
from data_n
group by department;


-- Q76. Find the maximum salary in each department.

select department,max(salary) as maximum_salary
from data_n
group by department;


-- Q77. Find the minimum salary in each department.

select department,min(salary) as minimum_salary
from data_n
group by department;


-- Q78. Find the total salary in each department.

select department,sum(salary) as total_salary
from data_n
group by department;


-- Q79. Find the number of employees in each city.

select employee_city,count(*) as employee_count
from data_n
group by employee_city;


-- Q80. Find the average salary in each city.

select employee_city,avg(salary) as average_salary
from data_n
group by employee_city;


-- Q81. Find departments having more than 5 employees.

select department,count(*) as employee_count
from data_n
group by department
having count(*) > 5;


-- Q82. Find departments whose average salary is greater than 60000.

select department,avg(salary) as average_salary
from data_n
group by department
having avg(salary) > 60000;


-- Q83. Find cities whose total salary is greater than 200000.

select employee_city,sum(salary) as total_salary
from data_n
group by employee_city
having sum(salary) > 200000;


-- Q84. Find the department with the highest total salary.

select department,sum(salary) as total_salary
from data_n
group by department
order by total_salary desc
limit 1;


-- Q85. Find the department with the highest average salary.

select department,avg(salary) as average_salary
from data_n
group by department
order by average_salary desc
limit 1;


-- Q86. Display employee count and average salary for each department and city combination.

select department,employee_city,
count(*) as employee_count,
avg(salary) as average_salary
from data_n
group by department,employee_city;


-- Q87. Find the difference between the maximum and minimum salary in each department.

select department,
max(salary)-min(salary) as salary_difference
from data_n
group by department;


-- Q88. Find departments where the maximum salary is greater than 70000.

select department,max(salary) as maximum_salary
from data_n
group by department
having max(salary) > 70000;


-- Q89. Find cities having at least 3 employees with salary above 60000.

select employee_city,count(*) as employee_count
from data_n
where salary > 60000
group by employee_city
having count(*) >= 3;


-- Q90. Find the total number of distinct departments and distinct cities.

select 
count(distinct department) as distinct_departments,
count(distinct employee_city) as distinct_cities
from data_n;


-- Q91. Create a products table with product_id as PRIMARY KEY.

create table products(
product_id int primary key,
product_name varchar(50),
price decimal(10,2)
);


-- Q92. Create a users table where email must be UNIQUE.

create table users(
user_id int primary key,
user_name varchar(50),
email varchar(100) unique
);


-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.

create table orders(
order_id int primary key,
order_amount decimal(10,2),
check(order_amount > 0)
);


-- Q94. Create a customers table where customer_name cannot be NULL.

create table customers(
customer_id int primary key,
customer_name varchar(50) not null
);


-- Q95. Create a table with a DEFAULT status value of 'Active'.

create table employee_status(
id int primary key,
employee_name varchar(50),
status varchar(20) default 'Active'
);


-- Q96. Insert a row that uses the DEFAULT value.

insert into employee_status(id,employee_name)
values(1,'Alice');


-- Q97. Attempt to insert a duplicate PRIMARY KEY.

insert into employee_status(id,employee_name)
values(1,'Bob');


-- Q98. Attempt to insert a duplicate UNIQUE email.

insert into users(user_id,user_name,email)
values(1,'Alice','alice@gmail.com');

insert into users(user_id,user_name,email)
values(2,'Bob','alice@gmail.com');


-- Q99. Create employees and departments with a FOREIGN KEY relationship.

create table departments(
department_id int primary key,
department_name varchar(50)
);

create table employee_details(
employee_id int primary key,
employee_name varchar(50),
department_id int,
foreign key(department_id)
references departments(department_id)
);


-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.

insert into departments
values(101,'Data Science');

insert into employee_details
values(1,'Alice',101);


-- Q101. Attempt to insert an employee with a department_id that does not exist.

insert into employee_details
values(2,'Bob',999);


-- Q102. Add a CHECK constraint to allow age only between 18 and 60.

alter table student
add constraint check_age
check(age between 18 and 60);


-- Q103. Create a composite PRIMARY KEY using two columns.

create table employee_project(
employee_id int,
project_id int,
primary key(employee_id,project_id)
);


-- Q104. Create an attendance table where employee_id and attendance_date
-- together form a composite key.

create table attendance_new(
employee_id int,
attendance_date date,
status varchar(20),
primary key(employee_id,attendance_date)
);


-- Q105. Create a table with a named constraint and then identify its purpose.

create table salary_data(
employee_id int primary key,
salary int,
constraint check_salary check(salary > 0)
);

-- Q106. Display employee_name and department_name using an INNER JOIN.

select e.employee_name,d.departmnet_name
from data_n as e
inner join department_data as d
on e.department = d.departmnet_name;


-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
select 
e.employee_name,
e.salary,
d.departmnet_name,
d.location
from data_n as e
inner join department_data as d
on e.department = d.departmnet_name;

-- Q108. Find employees working in the Data Science department using a JOIN.

select 
e.employee_name,
e.salary,
d.departmnet_name
from data_n as e
inner join department_data as d
on e.department = d.departmnet_name
where d.departmnet_name = 'Data Science';

-- Q109. Find employees working in departments located in Hyderabad.

select 
e.employee_name,
e.department,
d.location
from data_n as e
inner join department_data as d
on e.department = d.departmnet_name
where d.location = 'Hyderabad';

-- Q110. Display all employees even if they do not belong to any department.

select 
e.employee_name,
e.department,
d.departmnet_name
from data_n as e
left join department_data as d
on e.department = d.departmnet_name;

-- Q111. Display all departments even if they have no employees.

select 
d.department_id,
d.departmnet_name,
e.employee_name
from department_data as d
left join data_n as e
on d.departmnet_name = e.department;

-- Q112. Find departments that currently have no employees.

select 
d.department_id,
d.departmnet_name
from department_data as d
left join data_n as e
on d.departmnet_name = e.department
where e.employee_id is null;

-- Q113. Find employees who do not have a matching department.

select 
e.employee_id,
e.employee_name,
e.department
from data_n as e
left join department_data as d
on e.department = d.departmnet_name
where d.department_id is null;

-- Q114. Find the number of employees in each department using JOIN and GROUP BY.

select 
d.department_id,
d.departmnet_name,
count(e.employee_id) as employee_count
from department_data as d
left join data_n as e
on d.departmnet_name = e.department
group by d.department_id,d.departmnet_name;

-- Q115. Find the average salary in each department using JOIN and GROUP BY.

select 
d.department_id,
d.departmnet_name,
avg(e.salary) as average_salary
from department_data as d
left join data_n as e
on d.departmnet_name = e.department
group by d.department_id,d.departmnet_name;

-- Q116. Display each department with employee count including departments with zero employees.

select 
d.department_id,
d.departmnet_name,
count(e.employee_id) as employee_count
from department_data as d
left join data_n as e
on d.departmnet_name = e.department
group by d.department_id,d.departmnet_name;

-- Q117. Display each department with total salary including departments with zero employees.

select 
d.department_id,
d.departmnet_name,
coalesce(sum(e.salary),0) as total_salary
from department_data as d
left join data_n as e
on d.departmnet_name = e.department
group by d.department_id,d.departmnet_name;


-- Q118. Join departments with projects and display department_name and project_name.

select 
d.departmnet_name,
p.project_name
from department_data as d
inner join project as p
on d.department_id = p.department_id;

-- Q119. Display employees, department names, and project names using appropriate joins.

select 
e.employee_name,
d.departmnet_name,
p.project_name
from data_n as e
left join department_data as d
on e.department = d.departmnet_name
left join project as p
on d.department_id = p.department_id;

-- Q120. Find departments that have at least one project.

select distinct
d.department_id,
d.departmnet_name
from department_data as d
inner join project as p
on d.department_id = p.department_id;

-- Q121. Find departments that have no projects.

select 
d.department_id,
d.departmnet_name
from department_data as d
left join project as p
on d.department_id = p.department_id
where p.project_id is null;

-- Q122. Create an employee-manager relationship using manager_id in the employees table.

-- add manager id.....////////////////////
update data_n
set manager_id = case employee_id

    when 1 then null
    when 2 then 1
    when 3 then 1
    when 4 then 15
    when 5 then 16
    when 6 then 3
    when 7 then 2
    when 8 then 15
    when 9 then 3
    when 10 then 18
    when 11 then 5
    when 12 then 17
    when 13 then 3
    when 14 then 2
    when 15 then 4
    when 16 then 5
    when 17 then 12
    when 18 then 10
    when 19 then 3
    when 20 then 2
    when 21 then 15
    when 22 then 5
    when 23 then 17
    when 24 then 18
    when 25 then 3
    when 26 then 2
    when 27 then 4
    when 28 then 16
    when 29 then 17
    when 30 then 18
    when 31 then 1
    when 32 then 2
    when 33 then 15
    when 34 then 5
    when 35 then 17
    when 36 then 10
    when 37 then 3
    when 38 then 2
    when 39 then 15
    when 40 then 5
    when 41 then 17
    when 42 then 18
    when 43 then 3
    when 44 then 2
    when 45 then 15
    when 46 then 5
    when 47 then 17
    when 48 then 18
    when 49 then 1
    when 50 then 2

end;

-- Q122. Create an employee-manager relationship using manager_id.

alter table data_n
add manager_id int;

-- Q123. Using a SELF JOIN, display employee name and manager name.

select 
e.employee_name as employee,
m.employee_name as manager
from data_n as e
left join data_n as m
on e.manager_id = m.employee_id;

-- Q124. Using a SELF JOIN, display only employees who have managers.

select 
e.employee_name as employee,
m.employee_name as manager
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id;

-- Q125. Using a SELF JOIN, display employees who do not have managers.

select 
e.employee_name as employee
from data_n as e
left join data_n as m
on e.manager_id = m.employee_id
where m.employee_id is null;



-- Q136. Find employees whose salary is greater than the overall average salary.

select employee_name,salary
from data_n
where salary > (
    select avg(salary)
    from data_n
);

-- Q126. Find all managers who manage at least one employee.

select distinct
m.employee_name as manager
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id;

-- Q123. Using a SELF JOIN, display employee name and manager name.

select 
e.employee_name as employee,
m.employee_name as manager
from data_n as e
left join data_n as m
on e.manager_id = m.employee_id;


-- Q124. Using a SELF JOIN, display only employees who have managers.

select 
e.employee_name as employee,
m.employee_name as manager
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id;

-- Q125. Using a SELF JOIN, display employees who do not have managers.

select 
e.employee_name as employee
from data_n as e
left join data_n as m
on e.manager_id = m.employee_id
where m.employee_id is null;

-- Q126. Find all managers who manage at least one employee.

select distinct
m.employee_name as manager
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id;

-- Q127. Count the number of employees reporting to each manager.

select 
m.employee_name as manager,
count(e.employee_id) as employee_count
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id
group by m.employee_id,m.employee_name;

-- Q128. Find managers who manage more than 3 employees.

select 
m.employee_name as manager,
count(e.employee_id) as employee_count
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id
group by m.employee_id,m.employee_name
having count(e.employee_id) > 3;

-- Q129. Display employee, manager, and employee salary using a SELF JOIN.

select 
e.employee_name as employee,
m.employee_name as manager,
e.salary as employee_salary
from data_n as e
left join data_n as m
on e.manager_id = m.employee_id;

-- Q130. Find employees whose salary is greater than their manager's salary.

select 
e.employee_name as employee,
e.salary as employee_salary,
m.employee_name as manager,
m.salary as manager_salary
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id
where e.salary > m.salary;

-- Q131. Find employees who work in the same department as their manager.

select 
e.employee_name as employee,
e.department,
m.employee_name as manager
from data_n as e
inner join data_n as m
on e.manager_id = m.employee_id
where e.department = m.department;

-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.

select 
e.employee_id,
e.employee_name,
e.department
from data_n as e
left join department_data as d
on e.department = d.departmnet_name
where d.department_id is null;

-- Q133. Use multiple JOINs to display employee, department, and project information.

select 
e.employee_name,
d.departmnet_name,
p.project_name
from data_n as e
left join department_data as d
on e.department = d.departmnet_name
left join project as p
on d.department_id = p.department_id;

-- Q134. Find the total project budget for each department.

select 
d.department_id,
d.departmnet_name,
sum(p.budget) as total_project_budget
from department_data as d
left join project as p
on d.department_id = p.department_id
group by d.department_id,d.departmnet_name;

-- Q135. Find departments whose total project budget is greater than their department budget.

select 
d.department_id,
d.departmnet_name,
d.budget as department_budget,
sum(p.budget) as total_project_budget
from department_data as d
inner join project as p
on d.department_id = p.department_id
group by 
d.department_id,
d.departmnet_name,
d.budget
having sum(p.budget) > d.budget;

-- Q136. Find employees whose salary is greater than the overall average salary.

select employee_name,salary
from data_n
where salary > (
    select avg(salary)
    from data_n
);


-- Q137. Find employee or employees with the highest salary using a subquery.

select employee_name,salary
from data_n
where salary = (
    select max(salary)
    from data_n
);


-- Q138. Find employee or employees with the lowest salary using a subquery.

select employee_name,salary
from data_n
where salary = (
    select min(salary)
    from data_n
);


-- Q139. Find employees who earn the same salary as Alice.

select employee_name,salary
from data_n
where salary = (
    select salary
    from data_n
    where employee_name='Alice'
);


-- Q140. Find employees who earn more than Alice.

select employee_name,salary
from data_n
where salary > (
    select salary
    from data_n
    where employee_name='Alice'
);


-- Q141. Find employees working in the same department as Alice.

select employee_name,department
from data_n
where department = (
    select department
    from data_n
    where employee_name='Alice'
);


-- Q142. Find employees whose salary is greater than the average salary of their department.

select employee_name,department,salary
from data_n as e
where salary > (
    select avg(salary)
    from data_n as d
    where d.department=e.department
);


-- Q143. Find employees whose salary is less than the average salary of their department.

select employee_name,department,salary
from data_n as e
where salary < (
    select avg(salary)
    from data_n as d
    where d.department=e.department
);


-- Q144. Find the department with the highest average salary using a subquery.

select department,avg(salary) as average_salary
from data_n
group by department
having avg(salary) = (
    select max(avg_salary)
    from (
        select avg(salary) as avg_salary
        from data_n
        group by department
    ) as x
);


-- Q145. Find departments whose average salary is greater than company average salary.

select department,avg(salary) as average_salary
from data_n
group by department
having avg(salary) > (
    select avg(salary)
    from data_n
);


-- Q146. Find employees who work in departments located in Hyderabad using a subquery.

select employee_name,department
from data_n
where department in (
    select departmnet_name
    from department_data
    where location='Hyderabad'
);


-- Q147. Find employees who do not belong to any existing department.

select employee_name,department
from data_n
where department not in (
    select departmnet_name
    from department_data
);


-- Q148. Find departments that have at least one employee using EXISTS.

select d.departmnet_name
from department_data as d
where exists (
    select 1
    from data_n as e
    where e.department=d.departmnet_name
);


-- Q149. Find departments that have no employees using NOT EXISTS.

select d.departmnet_name
from department_data as d
where not exists (
    select 1
    from data_n as e
    where e.department=d.departmnet_name
);


-- Q150. Find employees whose salary is greater than every employee in the HR department.

select employee_name,salary
from data_n
where salary > all (
    select salary
    from data_n
    where department='HR'
);


-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.

select employee_name,salary
from data_n
where salary > any (
    select salary
    from data_n
    where department='Finance'
);


-- Q152. Find the second-highest distinct salary using a subquery.

select max(salary) as second_highest_salary
from data_n
where salary < (
    select max(salary)
    from data_n
);


-- Q153. Find the third-highest distinct salary using a subquery.

select max(salary) as third_highest_salary
from data_n
where salary < (
    select max(salary)
    from data_n
    where salary < (
        select max(salary)
        from data_n
    )
);


-- Q154. Find employees with the second-highest distinct salary.

select employee_name,salary
from data_n
where salary = (
    select max(salary)
    from data_n
    where salary < (
        select max(salary)
        from data_n
    )
);


-- Q155. Use a correlated subquery to find employees earning above their department average.

select employee_name,department,salary
from data_n as e
where salary > (
    select avg(salary)
    from data_n as d
    where d.department=e.department
);

-- Q156. Create a CTE containing employees whose salary is greater than 60000.

with high_salary as (
    select *
    from data_n
    where salary > 60000
)
select *
from high_salary;


-- Q157. Use a CTE to calculate company average salary and display employees earning above it.

with company_avg as (
    select avg(salary) as avg_salary
    from data_n
)
select e.employee_name,e.salary
from data_n as e
cross join company_avg as c
where e.salary > c.avg_salary;


-- Q158. Use a CTE to calculate average salary by department.

with dept_avg as (
    select department,avg(salary) as average_salary
    from data_n
    group by department
)
select *
from dept_avg;


-- Q159. Use a CTE to find departments with average salary greater than 60000.

with dept_avg as (
    select department,avg(salary) as average_salary
    from data_n
    group by department
)
select *
from dept_avg
where average_salary > 60000;


-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.

with dept_stats as (
    select department,
    count(*) as employee_count,
    avg(salary) as average_salary
    from data_n
    group by department
),
high_paying as (
    select *
    from dept_stats
    where average_salary > 60000
)
select *
from high_paying;


-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.

with city_salary as (
    select employee_city,sum(salary) as total_salary
    from data_n
    group by employee_city
)
select *
from city_salary
where total_salary > 200000;


-- Q162. Use a CTE to find the highest salary in each department.

with dept_max as (
    select department,max(salary) as highest_salary
    from data_n
    group by department
)
select *
from dept_max;


-- Q163. Use a CTE to find employees earning above their department average.

with dept_avg as (
    select department,avg(salary) as average_salary
    from data_n
    group by department
)
select e.employee_name,e.department,e.salary
from data_n as e
join dept_avg as d
on e.department=d.department
where e.salary > d.average_salary;


-- Q164. Use a CTE to rank employees by salary.

with ranked_employee as (
    select employee_name,salary,
    rank() over(order by salary desc) as salary_rank
    from data_n
)
select *
from ranked_employee;


-- Q165. Use a CTE to find the top 2 highest-paid employees.

with ranked_employee as (
    select employee_name,salary,
    row_number() over(order by salary desc) as rn
    from data_n
)
select *
from ranked_employee
where rn <= 2;


-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.

with ranked_employee as (
    select employee_name,department,salary,
    row_number() over(
        partition by department
        order by salary desc
    ) as rn
    from data_n
)
select employee_name,department,salary
from ranked_employee
where rn=1;


-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.

with ranked_employee as (
    select employee_name,department,salary,
    dense_rank() over(
        partition by department
        order by salary desc
    ) as salary_rank
    from data_n
)
select *
from ranked_employee
where salary_rank=2;


-- Q168. Create a CTE that joins employees and departments, then filter the result.

with employee_department as (
    select e.employee_name,
    e.department,
    e.salary,
    d.location
    from data_n as e
    left join department_data as d
    on e.department=d.departmnet_name
)
select *
from employee_department
where location='Hyderabad';


-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3 employees.

with dept_count as (
    select department,count(*) as employee_count
    from data_n
    group by department
)
select *
from dept_count
where employee_count > 3;


-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.

with dept_salary as (
    select department,avg(salary) as average_salary
    from data_n
    group by department
),
high_dept as (
    select *
    from dept_salary
    where average_salary > 60000
)
select *
from high_dept;

-- Q171. Assign a unique row number to all employees ordered by salary descending.

select employee_name,salary,
row_number() over(order by salary desc) as row_num
from data_n;


-- Q172. Assign a row number to employees within each department ordered by salary descending.

select employee_name,department,salary,
row_number() over(
    partition by department
    order by salary desc
) as row_num
from data_n;


-- Q173. Rank employees by salary using RANK().

select employee_name,salary,
rank() over(order by salary desc) as salary_rank
from data_n;


-- Q174. Rank employees by salary using DENSE_RANK().

select employee_name,salary,
dense_rank() over(order by salary desc) as salary_rank
from data_n;


-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.

select employee_name,salary,
row_number() over(order by salary desc) as row_number_rank,
rank() over(order by salary desc) as rank_value,
dense_rank() over(order by salary desc) as dense_rank_value
from data_n;


-- Q176. Display the company average salary beside every employee using AVG() OVER().

select employee_name,salary,
avg(salary) over() as company_average_salary
from data_n;


-- Q177. Display the department average salary beside every employee using PARTITION BY.

select employee_name,department,salary,
avg(salary) over(
    partition by department
) as department_average_salary
from data_n;


-- Q178. Calculate a running total of salary ordered by hire_date.

select employee_name,hire_date,salary,
sum(salary) over(
    order by hire_date
) as running_total
from data_n;


-- Q179. Use LAG() to display the previous employee's salary when ordered by hire_date.

select employee_name,hire_date,salary,
lag(salary) over(
    order by hire_date
) as previous_salary
from data_n;


-- Q180. Use LEAD() to display the next employee's salary when ordered by hire_date.

select employee_name,hire_date,salary,
lead(salary) over(
    order by hire_date
) as next_salary
from data_n;


-- Q181. Find the top 3 highest-paid employees in every department.

with ranked_employee as (
    select employee_name,department,salary,
    dense_rank() over(
        partition by department
        order by salary desc
    ) as salary_rank
    from data_n
)
select *
from ranked_employee
where salary_rank <= 3;


-- Q182. Find the employee whose salary is closest to the average salary of their department.

with dept_avg as (
    select employee_name,department,salary,
    avg(salary) over(partition by department) as average_salary
    from data_n
)
select employee_name,department,salary,average_salary,
abs(salary-average_salary) as difference
from dept_avg
order by difference
limit 1;


-- Q183. Find the difference between highest-paid and second-highest distinct salary in every department.

with ranked_salary as (
    select department,salary,
    dense_rank() over(
        partition by department
        order by salary desc
    ) as salary_rank
    from data_n
),
salary_data as (
    select department,
    max(case when salary_rank=1 then salary end) as highest_salary,
    max(case when salary_rank=2 then salary end) as second_highest_salary
    from ranked_salary
    group by department
)
select department,
highest_salary-second_highest_salary as salary_difference
from salary_data;


-- Q184. Find employees whose salary is higher than their manager and whose department average salary is above company average.

with dept_avg as (
    select employee_id,department,salary,
    avg(salary) over(partition by department) as department_avg,
    avg(salary) over() as company_avg
    from data_n
)
select e.employee_name,
e.salary,
m.employee_name as manager,
e.department
from dept_avg as e
join data_n as m
on e.employee_id=m.manager_id
where e.salary > m.salary
and e.department_avg > e.company_avg;


-- Q185. Find first and most recently hired employee in each department.

with ranked_employee as (
    select employee_name,department,hire_date,
    row_number() over(
        partition by department
        order by hire_date
    ) as first_hired,
    row_number() over(
        partition by department
        order by hire_date desc
    ) as latest_hired
    from data_n
)
select department,
max(case when first_hired=1 then employee_name end) as first_employee,
max(case when latest_hired=1 then employee_name end) as latest_employee
from ranked_employee
group by department;


-- Q186. Find departments where every employee earns more than 50000.

select department,min(salary) as minimum_salary
from data_n
group by department
having min(salary) > 50000;


-- Q187. Find departments where at least 70 percent of employees earn above the company average salary.

with company_avg as (
    select avg(salary) as average_salary
    from data_n
),
dept_data as (
    select department,
    sum(
        case
            when salary > (select average_salary from company_avg)
            then 1 else 0
        end
    ) as above_average,
    count(*) as total_employees
    from data_n
    group by department
)
select department,
above_average,
total_employees
from dept_data
where above_average / total_employees >= 0.70;


-- Q188. Find the longest consecutive hiring-date gap.

with hire_data as (
    select employee_name,hire_date,
    lag(hire_date) over(order by hire_date) as previous_hire_date
    from data_n
)
select employee_name,
previous_hire_date,
hire_date,
datediff(hire_date,previous_hire_date) as gap_days
from hire_data
where previous_hire_date is not null
order by gap_days desc
limit 1;


-- Q189. Find employees whose salary increased relative to the previous employee in their department ordered by hire_date.

select employee_name,department,salary,hire_date,
lag(salary) over(
    partition by department
    order by hire_date
) as previous_salary
from data_n
having salary > previous_salary;


-- Q190. Find the department with the largest salary inequality.

select department,
max(salary)-min(salary) as salary_difference
from data_n
group by department
order by salary_difference desc
limit 1;


-- Q191. Find employees who share their salary with another employee
-- in the same department.

select employee_name,department,salary
from data_n
where (department,salary) in (
    select department,salary
    from data_n
    group by department,salary
    having count(*) > 1
);


-- Q192. Find the third-highest distinct salary in each department
-- and return all employees who earn it.

with ranked_employee as (
    select employee_name,department,salary,
    dense_rank() over(
        partition by department
        order by salary desc
    ) as salary_rank
    from data_n
)
select *
from ranked_employee
where salary_rank=3;


-- Q193. Find departments whose total employee salary exceeds their project budget, and return the difference.

with employee_salary as (
    select department,sum(salary) as total_employee_salary
    from data_n
    group by department
),
project_budget as (
    select d.departmnet_name,
    sum(p.budget) as total_project_budget
    from department_data as d
    join project as p
    on d.department_id=p.department_id
    group by d.departmnet_name
)
select e.department,
e.total_employee_salary,
p.total_project_budget,
e.total_employee_salary-p.total_project_budget as difference
from employee_salary as e
join project_budget as p
on e.department=p.departmnet_name
where e.total_employee_salary > p.total_project_budget;


-- Q194. Find employees who belong to departments with no projects but earn above their department average.

with dept_avg as (
    select employee_id,employee_name,department,salary,
    avg(salary) over(partition by department) as department_avg
    from data_n
)
select e.employee_name,e.department,e.salary
from dept_avg as e
where e.salary > e.department_avg
and not exists (
    select 1
    from department_data as d
    join project as p
    on d.department_id=p.department_id
    where d.departmnet_name=e.department
);


-- Q195. Return one row per department containing highest salary, lowest salary, and department average.

select department,
max(salary) as highest_salary,
min(salary) as lowest_salary,
avg(salary) as average_salary
from data_n
group by department;


-- Q196. Find employees who are in the top 20 percent of salaries within their department.

with ranked_employee as (
    select employee_name,department,salary,
    ntile(5) over(
        partition by department
        order by salary desc
    ) as salary_group
    from data_n
)
select *
from ranked_employee
where salary_group=1;


-- Q197. Find the median salary in each department.

with ranked_employee as (
    select department,salary,
    row_number() over(
        partition by department
        order by salary
    ) as rn,
    count(*) over(
        partition by department
    ) as total_count
    from data_n
)
select department,
avg(salary) as median_salary
from ranked_employee
where rn in (
    floor((total_count+1)/2),
    ceil((total_count+1)/2)
)
group by department;


-- Q198. Find employees whose salary is greater than the average salary of all employees hired before them.

select e.employee_name,e.salary,e.hire_date
from data_n as e
where e.salary > (
    select avg(p.salary)
    from data_n as p
    where p.hire_date < e.hire_date
);


-- Q199. Find managers whose direct reports collectively earn more than the manager and identify the difference.

select m.employee_name as manager,
m.salary as manager_salary,
sum(e.salary) as reports_salary,
sum(e.salary)-m.salary as difference
from data_n as m
join data_n as e
on e.manager_id=m.employee_id
group by m.employee_id,m.employee_name,m.salary
having sum(e.salary) > m.salary;


-- Q200. Create a report showing every employee's:
-- company salary rank,
-- department salary rank,
-- department average,
-- difference from department average,
-- previous salary,
-- next salary.

select 
employee_name,
department,
salary,

rank() over(
    order by salary desc
) as company_salary_rank,

rank() over(
    partition by department
    order by salary desc
) as department_salary_rank,

avg(salary) over(
    partition by department
) as department_average,

salary-avg(salary) over(
    partition by department
) as difference_from_department_average,

lag(salary) over(
    partition by department
    order by hire_date
) as previous_salary,

lead(salary) over(
    partition by department
    order by hire_date
) as next_salary

from data_n;
