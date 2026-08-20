-- 1 Database & Table Creation (1–20)
create database company_db;
use company_db;
create table employee
(
employee_id varchar(30) primary key,
employee_name varchar(50) not null, 
department varchar(50) , 
salary int check (salary > 0), 
city varchar(50) default 'hyderabad', 
email varchar(100) unique,
hire_date date
);
select * from employee;

create table department(
department_id varchar(30) primary key,
department_name varchar(30) ,
 location varchar(30), 
 budget int
);
create table project_table(
project_id varchar(50), 
project_name varchar(50), 
department_id varchar(50), 
budget int
);

insert into employee 
values("R1","janvi","CSE",50000,"nagpur","jkumbhare@email.com","2025-07-06");

insert into employee values
('E001', 'Rahul Sharma', 'IT', 45000, 'Hyderabad', 'rahul@gmail.com', '2024-01-15'),
('E002', 'Priya Singh', 'HR', 40000, 'Mumbai', 'priya@gmail.com', '2024-02-20'),
('E003', 'Amit Kumar', 'Finance', 50000, 'Delhi', 'amit@gmail.com', '2023-11-10'),
('E004', 'Sneha Patel', 'Marketing', 42000, 'Pune', 'sneha@gmail.com', '2024-03-05'),
('E005', 'Arjun Reddy', 'IT', 55000, 'hyderabad', 'arjun@gmail.com', '2023-08-18');

insert into department values
('D001', 'IT', 'Hyderabad', 500000),
('D002', 'HR', 'Mumbai', 300000),
('D003', 'Finance', 'Delhi', 400000),
('D004', 'Marketing', 'Pune', 350000),
('D005', 'Sales', 'Bangalore', 450000);

create table students
(student_id int primary key,
 student_name varchar(50) NOT NULL,
 email varchar(100) UNIQUE,
 age int check (age >= 18),
 city varchar(50) DEFAULT 'Hyderabad'
);

create table attendance
(employee_id int, 
attendance_date date, 
status varchar(30)
);

create table if not exists run
( student_id int,
 student_name varchar(50) 
);

select * from employee;
drop temporary table if exists temp_data; 

-- 2	Basic SELECT & Filtering (21–45)
 select * from employee;
 select employee_name,salary from employee;
 select employee_name from employee
 where city="hyderabad";
 select employee_name from employee
 where salary>60000;
 select employee_name from employee 
 where salary<=50000;
 select employee_name from employee
 where salary between 50000 and 70000;
 select employee_name from employee
 where city in ("Hyderabad"," Bangalore","Mumbai");
 select employee_name from employee
 where city!="hyderabad";
 select employee_name from employee
 where employee_name like "A%";
 select employee_name from employee
 where employee_name like "%a";
 select employee_name from employee
 where employee_name like "%i%";
 select employee_name from employee
 where department is null ;
 select employee_name from employee
 where department is not  null ;
 select employee_name from employee
 where hire_date > 2022-01-01 ;
 select employee_name from employee
 where hire_date between 2023-01-01 and 2025-01-01;
 select * from employee;
 select employee_name  from employee
 where salary>50000 and city="hyderabad";
 select employee_name  from employee
 where salary>70000 or city="hyderabad";
 select employee_name from employee
 where department != "HR" ;
 select distinct city from employee;
 select distinct department from employee;
 select  employee_name from employee order by salary asc;
 select  employee_name from employee order by salary desc;
 select  employee_name from employee order by department asc,salary desc;
 select  employee_name from employee order by employee_id limit 5;
 select  employee_name,salary from employee order by salary desc limit 3; 
 
 --  3 UPDATE, DELETE, ALTER & Basic Functions (46–65)
  update employee set salary=75000 where employee_id="E001" ;
  select * from employee;
 update employee set salary=salary*1.10;
 update employee set city="bengaluru" where city="bangalore";
 delete from employee where employee_id="E001";
 delete from employee where salary <40000;
 alter table employee add email_nam varchar(50);
 alter table employee add phone_number int ;
 alter table employee modify employee_name varchar(100);
 alter table employee rename column  city to employee_city;
 alter table employee drop column phone_number;
 select upper(employee_name) from employee;
select lower(employee_name) from employee;
select length(employee_name) from employee;
select employee_name, left(employee_name, 3) as first_three_char from  employee;
select  employee_name, ROUND(salary, -3) as rounded_salary from employee;
select curdate() as current_date;
 select employee_name,timestampdiff(year,hire_date,curdate())
 -- select employee_name coalesce(department, 'Unassigned') as department from employee;
 
 -- 4.	Aggregate Functions, GROUP BY & HAVING (66–90)
 select count(employee_name)as total_employee  from employee; 
 select sum(salary) as total_salary from employee;
 select avg(salary) as average_salary from employee;
 select max(salary) as highest_salary from employee;
 select  min(salary) as lowest_salary from  employee;
 select count(city) as employee_city  from employee where city = "Hyderabad";
 select sum(salary) as total_salary from employee where city = "Mumbai";
 select avg(salary) as average_salary from employee where city = "Bangalore";
 select * from employee;
 select department, avg(salary) as average_salary from employee group by department;
 select department, max(salary) as maximum_salary from employee group by department;
 select department, min(salary) as minimum_salary from employee group by department;
 select  department, sum(salary) as total_salary from employee group by department;
 select city, count(*) as employee_count from employee group by city;
 select city, avg(salary) as average_salary from employee group by city;
 select department, count(*) as employee_count from employee group by department having COUNT(*) > 5;
 select department, avg(salary) as average_salary from employee group by department having avg(salary) > 60000;
 select city, sum(salary) as total_salary from employee
group by city having sum(salary) > 200000;
 select department, sum(salary) as total_salary from employee group by department 
 order by total_salary desc
limit 1;
select department, avg(salary) as average_salary
from employee group by department
order by average_salary desc limit 1;
select department, city,count(*) as employee_count,avg(salary) as average_salary
from employee group by department, city;
select department,max(salary) - min(salary) as salary_difference
from employee group by department;
select department, max(salary) as maximum_salary
from employees group by department having max(salary) > 70000;
select city, count(*) as employee_count from employee
where salary > 60000 group by city having count(*) >= 3;
select count(distinct department) as distinct_departments,
       count(distinct city) as distinct_cities from employee;
       
-- 5 Constraints,keys and data integrity(91-105)
create table products 
(product_id int primary key,
 product_name varchar(100),
 price int
);
create table users
(product_id int primary key,
 product_name varchar(100),
 email varchar(50) unique
);
create table orders 
(order_id int primary key,
order_amount int check (order_amount > 0)
);
create table customers 
(customer_id int primary key,
 customer_name varchar(100) not null
);
create table accounts 
(account_id int primary key,
 account_name varchar(100),
 status varchar(20) default 'Active'
);
select * from accounts;
insert into accounts (account_id, account_name)
values (1, 'Janvi');
insert into products (product_id, product_name, price)
values (1, 'Laptop', 50000);
insert into products (product_id, product_name, price)
values (1, 'Mobile', 20000);
insert into users (product_id,product_name, email)
values (1, 'Rahul', 'rahul@gmail.com');
insert into users (product_id,product_name, email)
values (2, 'Amit', 'rahul@gmail.com');
create table dep_t 
(department_id int primary key,
 department_name varchar(100)
);
insert into dep_t (department_id, department_name)
values (101, 'IT');
insert into employee(employee_id, employee_name, department, salary)
values (2, 'Amit', 999, 55000);
select * from employee;
create table persons 
(person_id int primary key,
 person_name varchar(100),
 age int,check (age between 18 and 60)
);
create table student_courses 
(student_id int,
 course_id int,
 course_name varchar(100),
 primary key (student_id, course_id)
);
create table attend_t 
(employee_id int,
 attendance_date date,
 status varchar(20),
 primary key (employee_id, attendance_date)
);
create table stud_s 
(student_id int primary key,
 student_name varchar(100),
 age int,
 constraint check (age >= 18)
);

-- 6.	JOINs Including Self Join (106–135)

select e.employee_name, d.department_name
from employee as e
inner join departments as d
on e.department_id = d.department_id;
select e.employee_name,e.salary,d.department_name,d.location
from employee as e inner join departments as d
on e.department_id = d.department_id;
select e.employee_name
from employee as e inner join departments as d
on e.department_id = d.department_id
where d.department_name = 'Data Science';
select e.employee_name,d.department_name,d.location
from  employee as e inner join departments as d
on e.department_id = d.department_id
where d.location = 'Hyderabad';
select d.department_name,e.employee_name
from department as d
left join employee as e
ON d.department_id = e.department_id;
 