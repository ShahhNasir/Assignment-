

-- DATABASE AND TABLE CREATION --

use assignment2;
create table employees
(employee_id int primary key,
empoyee_name varchar (50) not null,
department_id int,
department varchar(50),
salary decimal(10,2) check (salary>0),
city varchar(50) default"hyderabad",
hire_date date,
email varchar(100)unique);

create table department
(department_id int primary key,
department_name varchar(50),
location varchar(40),
budget bigint);

create table project
(project_id int,
project_name varchar(50),
department_id int,
budget bigint);

 alter table employees
add constraint fk_employee_department
foreign key (department_id)
references department(department_id); 

insert into department values
("111","IT","hyderabad",50000);
insert into department values
(112, 'HR', 'Chennai', 300000),
(113, 'Finance', 'Bangalore', 400000);
select * from department; 

insert into employees values
("101","aravind",111,"IT",50000,"hyderabad","2024-01-15","aravindnami13@gmail.com");
select * from employees;

insert into employees values
("103", 'Charlie', 112, 'HR', 50000, "Chennai", '2024-03-12', "charlie@gmail.com"),
("102",'David',113 , 'Finance', 65000, "Bangalore", '2024-04-20', "david@gmail.com");

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 18),
    city VARCHAR(50) DEFAULT 'Hyderabad');
    
create table attendance(
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20)
);

create table if not exists employees
(employee_id int primary key,
employee_name varchar(50));

desc employees; -- displays table structure --
drop table if exists temp_data;

 -- BASIC SELECT AND FILTERING -- 
 select * from emp;
 select employee_name,salary from emp;
 select employee_name as live,city from emp where city = "hyderabad";
 select employee_name,salary from emp where salary > 60000 order by salary desc;
 select employee_name,salary from emp where salary <= 50000 order by salary desc;
 select employee_name,salary from emp where salary between 50000 and 70000 order by salary desc;
 select  employee_name,city from emp where city in("hyderabad","banglore","mumbai");
 select employee_name,city from emp where city != "hyderabad";
 select employee_name from emp where employee_name like ("a%");
 select employee_name from emp where employee_name like ("%a");
 select employee_name from emp where employee_name like ("%i%");
 select employee_name,department from emp where department is null;
 select employee_name,department as employees from emp where department is not null;
 select employee_name,hire_date from emp where hire_date > "2022-01-01" order by hire_date desc;
 select employee_name,hire_date from emp where hire_date between "2022-01-01" and "2024-10-13" order by hire_date desc; 
 select employee_name,salary,city from emp where salary >50000 and city = "hyderabad";
 select employee_name,salary,city from emp where salary > 70000 or city = "hyderabad" order by salary desc;
 select employee_name,department from emp where department != "HR" order by department desc;
 select distinct city from emp;
 select distinct department from emp;
select employee_name,salary from emp order by salary;
select employee_name,salary from emp order by salary desc;
select employee_name,department,salary from emp order by department asc, salary desc;
select employee_name from emp limit 5;
select employee_name,max(salary) as high_salary from emp group by employee_name limit 3; 

-- UPDATE,DELETE,ALTER & BASIC FUNCTIONS --
show tables;
select * from employees; 
SET SQL_SAFE_UPDATES = 0; -- WE USE REMOVE SAFE UPDATE -- 
update employees set salary = 60000 where employee_id ="101";
update employees set salary = salary*1.10 where employee_id >0;
update employees set salary =salary+ 5000 where department = "HR";
update employees set city = "bengalure" where city = "bangalore";
delete from employees where employee_id = 101; 
delete from employees where salary <30000;
alter table employees modify employee_name varchar(150);
alter table employees rename column city to city_name;
alter table employees drop column hire_date;
select upper(employee_name)as employee_name from employees;


  
   -- AGGREGATE FUNCTIONS,GROUP BY AND HAVING --
   select * FROM EMP;
   select count(*) from emp;
   select sum(salary) from emp;
   select avg(salary) from emp;
   select max(salary) from emp limit 1;
   select min(salary) from emp limit 1;
   select count(*)employee_count from emp group by city having city = "hyderabad";
   select sum(salary) as total_salary from emp where city = "mumbai";
   select avg(salary),city from emp group by city having city = "banglore";
   select count(employee_name)as employees,department from emp group by department;
   select avg(salary)as avgg_salary,department from emp group by department;
   select max(salary),department from emp group by department;
   select min(salary),department from emp group by department;
   select sum(salary),department from emp group by department;
   select count(employee_name)as employees,city from emp group by city;
   select avg(salary),city from emp group by city;
   select department,count(employee_name) from emp group by department having count(employee_name) > 5;
   select department,avg(salary) from emp group by department having avg(salary) > 60000;
   select city,sum(salary) from emp group by city having sum(salary) > 200000;
   select department,sum(salary)from emp group by department limit 1;
   select department,avg(salary) from emp group by department limit 1;
   select department,count(employee_name)as employees,avg(salary),city from emp group by department,city;
   select department,max(salary),min(salary) from emp group by department;
   select department,max(salary) from emp group by department  having max(salary) > 70000; 
   select city,count(*)as employee_counut from emp where salary > 60000 group by city having count(*) >= 3;
   select distinct count(distinct department)as total_department,count(distinct city)as total_city from emp;
   
   -- CONSTRANTS,KEYS & DATA INTEGRITY --
create table products (
    product_id int primary key,
    product_name varchar(100),
    price decimal(10,2) );

create table users (
    user_id int primary key,
    username varchar(100),
    email varchar(150) unique);


create table orders (
    order_id int primary key,
    order_amount decimal(10,2) 
    check (order_amount > 0)
);

create table customers (
customer_id int primary key,
customer_name varchar(100) not null
);

create table accounts (
account_id int primary key,
account_name varchar(100),
status varchar(20) default 'active'
);

insert into accounts (account_id, account_name)
values (1, 'aravind');


insert into products (product_id, product_name, price)
values (1, 'laptop', 50000);

insert into users (user_id, username, email)
values (2, 'bhaskar', 'aravind@gmail.com');

create table departmentss (
    department_id int primary key,
    department_name varchar(100)
);

create table employeees (
    employee_id int primary key,
    employee_name varchar(100),
    department_id int,
    foreign key (department_id)
        references departmentss(department_id)
);

insert into departmentss
values (10, 'hr');

insert into employeees
values (101, 'aravind', 10);


insert into employeees
values (102, 'bhaskar', 20);


create table persons (
person_id int primary key,
person_name varchar(100),
age int check (age between 18 and 60));


create table student_courses (
student_id int,
course_id int,
primary key (student_id, course_id)
);


create table attendances (
employee_id int,
attendance_date date,
status varchar(20),
primary key (employee_id, attendance_date)
);

create table employee_details (
employee_id int primary key,
employee_name varchar(100),    
age int,
constraint chk_employee_age
check (age between 18 and 60)
);
   
    -- JOINS --
    select * from departments;
    select * from emp;
    SELECT e.employee_name, d.department_name
FROM emp AS e
INNER JOIN departments AS d
ON e.department = d.department_name;
select employee_name,salary,department_name,location from emp as e
inner join departments as d
on e.department = d.department_name;
select employee_name,department from emp as e
inner join departments as d 
on e.department = d.department_name where department = "data science";
select employee_name,department,city from emp as e
inner join departments as d
on e.department = d.department_name where city = "hyderabad";
select department_name,employee_name from departments as d
left join emp as e
on e.department = d.department_name;
select * from employees;
select department_name,employee_id as employee_cpunt
from departments d left join employees as e
on d.department_id=d.department_id where department_name is null;
select * from emp;
select * from departments;
select count(employee_name) as employee_count,department from emp as e
left join departments as d 
on e.department = d.department_name group by department;
select avg(salary),department from emp e
left join department d 
on e.department = d.department_name group by department order by avg(salary) desc;
select department,count(employee_name) as employee from emp e
left join department d 
on e.department = d.department_name group by  department ;
select department,sum(salary) as total_salary from emp e
left join departments d
on e.department = d.department_name group by department;
select * from projects;
select * from employees;
select * from departments;
select department_name,project_name from departments d
inner join projects p 
on d.department_id = p.department_id;
select employee_name,department_name,project_name from employees e
inner join departments d
on e.department_id = d.department_id
inner join projects p
on e.department_id = p.department_id;
select department_name,project_name from projects as p
inner join departments as d 
on d.department_id = p.department_id ;
select department_name,project_name from departments d
left join projects p 
on d.department_id = p.department_id where project_name is null;
select e.employee_name as employee,m.employee_name as manager from employees e
left join employees m 
on e.manager_id = m.employee_id;
select e.employee_name as employee,m.employee_name as manager
from employees e inner join employees m
on e.manager_id = m.employee_id  ;
select e.employee_name,m.employee_name from employees e
left join employees m
on e.manager_id = m.employee_id is not null;
select employee_name from employees where manager_id is not null;
select e.employee_name,m.employee_name from employees e
left join employees m
on e.manager_id = m.employee_id is null;
select distinct m.employee_name as manager from employees e
inner join employees m 
on e.manager_id = m.employee_id is null;
select m.employee_name as manager,count(e.employee_id) as employee_count from employees e
inner join employees m 
on e.manager_id = m.employee_id group by m.employee_id,m.employee_name;
select m.employee_name as employee,count(e.employee_id) from employees e
left join employees m 
on e.manager_id = m.employee_id group by m.employee_name,m.employee_id having count(e.employee_id) >=3;
select e.employee_name as employees ,m.employee_name as managers,e.salary as salary from employees e
left join employees m
on m.employee_id = e.manager_id;
select e.employee_name as employee,m.employee_name as manager,e.salary as employee_salary from employees e
left join employees m
on m.employee_id = e.manager_id;
SELECT e.employee_name AS employee,e.salary AS employee_salary,m.employee_name AS manager,m.salary AS manager_salary
FROM employees e inner join employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;
select e.employee_name,e.department_id from employees e
left join departments d
    on e.department_id = d.department_id
where d.department_id is null;
select e.employee_name,d.department_name,p.project_name from employees e
inner join departments d
on e.department_id = d.department_id
inner join projects p on e.department_id = p.department_id;
SELECT d.department_name,sum(p.budget) AS total_project_budget
from departments d left join projects p
on d.department_id = p.department_id group by d.department_id,d.department_name;
select d.department_name,d.budget AS department_budget,
    SUM(p.budget) AS total_project_budget from departments d
inner join projects p  on d.department_id = p.department_id
group by  d.department_id, d.department_name, d.budget having SUM(p.budget) > d.budget;

-- SUBQUERIES -- 
select * from emp;
select employee_name,salary from emp where salary >(select avg(salary) from emp);
select employee_name,salary from emp where salary =(select max(salary) from emp );
select employee_name,salary from emp where salary =(select min(salary) from emp);
select employee_name,salary from emp where salary =(select salary from emp where employee_name = "alice");
select employee_name,salary from emp where salary >(select salary from emp where employee_name = "alice");
select employee_name,department from emp where department =(select department from emp where employee_name = "alice");

select employee_name,salary,department from emp e where salary >(select avg(salary) from emp where department = e.department);
select employee_name,salary,department from emp e where salary <(select avg(salary) from emp where department = e.department);
select department,salary from emp where salary =(select max(salary) from emp limit 1);
select department,avg(salary) from emp  group by department having avg(salary)>(select avg(salary) from emp);
select employee_name,department,city from emp where city in (select city from emp where city = "hyderabad");
select employee_name,salary from emp where salary > (select max(salary) from emp where department = "HR");
select employee_name,salary,department from emp where salary > (select max(salary) from emp where department = "FINANCE"); 
select  max(salary) from emp where salary <(select max(salary) from emp); 
select max(salary) from emp where salary = (select max(salary) from emp where salary <(select max(salary) from emp));
 -- CTE( COMMON TABLE EXPRESSIONS) --
 with high_salary as
 (select employee_name,salary from emp where salary > 60000 order by salary desc)
 select * from high_salary;
 with company_salary as
(select  avg(salary) as avg_salary from emp ) select salary,department from emp where salary >(select avg_salary from company_salary);
with avg_salary as
(select department,avg(salary) from emp group by department)
select * from avg_salary;
with avg_salary as
(select department,avg(salary) from emp where salary > 60000  group by department)
select * from avg_salary;

with ranked as (
    select employee_name, rank() over(order by salary desc) as salary_rank from emp )
select * from ranked;

with ranked as (
    select employee_name, dense_rank() over(order by salary desc) as rnk from emp)
select *from ranked limit 2;

with ranked as (
    select employee_name,department,row_number() over(partition by department order by salary desc) as rn from emp) 
select * from ranked where rn = 1;



with ranked as (select e.* ,dense_rank() over(partition by department order by salary desc) as rnk from emp e
)
select *
from ranked
where rnk = 2;



with emp_dept as (select e.employee_id, e.salary,d.department_name from employees e
    join departments d on e.department_id = d.department_id)
select * from emp_dept ;


with dept_count as (select department_id, count(*) as employee_count from employees group by department_id
)
select *
from dept_count
where employee_count > 3;


with dept_avg as (select department_id, avg(salary) as avg_salary from employees
    group by department_id),
high_paid as (select e.*from employees e join dept_avg d on e.department_id = d.department_id where e.salary > d.avg_salary)
select * from high_paid;
 -- WINDOWS -- 
 select employee_name,salary,row_number() over(order by salary desc)  from emp;
 select employee_name,department,row_number() over(partition by department order by salary desc) from emp;
 select employee_name,salary,rank() over( order by salary desc) from emp;
 select employee_name,salary,dense_rank() over(order by salary desc) as rankk from emp;
 select employee_name,salary,row_number() over(order by salary desc) ,rank() over(order by salary desc),dense_rank() over(order by salary desc) from emp;
 select employee_name,salary,avg(salary) over () from emp;
 select employee_name,department,avg(salary) over(partition by department) as avgg from emp;
 select employee_name,hire_date,sum(salary) over(partition by hire_date) from emp;
 select employee_name,hire_date,salary,lag(salary) over(order by hire_date) from emp;
 select employee_name,hire_date,salary,lead(salary) over(order by hire_date) from emp;
  -- HARD SQL CHALLENGES QUESTIOS -- 
with  ranked as
  (select employee_name,department, dense_rank() over(partition by department order by salary desc)as rnk from emp)
  select * from ranked where rnk <= 3;
  select department_id from employees group by department_id having min(salary) > 50000;
  select e.*
from employees e
where salary > (select avg(e2.salary)from employees e2 where e2.hie_date < e.hire_date
);