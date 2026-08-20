-- q1). create a database named company_db.

create database company_db;


-- q2). select and use the company_db database.

use company_db;


-- q3). create an employees table with employee_id, employee_name,
-- department_id, salary, city, and hire_date columns.

create table employees_q3 (
    employee_id int,
    employee_name varchar(100),
    department_id int,
    salary decimal(12,3),
    city varchar(100),
    hire_date date
);


-- q4). make employee_id the primary key.

alter table employees_q3
add primary key (employee_id);


-- q5). make employee_name not null.

alter table employees_q3
modify employee_name varchar(100) not null;


-- q6). add a unique constraint to an email column.

alter table employees_q3
add column email varchar(150);

alter table employees_q3
add unique (email);


-- q7). add a check constraint so salary must be greater than 0.

alter table employees_q3
add constraint chk_salary
check (salary > 0);


-- q8). add a default value of 'hyderabad' for the city column.

alter table employees_q3
alter city set default 'hyderabad';


-- q9). create a departments table with department_id,
-- department_name, location, and budget.

create table departments (
    department_id int,
    department_name varchar(100),
    location varchar(100),
    budget decimal(12,2)
);


-- q10). make department_id the primary key.

alter table departments
add primary key (department_id);


-- q11). create a projects table with project_id,
-- project_name, department_id, and budget.

create table projects (
    project_id int primary key,
    project_name varchar(100),
    department_id int,
    budget decimal(12,2)
);


-- q12). add a foreign key from employees_q3.department_id
-- to departments.department_id.

alter table employees_q3
add constraint fk_q12
foreign key (department_id)
references departments(department_id);


-- q13). insert one employee record.

insert into employees_q3
(employee_id, employee_name, department_id, salary, city, hire_date, email)
values
(101, 'adam', 101, 55000, 'hyderabad', '2025-01-10', 'adam@example.com');


-- q14). insert five employee records.

insert into employees_q3
(employee_id, employee_name, department_id, salary, city, hire_date, email)
values
(102, 'anna', 101, 50000, 'hyderabad', '2025-01-11', 'anna@example.com'),
(103, 'ben', 101, 60000, 'bangalore', '2025-02-01', 'ben@example.com'),
(104, 'cara', 101, 52000, 'mumbai', '2025-02-10', 'cara@example.com'),
(105, 'david', 101, 70000, 'hyderabad', '2025-03-01', 'david@example.com'),
(106, 'emma', 101, 58000, 'bangalore', '2025-03-15', 'emma@example.com');


-- q15). insert a department record.

insert into departments
(department_id, department_name, location, budget)
values
(101, 'it', 'hyderabad', 300000);


-- q16). create a students table with primary key, not null,
-- unique, check, and default constraints.

create table students (
    student_id int primary key,
    student_name varchar(100) not null,
    email varchar(150) unique,
    age int check (age between 5 and 100),
    city varchar(100) default 'hyderabad'
);


-- q17). create an attendance table with employee_id,
-- attendance_date, and status.

create table attendance_q17 (
    employee_id int,
    attendance_date date,
    status varchar(30)
);


-- q18). create a table only if it does not already exist.

create table if not exists temp_data (
    id int
);


-- q19). display the structure of employees_q3.

describe employees_q3;


-- q20). drop a temporary table named temp_data if it exists.

drop table if exists temp_data;


-- q21). display all columns from employees_q3.

select *
from employees_q3;


-- q22). display only employee_name and salary.

select employee_name, salary
from employees_q3;


-- q23). display employees who live in hyderabad.

select *
from employees_q3
where city = 'hyderabad';


-- q24). display employees whose salary is greater than 60000.

select *
from employees_q3
where salary > 60000;


-- q25). display employees whose salary is less than or equal to 50000.

select *
from employees_q3
where salary <= 50000;


-- q26). display employees whose salary is between 50000 and 70000.

select *
from employees_q3
where salary between 50000 and 70000;


-- q27). display employees who live in hyderabad,
-- bangalore, or mumbai using in.

select *
from employees_q3
where city in ('hyderabad', 'bangalore', 'mumbai');


-- q28). display employees who do not live in hyderabad.

select *
from employees_q3
where city <> 'hyderabad';


-- q29). display employees whose names start with 'a'.

select *
from employees_q3
where employee_name like 'a%';


-- q30). display employees whose names end with 'a'.

select *
from employees_q3
where employee_name like '%a';


-- q31). display employees whose names contain the letter 'i'.

select *
from employees_q3
where employee_name like '%i%';


-- q32). display employees whose department_id is null.

select *
from employees_q3
where department_id is null;


-- q33). display employees whose department_id is not null.

select *
from employees_q3
where department_id is not null;


-- q34). display employees hired after 2022-01-01.

select *
from employees_q3
where hire_date > '2022-01-01';


-- q35). display employees hired between two given dates.

select *
from employees_q3
where hire_date between '2020-01-01' and '2023-12-31';


-- q36). display employees with salary greater than 50000
-- and who live in hyderabad.

select *
from employees_q3
where salary > 50000
and city = 'hyderabad';


-- q37). display employees who live in hyderabad
-- or earn more than 70000.

select *
from employees_q3
where city = 'hyderabad'
or salary > 70000;


-- q38). display employees who are not in department 101.

select *
from employees_q3
where department_id <> 101
or department_id is null;


-- q39). display distinct cities.

select distinct city
from employees_q3;


-- q40). display distinct departments.

select distinct department_id
from employees_q3;


-- q41). display employees sorted by salary in ascending order.

select *
from employees_q3
order by salary asc;


-- q42). display employees sorted by salary in descending order.

select *
from employees_q3
order by salary desc;


-- q43). display employees sorted first by department
-- and then by salary descending.

select *
from employees_q3
order by department_id asc, salary desc;


-- q44). display the first 5 employees after sorting by employee_id.

select *
from employees_q3
order by employee_id
limit 5;


-- q45). display the top 3 highest-paid employees.

select *
from employees_q3
order by salary desc
limit 3;


-- q46). update the salary of one employee using employee_id.

update employees_q3
set salary = 60000
where employee_id = 101;


-- q47). increase the salary of all employees by 10 percent.

update employees_q3
set salary = salary * 1.10;


-- q48). increase the salary of employees in the data science department by 5000.

update employees_q3
set salary = salary + 5000
where department_id = 101;


-- q49). change the city of all employees currently living
-- in bangalore to bengaluru.

update employees_q3
set city = 'bengaluru'
where city = 'bangalore';

select * from employees_q3

-- q50). delete one employee using employee_id.

delete from employees_q3
where employee_id = 101;

-- q51). delete employees whose salary is below a specified amount.

delete from employees_q3
where salary < 50000;


-- q52). add an email column to the employees table.

alter table employees_q3
add column email_address varchar(150);


-- q53). add a phone_number column to the employees table.

alter table employees_q3
add column phone_number varchar(20);


-- q54). modify the length of the employee_name column.

alter table employees_q3
modify employee_name varchar(150);


-- q55). rename the city column to employee_city.

alter table employees_q3
rename column city to employee_city;


-- q56). drop the phone_number column.

alter table employees_q3
drop column phone_number;


-- q57). display employee names in uppercase.

select upper(employee_name) as employee_name
from employees_q3;


-- q58). display employee names in lowercase.

select lower(employee_name) as employee_name
from employees_q3;


-- q59). display the length of every employee name.

select employee_name,
length(employee_name) as name_length
from employees_q3;


-- q60). display the first three characters of every employee name.

select employee_name,
left(employee_name, 3) as first_three_characters
from employees_q3;


-- q61). display employee_name and salary rounded to the nearest thousand.

select employee_name,
round(salary, -3) as rounded_salary
from employees_q3;


-- q62). display the current date.

-- q62). display the current date

select current_date() as today;


-- q63). calculate how many years each employee has worked using hire_date.

select employee_name,
timestampdiff(year, hire_date, current_date()) as years_worked
from employees_q3;


-- q64). replace null department_id values with 'unassigned'
-- in the query result.

select employee_name,
coalesce(department_id, 'unassigned') as department_id
from employees_q3;


-- q65). use case to label employees as low, medium, or high salary.

select employee_name,
salary,
case
when salary < 50000 then 'low'
when salary between 50000 and 70000 then 'medium'
else 'high'
end as salary_level
from employees_q3;


-- q66). find the total number of employees.

select count(*) as employee_count
from employees_q3;


-- q67). find the total salary paid to all employees.

select sum(salary) as total_salary
from employees_q3;


-- q68). find the average salary of all employees.

select avg(salary) as average_salary
from employees_q3;


-- q69). find the highest salary.

select max(salary) as highest_salary
from employees_q3;


-- q70). find the lowest salary.

select min(salary) as lowest_salary
from employees_q3;


-- q71). find the number of employees in hyderabad.

select count(*) as employee_count
from employees_q3
where employee_city = 'hyderabad';


-- q72). find the total salary paid to employees in mumbai.

select sum(salary) as total_salary
from employees_q3
where employee_city = 'mumbai';


-- q73). find the average salary of employees in bangalore.

select avg(salary) as average_salary
from employees_q3
where employee_city = 'bangalore';


-- q74). find the number of employees in each department.

select department_id,
count(*) as employee_count
from employees_q3
group by department_id;


-- q75). find the average salary in each department.

select department_id,
avg(salary) as average_salary
from employees_q3
group by department_id;


-- q76). find the maximum salary in each department.

select department_id,
max(salary) as maximum_salary
from employees_q3
group by department_id;


-- q77). find the minimum salary in each department.

select department_id,
min(salary) as minimum_salary
from employees_q3
group by department_id;


-- q78). find the total salary in each department.

select department_id,
sum(salary) as total_salary
from employees_q3
group by department_id;


-- q79). find the number of employees in each city.

select employee_city,
count(*) as employee_count
from employees_q3
group by employee_city;


-- q80). find the average salary in each city.

select employee_city,
avg(salary) as average_salary
from employees_q3
group by employee_city;


-- q81). find departments having more than 5 employees.

select department_id,
count(*) as employee_count
from employees_q3
group by department_id
having count(*) > 5;


-- q82). find departments whose average salary is greater than 60000.

select department_id,
avg(salary) as average_salary
from employees_q3
group by department_id
having avg(salary) > 60000;


-- q83). find cities whose total salary is greater than 200000.

select employee_city,
sum(salary) as total_salary
from employees_q3
group by employee_city
having sum(salary) > 200000;


-- q84). find the department with the highest total salary.

select department_id,
sum(salary) as total_salary
from employees_q3
group by department_id
order by total_salary desc
limit 1;


-- q85). find the department with the highest average salary.

select department_id,
avg(salary) as average_salary
from employees_q3
group by department_id
order by average_salary desc
limit 1;


-- q86). display employee count and average salary for each department and city combination.

select department_id,
employee_city,
count(*) as employee_count,
avg(salary) as average_salary
from employees_q3
group by department_id, employee_city;


-- q87). find the difference between the maximum and minimum salary in each department.

select department_id,
max(salary) - min(salary) as salary_difference
from employees_q3
group by department_id;


-- q88). find departments where the maximum salary is greater than 70000.

select department_id,
max(salary) as maximum_salary
from employees_q3
group by department_id
having max(salary) > 70000;


-- q89). find cities having at least 3 employees with salary above 60000.

select employee_city,
count(*) as high_salary_count
from employees_q3
where salary > 60000
group by employee_city
having count(*) >= 3;


-- q90). find the total number of distinct departments and distinct cities.

select count(distinct department_id) as distinct_departments,
count(distinct employee_city) as distinct_cities
from employees_q3;


-- q91). create a products table with product_id as primary key.

create table products (
product_id int primary key,
product_name varchar(100),
price decimal(10,2)
);


-- q92). create a users table where email must be unique.

create table users (
user_id int primary key,
user_name varchar(100),
email varchar(150) unique
);


-- q93). create an orders table where order_amount must be greater than 0 using check.

create table orders (
order_id int primary key,
order_amount decimal(12,2),
check (order_amount > 0)
);


-- q94). create a customers table where customer_name cannot be null.

create table customers (
customer_id int primary key,
customer_name varchar(100) not null
);


-- q95). create a table with a default status value of 'active'.

create table status_table (
id int primary key,
status varchar(30) default 'active'
);


-- q96). insert a row that uses the default value.

insert into status_table (id)
values (1);


-- q97). attempt to insert a duplicate primary key and identify the violated constraint.

insert into products
values (1, 'laptop', 50000);

-- for voilating constraint:
insert into products
values (1, 'phone', 30000);


-- q98). attempt to insert a duplicate unique email and identify the violated constraint.

insert into users
values (1, 'user1', 'user@example.com');

insert into users
values (2, 'user2', 'user@example.com');


-- q99). create employees and departments with a foreign key relationship.

create table departments_fk (
department_id int primary key,
department_name varchar(100)
);

create table employees_fk (
employee_id int primary key,
employee_name varchar(100),
department_id int,
foreign key (department_id)
references departments_fk(department_id)
);


-- q100). insert valid parent and child records respecting the foreign key.

insert into departments_fk
values (1, 'it');

insert into employees_fk
values (1, 'john', 1);


-- q101). attempt to insert an employee with a department_id that does not exist.

insert into employees_fk
values (2, 'mike', 999);


-- q102). add a check constraint to allow age only between 18 and 60.

alter table customers
add column age int;

alter table customers
add constraint chk_customer_age
check (age between 18 and 60);


-- q103). create a composite primary key using two columns.

create table composite (
employee_id int,
project_id int,
primary key (employee_id, project_id)
);


-- q104). create an attendance table where employee_id and attendance_date together form a composite key.

create table attendance (
employee_id int,
attendance_date date,
status varchar(30),
primary key (employee_id, attendance_date)
);


-- q105). create a table with a named constraint and identify its purpose.

create table named_constraint (
id int primary key,
age int,
constraint chk_named_age
check (age >= 18)
);


-- q106). display employee_name and department_name using an inner join.

select e.employee_name,
d.department_name
from employees_q3 as e
inner join departments as d
on e.department_id = d.department_id;


-- q107). display employee_name, salary, department_name, and location using a join.

select e.employee_name,
e.salary,d.department_name,d.location
from employees_q3 e
join departments d
on e.department_id = d.department_id;


-- q108). find employees working in the data science department  using a join.

select e.*
from employees_q3 as e
join departments as d
on e.department_id = d.department_id
where d.department_name = 'data science';


-- q109). find employees working in departments located in hyderabad.

select e.*
from employees_q3 as e
join departments as d
on e.department_id = d.department_id
where d.location = 'hyderabad';


-- q110). display all employees even if they do not  belong to any department.

select e.employee_name,d.department_name
from employees_q3 as e
left join departments as d
on e.department_id = d.department_id;


-- q111). display all departments even if they have no employees.

select d.department_name, e.employee_name
from departments as d
left join employees_q3 as e
on d.department_id = e.department_id;


-- q112). find departments that currently have no employees.

select d.department_name
from departments d
left join employees_q3 e
on d.department_id = e.department_id
where e.employee_id is null;


-- q113). find employees who do not have a matching department.

select e.employee_name
from employees_q3 e
left join departments d
on e.department_id = d.department_id
where d.department_id is null;


-- q114). find the number of employees in each department using join and group by.

select d.department_name,count(e.employee_id) as employee_count
from departments d
left join employees_q3 e
on d.department_id = e.department_id
group by d.department_id,d.department_name;


-- q115). find the average salary in each department using join and group by.

select d.department_name,avg(e.salary) as average_salary
from departments d
left join employees_q3 e
on d.department_id = e.department_id
group by d.department_id,d.department_name;


-- q116). display each department with employee count including departments with zero employees.

select d.department_name,count(e.employee_id) as employee_count
from departments d
left join employees_q3 e
on d.department_id = e.department_id
group by d.department_id,d.department_name;


-- q117). display each department with total salary including departments with zero employees.

select d.department_name,coalesce(sum(e.salary), 0) as total_salary
from departments d
left join employees_q3 e
on d.department_id = e.department_id
group by d.department_id,d.department_name;


-- q118). join departments with projects and display department_name and project_name.

select d.department_name,p.project_name
from departments d
join projects p
on d.department_id = p.department_id;


-- q119). display employees, department names,and project names using appropriate joins.

select e.employee_name,d.department_name,p.project_name
from employees_q3 e
left join departments d
on e.department_id = d.department_id
left join projects p
on d.department_id = p.department_id;


-- q120). find departments that have at least one project.

select distinct d.department_name
from departments d
join projects p
on d.department_id = p.department_id;


-- q121). find departments that have no projects.

select d.department_name
from departments d
left join projects p
on d.department_id = p.department_id
where p.project_id is null;


-- q122). create an employee-manager relationship using manager_id in the employees table.

alter table employees_q3
add column manager_id int;


-- q123). using a self join, display employee name and manager name.

select e.employee_name as employee_name,
       m.employee_name as manager_name
from employees_q3 e
left join employees_q3 m
on e.manager_id = m.employee_id;


-- q124). using a self join, display only employeeswho have managers.

select e.employee_name as employee_name,
       m.employee_name as manager_name
from employees_q3 e
join employees_q3 m
on e.manager_id = m.employee_id;


-- q125). using a self join, display employees who do not have managers.


select *from employees_q3
select e.employee_name as employee_name
from employees_q3 e
left join employees_q3 m
on e.manager_id = m.employee_id
where e.manager_id is null;


-- q126). find all managers who manage at least one employee.

select distinct m.employee_id,m.employee_name
from employees_q3 e
join employees_q3 m
on e.manager_id = m.employee_id;


-- q127). count the number of employees reporting to each manager.

select m.employee_id,m.employee_name,count(e.employee_id) as employee_count
from employees_q3 m
join employees_q3 e
on e.manager_id = m.employee_id
group by m.employee_id,m.employee_name;


-- q128). find managers who manage more than 3 employees.

select m.employee_id,
       m.employee_name,
       count(e.employee_id) as employee_count
from employees_q3 m
join employees_q3 e
on e.manager_id = m.employee_id
group by m.employee_id,
         m.employee_name
having count(e.employee_id) > 3;


-- q129). display employee, manager,and employee salary using a self join.

select e.employee_name as employee_name,
       m.employee_name as manager_name,
       e.salary
from employees_q3 e
left join employees_q3 m
on e.manager_id = m.employee_id;


-- q130). find employees whose salary is greater than their manager's salary.

select e.employee_name,
       e.salary,
       m.employee_name as manager_name,
       m.salary as manager_salary
from employees_q3 e
join employees_q3 m
on e.manager_id = m.employee_id
where e.salary > m.salary;


-- q131). find employees who work in the same department as their manager.

select e.employee_name,
       m.employee_name as manager_name,
       e.department_id
from employees_q3 e
join employees_q3 m
on e.manager_id = m.employee_id
where e.department_id = m.department_id;


-- q132). use a left join to find unmatched rows

select e.*
from employees_q3 e
left join departments d
on e.department_id = d.department_id
where d.department_id is null;


-- q133). use multiple joins to display employee,department, and project information.

select e.employee_name,
       d.department_name,
       p.project_name
from employees_q3 e
left join departments d
on e.department_id = d.department_id
left join projects p
on d.department_id = p.department_id;


-- q134). find the total project budget for each department.

select d.department_name,
       coalesce(sum(p.budget), 0) as total_project_budget
from departments d
left join projects p
on d.department_id = p.department_id
group by d.department_id,
         d.department_name;


-- q135). find departments whose total project budget is greater than their department budget.

select d.department_name,
       d.budget as department_budget,
       sum(p.budget) as total_project_budget
from departments d
join projects p
on d.department_id = p.department_id
group by d.department_id,
         d.department_name,
         d.budget
having sum(p.budget) > d.budget;


-- q136). find employees whose salary is greater than the overall average salary.

select *
from employees_q3
where salary > (
    select avg(salary)
    from employees_q3
);


-- q137). find the employee or employees with the highest salary using a subquery.

select *
from employees_q3
where salary = (
    select max(salary)
    from employees_q3
);


-- q138). find the employee or employees with the lowest salary using a subquery.

select *
from employees_q3
where salary = (
    select min(salary)
    from employees_q3
);


-- q139). find employees who earn the same salary as alice.

select *
from employees_q3
where salary = (select salary from employees_q3
    where employee_name = 'alice'
);


-- q140). find employees who earn more than alice.

select *
from employees_q3
where salary > (
    select salary
    from employees_q3
    where employee_name = 'alice'
);


-- q141). find employees working in the same department as alice.

select *
from employees_q3
where department_id = (
    select department_id
    from employees_q3
    where employee_name = 'alice'
);


-- q142). find employees whose salary is greater than the average salary of their department.

select e.*
from employees_q3 e
where e.salary > (
    select avg(e2.salary)
    from employees_q3 e2
    where e2.department_id = e.department_id
);


-- q143). find employees whose salary is less than the average salary of their department.

select e.*
from employees_q3 e
where e.salary < (
    select avg(e2.salary)
    from employees_q3 e2
    where e2.department_id = e.department_id
);


-- q144). find the department with the highest average salary using a subquery.

select department_id,
       avg(salary) as average_salary
from employees_q3
group by department_id
having avg(salary) = (
    select max(average_salary)
    from (
        select avg(salary) as average_salary
        from employees_q3
        group by department_id
    ) as avg_salaries
);


-- q145). find departments whose average salary is greater than the company average salary.

select department_id,
       avg(salary) as average_salary
from employees_q3
group by department_id
having avg(salary) > (
    select avg(salary)
    from employees_q3
);


-- q146). find employees who work in departments located in hyderabad using a subquery.

select *
from employees_q3
where department_id in (
    select department_id
    from departments
    where location = 'hyderabad'
);


-- q147). find employees who do not belong to any existing department using not exists.

select e.*
from employees_q3 e
where not exists (
    select 1
    from departments d
    where d.department_id = e.department_id
);


-- q148). find departments that have at least one employee using exists.

select *
from departments d
where exists (
    select 1
    from employees_q3 e
    where e.department_id = d.department_id
);


-- q149). find departments that have no employees using not exists.

select d.department_id, d.department_name
from departments d
where not exists (
    select 1
    from employees_q3 e
    where e.department_id = d.department_id
);

-- q150). find employees whose salary is greater than every employee in the hr department.

select *from employees_q3
where salary > all (
    select salary
    from employees_q3
    where department_id = (
        select department_id
        from departments
        where department_name = 'hr'
    )
);

-- q151). find employees whose salary is greater than at least one employee in the finance department.

select *
from employees_q3
where salary>any (select salary from employees_q3 where department_id = (select department_id from departments where department_name = 'finance'));


-- q152). find the second-highest distinct salary using a subquery.

select max(salary) as second_highest_salary
from employees_q3
where salary < (select max(salary)from employees_q3);


-- q153). find the third-highest distinct salary using a subquery.

select max(salary) as third_highest_salary
from employees_q3
where salary < (
    select max(salary)
    from employees_q3
    where salary < (
        select max(salary)
        from employees_q3
    )
);


-- q154). find employees with the second-highest distinct salary.

select *
from employees_q3
where salary = (select max(salary)from employees_q3 where salary < (select max(salary)from employees_q3));


-- q155). use a correlated subquery to find employees
-- earning above their department average.

select e.*
from employees_q3 e
where e.salary > (
    select avg(e2.salary)
    from employees_q3 e2
    where e2.department_id = e.department_id
);


-- q156). create a cte containing employees
-- whose salary is greater than 60000.

with high_salary as (
    select *
    from employees_q3
    where salary > 60000
)
select *
from high_salary;


-- q157). use a cte to calculate the company average salary
-- and display employees earning above it.

with company_average as (
    select avg(salary) as average_salary
    from employees_q3
)
select e.*
from employees_q3 e
cross join company_average c
where e.salary > c.average_salary;


-- q158). use a cte to calculate average salary by department.

with department_average as (
    select department_id,
           avg(salary) as average_salary
    from employees_q3
    group by department_id
)
select *
from department_average;


-- q159). use a cte to find departments with average salary
-- greater than 60000.

with department_average as (
    select department_id,
           avg(salary) as average_salary
    from employees_q3
    group by department_id
)
select *
from department_average
where average_salary > 60000;


-- q160). create two ctes: one for department statistics
-- and one for high-paying departments.

with department_stats as (
    select department_id,
           count(*) as employee_count,
           avg(salary) as average_salary
    from employees_q3
    group by department_id
),
high_paying_departments as (
    select *
    from department_stats
    where average_salary > 60000
)
select *
from high_paying_departments;


-- q161). use a cte to calculate total salary by city
-- and filter cities above a chosen threshold.

with city_salary as (
    select employee_city,
           sum(salary) as total_salary
    from employees_q3
    group by employee_city
)
select *
from city_salary
where total_salary > 200000;


-- q162). use a cte to find the highest salary in each department.

with department_highest as (
    select department_id,
           max(salary) as highest_salary
    from employees_q3
    group by department_id
)
select *
from department_highest;


