-- 1. Database & Table Creation (1–20)

-- Q1. Create a database named company_db.
create database company_db;

-- Q2. Select and use the company_db database.
use company_db;

-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date columns.
create table employees(employee_id int, employee_name varchar(30), department varchar(30), 
salary int, city varchar(20), hire_date date);

-- Q4. Make employee_id the PRIMARY KEY.
alter table employees add primary key  (employee_id);

-- Q5. Make employee_name NOT NULL.
alter table employees modify column employee_name varchar(30) not null;

-- Q6. Add a UNIQUE constraint to an email column.
alter table employees add column email varchar(30) unique;

-- Q7. Add a CHECK constraint so salary must be greater than 0.
alter table employees add constraint check (salary>0);

-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.
alter table employees alter column city set default 'Hydraabad';

-- Q9. Create a departments table with department_id, department_name, location, and budget.
create table departments(department_id int,department_name varchar(30),location varchar(20),budget int);

--  Q10. Make department_id the PRIMARY KEY in the departments table.
alter table departments add primary key (department_id);

-- Q11. Create a projects table with project_id, project_name, department_id, and budget.
create table projects(project_id varchar(10), project_name varchar(30), department_id varchar(10),budget int);

-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.
alter table employees add foreign key (department_id) references  departments(department_id);
 
 -- Q13. Insert one employee record.
 insert into employees (employee_id,employee_name,salary,city,hire_date,email)
 values(101,'manish',50000,'hydrabad','2002-10-02','manisg@gmail.com');
 
 -- Q14. Insert five employee records in a single INSERT statement.
  insert into employees (employee_id,employee_name,salary,city,hire_date,email)
 values(102,'sonam',45000,'hydrabad','2023-10-02','sonam@gmail.com'),
 (103,'rohan',30000,'mumbai','2012-05-14','rohan23@gmail.com'),
  (104,'deepak',70000,'delhi','2015-03-06','deepak@gmail.com'),
   (105,'mohan',45000,'hydrabad','2018-04-15','mohan67@gmail.com'),
    (106,'shrikant',30000,'mumbai','2012-09-14','shrikant.sh@gmail.com');
    
-- Q15. Insert a department record.
insert into departments values(01,'data science','hydrabad',50000);

-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE, CHECK, and DEFAULT constraints.
create table students(stu_id int primary key,stu_name varchar(30) not null,email varchar(30) unique,marks int check (marks>45), department varchar(30) default 'IT');   

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.
create table attendance (employee_id int,attendance_date date, status varchar(20));

-- Q18. Create a table only if it does not already exist.
create table if not exists  students(stu_id int primary key,stu_name varchar(30) not null,email varchar(30) unique,marks int check (marks>45), department varchar(30) default 'IT');
create table if not exists teachers (teacher_id int primary key,teacher_name varchar(30) not null,email varchar(30) unique, department varchar(30) default 'IT');

-- Q19. Describe or display the structure of the employees table.
desc employees;
describe employees;

-- Q20. Drop a temporary table named temp_data if it exists.
drop table if exists temp_data;                      


-- 2. Basic SELECT & Filtering (21–45)
-- Q21. Display all columns from the employees table.
 select * from employees;
 
 -- Q22. Display only employee_name and salary.
 select employee_name,salary from employees;
 
 -- Q23. Display employees who live in Hyderabad.
 select employee_name,employee_id,city from employees where city='hydrabad';
 
 -- Q24. Display employees whose salary is greater than 60000.
 select employee_id,employee_name,salary from employees where salary>60000;
 
 -- Q25. Display employees whose salary is less than or equal to 50000.
 select employee_id,employee_name,salary from employees where salary<=50000;
 
 -- Q26. Display employees whose salary is between 50000 and 70000.
 select employee_id,employee_name,salary from employees where salary between 50000 and 70000;
 
 -- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
 select employee_id,employee_name,city from employees where city in ('hydrabad','bangalore','mumbai');
 
 -- Q28. Display employees who do not live in Hyderabad.
 select employee_id,employee_name,city from employees where city != 'hydrabad';
 select employee_id,employee_name,city from employees where city not in ('hydrabad'); -- when cities are multiple or one.
 
 -- Q29. Display employees whose names start with 'A'.
 select employee_id,employee_name from employees where employee_name like 'A%';
 
 -- Q30. Display employees whose names end with 'a'.
 select employee_id,employee_name from employees where employee_name like '%a';
 
 -- Q31. Display employees whose names contain the letter 'i'.
 select employee_id,employee_name from employees where employee_name like '%i%';
 
 -- Q32. Display employees whose department is NULL.
 select employee_id,employee_name,department_id from employees where department_id is null;
 
 -- Q33. Display employees whose department is NOT NULL
 select employee_id,employee_name,department_id from employees where department_id is not null;
 
 -- Q34. Display employees hired after 2022-01-01.
 select employee_id,employee_name,hire_date from employees where hire_date>'2022-01-01';
 
 -- Q35. Display employees hired between two given dates.
 select employee_id,employee_name,hire_date from employees where hire_date between '2004-01-01' and '2022-01-07';
 
 -- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
 select employee_id,employee_name,salary,city from employees where salary>50000 and city='hydrabad';
 
 -- Q37. Display employees who live in Hyderabad OR earn more than 70000.
 select employee_id,employee_name,salary,city from employees where  city='hydrabad' or salary>70000;
 
 -- Q38. Display employees who are NOT in the HR department.
select employee_id,employee_name,salary,department_name from employees as e
inner join departments as d
on e.department_id = d.department_id
where department_name = 'HR';

-- Q39. Display distinct cities from the employees table.
select distinct city from employees;

-- Q40. Display distinct departments from the employees table.
select distinct department_id from employees;

-- Q41. Display employees sorted by salary in ascending order.
select employee_id,employee_name,salary from employees order by salary asc;

-- Q42. Display employees sorted by salary in descending order.
select employee_id,employee_name,salary from employees order by salary desc;

-- Q43. Display employees sorted first by department and then by salary descending.
select department_id,salary from employees order by department_id,salary desc;

-- Q44. Display the first 5 employees after sorting by employee_id.
select employee_name,employee_id from employees order by employee_id  limit 5;

-- Q45. Display the top 3 highest-paid employees.
select employee_id,employee_name,salary from employees order by salary desc limit 3;


-- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65)
-- Q46. Update the salary of one employee using employee_id.
update employees set salary=100000 where employee_id = 112;

-- Q47. Increase the salary of all employees by 10 percent.
update employees set salary = salary*1.10 where employee_id>0;

-- Q48. Increase the salary of employees in the Data Science department by 5000.
update employees as e 
inner join departments as d
on e.department_id = d.department_id 
 set salary = salary+5000 where employee_id>0 and department_name= 'data science';
 
-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update employees as e 
inner join departments as d
on e.department_id = d.department_id 
 set city='bengaluru' where employee_id>0 and city= 'bangalore';
 
 -- Q50. Delete one employee using employee_id.
 delete from employees  where employee_id = 105;
 
 -- Q51. Delete employees whose salary is below a specified amount.
 delete from employees where employee_id > 0 and salary > 90000;
 
 -- Q52. Add an email column to the employees table.
 alter table employees add column email varchar(30);
 
 -- Q53. Add a phone_number column to the employees table.
 alter table employees add column phone_number bigint;
 
 -- Q54. Modify the length of the employee_name column.
 alter table employees modify column employee_name varchar(40);
 
 -- Q55. Rename the city column to employee_city.
 alter table employees rename column city to employee_city;
 
 -- Q56. Drop the phone_number column.
 alter table employees drop column phone_number;
 
 -- Q57. Display employee names in uppercase.
select ucase(employee_name) from employees;

-- Q58. Display employee names in lowercase.
select lcase(employee_name) from employees;

-- Q59. Display the length of every employee name.
select employee_name,length(employee_name) as length_of_employee_name from employees;

-- Q60. Display the first three characters of every employee name.
select employee_name,left(employee_name,3) from employees ;
select employee_name,substring(employee_name,1,3) from employees ;

-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select employee_name,salary,round(salary,-3) from employees;

-- Q62. Display the current date.
select curdate();

-- Q63. Calculate how many years each employee has worked using hire_date.
select  employee_name,timestampdiff(year,hire_date,curdate()) from employees;

-- Q64. Replace NULL department values with 'Unassigned' in the query result.
select employee_name,coalesce(department_id, 'unassigned') from employees;  

-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
select employee_name, salary, case 
when salary<40000 then 'low'
when salary between 40000 and 60000 then 'medium'
else  'high'  
end as salary_label
from employees;

-- 4. Aggregate Functions, GROUP BY & HAVING (66–90)
-- Q66. Find the total number of employees.
select count(*) as total_number_of_employees from employees;

-- Q67. Find the total salary paid to all employees.
select sum(salary) as total_salary_of_employees from employees;

-- Q68. Find the average salary of all employees.
select avg(salary) as average_salary_of_employees from employees;

-- Q69. Find the highest salary.
select max(salary) as highest_salary from employees;

-- Q70. Find the lowest salary.
select min(salary) as lowest_salary from employees;

-- Q71. Find the number of employees in Hyderabad.
select count(employee_city) as number_of_employees_in_hydrabad from employees where employee_city='hydrabad';

-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary) as total_salaty_of_employees_in_mumbai from employees where employee_city='mumbai';

-- Q73. Find the average salary of employees in Bangalore.
select avg(salary) as total_averagesalaty_of_employees_in_Bangalore from employees where employee_city='bengaluru';

-- Q74. Find the number of employees in each department.
select department_id,count(employee_id) as number_of_employeees from employees group by department_id;

-- Q75. Find the average salary in each department.
select department_id,avg(salary) as average_salaary from employees group by department_id;

-- Q76. Find the maximum salary in each department.
select department_id,max(salary) as maximum_salaary from employees group by department_id;

-- Q77. Find the minimum salary in each department.
select department_id,min(salary) as minimum_salaary from employees group by department_id;

-- Q78. Find the total salary in each department.
select department_id,sum(salary) as total_salaary from employees group by department_id;

-- Q79. Find the number of employees in each city.
select employee_city,count(employee_id) as number_of_employees from employees group by employee_city;

-- Q80. Find the average salary in each city.
select employee_city,avg(salary) as average_of_employees from employees group by employee_city;

-- Q81. Find departments having more than 5 employees.
select department_id,count(employee_id) as number_of_employees from employees group by department_id having count(employee_id)>5;

-- Q82. Find departments whose average salary is greater than 60000.
select department_id,avg(salary) as average_salary from employees group by department_id having avg(salary)> 60000;
 
 -- Q83. Find cities whose total salary is greater than 200000.
 select employee_city,sum(salary) as total_salary from employees group by employee_city having sum(salary)> 200000;
 
 -- Q84. Find the department with the highest total salary.
 select department_id,sum(salary) as highest_total_salary from employees group by department_id order by sum(salary) desc limit 1;
 
 -- Q85. Find the department with the highest average salary.
 select department_id,avg(salary) as highest_average_salary from employees group by department_id order by avg(salary) desc limit 1;
 
 -- Q86. Display employee count and average salary for each department and city combination.
 SELECT department_id,
       employee_city,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM employees
GROUP BY department_id, employee_city;

-- Q87. Find the difference between the maximum and minimum salary in each department.
select department_id, max(salary)-min(salary) as difference_between_highest_and_lowest_salary from employees group by department_id;

-- Q88. Find departments where the maximum salary is greater than 70000.
select department_id , max(salary) from employees group by department_id having max(salary)>70000;

-- Q89. Find cities having at least 3 employees with salary above 60000.
select employee_city,count(employee_name) as number_of_employees from employees where salary>60000 group by employee_city having count(employee_name)>=3 ; 

-- Q90. Find the total number of distinct departments and distinct cities.
select count(distinct department_id),count(distinct employee_city) from employees;

-- 5. Constraints, Keys & Data Integrity (91–105)
-- Q91. Create a products table with product_id as PRIMARY KEY.
create table products(product_id varchar(10) primary key, product_name varchar(30),mfg_date date,exp_date date, price float(8.2));

-- Q92. Create a users table where email must be UNIQUE.
create table users(user_id varchar(10),user_name varchar(30),city varchar(30),email varchar(30) unique);

-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK.
create table orders(order_id varchar(10),product_id varchar(10),user_id varchar(10),order_amount int check (order_amount>0) );

-- Q94. Create a customers table where customer_name cannot be NULL.
create table customers(customer_id varchar(10), customer_name varchar(30) not null, city varchar(30),phone_no bigint,email varchar(40));

-- Q95. Create a table with a DEFAULT status value of 'Active'.
create table cust_status(customer_id varchar(10),login_Date date,status_active_or_not varchar(10) default 'active');

-- Q96. Insert a row that uses the DEFAULT value.
insert into cust_status(customer_id,login_date) values('c101','2023-08-11');
insert into cust_status values('c102','2023-04-11',default);

-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated.
insert into employees values(101,'samim',30,60000,'hydrabad','2024-04-06','samim@123gmail.com');   -- duplicate entry 

-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated.
insert into employees values(115,'samim',30,60000,'hydrabad','2024-04-06','samim@123gmail.com'); 
insert into employees values(116,'samim husain',50,35000,'hydrabad','2026-04-06','samim@123gmail.com'); -- duplicate entry

-- Q99. Create employees and departments with a FOREIGN KEY relationship.
alter table employees add constraint fk_employees_departments foreign key (department_id) references departments(department_id);

-- Q101. Attempt to insert an employee with a department_id that does not exist.
insert into employees values(116,'suresh',70,30000,'chenai','2024-08-07','sure12334@gmail.com'); -- cannot add or update a child row : foreigen key constraint fails

-- Q102. Add a CHECK constraint to allow age only between 18 and 60.
 alter table customers modify column age tinyint check (age between 18 and 60);
 
 -- Q103. Create a composite PRIMARY KEY using two columns.
 alter table cust_status add primary key (customer_id,login_date);
  
  -- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
  create table attendance1 (employee_id varchar(10),attendance_date date,present_or_not varchar(10), primary key (employee_id,attendance_date));
  
  -- Q105. Create a table with a named constraint and then identify its purpose.
  create table students1(student_id varchar(10),student_name varchar(30),roll_no tinyint,constraint pk_students1 primary key (student_id)); -- unique value,cannot be null,easier to identify,modify or drop.
  
  
  -- 6. JOINs Including Self Join (106–135)
  -- Q106. Display employee_name and department_name using an INNER JOIN.
  select employee_name,department_name from employees as e
  inner join departments as d
  on e.department_id = d.department_id;
  
  -- Q107. Display employee_name, salary, department_name, and location using a JOIN.
  select employee_name,salary,department_name,location from employees as e
  left join departments as d
  on e.department_id = d.department_id
  union
  select employee_name,salary,department_name,location from employees as e
  right join departments as d
  on e.department_id = d.department_id;
  
  -- Q108. Find employees working in the Data Science department using a JOIN.
  select employee_name,employee_id from employees as e
  inner join departments as d
  on e.department_id = d.department_id
  where department_name = 'data science';
  
  -- Q109. Find employees working in departments located in Hyderabad.
  select employee_id,employee_name from employees as e
  inner join departments as d
  on e.department_id = d.department_id
  where location = 'hyderabad';
  
  -- Q110. Display all employees even if they do not belong to any department.
  select employee_name,department_id from employees;
  
  -- Q111. Display all departments even if they have no employees.
  select d.department_id,department_name,employee_name from employees as e
  right join departments as d
  on e.department_id = d.department_id;
  
-- Q112. Find departments that currently have no employees.
select department_name,employee_name from employees as e
right join departments as d
  on e.department_id = d.department_id 
  where employee_name is null;
  
-- Q113. Find employees who do not have a matching department.  
select employee_name,department_name from employees as e
left join departments as d
  on e.department_id = d.department_id 
  where department_name is null;
  
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
select department_name,count(employee_name) from employees as e
right join departments as d
  on e.department_id = d.department_id 
  group by department_name; 
  
-- Q115. Find the average salary in each department using JOIN and GROUP BY.
select department_name,avg(salary) from employees as e
right join departments as d
  on e.department_id = d.department_id
  group by department_name;
  
-- Q116. Display each department with employee count including departments with zero employees.
select department_name,count(employee_name) from employees as e
right join departments as d
  on e.department_id = d.department_id
  group by department_name;

-- Q117. Display each department with total salary including departments with zero employees.
select department_name,sum(salary) as total_salary from employees as e
right join departments as d
  on e.department_id = d.department_id
  group by department_name;
  
-- Q118. Join departments with projects and display department_name and project_name.
select department_name,project_name from projects as p
inner join departments as d
  on p.department_id = d.department_id ;
  
-- Q119. Display employees, department names, and project names using appropriate joins.
select e.employee_name,d.department_name,p.project_name from employees as e
inner join departments as d
on e.department_id=d.department_id
inner join projects as p
on d.department_id=p.department_id;

 with emp_pro as 
 (select employee_name,p.department_id,project_name from employees as e
inner join projects as p
on p.department_id=e.department_id )
select  employee_name,department_name,project_name from departments as d
inner join emp_pro 
on d.department_id = emp_pro.department_id;

-- Q120. Find departments that have at least one project.
 select department_name,count(project_name)  as total_project from departments as d
 inner join projects as p 
 on d.department_id= p.department_id
 group by department_name;
 
 -- Q121. Find departments that have no projects.
  select department_name,count(project_name)  as total_project from departments as d
 left join projects as p 
 on d.department_id= p.department_id
 group by department_name having total_project = 0;

-- Q122. Create an employee-manager relationship using manager_id in the employees table.
 
 
 -- 7. Subqueries (136–155)
 -- Q136. Find employees whose salary is greater than the overall average salary.
 select employee_name,salary as greater_than_overall_average_salary from employees where salary>(select avg(salary) from employees);
 
 -- Q137. Find the employee or employees with the highest salary using a subquery.
  select employee_name,salary from employees where salary = (select max(salary) from employees);
  
 -- Q138. Find the employee or employees with the lowest salary using a subquery.
 select employee_name,salary from employees where salary = (select min(salary) from employees);
 
-- Q139. Find employees who earn the same salary as Alice.
select employee_name,salary from employees where salary=(select salary from employees where employee_name='alice');

-- Q140. Find employees who earn more than Alice.
select employee_name,salary from employees where salary>(select salary from employees where employee_name='alice');

-- Q141. Find employees working in the same department as Alice.
select employee_name,department_id from employees where department_id=(select department_id from employees where employee_name='alice');

-- Q142. Find employees whose salary is greater than the average salary of their department.
select employee_name,department_id,salary from employees as e where salary > (select avg(salary) from employees where department_id = e.department_id);

-- Q143. Find employees whose salary is less than the average salary of their department.
select employee_name,department_id,salary from employees as e where salary < (select avg(salary) from employees where department_id = e.department_id);

-- Q144. Find the department with the highest average salary using a subquery.
select department_id,avg(salary) as avgs from employees group by department_id order by avg(salary) desc limit 1;

-- Q145. Find departments whose average salary is greater than the company average salary.
select department_id,avg(salary) from employees group by department_id having avg(salary)>(select avg(salary) from employees);

-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
select employee_id,employee_name, department_id from employees where department_id = (select department_id from departments where location='hyderabad');

-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.
 
--  Q148. Find departments that have at least one employee using EXISTS.
select department_id,count(employee_name) from employees group by department_id having count(employee_name) >=1;

-- Q149. Find departments that have no employees using NOT EXISTS.


-- Q150. Find employees whose salary is greater than every employee in the HR department.
select employee_name,salary from employees where salary>(select max(salary) from employees where department_id=(select department_id from departments where department_name='HR'));

-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
select employee_name,salary from employees where salary>(select min(salary) from employees where department_id=(select department_id from departments where department_name='Finance'));

-- Q152. Find the second-highest distinct salary using a subquery.
select distinct salary from employees where salary<(select max(salary) from employees) order by salary desc limit 1;

-- Q153. Find the third-highest distinct salary using a subquery.
select  salary as third_highest_salary from ( select salary from employees order by salary desc limit 3) as sal order by salary asc limit 1;

-- Q154. Find employees with the second-highest distinct salary.
select distinct employee_name,salary from employees where salary<(select max(salary) from employees) order by salary desc limit 1;

-- Q155. Use a correlated subquery to find employees earning above their department average.
select employee_name,salary,department_id from employees as e where salary>(select avg(salary) from employees where department_id = e.department_id); 

 
-- 8. CTEs — Common Table Expressions (156–170)
-- Q156. Create a CTE containing employees whose salary is greater than 60000.
with sal as (select * from employees where salary>60000) select employee_name,salary from sal;

-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.
with avg_sal as (select avg(salary) from employees) select employee_name,salary from employees where salary>avg_sal;

-- Q158. Use a CTE to calculate average salary by department.
with avg_sal as 
(select  department_id,avg(salary) from employees group by department_id)
select * from avg_sal;

-- Q159. Use a CTE to find departments with average salary greater than 60000.
with avg_sal as (select  department_id,avg(salary) from employees group by department_id having avg(salary)>60000) select * from avg_sal;

-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.


-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.
select employee_city,sum(salary) from employees group by employee_city order by sum(salary) desc;

-- Q162. Use a CTE to find the highest salary in each department.
with high_sal as (select department_id,max(salary) from employees group by department_id) select * from high_sal;

-- Q163. Use a CTE to find employees earning above their department average.
select employee_name,salary from employees as e where salary>(select avg(salary) from employees where department_id = e.department_id);

-- Q164. Use a CTE to rank employees by salary.
with rnk_employee as (select employee_name,salary,rank() over(order by salary desc) as salary_rank  from employees) select * from rnk_employee ;

-- Q165. Use a CTE to find the top 2 highest-paid employees.
with rnk_employee as (select employee_name,salary,rank() over(order by salary desc) as salary_rank  from employees) select * from rnk_employee order by salary_rank limit 2;

-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.
with withrno as ( 
select employee_name,department_id, salary,rank() over(order by employee_name) as rno from employees )
select * from withrno as e where salary = (select max(salary) from withrno where department_id = e.department_id);

-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.
with sal_rnk as 
(select department_id,employee_name,salary, dense_rank() over(partition by department_id order by salary) as salary_rank from employees ) 
select department_id,employee_name,salary,salary_rank from sal_rnk where salary_rank=2;

-- Q168. Create a CTE that joins employees and departments, then filter the result.
with joins as
(select e.employee_id,e.employee_name,e.salary,d.department_id,d.department_name from employees as e inner join departments as d on e.department_id=d.department_id )
select * from joins;

-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3 employees.
with numofemp as
(select d.department_name,count(e.employee_name) as number_of_employee from employees as e
inner join departments as d
on e.department_id=d.department_id
group by department_name having number_of_employee > 3 )
select * from numofemp;

-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.


-- 9. Window Functions (171–180)
-- Q171. Assign a unique row number to all employees ordered by salary descending.
select * ,row_number() over(order by salary desc) as si_no from employees;

-- Q172. Assign a row number to employees within each department ordered by salary descending.
select employee_name,department_id,salary, row_number() over(partition by department_id order by salary desc) from employees;

-- Q173. Rank employees by salary using RANK().
select *, rank() over(order by salary desc) from employees; 

-- Q174. Rank employees by salary using DENSE_RANK().
select *, dense_rank() over(order by salary desc) from employees;

-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.
select employee_name,salary,row_number() over(order by salary asc), rank() over(order by salary asc), dense_rank() over(order by salary asc)  from employees;

-- Q176. Display the company average salary beside every employee using AVG() OVER().
select employee_name,salary, avg(salary) over() from employees;

-- Q177. Display the department average salary beside every employee using PARTITION BY.
select employee_name,department_id,salary, avg(salary) over(partition by department_id) from employees;

-- Q178. Calculate a running total of salary ordered by hire_date.
select employee_name,hire_date,salary,sum(salary) over(order by hire_date) from employees;

-- Q179. Use LAG() to display the previous employee's salary when ordered by hire_date.
select employee_name,hire_date,salary, lag(salary) over(order by hire_date) from employees;

-- Q180. Use LEAD() to display the next employee's salary when ordered by hire_date.
select employee_name,hire_date,salary, lead(salary) over(order by hire_date) from employees;


-- 10. Hard SQL Challenge Questions (181–200)
-- Q181. Find the top 3 highest-paid employees in every department, including ties if appropriate. Hint: Compare ROW_NUMBER, RANK, and DENSE_RANK before choosing one.
with sal_rank as (
select employee_name,department_id,salary,dense_rank() over(partition by department_id order by salary desc) as salary_rank from employees)
select * from sal_rank where salary_rank in(1,2,3);

-- Q182. Find the employee whose salary is closest to the average salary of their department. Hint: Calculate department average with a window function, then compare absolute differences.
WITH dept_avg AS (
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,
        AVG(salary) OVER (PARTITION BY department_id) AS avg_dept_salary
    FROM employees
),
ranked AS (
    SELECT
        *,
        ABS(salary - avg_dept_salary) AS salary_diff
    FROM dept_avg
)
SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    avg_dept_salary
FROM ranked
WHERE salary_diff = (
    SELECT MIN(r2.salary_diff)
    FROM ranked r2
    WHERE r2.department_id = ranked.department_id
);

-- Q183. For every department, find the difference between its highest-paid and second-highest distinct salary. Hint: Use DENSE_RANK in a CTE.
-- Q184. Find employees whose salary is higher than their manager and whose department average salary is also above the company average. Hint: Combine SELF JOIN, window/aggregate logic, and a CTE.
-- Q185. Find the first employee hired in each department and the most recently hired employee in each department. Hint: Use two rankings ordered in opposite directions.
-- Q186. Find departments where every employee earns more than 50000. Hint: Think about MIN(salary) or NOT EXISTS.
select department_id from employees group by department_id having min(salary) > 50000;

-- Q187. Find departments where at least 70 percent of employees earn above the company average salary. Hint: Use conditional aggregation and a company-average CTE.
-- Q188. Find the longest consecutive hiring-date gap between employees when ordered by hire_date. Hint: Use LAG() and date difference logic.
-- Q189. Find employees whose salary increased relative to the previous employee in their department when ordered by hire_date. Hint: PARTITION BY department with LAG().
-- Q190. Find the department with the largest salary inequality, measured as maximum salary minus minimum salary. Hint: Aggregate first, then rank the result.
select department_id,max(salary)-min(salary) as dif, rank() over( order by max(salary)-min(salary) desc ) as rank_of_difference from employees group by department_id limit 1 ;

-- Q191. Find employees who share their salary with another employee in the same department. Hint: GROUP BY department and salary, or use a window COUNT().
-- Q192. Find the third-highest distinct salary in each department and return all employees who earn it. Hint: DENSE_RANK plus a CTE.
with sal_rank as(
select department_id,salary, dense_rank() over(partition by department_id order by salary desc) as rnk from employees )
select * from sal_rank where rnk=3;

-- Q193. Find departments whose total employee salary exceeds their project budget, and return the difference. Hint: Aggregate employee salary and project budget separately before joining.
-- Q194. Find employees who belong to departments with no projects but earn above their department average. Hint: Combine NOT EXISTS with a window calculation.
-- Q195. Return one row per department containing the employee with the highest salary, the employee with the lowest salary, and the department average. Hint: Use conditional aggregation after ranking.
-- Q196. Find employees who are in the top 20 percent of salaries within their department. Hint: Investigate NTILE(5) or percentile-related window logic supported by your SQL database.
-- Q197. Find the median salary in each department. Hint: The exact syntax depends on your SQL database; consider ROW_NUMBER plus counts if percentile functions are unavailable.
-- Q198. Find employees whose salary is greater than the average salary of all employees hired before them. Hint: This requires a running window frame or correlated logic. Hint: SELF JOIN, GROUP BY, and aggregation.
-- Q200. Create a report showing for every employee: company salary rank, department salary rank, department average, difference from department average, previous salary by hire date, and next salary by hire date. Hint: Use multiple window functions in one SELECT or organize them with a CTE.
