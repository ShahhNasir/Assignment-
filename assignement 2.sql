use company_db;
create table employee
(
emp_id int primary key,
emp_name varchar(20) not null,
department_id int,
salary int check (salary>0),
city varchar(50) DEFAULT 'Hyderabad',
hire_date date,
email_id varchar( 20) unique
);
create table department
(
dep_id int primary key,
dep_name varchar(20),
location varchar(20),
budget int
);
create table project
(
pro_id int,
pro_name varchar(50),
department_id int,
budget int
);
insert into employee values
(101,"Gowtham","900","45000","hyderabad","2025-01-23","Gowtham@gmail.com"),
(202,"Sathvik","674","89000","hyderabad","2022-12-20","Sathvik@gmail.com"),
(303,"Pavan","452","34000","vijayawada","2024-03-30","Pavan@gamil.com"),
(404,"Abhi","341","45000","goa","2025-06-25","Abhi@gmail.com"),
(505,"Navenn","456","67000","chennai","2023-09-26","Naveen@gmail.com"),
(606,"Rama","345","56900","bangalore","2026-08-27","Rama@gmail.com");

 insert into department values
 (101,"HR","hyderabad","100000"),
 (202,"IT","hyderabad","4500000"),
 (303,"AI","vijayawade","340000"),
 (404,"IT","goa","600000"),
 (505,"HR","chennai","670000"),
 (606,"IT","bangalore",560000);
 
 create table student
 (
 stu_id int primary key,
 stu_name varchar(30) not null,
 email varchar(30)unique,
 age int check (age >= 18), 
 city varchar(50) default 'hyderabad'
 );
 
 create table attendance
 (
employee_id int,
attendance_date date,
 status varchar(50)
 );

create table if not exists employees_backup
(
employee_id int,
employee_name varchar(50)
);

desc employee;

drop temporary table if exists temp_data;

-- select commands

select*from employee;

select emp_name,salary
from employee;

select *from employee
where city = "hyderabad";

select*from employee
where salary > 60000;

select*from employee
where salary < 50000;

select*from employee
where salary between 50000 and 60000;

select*from employee
where city in ("hyderabad","bangalore","chennai");

select*from employee
where city <> "hyderabad";

select*from employee
where emp_name like "A%";

select*from employee
where emp_name like "%a";

select*from employee
where emp_name like "%i%";

select*from employee
where  department_id is null;

select*from employee
where department_id is not null;

select*from employee
where hire_date = "2022-01-01";

select*from employee
where hire_date  between 2023-01-23 and 2026-09-13;

select*from employee
where salary >=50000 and city = "hyderabad";

select*from employee
where city <> "hyderabad" and salary >=60000;

select*from employee
where department_id <> "HR";

select distinct city
from employee;

select distinct department_id
from employee;

select*from employee
order by salary asc;

select*from employee
order by salary desc;

select*from employee
order by salary asc, salary desc;

select*from employee
order by salary asc limit 5;

select*from employee
order by salary desc limit 3;

-- update delete alter commands

update employee
set salary = 55000
where emp_id = "101";

update employee
set salary = salary * 1.10
where emp_id > 0;

update employee
set salary = salary + 5000
where department_id ="900"
and emp_id > 0;

update employee
set city = 'Bengaluru'
where city = 'Bangalore'
and emp_id > 0;

-- delete commands

delete from employee
where emp_id = "101";

delete from employee
where salary < "40000"
and emp_id > 0;

-- alter commands

alter table employee
add email varchar(50);

alter table employee
add phone_number varchar(30);

alter table employee
modify emp_name varchar(100);

alter table employee
rename column city to city;

alter table employee
drop column phone_number;

-- select commands

select upper(emp_name) as emp_id
from employee;

select lower(emp_name) as emp_id
from employee;

select length(emp_name) as name_length
from employee;

select emp_name , left(emp_name, 3) as first_three_characters
from employee;

select emp_name,substring(emp_name, 1, 3) as first_three_characters
from employee;

select emp_name,round(salary, -3) AS rounded_salary
from employee;


select curdate() as current_date;

select emp_name,salary,case 
when salary < 40000 then 'Low'
when salary between 40000 and 70000 then 'Medium'
else 'High'
end as salary_category from employee;

SELECT emp_name,
timestamp(year, hire_date, curdate()) as years_worked from employee;

-- Aggregate Functions, GROUP BY & HAVING

select count(*) as total_employee
from employee;

select sum(salary) as total_salary
from employee;

select avg(salary) as total_average
from employee;

select max(salary) as total_max
from employee;

select min(salary)as lowest_salary
from employee;

select count(*) as employee_count
from employee where city = "hyderabad";

select sum(salary) as total_salary 
from employee where city = "goa";  

select min(salary) as lowert_salary
from employee where city = "hyderabad";  -- aggregate function

select department_id,count(*) as count_employee
from employee group by department_id ;

select department_id,avg(salary) as average_salary
from employee group by department_id;

select department_id,max(salary) as maximum_salary
from employee group by department_id;

select department_id,min(salary) as minumum_salary
from employee group by department_id;

select department_id,sum(salary) as total_salary
from employee group by department_id;

select city ,count(*) as total_city
from employee group by city;

select city,avg(salary) as average_salary
from employee group by city;

select department_id ,count(*) as count_salary
from employee group by department_id
having count(*) >5;

select department_id,avg(salary) as average_salary
from employee group by department_id
having avg(salary) > 60000;

select city,sum(salary) as total_salary
from employee group by city 
having sum(salary) > 20000;


select department_id,sum(salary) as total_salary 
from employee group by department_id
order by total_salary desc limit 1;

select department_id,avg(salary) as average_salary
from employee group by department_id
order by average_salary  desc limit 1;

select department_id,city ,count(*) as count_employee,avg(Salary) as average_salary
from employee group by department_id,city;

select department_id,min(salary) as minimum_salary,max(salary) as maximum_salary
from employee group by department_id;

select department_id,max(salary) as maximum_Salary 
from employee group by department_id
having max(salary) > 70000;

select city,count(*) as count_employee
from employee where salary > 60000
group by city having count(*)>=3;

select count(distinct department_id) as distinct_department,
count(distinct city) as distinct_cities from employee;

use company_db;
create table products
(
product_id int primary key,
product_name varchar(100),
price decimal(10,2)
);

create table users
(
users_id int primary key,
users_name varchar(100),
email varchar(100) unique
);

create table orders
(
orders_id int primary key,
customer_name varchar(40),
orders_amount decimal(10,2) check (orders_amount > 0)
);
create table customers
(
cus_id int primary key,
cus_name varchar(50) not null,
cus_city varchar(50)
);

create table accounts
(
acc_id int primary key,
acc_name varchar(50),
acc_status varchar(50) default "active"
);

insert into accounts value
(1,"Gowtham");
select * from accounts;

insert into products value
(101,"lapto","69000"),
(102,"moblie",79000);

insert into users value
(122,"Gowtham","Gowtham@gmail.com"),
(123,"Sathvik","Sathvik@gmail.com");











