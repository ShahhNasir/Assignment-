-- SQL Assignment - 200 Questions 

    -- 1. Database & Table Creation (1–20)
-- Q1. Create a database named company_db. 
-- Created company_db .

-- Q2. Select and use the company_db database.
use company_db;

-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.
-- Q4. Make employee_id the PRIMARY KEY.
-- Q5. Make employee_name NOT NULL.
-- Q6. Add a UNIQUE constraint to an email column.
-- Q7. Add a CHECK constraint so salary must be greater than 0.
-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.


create table employees 
(
employee_id int primary key,
employee_name varchar(30) not null ,
department varchar (30),
salary int check (salary>0),
city varchar(30) default "Hyderabad",
hire_date date
);

select * from employees;

-- Q9. Create a departments table with department_id, department_name, location, and budget.
-- Q10. Make department_id the PRIMARY KEY in the departments table.
create table departments
(
department_id int primary key,
department_name varchar(30) not null ,
location varchar (30),
budget int
);
select * from departments ;

alter table employees
add department_id int ;

select * from employees ;

-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.

alter table employees
add constraint fk_employee_department
foreign key (department_id)
references departments(department_id);

-- Q13. Insert one employee record.

select * from employees;

insert into departments values 
(1, 'Data Science', 'Hyderabad', 50000);

insert into employees values
(1, 'Alice', 'Data Science', 60000, 'Hyderabad', '2022-01-15', 1);

select * from employees ;

-- Q14. Insert five employee records in a single INSERT statement.

insert into employees values
(2,'Bob','HR',55000,'Bangalore','2021-06-20',2),
(3,'Charlie','Data Science',70000,'Hyderabad','2020-03-10',1),
(4,'David','Finance',50000,'Mumbai','2023-02-18',3),
(5,'Emma','Sales',65000,'Delhi','2022-11-05',4);

select * from employees;

insert departments values
(2,'HR','Bangalore',500000),
(3,'Finance','Mumbai',700000),
(4,'Sales','Delhi',600000);
select * from departments;

-- Q15. Insert a department record.
insert into departments values
(5,'Marketing','Hyderabad',800000);
select * from departments ;

-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.

create table students 
(
student_id int primary key,
student_name varchar(30) not null,
email varchar(30) unique ,
age int check (age>18),
city varchar(30) default "hyderabad"
);
select * from students;

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.

create table attendance
(
employee_id int ,
attendance_date date,
status varchar(20)
);
select * from attendance;

-- Q18. Create a table only if it does not already exist.
create table if not exists attendance 
(
employee_id int ,
attendance_date date,
status varchar(20)
);

show tables;

-- Q19. Describe or display the structure of the employees table.
desc employees;

-- Q20. Drop a temporary table named temp_data if it exists. 
drop temporary table if exists temp_data;

    -- 2. Basic SELECT & Filtering (21–45)
-- Q21. Display all columns from the employees table.
select * from employees ;

-- Q22. Display only employee_name and salary.
select employee_name , salary from employees ;

-- Q23. Display employees who live in Hyderabad.
select employee_name , city from employees
where city = 'Hyderabad';

-- Q24. Display employees whose salary is greater than 60000.
select employee_name , salary from employees
where salary > 60000;

-- Q25. Display employees whose salary is less than or equal to 50000.
select employee_name , salary from employees
where salary <= 50000;

-- Q26. Display employees whose salary is between 50000 and 70000.
select employee_name , salary from employees
where salary between 50000 and 70000;

-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
select employee_name , city from employees
where city in ('Hyderabad ', 'Bangalore' , 'Mumbai');

-- Q28. Display employees who do not live in Hyderabad.
select employee_name , city from employees
where city != 'Hyderabad';

-- Q29. Display employees whose names start with 'A'.
select employee_name from employees
where employee_name
like 'A%';

-- Q30. Display employees whose names end with 'a'.
select employee_name from employees
where employee_name
like '%A';

-- Q31. Display employees whose names contain the letter 'i'.
select employee_name from employees
where employee_name like '%i%';

-- Q32. Display employees whose department is NULL.
select employee_name from employees
where department is null ;

-- Q33. Display employees whose department is NOT NULL.
select employee_name from employees
where department is not null ;

-- Q34. Display employees hired after 2022-01-01.
select employee_name from employees
where hire_date > '2022-01-01';

-- Q35. Display employees hired between two given dates.
select employee_name from employees
where hire_date between '2022-01-01' and '2023-01-01' ;

-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select employee_name , salary from employees
where salary > 50000 and city='Hyderabad';

-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select employee_name , city , salary from employees
where city ='Hyderabad' or salary > 70000 ;

-- Q38. Display employees who are NOT in the HR department.
select employee_name , department from employees
where department != 'HR'; 

-- Q39. Display distinct cities from the employees table.
select distinct(city) from employees ;

-- Q40. Display distinct departments from the employees table.
select distinct department from employees ;

-- Q41. Display employees sorted by salary in ascending order.
select employee_name , salary from employees
order by salary ;

-- Q42. Display employees sorted by salary in descending order.
select employee_name , salary from employees
order by salary desc ;

-- Q43. Display employees sorted first by department and then by salary descending.
select employee_name , department, salary from employees
order by department , salary desc ;

-- Q44. Display the first 5 employees after sorting by employee_id.
select employee_id , employee_name from employees
order by employee_id limit 5;

-- Q45. Display the top 3 highest-paid employees.
select employee_name , salary  from employees
order by salary desc limit 3;

    -- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65)
-- Q46. Update the salary of one employee using employee_id.
select * from employees ;
update employees
set salary = 75000
where employee_id = 1;

-- Q47. Increase the salary of all employees by 10 percent.
-- select * from employees 
update employees
set salary = salary+(salary*10/100)
where employee_id > 0 ;

select * from employees;

-- Q48. Increase the salary of employees in the Data Science department by 5000.
update employees
set salary = salary + 5000 
where department= 'Data Science' and department_id > 0;

-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update employees
set city = 'Bengaluru'
where city='Bangalore' and 
employee_id > 0 ;

-- Q50. Delete one employee using employee_id.
delete from employees
where employee_id ='1';
select * from employees ;

-- Q51. Delete employees whose salary is below a specified amount.
delete from employees
where salary < 60000 and employee_id > 0 ;

-- Q52. Add an email column to the employees table.
alter table employees 
add email varchar(20) unique ;

-- Q53. Add a phone_number column to the employees table.
alter table employees 
add phone_no bigint ;

-- Q54. Modify the length of the employee_name column.
desc employees ;
alter table employees
modify employee_name varchar(60);

-- Q55. Rename the city column to employee_city.
alter table employees 
rename column city to employee_city;

-- Q56. Drop the phone_number column.
alter table employees
drop column phone_no ;  -- first alter and drop the column .

-- Q57. Display employee names in uppercase.
select upper(employee_name) from employees;
-- Q58. Display employee names in lowercase.
select lower(employee_name) from employees ;
-- Q59. Display the length of every employee name.
select employee_name , length(employee_name) from employees;
-- Q60. Display the first three characters of every employee name.
select employee_name , left(employee_name , 3)as frist_3 from employees ;
-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select employee_name , 
round(salary,-3)
 from employees;  -- (Salary,-3) makes -3(thousands) rounded to the nearest from the salary.
 -- Q62. Display the current date.
 select current_date();
 -- Q63. Calculate how many years each employee has worked using hire_date.
select employee_name,
       hire_date,
       timestampdiff(year, hire_date, curdate()) as years_worked
from employees;
-- Q64. Replace NULL department values with 'Unassigned' in the query result.
select employee_name ,
coalesce(department , 'Unassigned')
 as department from employees ;
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
select employee_name, salary,
       case
           when salary < 50000 then 'Low'
           when salary < 70000 then 'Medium'
           else 'High'
       end as salary_level
from employees;

    -- 4.Aggregate Functions, GROUP BY & HAVING (66–90)
-- Q66. Find the total number of employees.
select count(employee_id) from employees;

-- Q67. Find the total salary paid to all employees.
select sum(salary) from employees ;
select employee_name , salary from employees ;

-- Q68. Find the average salary of all employees.
select employee_name , avg(salary) from employees
group by employee_name ;

-- Q69. Find the highest salary.
select  max(salary)  from employees ;

-- Q70. Find the lowest salary.
select min(salary) from employees ;

-- Q71. Find the number of employees in Hyderabad.
select count(employee_id) from employees
where employee_city = 'Hyderabad' ;

-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary) from employees
where employee_city = 'Mumbai';

-- Q73. Find the average salary of employees in Bangalore.
select avg(salary) from employees
where employee_city='Bangalore';

-- Q74. Find the number of employees in each department.
select count(employee_id) , department from employees
group by department ;

-- Q75. Find the average salary in each department.
select avg(salary) , department from employees
group by department ;

-- Q76. Find the maximum salary in each department., 
-- Q77. Find the minimum salary in each department.
select max(salary) ,min(salary) , department from employees
group by department ;

-- Q78. Find the total salary in each department.
select sum(salary) , department from employees
group by department ;

-- Q79. Find the number of employees in each city.
select count(employee_id) , employee_city from employees 
group by employee_city ;

-- Q80. Find the average salary in each city.
select avg(salary) , employee_city from employees
group by employee_city ;

-- Q81. Find departments having more than 5 employees.
select count(employee_id) , department from employees
group by (department)
having count(employee_id) > 5 ;
select * from employees;

-- Q82. Find departments whose average salary is greater than 60000.
select department , avg(salary) from employees
group by department
having avg(salary) > 60000 ;

-- Q83. Find cities whose total salary is greater than 200000.
select employee_city , sum(salary) from employees
group by employee_city 
having sum(salary) >200000 ;

-- Q84. Find the department with the highest total salary.
select department , max(salary) from employees
group by department 
having max(salary) = (select sum(salary) from employees);

-- Q85. Find the department with the highest average salary.
select department , avg(salary) from employees
group by department 
order by avg(salary) desc limit 1; 
select * from employees ;

-- Q86. Display employee count and average salary for each department and city combination.
select count(employee_id) , avg(salary),
department , employee_city 
from employees
group by department , employee_city ;

-- Q87. Find the difference between the maximum and minimum salary in each department.
select department ,max(salary) - min(salary) as difference from employees 
group by department ;

-- Q88. Find departments where the maximum salary is greater than 70000.
select department , max(salary) from employees
group by department 
having max(salary) > 70000 ;

-- Q89. Find cities having at least 3 employees with salary above 60000.
select employee_city,count(employee_id)
from employees
where salary>60000
group by employee_city
having count(employee_id)>=3;

-- Q90. Find the total number of distinct departments and distinct cities.
select count(distinct department),count(distinct employee_city)
from employees;

-- Q91. Create a products table with product_id as PRIMARY KEY
create table products(product_id int primary key);

-- Q92. Create a users table where email must be UNIQUE.
create table users(user_id int primary key,
email varchar(100) unique);

-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
create table orders(order_id int primary key,order_amount decimal(10,2) 
check(order_amount>0));

-- Q94. Create a customers table where customer_name cannot be NULL.
create table customers(customer_id int primary key,
customer_name varchar(100) not null);

-- Q95. Create a table with a DEFAULT status value of 'Active'
create table accounts(account_id int primary key,status varchar(20) default 'Active');

-- Q96. Insert a row that uses the DEFAULT value.
insert into accounts(account_id) values(1);

-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
insert into products(product_id) values(1);
insert into products(product_id) values(1);

-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
insert into users(user_id,email) values(1,'abc@gmail.com');
insert into users(user_id,email) values(2,'abc@gmail.com');

-- Q99. Create employees and departments with a FOREIGN KEY relationship.
create table departments(department_id int primary key,department_name varchar(100));
create table employees(employee_id int primary key,employee_name varchar(100),
department_id int,foreign key(department_id) references departments(department_id));

-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
insert into departments(department_id,department_name)
values(10,'hr');
insert into employees(employee_id,employee_name,department_id)
values(10,'bob',10);

-- Q101. Attempt to insert an employee with a department_id that does not exist.
insert into employees(employee_id,employee_name,department_id)
values(21,'alice',99);

-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
alter table students
add constraint chk_age check(age between 18 and 60);

-- Q103. Create a composite PRIMARY KEY using two columns.
create table student_courses(
    student_id int,
    course_id int,
    primary key(student_id,course_id)
);

-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
create table attendance(
    employee_id int,
    attendance_date date,
    status varchar(20),
    primary key(employee_id,attendance_date)); 

-- Q105. Create a table with a named constraint and then identify its purpose.
alter table products
add price decimal(10,2);
alter table products
add constraint chk_price check(price>0);
desc products;

-- q106. display employee_name and department_name using an inner join.
select e.employee_name,d.department_name
from employees e
inner join departments d on e.department_id=d.department_id;

-- q107. display employee_name, salary, department_name, and location using a join.
select e.employee_name,e.salary,d.department_name,d.location
from employees e
join departments d on e.department_id=d.department_id;

-- q108. find employees working in the Data Science department using a join.
select e.employee_name
from employees e
join departments d on e.department_id=d.department_id
where d.department_name='Data Science';

-- q109. find employees working in departments located in Hyderabad.
select e.employee_name
from employees e
join departments d on e.department_id=d.department_id
where d.location='Hyderabad';

-- q110. display all employees even if they do not belong to any department.
select e.employee_name,d.department_name
from employees e
left join departments d on e.department_id=d.department_id;

-- q111. display all departments even if they have no employees.
select d.department_name,e.employee_name
from departments d
left join employees e on d.department_id=e.department_id;

-- q112. find departments that currently have no employees.
select d.department_name
from departments d
left join employees e on d.department_id=e.department_id
where e.employee_id is null;

-- q113. find employees who do not have a matching department.
select e.employee_name
from employees e
left join departments d on e.department_id=d.department_id
where d.department_id is null;

-- q114. find the number of employees in each department using join and group by.
select d.department_name,count(e.employee_id) as employee_count
from departments d
left join employees e on d.department_id=e.department_id
group by d.department_id,d.department_name;

-- q115. find the average salary in each department using join and group by.
select d.department_name,avg(e.salary) as average_salary
from departments d
left join employees e on d.department_id=e.department_id
group by d.department_id,d.department_name;

-- q116. display each department with employee count including departments with zero employees.
select d.department_name,count(e.employee_id) as employee_count
from departments d
left join employees e on d.department_id=e.department_id
group by d.department_id,d.department_name;

-- q117. display each department with total salary including departments with zero employees.
select d.department_name,coalesce(sum(e.salary),0) as total_salary
from departments d
left join employees e on d.department_id=e.department_id
group by d.department_id,d.department_name;

-- q118. join departments with projects and display department_name and project_name.
create table projects(
project_id int primary key,
project_name varchar(100),
department_id int,
foreign key(department_id) references departments(department_id)
);
insert into projects(project_id,project_name,department_id)
values(1,'data analytics',1),
(2,'hr portal',2),
(3,'sales dashboard',4),
(4,'finance system',3);
select d.department_name,p.project_name
from departments d
join projects p on d.department_id=p.department_id;

-- q119. display employees, department names, and project names using appropriate joins.
select e.employee_name,d.department_name,p.project_name
from employees e
join departments d on e.department_id=d.department_id
join projects p on d.department_id=p.department_id;

-- q120. find departments that have at least one project.
select distinct d.department_name
from departments d
join projects p on d.department_id=p.department_id;

-- q121. find departments that have no projects.
select d.department_name
from departments d
left join projects p on d.department_id=p.department_id
where p.project_id is null;

-- q122. create an employee-manager relationship using manager_id in the employees table.
alter table employees
add manager_id int,
add foreign key(manager_id) references employees(employee_id);

-- q123. using a self join, display employee name and manager name.
select e.employee_name,m.employee_name as manager_name
from employees e
left join employees m on e.manager_id=m.employee_id;

-- q124. using a self join, display only employees who have managers.
select e.employee_name,m.employee_name as manager_name
from employees e
join employees m on e.manager_id=m.employee_id;

-- q125. using a self join, display employees who do not have managers.
select e.employee_name
from employees e
left join employees m on e.manager_id=m.employee_id
where e.manager_id is null;

-- q126. find all managers who manage at least one employee.
select distinct m.employee_name as manager_name
from employees e
join employees m on e.manager_id=m.employee_id;

-- q127. count the number of employees reporting to each manager.
select m.employee_name as manager_name,count(e.employee_id) as employee_count
from employees m
join employees e on e.manager_id=m.employee_id
group by m.employee_id,m.employee_name;

-- q128. find managers who manage more than 3 employees.
select m.employee_name as manager_name,count(e.employee_id) as employee_count
from employees m
join employees e on e.manager_id=m.employee_id
group by m.employee_id,m.employee_name
having count(e.employee_id)>3;

-- q129. display employee, manager, and employee salary using a self join.
select e.employee_name,m.employee_name as manager_name,e.salary
from employees e
left join employees m on e.manager_id=m.employee_id;

-- q130. find employees whose salary is greater than their manager's salary.
select e.employee_name,e.salary,m.employee_name as manager_name,m.salary as manager_salary
from employees e
join employees m on e.manager_id=m.employee_id
where e.salary>m.salary;

-- q131. find employees who work in the same department as their manager.
select e.employee_name,m.employee_name as manager_name,e.department_id
from employees e
join employees m on e.manager_id=m.employee_id
where e.department_id=m.department_id;

-- q132. use a left join to find unmatched rows between employees and departments.
select e.employee_id,e.employee_name,e.department_id
from employees e
left join departments d on e.department_id=d.department_id
where d.department_id is null;

-- q133. use multiple joins to display employee, department, and project information.
select e.employee_name,d.department_name,p.project_name
from employees e
join departments d on e.department_id=d.department_id
join projects p on d.department_id=p.department_id;

-- q134. find the total project budget for each department.
alter table projects
add budget decimal(12,2);
update projects
set budget=100000
where project_id=1;
update projects
set budget=80000
where project_id=2;
update projects
set budget=120000
where project_id=3;
update projects
set budget=90000
where project_id=4;
select d.department_name,sum(p.budget) as total_project_budget
from departments d
left join projects p on d.department_id=p.department_id
group by d.department_id,d.department_name;

-- q135. find departments whose total project budget is greater than their department budget.
select d.department_name,sum(p.budget) as total_project_budget,d.budget as department_budget
from departments d
join projects p on d.department_id=p.department_id
group by d.department_id,d.department_name,d.budget
having sum(p.budget)>d.budget;

      -- 7. Subqueries (136–155)
-- q136. find employees whose salary is greater than the overall average salary.
select employee_name,salary
from employees
where salary>(select avg(salary) from employees);

-- q137. find the employee or employees with the highest salary using a subquery.
select employee_name,salary
from employees
where salary=(select max(salary) from employees);

-- q138. find the employee or employees with the lowest salary using a subquery.
select employee_name,salary
from employees
where salary=(select min(salary) from employees);

-- q139. find employees who earn the same salary as Alice.
select employee_name,salary
from employees
where salary=(select salary from employees where employee_name='Alice');

-- q140. find employees who earn more than Alice.
select employee_name,salary
from employees
where salary>(select salary from employees where employee_name='Alice');

-- q141. find employees working in the same department as Alice.
select employee_name,department_id
from employees
where department_id=(select department_id from employees where employee_name='Alice');

-- q142. find employees whose salary is greater than the average salary of their department.
select employee_name,salary,department_id
from employees e
where salary>(select avg(salary) from employees where department_id=e.department_id);

-- q143. find employees whose salary is less than the average salary of their department.
select employee_name,salary,department_id
from employees e
where salary<(select avg(salary) from employees where department_id=e.department_id);

-- q144. find the department with the highest average salary using a subquery.
select department_id,department
from employees
group by department_id,department
having avg(salary)=(select max(avg_salary) from (select avg(salary) as avg_salary from employees group by department_id,department) x);

-- q145. find departments whose average salary is greater than the company average salary.
select department,avg(salary) as average_salary
from employees
group by department
having avg(salary)>(select avg(salary) from employees);

-- q146. find employees who work in departments located in Hyderabad using a subquery.
select employee_name,department_id
from employees
where department_id in(select department_id from departments where location='Hyderabad');

-- q147. find employees who do not belong to any existing department using not in or not exists.
select e.employee_name,e.department_id
from employees e
where not exists(select 1 from departments d where d.department_id=e.department_id);

-- q148. find departments that have at least one employee using exists.
select d.department_name
from departments d
where exists(select 1 from employees e where e.department_id=d.department_id);

-- q149. find departments that have no employees using not exists.
select d.department_name
from departments d
where not exists(select 1 from employees e where e.department_id=d.department_id);

-- q150. find employees whose salary is greater than every employee in the HR department.
select employee_name,salary
from employees
where salary>all(select salary from employees where department='HR');

-- q151. find employees whose salary is greater than at least one employee in the Finance department.
select employee_name,salary
from employees
where salary>any(select salary from employees where department='Finance');

-- q152. find the second-highest distinct salary using a subquery.
select max(salary) as second_highest_salary
from employees
where salary<(select max(salary) from employees);

-- q153. find the third-highest distinct salary using a subquery.
select max(salary) as third_highest_salary
from employees
where salary<(select max(salary) from employees where salary<(select max(salary) from employees));

-- q154. find employees with the second-highest distinct salary.
select employee_name,salary
from employees
where salary=(select max(salary) from employees where salary<(select max(salary) from employees));

-- q155. use a correlated subquery to find employees earning above their department average.
select employee_name,salary,department
from employees e
where salary>(select avg(salary) from employees where department=e.department);

   -- 8. CTEs — Common 0Table Expressions (156–170)
-- q156. create a cte containing employees whose salary is greater than 60000.
with high_salary as(
select * from employees
where salary>60000
)
select * from high_salary;

-- q157. use a cte to calculate the company average salary and display employees earning above it.
with company_avg as(
select avg(salary) as avg_salary from employees
)
select e.employee_name,e.salary
from employees e
cross join company_avg c
where e.salary>c.avg_salary;

-- q158. use a cte to calculate average salary by department.
with dept_avg as(
select department,avg(salary) as average_salary
from employees
group by department
)
select * from dept_avg;

-- q159. use a cte to find departments with average salary greater than 60000.
with dept_avg as(
select department,avg(salary) as average_salary
from employees
group by department
)
select * from dept_avg
where average_salary>60000;

-- q160. create two ctes: one for department statistics and one for high-paying departments.
with dept_stats as(
select department,count(employee_id) as employee_count,avg(salary) as average_salary
from employees
group by department
),
high_paying as(
select department,average_salary
from dept_stats
where average_salary>60000
)
select * from high_paying;

-- q161. use a cte to calculate total salary by city and filter cities above a chosen threshold.
with city_salary as(
select employee_city,sum(salary) as total_salary
from employees
group by employee_city
)
select * from city_salary
where total_salary>100000;

-- q162. use a cte to find the highest salary in each department.
with dept_max as(
select department,max(salary) as highest_salary
from employees
group by department
)
select * from dept_max;

-- q163. use a cte to find employees earning above their department average.
with dept_avg as(
select department,avg(salary) as average_salary
from employees
group by department
)
select e.employee_name,e.salary,e.department
from employees e
join dept_avg d on e.department=d.department
where e.salary>d.average_salary;

-- q164. use a cte to rank employees by salary.
with ranked_employees as(
select employee_name,salary,
rank() over(order by salary desc) as salary_rank
from employees
)
select * from ranked_employees;

-- q165. use a cte to find the top 2 highest-paid employees.
with ranked_employees as(
select employee_name,salary,
row_number() over(order by salary desc) as salary_rank
from employees
)
select employee_name,salary
from ranked_employees
where salary_rank<=2;

-- q166. use a cte with row_number to find the highest-paid employee in each department.
with ranked_employees as(
select employee_name,salary,department,
row_number() over(partition by department order by salary desc) as salary_rank
from employees
)
select employee_name,salary,department
from ranked_employees
where salary_rank=1;

-- q167. use a cte with dense_rank to find the second-highest salary in each department.
with ranked_employees as(
select employee_name,salary,department,
dense_rank() over(partition by department order by salary desc) as salary_rank
from employees
)
select employee_name,salary,department
from ranked_employees
where salary_rank=2;

-- q168. create a cte that joins employees and departments, then filter the result.
with employee_details as(
select e.employee_name,e.salary,d.department_name
from employees e
join departments d on e.department_id=d.department_id
)
select * from employee_details
where salary>60000;

-- q169. create a cte containing departments with employee counts and filter departments with more than 3 employees.
with dept_counts as(
select department,count(employee_id) as employee_count
from employees
group by department
)
select * from dept_counts
where employee_count>3;

-- q170. create multiple dependent ctes where the second cte uses the first cte.
with dept_stats as(
select department,avg(salary) as average_salary
from employees
group by department
),
high_paying as(
select department,average_salary
from dept_stats
where average_salary>60000
)
select * from high_paying;

    -- 9. Window Functions (171–180)
-- q171. assign a unique row number to all employees ordered by salary descending.
select employee_name,salary,
row_number() over(order by salary desc) as row_num
from employees;

-- q172. assign a row number to employees within each department ordered by salary descending.
select employee_name,department,salary,
row_number() over(partition by department order by salary desc) as row_num
from employees;

-- q173. rank employees by salary using rank().
select employee_name,salary,
rank() over(order by salary desc) as salary_rank
from employees;

-- q174. rank employees by salary using dense_rank().
select employee_name,salary,
dense_rank() over(order by salary desc) as salary_rank
from employees;

-- q175. compare row_number, rank, and dense_rank on duplicate salary values.
select employee_name,salary,
row_number() over(order by salary desc) as row_num,
rank() over(order by salary desc) as salary_rank,
dense_rank() over(order by salary desc) as dense_salary_rank
from employees;

-- q176. display the company average salary beside every employee using avg() over().
select employee_name,salary,
avg(salary) over() as company_avg_salary
from employees;

-- q177. display the department average salary beside every employee using partition by.
select employee_name,department,salary,
avg(salary) over(partition by department) as department_avg_salary
from employees;

-- q178. calculate a running total of salary ordered by hire_date.
select employee_name,salary,hire_date,
sum(salary) over(order by hire_date) as running_total
from employees;

-- q179. use lag() to display the previous employee's salary when ordered by hire_date.
select employee_name,salary,hire_date,
lag(salary) over(order by hire_date) as previous_salary
from employees;

-- q180. use lead() to display the next employee's salary when ordered by hire_date.
select employee_name,salary,hire_date,
lead(salary) over(order by hire_date) as next_salary
from employees;

commit;

   -- 10. Hard SQL Challenge Questions (181–200)
   
