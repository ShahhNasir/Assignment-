create database company_data;
use company_data;
create table employees (employee_id int, 
employee_name varchar(100), 
department varchar(100),
salary decimal(10,2), 
city varchar(50),
hire_date date
);
alter table employees add primary key (employee_id);
alter table employees modify employee_name varchar(100) not null;
alter table employees add check (salary > 0);
alter table employees modify city varchar(50) default 'hyderabad';
create table departments (
department_id int, 
department_name varchar(100), 
location varchar(100), 
budget decimal(12,2)
);
alter table departments add primary key (department_id);
create table projects (
project_id int, 
project_name varchar(100), 
department_id int, 
budget decimal(12,2)
);
alter table employees add foreign key (department_id) references departments(department_id);
insert into employees values (1, 'alice', 'hr', 50000, 'hyderabad', '2023-01-10');
insert into employees values (2, 'bob', 'finance', 60000, 'mumbai', '2022-05-15'), 
(3, 'carol', 'it', 70000, 'bangalore', '2021-08-20'), 
(4, 'david', 'hr', 55000, 'hyderabad', '2023-03-12'), 
(5, 'emma', 'sales', 65000, 'mumbai', '2022-11-05');

insert into departments values (1, 'hr', 'hyderabad', 500000);

create table students (student_id int primary key, 
student_name varchar(100) not null, 
email varchar(100) unique,
age int check (age >= 18), 
city varchar(50) default 'hyderabad');

create table attendance (employee_id int, attendance_date date, status varchar(20));

create table if not exists temp_data (id int);

describe employees;

drop table if exists temp_data;

select * from employees;

select employee_name, salary from employees;

select * from employees where city = 'hyderabad';

select * from employees where salary > 60000;

select * from employees where salary <= 50000;

select * from employees where salary between 50000 and 70000;

select * from employees where city in ('hyderabad', 'bangalore', 'mumbai');

select * from employees where city <> 'hyderabad';

select * from employees where employee_name like 'a%';

select * from employees where employee_name like '%a';

select * from employees where employee_name like '%i%';

select * from employees where department is null;

select * from employees where department is not null;

select * from employees where hire_date > '2022-01-01';

select * from employees where hire_date between '2022-01-01' and '2023-12-31';

select * from employees where salary > 50000 and city = 'hyderabad';

select * from employees where city = 'hyderabad' or salary > 70000;

select * from employees where department <> 'hr';

select distinct city from employees;

select distinct department from employees;

select * from employees order by salary asc;

select * from employees order by salary desc;

select * from employees order by department asc, salary desc;

select * from employees order by employee_id limit 5;

select * from employees order by salary desc limit 3;

update employees set salary = 65000 where employee_id = 1;

update employees set salary = salary * 1.10;

update employees set salary = salary + 5000 where department = 'data science';

update employees set city = 'bengaluru' where city = 'bangalore';

delete from employees where employee_id = 1;

delete from employees where salary < 30000;

alter table employees add email varchar(100);

alter table employees add phone_number varchar(15);

alter table employees modify employee_name varchar(150);

alter table employees rename column city to employee_city;

alter table employees drop column phone_number;

select upper(employee_name) as employee_name from employees;

select lower(employee_name) as employee_name from employees;

select employee_name, length(employee_name) as name_length from employees;

select employee_name, left(employee_name, 3) as first_three_characters from employees;

select employee_name, round(salary, -3) as rounded_salary from employees;

select current_date() as current_date;

select employee_name, timestampdiff(year, hire_date, current_date()) as years_worked from employees;

select employee_name, coalesce(department, 'unassigned') as department from employees;

select employee_name, salary, case when salary < 50000 then 'low' when salary between 50000 and 70000 then 'medium' else 'high' end as salary_level from employees;

select count(*) as total_employees from employees;

select sum(salary) as total_salary from employees;

select avg(salary) as average_salary from employees;

select max(salary) as highest_salary from employees;

select min(salary) as lowest_salary from employees;

select count(*) as employee_count from employees where city = 'hyderabad';

select sum(salary) as total_salary from employees where city = 'mumbai';

select avg(salary) as average_salary from employees where city = 'bangalore';

select department, count(*) as employee_count from employees group by department;

select department, avg(salary) as average_salary from employees group by department;

select department, max(salary) as maximum_salary from employees group by department;

select department, min(salary) as minimum_salary from employees group by department;

select department, sum(salary) as total_salary from employees group by department;

select city, count(*) as employee_count from employees group by city;

select city, avg(salary) as average_salary from employees group by city;

select department, count(*) as employee_count from employees group by department having count(*) > 5;

select department, avg(salary) as average_salary from employees group by department having avg(salary) > 60000;

select city, sum(salary) as total_salary from employees group by city having sum(salary) > 200000;

select department, sum(salary) as total_salary from employees group by department order by total_salary desc limit 1;

select department, avg(salary) as average_salary from employees group by department order by average_salary desc limit 1;

select department, city, count(*) as employee_count, avg(salary) as average_salary from employees group by department, city;

select department, max(salary) - min(salary) as salary_difference from employees group by department;

select department, max(salary) as maximum_salary from employees group by department having max(salary) > 70000;

select city from employees where salary > 60000 group by city having count(*) >= 3;

select count(distinct department) as distinct_departments, count(distinct city) as distinct_cities from employees;

create table products (product_id int primary key, product_name varchar(100));

create table users (user_id int primary key, email varchar(100) unique);

create table orders (order_id int primary key, order_amount decimal(10,2) check (order_amount > 0));

create table customers (customer_id int primary key, customer_name varchar(100) not null);

create table users (user_id int primary key, status varchar(20) default 'active');

insert into users (user_id) values (1);

insert into employees (employee_id, employee_name) values (1, 'john');

insert into users (user_id, email) values (2, 'test@example.com');

create table departments (department_id int primary key, 
department_name varchar(100)); 
create table employees (employee_id int primary key, employee_name varchar(100), 
department_id int, foreign key (department_id) references departments(department_id));

insert into departments values (1, 'hr'); insert into employees values (1, 'alice', 1);

insert into employees values (2, 'bob', 999);

alter table employees add constraint chk_age check (age between 18 and 60);

create table attendance (employee_id int, attendance_date date, primary key (employee_id, attendance_date));

create table attendance (employee_id int, attendance_date date, status varchar(20), primary key (employee_id, attendance_date));

create table employees (employee_id int, salary decimal(10,2), constraint pk_employee primary key (employee_id));

select e.employee_name, d.department_name from employees e inner join departments d on e.department_id = d.department_id;

select e.employee_name, e.salary, d.department_name, d.location from employees e join departments d on e.department_id = d.department_id;

select e.employee_name from employees e join departments d on e.department_id = d.department_id where d.department_name = 'data science';

select e.employee_name from employees e join departments d on e.department_id = d.department_id where d.location = 'hyderabad';

select e.employee_name, d.department_name from employees e left join departments d on e.department_id = d.department_id;

select d.department_name, e.employee_name from departments d left join employees e on d.department_id = e.department_id;

select d.department_name from departments d left join employees e on d.department_id = e.department_id where e.employee_id is null;

select e.employee_name from employees e left join departments d on e.department_id = d.department_id where d.department_id is null;

select d.department_name, count(e.employee_id) as employee_count from departments d join employees e on d.department_id = e.department_id group by d.department_name;

select d.department_name, avg(e.salary) as average_salary from departments d join employees e on d.department_id = e.department_id group by d.department_name;

select d.department_name, count(e.employee_id) as employee_count from departments d left join employees e on d.department_id = e.department_id group by d.department_name;

select d.department_name, coalesce(sum(e.salary), 0) as total_salary from departments d left join employees e on d.department_id = e.department_id group by d.department_name;

select d.department_name, p.project_name from departments d join projects p on d.department_id = p.department_id;

select e.employee_name, d.department_name, p.project_name from employees e join departments d on e.department_id = d.department_id left join projects p on d.department_id = p.department_id;

select distinct d.department_name from departments d join projects p on d.department_id = p.department_id;

select d.department_name from departments d left join projects p on d.department_id = p.department_id where p.project_id is null;

alter table employees add manager_id int; alter table employees add foreign key (manager_id) references employees(employee_id);

select e.employee_name as employee, m.employee_name as manager from employees e left join employees m on e.manager_id = m.employee_id;

select e.employee_name as employee, m.employee_name as manager from employees e join employees m on e.manager_id = m.employee_id;

select e.employee_name as employee from employees e left join employees m on e.manager_id = m.employee_id where m.employee_id is null;

select distinct m.employee_id, m.employee_name from employees m join employees e on e.manager_id = m.employee_id;

select m.employee_name as manager, count(e.employee_id) as employee_count from employees m join employees e on e.manager_id = m.employee_id group by m.employee_id, m.employee_name;

select m.employee_name as manager, count(e.employee_id) as employee_count from employees m join employees e on e.manager_id = m.employee_id group by m.employee_id, m.employee_name having count(e.employee_id) > 3;

select e.employee_name as employee, m.employee_name as manager, e.salary from employees e left join employees m on e.manager_id = m.employee_id;

select e.employee_name, e.salary, m.employee_name as manager, m.salary as manager_salary from employees e join employees m on e.manager_id = m.employee_id where e.salary > m.salary;

select e.employee_name, m.employee_name as manager from employees e join employees m on e.manager_id = m.employee_id where e.department_id = m.department_id;

select e.employee_name, d.department_name from employees e left join departments d on e.department_id = d.department_id where d.department_id is null;

select e.employee_name, d.department_name, p.project_name from employees e join departments d on e.department_id = d.department_id left join projects p on d.department_id = p.department_id;

select d.department_name, sum(p.budget) as total_project_budget from departments d join projects p on d.department_id = p.department_id group by d.department_name;

select d.department_name, sum(p.budget) as total_project_budget, d.budget as department_budget from departments d join projects p on d.department_id = p.department_id group by d.department_id, d.department_name, d.budget having sum(p.budget) > d.budget;

select * from employees where salary > (select avg(salary) from employees);

select * from employees where salary = (select max(salary) from employees);
use company_db;

select * from employees where salary = (select salary from employees where employee_name = 'alice');

select * from employees where department_id = (select department_id from employees where employee_name = 'alice');

select * from employees where salary > (select salary from employees where employee_name = 'alice');

select * from employees e where salary > (select avg(salary) from employees where department_id = e.department_id);

select * from employees e where salary < (select avg(salary) from employees where department_id = e.department_id);

select department_id, avg(salary) as average_salary from employees group by department_id order by average_salary desc limit 1;

select department_id, avg(salary) as average_salary from employees group by department_id having avg(salary) > (select avg(salary) from employees);

select * from employees where department_id in (select department_id from departments where location = 'hyderabad');

select * from employees where department_id not in (select department_id from departments);

select d.* from departments d where exists (select 1 from employees e where e.department_id = d.department_id);

select d.* from departments d where not exists (select 1 from employees e where e.department_id = d.department_id);

select * from employees where salary > all (select salary from employees where department = 'hr');

select * from employees where salary > any (select salary from employees where department = 'finance');

select max(salary) as second_highest_salary from employees where salary < (select max(salary) from employees);

select max(salary) as third_highest_salary from employees where salary < (select max(salary) from employees where salary < (select max(salary) from employees));

select * from employees where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

select * from employees e where salary > (select avg(salary) from employees where department_id = e.department_id);

with high_salary as (select * from employees where salary > 60000) select * from high_salary;

with company_avg as (select avg(salary) as avg_salary from employees) select e.* from employees e cross join company_avg c where e.salary > c.avg_salary;

with department_avg as (select department, avg(salary) as avg_salary from employees group by department) select * from department_avg;

with department_avg as (select department, avg(salary) as avg_salary from employees group by department) select * from department_avg where avg_salary > 60000;

with department_stats as (select department, count(*) as employee_count, avg(salary) as avg_salary from employees group by department), high_paying as (select * from department_stats where avg_salary > 60000) select * from high_paying;

with city_salary as (select city, sum(salary) as total_salary from employees group by city) select * from city_salary where total_salary > 200000;

with department_max as (select department, max(salary) as highest_salary from employees group by department) select * from department_max;

with ranked_employees as (select e.*, rank() over (order by salary desc) as salary_rank from employees e) select * from ranked_employees;

with ranked_employees as (select e.*, row_number() over (order by salary desc) as rn from employees e) select * from ranked_employees where rn <= 2;

with ranked_employees as (select e.*, row_number() over (partition by department order by salary desc) as rn from employees e) select * from ranked_employees where rn = 1;

with ranked_employees as (select e.*, dense_rank() over (partition by department order by salary desc) as salary_rank from employees e) select * from ranked_employees where salary_rank = 2;

with employee_details as (select e.*, d.department_name, d.location from employees e join departments d on e.department_id = d.department_id) select * from employee_details;

with department_counts as (select department, count(*) as employee_count from employees group by department) select * from department_counts where employee_count > 3;

with first_cte as (select department, avg(salary) as avg_salary from employees group by department), second_cte as (select * from first_cte where avg_salary > 60000) select * from second_cte;

select employee_name, row_number() over (order by salary desc) as row_num from employees;

select employee_name, department, row_number() over (partition by department order by salary desc) as row_num from employees;

select employee_name, salary, rank() over (order by salary desc) as salary_rank from employees;

select employee_name, salary, dense_rank() over (order by salary desc) as salary_rank from employees;

select employee_name, salary, row_number() over (order by salary desc) as row_num, rank() over (order by salary desc) as salary_rank, dense_rank() over (order by salary desc) as dense_salary_rank from employees;

select employee_name, salary, avg(salary) over () as company_average_salary from employees;

select employee_name, department, salary, avg(salary) over (partition by department) as department_average_salary from employees;

select employee_name, hire_date, salary, sum(salary) over (order by hire_date rows unbounded preceding) as running_total from employees;

select employee_name, hire_date, salary, lag(salary) over (order by hire_date) as previous_salary from employees;

select employee_name, hire_date, salary, lead(salary) over (order by hire_date) as next_salary from employees;

with ranked as (select e.*, dense_rank() over (partition by department order by salary desc) as salary_rank from employees e) select * from ranked where salary_rank <= 3;

with ranked as (select e.*, avg(salary) over (partition by department) as department_avg from employees e) select * from ranked where abs(salary - department_avg) = (select min(abs(r.salary - r.department_avg)) from ranked r where r.department = ranked.department);

with ranked as (select department, salary, dense_rank() over (partition by department order by salary desc) as salary_rank from employees), salaries as (select department, max(case when salary_rank = 1 then salary end) as highest_salary, max(case when salary_rank = 2 then salary end) as second_highest_salary from ranked group by department) select department, highest_salary - second_highest_salary as salary_difference from salaries;

with dept_avg as (select department, avg(salary) as department_avg from employees group by department), company_avg as (select avg(salary) as company_avg from employees) select e.employee_name, e.salary, m.employee_name as manager, d.department_avg from employees e join employees m on e.manager_id = m.employee_id join dept_avg d on e.department = d.department cross join company_avg c where e.salary > m.salary and d.department_avg > c.company_avg;

with ranked as (select e.*, row_number() over (partition by department order by hire_date asc) as first_rank, row_number() over (partition by department order by hire_date desc) as last_rank from employees e) select * from ranked where first_rank = 1 or last_rank = 1;

select department from employees group by department having min(salary) > 50000;

with company_avg as (select avg(salary) as avg_salary from employees) select e.department from employees e cross join company_avg c group by e.department having sum(case when e.salary > c.avg_salary then 1 else 0 end) / count(*) >= 0.70;

with gaps as (select hire_date, lag(hire_date) over (order by hire_date) as previous_date from employees) select max(datediff(hire_date, previous_date)) as longest_gap from gaps where previous_date is not null;

select employee_name, department, salary, hire_date, lag(salary) over (partition by department order by hire_date) as previous_salary from employees;

select department, max(salary) - min(salary) as salary_inequality from employees group by department order by salary_inequality desc limit 1;

select * from employees e where (e.department, e.salary) in (select department, salary from employees group by department, salary having count(*) > 1);

with ranked as (select e.*, dense_rank() over (partition by department order by salary desc) as salary_rank from employees e) select * from ranked where salary_rank = 3;

with employee_salary as (select department_id, sum(salary) as total_employee_salary from employees group by department_id), project_budget as (select department_id, sum(budget) as total_project_budget from projects group by department_id) select d.department_name, e.total_employee_salary, p.total_project_budget, e.total_employee_salary - p.total_project_budget as difference from departments d join employee_salary e on d.department_id = e.department_id join project_budget p on d.department_id = p.department_id where e.total_employee_salary > p.total_project_budget;

select e.* from employees e where not exists (select 1 from projects p where p.department_id = e.department_id) and e.salary > (select avg(e2.salary) from employees e2 where e2.department_id = e.department_id);

with ranked as (select e.*, row_number() over (partition by department order by salary desc) as high_rank, row_number() over (partition by department order by salary asc) as low_rank, avg(salary) over (partition by department) as department_avg from employees e) select department, max(case when high_rank = 1 then employee_name end) as highest_paid_employee, max(case when low_rank = 1 then employee_name end) as lowest_paid_employee, max(department_avg) as department_average from ranked group by department;

select * from (select e.*, ntile(5) over (partition by department order by salary desc) as salary_group from employees e) x where salary_group = 1;

with ranked as (select e.*, row_number() over (partition by department order by salary) as rn, count(*) over (partition by department) as cnt from employees e) select department, avg(salary) as median_salary from ranked where rn in (floor((cnt + 1) / 2), floor((cnt + 2) / 2)) group by department;

select e.* from employees e where e.salary > (select avg(e2.salary) from employees e2 where e2.hire_date < e.hire_date);

select m.employee_name as manager, sum(e.salary) as direct_reports_salary, m.salary as manager_salary, sum(e.salary) - m.salary as difference from employees m join employees e on e.manager_id = m.employee_id group by m.employee_id, m.employee_name, m.salary having sum(e.salary) > m.salary;

select employee_name, salary, rank() over (order by salary desc) as company_salary_rank, rank() over (partition by department order by salary desc) as department_salary_rank, avg(salary) over (partition by department) as department_average, salary - avg(salary) over (partition by department) as difference_from_department_average, lag(salary) over (order by hire_date) as previous_salary, lead(salary) over (order by hire_date) as next_salary from employees;