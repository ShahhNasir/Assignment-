use company_db;

create table employees(
employee_id int primary key,
employee_name varchar(20) not null,
department varchar(20) ,
department_id int,
city varchar(20),
salary int ,
hire_date varchar(20),
email varchar(50) unique);

alter table employees
modify salary int check(salary>0);

alter table employees
modify city varchar(20) default "Hyderabad";

drop table employees;

insert into employees values(1, 'Alice', 'Data Science', 1, 'Hyderabad', 60000, '2022-01-15', 'alice@gmail.com',null);


INSERT INTO employees VALUES 
(2, 'Bob', 'HR', 2, 'Bangalore', 55000, '2021-06-20', 'bob@gmail.com'), 
(3, 'Charlie', 'Data Science', 1, 'Hyderabad', 70000, '2020-03-10', 'charlie@gmail.com'), 
(4, 'David', 'Finance', 3, 'Mumbai', 50000, '2023-02-18', 'david@gmail.com'), 
(5, 'Emma', 'Sales', 4, 'Delhi', 65000, '2022-11-05', 'emma@gmail.com'), 
(6, 'Frank', 'Data Science', 1, 'Hyderabad', 45000, '2024-01-10', 'frank@gmail.com'), 
(7, 'Grace', 'HR', 2, 'Bangalore', 58000, '2023-07-12', 'grace@gmail.com'), 
(8, 'Henry', 'Finance', 3, 'Mumbai', 52000, '2021-09-25', 'henry@gmail.com'), 
(9, 'Irene', 'Data Science', 1, 'Hyderabad', 72000, '2019-05-14', 'irene@gmail.com'), 
(10, 'Jack', 'Marketing', 5, 'Chennai', 48000, '2024-04-01', 'jack@gmail.com'), 
(11, 'Karen', 'Sales', 4, 'Delhi', 62000, '2021-12-11', 'karen@gmail.com'), 
(12, 'Leo', 'IT', 6, 'Pune', 68000, '2020-08-08', 'leo@gmail.com'), 
(13, 'Mia', 'Data Science', 1, 'Hyderabad', 75000, '2018-02-22', 'mia@gmail.com'), 
(14, 'Noah', 'HR', 2, 'Bangalore', 54000, '2022-06-30', 'noah@gmail.com'), 
(15, 'Olivia', 'Finance', 3, 'Mumbai', 59000, '2021-03-17', 'olivia@gmail.com'), 
(16, 'Peter', 'Sales', 4, 'Delhi', 61000, '2023-09-01', 'peter@gmail.com'), 
(17, 'Quinn', 'IT', 6, 'Pune', 73000, '2019-11-19', 'quinn@gmail.com'), 
(18, 'Rachel', 'Marketing', 5, 'Chennai', 51000, '2022-04-14', 'rachel@gmail.com'), 
(19, 'Sam', 'Data Science', 1, 'Hyderabad', 67000, '2020-12-05', 'sam@gmail.com'), 
(20, 'Tina', 'HR', 2, 'Bangalore', 56000, '2024-02-20', 'tina@gmail.com'), 
(21, 'Uma', 'Finance', 3, 'Mumbai', 64000, '2019-07-07', 'uma@gmail.com'), 
(22, 'Victor', 'Sales', 4, 'Delhi', 58000, '2022-08-16', 'victor@gmail.com'), 
(23, 'Wendy', 'IT', 6, 'Pune', 76000, '2018-10-10', 'wendy@gmail.com'), 
(24, 'Xavier', 'Marketing', 5, 'Chennai', 53000, '2023-01-25', 'xavier@gmail.com'), 
(25, 'Yara', 'Data Science', 1, 'Hyderabad', 70000, '2021-05-21', 'yara@gmail.com'), 
(26, 'Zack', 'HR', 2, 'Bangalore', 60000, '2020-01-09', 'zack@gmail.com'), 
(27, 'Aarav', 'Finance', 3, 'Mumbai', 55000, '2024-03-15', 'aarav@gmail.com'), 
(28, 'Bhavna', 'Sales', 4, 'Delhi', 66000, '2021-10-03', 'bhavna@gmail.com'), 
(29, 'Chetan', 'IT', 6, 'Pune', 71000, '2022-02-28', 'chetan@gmail.com'), 
(30, 'Divya', 'Marketing', 5, 'Chennai', 57000, '2020-06-12', 'divya@gmail.com'), 
(31, 'Ethan', 'Data Science', 1, 'Hyderabad', 63000, '2023-05-18', 'ethan@gmail.com'), 
(32, 'Fatima', 'HR', 2, 'Bangalore', 52000, '2019-09-09', 'fatima@gmail.com'), 
(33, 'Gopal', 'Finance', 3, 'Mumbai', 60000, '2021-11-27', 'gopal@gmail.com'), 
(34, 'Harsha', 'Sales', 4, 'Delhi', 59000, '2024-05-06', 'harsha@gmail.com'), 
(35, 'Isha', 'IT', 6, 'Pune', 74000, '2020-04-24', 'isha@gmail.com'), 
(36, 'Jatin', 'Marketing', 5, 'Chennai', 49000, '2022-07-13', 'jatin@gmail.com'), 
(37, 'Kavya', 'Data Science', 1, 'Hyderabad', 68000, '2018-12-01', 'kavya@gmail.com'), 
(38, 'Lokesh', 'HR', 2, 'Bangalore', 57000, '2023-10-22', 'lokesh@gmail.com'), 
(39, 'Meera', 'Finance', 3, 'Mumbai', 62000, '2020-09-30', 'meera@gmail.com'), 
(40, 'Nikhil', 'Sales', 4, 'Delhi', 64000, '2021-02-05', 'nikhil@gmail.com'), 
(41, 'Pooja', 'IT', 6, 'Pune', 72000, '2022-12-18', 'pooja@gmail.com'), 
(42, 'Rahul', 'Marketing', 5, 'Chennai', 54000, '2019-08-26', 'rahul@gmail.com'), 
(43, 'Sneha', 'Data Science', 1, 'Hyderabad', 71000, '2021-06-08', 'sneha@gmail.com'), 
(44, 'Tarun', 'HR', 2, 'Bangalore', 59000, '2020-05-11', 'tarun@gmail.com'), 
(45, 'Varun', 'Finance', 3, 'Mumbai', 56000, '2023-04-02', 'varun@gmail.com'), 
(46, 'Ananya', 'Sales', 4, 'Delhi', 63000, '2022-09-29', 'ananya@gmail.com'), 
(47, 'Kiran', 'IT', 6, 'Pune', 70000, '2019-03-23', 'kiran@gmail.com'), 
(48, 'Neha', 'Marketing', 5, 'Chennai', 52000, '2021-07-15', 'neha@gmail.com'), 
(49, 'Rohan', 'Data Science', 1, 'Hyderabad', 65000, '2024-06-01', 'rohan@gmail.com'), 
(50, 'Sana', 'HR', 2, 'Bangalore', 55000, '2022-10-12', 'sana@gmail.com');



create table departments(
department_id int primary key,
department_name varchar(20) not null,
location varchar(20),
budget int);

INSERT INTO departments
VALUES
(1, 'Data Science', 'Hyderabad', 900000),
(2, 'HR', 'Bangalore', 400000),
(3, 'Finance', 'Mumbai', 600000),
(4, 'Sales', 'Delhi', 700000),
(5, 'Marketing', 'Chennai', 500000),
(6, 'IT', 'Pune', 800000),
(7, 'Operations', 'Hyderabad', 450000),
(8, 'Research', 'Bangalore', 650000);

create table projects(
project_id int primary key,
project_name varchar(50) not null,
department_id int,
budget int);

INSERT INTO projects
VALUES
(101, 'AI Analytics Platform', 1, 400000),
(102, 'Disease Prediction System', 1, 350000),
(103, 'Employee Management', 2, 150000),
(104, 'Payroll Automation', 3, 250000),
(105, 'Sales Dashboard', 4, 300000),
(106, 'CRM System', 4, 280000),
(107, 'Digital Marketing', 5, 180000),
(108, 'Cloud Infrastructure', 6, 450000),
(109, 'Cyber Security', 6, 300000),
(110, 'Data Research', 8, 350000);


-- Add a FOREIGN KEY from employees.department_id to departments.department_id.

alter table employees
add constraint 
foreign key (department_id)
references departments(department_id);


create table students(
student_id int primary key,
student_name varchar(30) not null,
student_phn_num bigint unique,
student_age int check (student_age>3),
student_city varchar(40) default "hyderabad");


create table attendance(
employee_id int primary key,
attendance_date date,
status varchar(30));


create table if not exists temp_data(
temp_id int ,
temp_name varchar(20));


desc employees;

-- basic select and filtering

select * from employees;

select employee_name,salary from employees;

select employee_name,city from employees where city ="Hyderabad";

select employee_name ,salary from employees where salary>60000;

select employee_name ,salary from employees where salary  <= 50000;

select employee_name ,salary from employees where salary between 50000 and 70000;

select employee_name,city from employees where city in ("Hyderabad","Bangalore","Mumbai");

select employee_name ,city from employees where city != "Hyderabad";

select * from employees where employee_name like "a%";

select * from employees where employee_name like "%a";

select * from employees where employee_name like "%i%";
 
 select * from employees where department != null;
 
 select * from employees where department is not null;
 
 select * from employees where hire_date > 2022-01-01;
 
 select * from employees where hire_date between "2022-01-01" and "2024-01-01";
 
 select * from employees where salary>50000 and city ="Hyderabad";
 
 select * from employees where city="Hyderabad" or salary>70000;
 
 select * from employees where department!="HR";
 
 select distinct(city) from employees;
 
  select distinct(department) from employees;
  
  select* from employees
  order by salary;
  
   select* from employees
  order by salary desc;
  
  select * from employees order by department,salary desc;
  
  select * from employees order by employee_id limit 5;
  
  select * from employees order by salary desc limit 3;
  
  
  
  -- UPDATE, DELETE, ALTER & Basic Functions
  
  update employees
  set salary=56000
  where employee_id=1;
  select * from employees;
  
  set sql_safe_updates=0;
  
  
  update employees
  set salary = salary+(salary * (10.0/100));
  
  select * from employees;
  
  update employees
  set salary = salary + 5000
  where department="Data science";
  select * from employees;
  
  update employees 
  set city = "Bengaluru"
  where city = "Bangalore";
  select * from employees;
  
  delete from employees
  where employee_id = 1;
  
  delete from employees
  where salary<45000;
  
  alter table employees
  add phone_no bigint;
  
  alter table employees
  modify employee_name varchar(50);
  
  alter table employees
  rename column city to employee_city;
  
  alter table employees
  drop column phone_no;
  
  select upper(employee_name) from employees;
  
  select lower(employee_name) from employees;
  
  select employee_name ,length(employee_name) from employees;
  
  select employee_name, left(employee_name,3) from employees;
  
  select employee_name,salary,round(salary,-3) from employees;
  
  select curdate();
  
  select employee_name ,timestampdiff(year,hire_date,curdate()) as years_worked from employees;
  
  select employee_name,salary,
 case
      when salary <60000 then "low"
      when salary <75000 then "medium"
      else "high"
      end as level
from employees;
  
  
  
  -- Aggregate Functions, GROUP BY & HAVING
  
  select count(*) from employees;
  
  select * from employees;
  
  select sum(salary) from employees;
  
  select avg(salary) from employees;
  
  select max(salary) from employees;
  
  select min(salary) from employees;
  
  select count(*) from employees
  where employee_city="Hyderabad";

select * from employees;

select sum(salary) from employees
where city="Mumbai";

select avg(salary) from employees
where city="Bangalore";

select department ,count(employee_id) from employees group by department;

select department,avg(salary) from employees group by department;

select department,max(salary) from employees group by department;

select department,min(salary) from employees group by department;

select department,sum(salary) from employees group by department;

select city,count(employee_name) from employees group by city;

select city,avg(salary) from employees group by city;

select department,count(*) from employees group by department having count(*)>5 ;

select department,avg(salary)from employees group by department having avg(salary)>60000;

select city,sum(salary)from employees group by city having sum(salary)>200000;

select department,sum(salary) from employees group by department order by sum(salary) desc limit 1;

select department,avg(salary) from employees group by department order by avg(salary) desc limit 1;

select department,city ,count(*),avg(salary) from employees
group by department,city 
order by count(*),avg(salary);

select department ,max(salary),min(salary),max(Salary)-min(salary) as difference from employees
group by department
order by max(salary),min(salary);

select department,max(salary) from employees
group by department
having max(salary)>70000;

select city,count(*) from employees
where salary>60000
group by city 
having count(*)>=3;

select count(distinct city,department) from employees;

-- JOINs Including Self Join--

select employee_name,department_name from employees as e
inner join departments as d
on e.department_id=d.department_id;

select employee_name, salary, department_name,location from employees as e
inner join departments as d
on e.department_id=d.department_id;

INSERT INTO employees
VALUES
(51, 'Arjun', NULL, NULL, DEFAULT, 58000, '2024-07-10', 'arjun@gmail.com'),
(52, 'Priya', NULL, NULL, DEFAULT, 62000, '2024-08-15', 'priya@gmail.com');


select employee_name,department from employees as e
left join departments as d
on e.department_id=d.department_id
where department ="Data science";

select employee_name,department,city from employees as e
left join departments as d
on e.department_id=d.department_id
where city ="Hyderabad";

select employee_name,department from employees as e
left join departments as d
on e.department_id=d.department_id;

select employee_name,department from employees as e
right join departments as d
on e.department_id=d.department_id;

select employee_name,department from employees as e
right join departments as d
on e.department_id=d.department_id
where department is null;

select employee_name,department from employees as e
left join departments as d
on e.department_id=d.department_id
where department is null;

select department,count(employee_name) from employees as e
inner join departments as d
on e.department_id=d.department_id
group by department;

select department,avg(salary) from employees as e
inner join departments as d
on e.department_id=d.department_id
group by department;

select count(employee_id),department_name from departments as d
left join employees as e
on e.department_id = d.department_id
group by d.department_name;

select d.department_name,sum(salary) from employees as e
right join departments as d
on e.department_id=d.department_id
group by d.department_name;

select department_name,project_name from departments as d
inner join projects as p
on d.department_id=p.department_id;

select employee_name,department_name,project_name from employees as e
inner join departments as d
on e.department_id=d.department_id
inner join projects as p
on d.department_id=p.department_id;

select department_name ,count(project_name) from departments as d
left join projects as p
on d.department_id=p.department_id
group by department_name
having count(project_name)>=1;

select department_name ,count(project_name) from departments as d
left join projects as p
on d.department_id=p.department_id
group by department_name
having count(project_name)=0;

alter table employees
add manager_id int ;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET manager_id = CASE employee_id
    WHEN 2 THEN 1
    WHEN 3 THEN 1
    WHEN 4 THEN 1
    WHEN 5 THEN 1
    WHEN 6 THEN 3
    WHEN 7 THEN 2
    WHEN 8 THEN 4
    WHEN 9 THEN 3
    WHEN 10 THEN 5
    WHEN 11 THEN 5
    WHEN 12 THEN 1
    WHEN 13 THEN 3
    WHEN 14 THEN 2
    WHEN 15 THEN 4
    WHEN 16 THEN 5
    WHEN 17 THEN 12
    WHEN 18 THEN 10
    WHEN 19 THEN 13
    WHEN 20 THEN 2
    WHEN 21 THEN 4
    WHEN 22 THEN 5
    WHEN 23 THEN 12
    WHEN 24 THEN 10
    WHEN 25 THEN 13
    WHEN 26 THEN 2
    WHEN 27 THEN 4
    WHEN 28 THEN 5
    WHEN 29 THEN 12
    WHEN 30 THEN 10
    WHEN 31 THEN 13
    WHEN 32 THEN 2
    WHEN 33 THEN 4
    WHEN 34 THEN 5
    WHEN 35 THEN 12
    WHEN 36 THEN 10
    WHEN 37 THEN 13
    WHEN 38 THEN 2
    WHEN 39 THEN 4
    WHEN 40 THEN 5
    WHEN 41 THEN 12
    WHEN 42 THEN 10
    WHEN 43 THEN 13
    WHEN 44 THEN 2
    WHEN 45 THEN 4
    WHEN 46 THEN 5
    WHEN 47 THEN 12
    WHEN 48 THEN 10
    WHEN 49 THEN 13
    WHEN 51 THEN 1
    WHEN 52 THEN 1
END
WHERE employee_id is not null;

select * from employees;

select m.employee_name as employee,e.employee_name as manager from employees as e
inner join employees as m
on e.employee_id=m.manager_id;

select m.employee_name as employee,e.employee_name as manager from employees as e
inner join employees as m
on e.employee_id=m.manager_id
where m.manager_id is not null;

select m.employee_name as employee,e.employee_name as manager from employees as e
right join employees as m
on e.employee_id=m.manager_id
where m.manager_id is null;

select m.employee_name as employee,e.employee_name as manager from employees as e
inner join employees as m
on e.employee_id=m.manager_id
where m.manager_id >= 1;

select e.employee_name as manager ,count(e.employee_name) from employees as e
inner join employees as m
on e.employee_id=m.manager_id
group by manager;

select e.employee_name as manager ,count(e.employee_name) from employees as e
inner join employees as m
on e.employee_id=m.manager_id
group by manager
having count(e.employee_name)>3;

select m.employee_name,e.employee_name,m.salary from employees as e
inner join employees as m
on e.employee_id=m.manager_id;

select m.employee_name as employee,e.employee_name as manager,m.salary as employee_salary ,e.salary as manager_salary from employees as e
inner join employees as m
on e.employee_id=m.manager_id
where m.salary>e.salary;


select * from employees;

select e.employee_name as employee,e.department as employee_department,
m.employee_name as manager,m.department as manager_department from employees as e
inner join employees as m
on e.manager_id=m.employee_id
where e.department=m.department;

select * from employees as e
left join departments as d
on e.department_id=d.department_id
where department is null;

select employee_name ,department,project_name from employees as e
inner join departments as d
on e.department_id=d.department_id
inner join projects as p
on d.department_id=p.department_id;

select d.department_name,sum(p.budget) from departments as d
inner join projects as p
on d.department_id=p.department_id
group by d.department_name;

select * from projects;

select d.department_name,sum(p.budget) from departments as d
inner join projects as p
on d.department_id=p.department_id
group by d.department_name,d.budget
having d.budget<sum(p.budget);

select * from departments;

desc departments;


-- Subqueries

select employee_name ,salary from employees
where salary>( select avg(salary) from employees);

select * from employees
where salary=(select max(salary) from employees);

select * from employees
where salary=(select min(salary) from employees);

select * from employees
where salary >(select salary from employees where employee_name="Alice");

select * from employees
where department =(select department from employees where employee_name="Alice");

select * from employees
where salary>(select avg(salary) from employees as e where e.department=department);

select * from employees
where salary<(select avg(salary) from employees as e where e.department=department);

select department,avg(salary) as avg_salary from employees
group by department
having avg(salary)= (select max(avg_salary)  from
(select avg(salary) as avg_salary from employees group by department) as dept_avg);

select department,avg(salary) from employees
group by department 
having avg(salary) >(select avg(salary) from employees);

select * from employees
where department in (select department from employees where city="Hyderabad");

	select * from employees
	where department_id not exists (select department_id from departments);

SELECT *
FROM employees AS e
WHERE NOT EXISTS (
    SELECT department
    FROM departments AS d
    WHERE d.department_id = e.department_id
);

select * from departments as d
where exists(select employee_name from employees as e
where d.department_id=e.department_id);

select * from departments as d
where not exists(select employee_name from employees as e
where d.department_id=e.department_id);

select * from employees 
where salary>all(
select salary from employees 
where department="HR"
);

