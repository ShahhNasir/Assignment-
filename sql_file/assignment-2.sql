-- Q1. Create a database named company_db.--
create database company_db;
--  Select and use the company_db database--
use company_db;
-- Q3. Create an employees table with employee_id, employee_name, department, salary, city, and hire_date
-- columns.--
create table emp(emp_id  varchar(10),emp_name varchar(20),
dept varchar(20),salary int,city varchar(20),hire_date date);
-- Q4.Make employee_id the PRIMARY KEY.--
alter table emp add primary key(emp_id);
-- Q5. Make employee_name NOT NULL.--
alter table emp modify emp_name varchar(20) not null;
-- Q6. Add a UNIQUE constraint to an email column.--
alter table emp add column emp_email varchar(20) unique;
-- Q7. Add a CHECK constraint so salary must be greater than 0.--
alter table emp add constraint salary check(salary > 0);
-- Q8. Add a DEFAULT value of 'Hyderabad' for the city column.--
alter table emp alter column city set default 'Hyderabad';
-- Q9. Create a departments table with department_id, department_name, location, and budget.--
create table dept(dept_id int,dept_name varchar(20),
location varchar(20),budget varchar(20));
-- Q10. Make department_id the PRIMARY KEY in the departments table.--
alter table dept add primary key(dept_id);
-- Q11. Create a projects table with project_id, project_name, department_id, and budget--
create table project(pro_id int,pro_name varchar(20),dept_id int,budget int);
INSERT INTO project VALUES 
(1, 'AI Alpha', 72, 50000),
(2, 'Data Pipeline', 73, 35000),
(3, 'Model Train', 77, 80000),
(4, 'Recruit Portal', 79, 20000);
insert into project values
(5,'Rag project',Null,300000);
-- Q12. Add a FOREIGN KEY from employees.department_id to departments.department_id.--
alter table emp add column dept_id int;
alter table emp add constraint dept_id foreign key(dept_id) references dept (dept_id); 
-- Q13. Insert one employee record.--
insert into dept values(80,'Analsty','Hyderabad','500000');
insert into emp values
('E001', 'Rahul Sharma','Data Science',60000,'Hyderabad','2026-03-15','rahul@gmail.com',77);
-- Q14. Insert five employee records in a single INSERT statement.-- 
insert into emp values
('E002','Kiran','AI',75000,'Benguluru','2025-01-31','kiran@gmail.com',72),
('E003','Arun','Data Science',55000,'Hyberabad','2025-05-23','arun@gmail.com',77),
('E004','Satesh','AI',45000,'Chennai','2024-03-22','satesh@gmail.com',72),
('E005','Sakshi','Data Analyst',46000,'Hyderabad','2022-03-12','sakshi@gmail.com',73),
('E006','Keerthi','Data Analyst',500000,'Chennai','2021-05-17','keerthi@gmail.com',73);
-- Q15. Insert a department record.--
insert into dept values
(72,'AI','Benguluru','650000'),
(73,'Data Analyst','Chennai','400000');
-- Q16. Create a students table with PRIMARY KEY, NOT NULL, UNIQUE,
-- CHECK, and DEFAULT constraints--
create table stud(roll_no int primary key,s_name varchar(20) not null,
email_id varchar(30) unique,age int check(age >= 18),dept varchar(10) default('Engineering'));

-- Q17. Create a table named attendance with employee_id, attendance_date, and status.--
create table atte(emp_id int,ate_date date,status varchar(10));
-- Q18. Create a table only if it does not already exist--
create table dse(des int);
-- Q19. Describe or display the structure of the employees table--
desc emp;
-- Q20. Drop a temporary table named temp_data if it exists.--
drop table dse;
-- Q21. Display all columns from the employees table.--
select * from emp;
-- Q22. Display only employee_name and salary.--
select emp_name,salary from emp;
-- Q23. Display employees who live in Hyderabad.--
select emp_name from emp where city = 'Hyderabad';
-- Q24. Display employees whose salary is greater than 60000--
select emp_name from emp where salary > 60000;
-- Q25. Display employees whose salary is less than or equal to 50000--
select emp_name from emp where salary <= 50000;
-- Q26. Display employees whose salary is between 50000 and 70000.--
select emp_name from emp where salary between 50000 and 70000;
-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.--
select emp_name from emp where city in ('Hyderabad','benguluru') or 'Mumbai';
-- Q28. Display employees who do not live in Hyderabad.--
select emp_name from emp where city != 'Hyderabad';
-- Q29. Display employees whose names start with 'A'.--
select emp_name from emp where emp_name like 'A%';
-- Q30. Display employees whose names end with 'a'.
select emp_name from emp where emp_name like '%a';
-- Q31. Display employees whose names contain the letter 'i'.--
select emp_name from emp where emp_name like '%i%';
-- Q32. Display employees whose department is NULL--
select emp_name from emp where dept is NULL;
-- Q33. Display employees whose department is NOT NULL.--
select emp_name from emp where dept is not null;
-- Q34. Display employees hired after 2022-01-01.
insert into emp values
('E007','Nandhini','Data Analyst',66000,'Mumbai','2022-01-01','nandhini@gmail.com',73);
insert into emp values
('E008','Deeksha','Data Science',54000,'Mumbai','2021-12-23','deeksha@gmail.com',Null);
insert into dept values
(79,'HR','Tirupathi','340000');
select emp_name from emp where hire_date = "2022-01-01";
-- Q35. Display employees hired between two given dates
select emp_name from emp where hire_date between '2021-01-01' and '2025-05-31';
-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select emp_name from emp where salary > 50000 and city = 'Hyderabad';
-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select emp_name from emp where city = 'Hyderabad' or salary > 70000;
-- Q38. Display employees who are NOT in the HR department.
select emp_name from emp where dept != 'HR';
-- Q39. Display distinct cities from the employees table.
select distinct(city) as cities from emp;
-- Q40. Display distinct departments from the employees table.
select distinct(dept) from emp;
-- Q41. Display employees sorted by salary in ascending order.
select emp_name,salary from emp order by salary;
-- Q42. Display employees sorted by salary in descending order.
select emp_name from emp order by salary desc;
-- Q43. Display employees sorted first by department and then by salary descending.
select emp_name,salary,dept from emp order by dept and salary desc;
-- Q44. Display the first 5 employees after sorting by employee_id.
select emp_name,emp_id from emp order by emp_id limit 5;
-- Q45. Display the top 3 highest-paid employees.
select emp_name,salary,emp_id from emp order by salary desc limit 3;
-- Q46. Update the salary of one employee using employee_id.
update emp set salary = 50000 where emp_id = 'E006';
-- Q47. Increase the salary of all employees by 10 percent.
update emp set salary = salary + (salary*0.10) where emp_id > 'E000';
-- Q48. Increase the salary of employees in the Data Science department by 5000
update emp set salary = salary + 5000 where dept = 'Data Science' and emp_id >'E000';
-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update emp set city = 'Bangalore' where city = 'Benguluru' and emp_id > 'E000';
-- Q50. Delete one employee using employee_id
delete from emp where emp_id = 'E007';
-- Q51. Delete employees whose salary is below a specified amount
select emp_name from emp where salary > 50000;
-- Q52. Add an email column to the employees table.
alter table emp add phone int2;
select * from emp;
-- Q53. Add a phone_number column to the employees table.
alter table emp add manager varchar(10);
-- Q54. Modify the length of the employee_name column.
alter table emp modify column emp_name varchar(40);
-- Q55. Rename the city column to employee_city.
alter table emp rename column city to emp_city;
-- Q56. Drop the phone_number column.
alter table emp drop column phone;
-- Q57. Display employee names in uppercase.
select upper(emp_name) from emp;
-- Q58. Display employee names in lowercase.
select lower(emp_name) from emp;
-- Q59. Display the length of every employee name. 
select char_length(emp_name) from emp;
-- Q60.Display the first three characters of every employee name.
select left(emp_name,3) from emp;
-- Q61.Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select emp_name,round(salary) from emp;
-- Q62. Display the current date.
select curdate();
-- Q63.Calculate how many years each employee has worked using hire_date.
select emp_name,hire_date,timestampdiff(year,hire_date,curdate()) as expre from emp;
-- Q64.Replace NULL department values with 'Unassigned' in the query result.
select emp_name,ifnull(dept,'unassigned') as dept_m from emp;
-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges.
select emp_name,salary,
    case 
        when salary >= 60000 then 'high'
        when salary >= 40000 and salary <= 59000 then 'medium' 
        else 'low'
	end as salary_level
from emp;
-- Q66. Find the total number of employees
select count(*) from emp;
-- Q67. Find the total salary paid to all employees.
select sum(salary) from emp;
-- Q68. Find the average salary of all employees.
select avg(salary) from emp;
-- Q69. Find the highest salary.
select max(salary) from emp;
-- Q70. Find the lowest salary
select min(salary) from emp;
-- Q71. Find the number of employees in Hyderabad.
select count(emp_name) from emp where emp_city = 'Hyderabad';
-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary) from emp where emp_city = 'Mumbai';
-- Q73. Find the average salary of employees in Bangalore.
select avg(salary) from emp where emp_city = 'Bangalore';
-- Q74. Find the number of employees in each department
select count(emp_name),dept from emp group by dept;
-- Q75. Find the average salary in each department.
select avg(emp_name),dept from emp group by dept;
-- Q76. Find the maximum salary in each department.
select max(salary),dept from emp group by dept;
-- Q77. Find the minimum salary in each department.
select min(salary),dept from emp group by dept; 
-- Q78. Find the total salary in each department.
select sum(salary),dept from emp group by dept;
-- Q79. Find the number of employees in each city
select count(emp_name) from emp group by emp_city;
-- Q80. Find the average salary in each city.
select avg(salary) from emp group by emp_city;
-- Q81. Find departments having more than 5 employees.
select count(emp_name) as cout from emp group by dept having cout > 5;
-- Q82. Find departments whose average salary is greater than 60000.
select avg(salary) as avg_dep from emp group by dept having avg_dep > 60000;
-- Q83. Find cities whose total salary is greater than 200000.
select emp_city from emp group by emp_city having sum(salary) > 100000;
-- Q84. Find the department with the highest total salary.
select dept from emp group by dept order by max(salary) limit 1;
-- Q85. Find the department with the highest average salary
select dept from emp group by dept order by avg(salary) desc limit 1;
-- Q86. Display employee count and average salary for each department and city combination.
select count(emp_name),avg(salary) from emp group by dept and emp_city;
-- Q87. Find the difference between the maximum and minimum salary in each department
select max(salary) - min(salary) as diff_sal from emp;
-- Q88. Find departments where the maximum salary is greater than 70000
select dept,max(salary) from emp group by dept having max(salary) > 70000;
-- Q89. Find cities having at least 3 employees with salary above 60000.
select emp_city from emp where salary > 60000 
group by emp_city having count(emp_name) >= 3;
-- Q90. Find the total number of distinct departments and distinct cities.
select distinct(count(dept and emp_city)) from emp;
-- Q91. Create a products table with product_id as PRIMARY KEY
create table prod(prod_id varchar(10) primary key);
-- Q92. Create a users table where email must be UNIQUE.
create table users(user_id varchar(10),user_email varchar(20) unique);
-- Q93. Create an orders table where order_amount must be greater than 0 using CHECK
create table orders(ord_id varchar(10),ord_amt int check(ord_amt >0));
-- Q94. Create a customers table where customer_name cannot be NULL
create table cust(cust_id int, cust_name varchar(20) not null);
-- Q95. Create a table with a DEFAULT status value of 'Active'.
create table abc(stat varchar(20) default('Active'));
-- Q96. Insert a row that uses the DEFAULT value.
insert into abc values('inactive');
insert into abc values();
-- Q97. Attempt to insert a duplicate PRIMARY KEY and explain which constraint is violated
insert into prod values('12Ee2');
insert into prod values('12Ee2');
-- Q98. Attempt to insert a duplicate UNIQUE email and explain which constraint is violated
insert into users values('E244','Saki@gmail.com');
insert into users values('E245','Saki@gmail.com');
-- Q99. Create employees and departments with a FOREIGN KEY relationship
create  table empl(emo_id int primary key,dept_id int,
foreign key(dept_id) references dept(dept_id));
-- Q100. Insert valid parent and child records respecting the FOREIGN KEY.
insert into empl values(1235,77);
-- Q101. Attempt to insert an employee with a department_id that does not exist.
insert into empl values(1232,71);
-- Q102. Add a CHECK constraint to allow age only between 18 and 60
insert into stud values(109,'Balu','Balu@gmail.com',16,'CSE');
-- Q103. Create a composite PRIMARY KEY using two columns.
create table up(u_id int,in_id int,pr_na varchar(10),primary key(u_id,in_id));
-- Q104. Create an attendance table where employee_id and attendance_date together form a composite key.
create table ate(emp_id int,atte_date date, primary key(emp_id,atte_date));
-- Q105. Create a table with a named constraint and then identify its purpose
create table bac(dac_id int primary key,dac_name varchar(20) not null,emp_id int, 
constraint ate_emp_bac foreign key(emp_id) references ate(emp_id));
-- Q106. Display employee_name and department_name using an INNER JOIN.
select emp_name,dept_name from emp as e
inner join dept as d
on e.dept_id = d.dept_id;
-- Q107. Display employee_name, salary, department_name, and location using a JOIN.
select emp_name,salary,dept_name,location from emp as e
join dept as d
on e.dept_id = d.dept_id;
-- Q108. Find employees working in the Data Science department using a JOIN.
select emp_name,dept_name from emp as e
join dept as d
on e.dept_id = d.dept_id
where d.dept_name = 'Data Science';
-- Q109. Find employees working in departments located in Hyderabad.
select emp_name,dept_name from emp as e
left join dept as d
on  e.dept_id = d.dept_id 
where city = 'Hyderabad';
-- Q110. Display all employees even if they do not belong to any department
select emp_name,dept_name from emp as e
left join dept as d
on e.dept_id = d.dept_id;	
-- Q111. Display all departments even if they have no employees.
select dept_name,emp_name from emp as e
right join dept as d
on d.dept_id = e.dept_id;
-- Q112. Find departments that currently have no employees
select dept_name from dept as d
left join emp as e
on d.dept_id = e.dept_id
where e.emp_name is null;
-- Q113. Find employees who do not have a matching department.
select emp_name from emp as e
left join dept as d
on e.dept_id = d.dept_id
where d.dept_name is null;
-- Q114. Find the number of employees in each department using JOIN and GROUP BY.
select count(emp_name) as emps from emp as e
left join dept as d
on e.dept_id = d.dept_id
group by d.dept_name;
-- Q115. Find the average salary in each department using JOIN and GROUP BY
select avg(emp_name) as emps from emp as e
left join dept as d
on e.dept_id = d.dept_id
group by d.dept_name;
-- Q116. Display each department with employee count including departments with zero employees.
select dept_name,count(emp_name) as emps from dept as d
left join emp as e
on d.dept_id = e.dept_id
group by d.dept_name;
-- Q117. Display each department with total salary including departments with zero employees
select dept_name,sum(salary) from dept as d
left join emp as e
on d.dept_id = e.dept_id
group by d.dept_name;
-- Q118. Join departments with projects and display department_name and project_name.
select dept_name,pro_name from dept as d
left join project as p 
on d.dept_id = p.dept_id;
-- Q119. Display employees, department names, and project names using appropriate joins
select emp_name,dept_name,pro_name from emp as e
join dept as d on e.dept_id = d.dept_id
join project as p on e.dept_id = p.dept_id;
-- Q120. Find departments that have at least one project
select dept_name from dept as d
left join project as p
on d.dept_id = p.dept_id
where p.pro_name is not null;
-- Q121. Find departments that have no projects
select dept_name from dept as d
left join project as p
on d.dept_id = p.dept_id
where p.pro_name is null;
-- Q122. Create an employee-manager relationship using manager_id in the employees table
alter table emp add column mang_id varchar(20); 
alter table emp add column mang_name varchar(20);
update emp set mang_id = 'M005',mang_name = 'Nandhini' where emp_id = 'E008';
-- Q123. Using a SELF JOIN, display employee name and manager name.
select e.emp_name,m.mang_name from emp as e
right join emp as m
on e.emp_id = m.emp_id;
-- Q124. Using a SELF JOIN, display only employees who have managers.
select e.emp_name,m.mang_name from emp as e
right join emp as m
on e.emp_id = m.emp_id
where m.mang_name is not null;
-- Q125. Using a SELF JOIN, display employees who do not have managers.
select e.emp_name,m.mang_name from emp as e
right join emp as m
on e.emp_id = m.emp_id
where m.mang_name is null;
-- Q126. Find all managers who manage at least one employee.
select m.mang_name,count(e.emp_name) from emp as e
left join emp as m
on e.emp_id = m.emp_id
group by m.mang_name having count(e.emp_name) >= 1; 
-- Q127. Count the number of employees reporting to each manager.
select m.mang_name,count(e.emp_name) from emp as e
left join emp as m
on e.emp_id = m.emp_id
group by m.mang_name; 
-- Q128. Find managers who manage more than 3 employees.
select m.mang_name,count(e.emp_name) from emp as e
left join emp as m
on e.emp_id = m.emp_id
group by m.mang_name having count(e.emp_name) = 3;
-- Q129. Display employee, manager, and employee salary using a SELF JOIN
select m.mang_name,e.emp_name,e.salary from emp as e
left join emp as m
on e.emp_id = m.emp_id;
-- Q130. Find employees whose salary is greater than their manager's salary.
select e.emp_name,m.mang_name from emp as e
right join emp as m
on e.emp_id = m.emp_id 
where e.salary > m.salary;
-- Q131. Find employees who work in the same department as their manager.
select e.emp_name,m.dept_id from emp as e
left join emp as m
on e.emp_id = m.emp_id
where e.dept_id = m.dept_id; 
-- Q132. Use a LEFT JOIN to find unmatched rows between employees and departments.
select emp_name,dept_name from emp as e
left join dept as d
on e.dept_id = d.dept_id where d.dept_name is null;
-- Q133. Use multiple JOINs to display employee, department, and project information.
select emp_name,dept_name,pro_name from emp as e
join dept as d on e.dept_id = d.dept_id
join project as p on e.dept_id = p.dept_id;
-- Q134. Find the total project budget for each department.
select sum(p.budget) from project as p
left join dept as d
on p.dept_id = d.dept_id group by d.dept_id;
-- Q135. Find departments whose total project budget is greater than their department budget.
select d.dept_name from dept as d
left join project as p 
on d.dept_id = p.dept_id group by d.dept_id having sum(p.budget) > sum(d.budget);
-- Q136. Find employees whose salary is greater than the overall average salary.
select emp_name from emp where salary >(select avg(salary) from emp);
-- Q137. Find the employee or employees with the highest salary using a subquery.
select emp_name from emp where salary = (select max(salary) from emp);
-- Q138. Find the employee or employees with the lowest salary using a subquery.
select emp_name from emp where salary = (select min(salary) from emp);
-- Q139. Find employees who earn the same salary as Alice.
select emp_name from emp where salary = (select salary from emp where emp_name = 'Alice');
-- Q140. Find employees who earn more than Alice.
select emp_name from emp where salary > (select salary from emp where emp_name = 'Alice');
-- Q141. Find employees working in the same department as Alice.
select emp_name from emp where dept_id = (select dept_id from emp where emp_name = 'Alice');
-- Q142. Find employees whose salary is greater than the average salary of their department.
select emp_name from emp where salary > (select avg(salary) from emp where dept_id = dept_id);
-- Q143. Find employees whose salary is less than the average salary of their department.
select emp_name from emp where salary < (select avg(salary) from emp where dept_id = dept_id);
-- Q144. Find the department with the highest average salary using a subquery.
select dept_id from emp where salary > (select avg(salary) from emp);
-- Q145. Find departments whose average salary is greater than the company average salary.
select dept_id from emp group by dept_id having avg(salary) > (select avg(salary) from emp);
-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
select emp_name from emp as e
left join dept as d
on e.dept_id = d.dept_id 
where d.location = 'Hyderabad';
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXIST
select emp_name from emp where dept_id not in (select dept_id from emp);
-- Q148. Find departments that have at least one employee using EXISTS.
select dept_name from dept as d WHERE EXISTS (
    SELECT 1 
    FROM emp AS e 
    WHERE e.dept_id = d.dept_id
);
-- Q149. Find departments that have no employees using NOT EXISTS.
select dept_name from dept as d WHERE not EXISTS (
    SELECT 1 
    FROM emp AS e 
    WHERE e.dept_id = d.dept_id
);
-- Q150. Find employees whose salary is greater than every employee in the HR department.
select emp_name from emp where salary > all (select salary from emp where dept_id = 79);
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
select emp_name from emp where salary > any (select salary from emp where dept_id = 77);
-- Q152. Find the second-highest distinct salary using a subquery.
select max(salary) as sec from emp where salary < (select max(salary) from emp);
-- Q153. Find the third-highest distinct salary using a subquery.
select max(salary) as thr from emp where salary <(select max(salary) as sec from emp where salary < (select max(salary) from emp));
-- Q154. Find employees with the second-highest distinct salary.
select emp_name from emp where salary =(select max(salary) as sec from emp where salary < (select max(salary) from emp));
-- Q155. Use a correlated subquery to find employees earning above their department average.
select emp_name from emp where salary > (select avg(salary) from emp where dept_id = dept_id);
-- Q156. Create a CTE containing employees whose salary is greater than 60000.
with sal as 
(select * from emp where salary > 60000)
select emp_name from sal;
-- Q157. Use a CTE to calculate the company average salary and display employees earning above it.
with avg_com as 
(select avg(salary) as sal from emp)
select emp_name from emp as e 
cross join avg_com as a 
where e.salary > a.sal;
-- Q158. Use a CTE to calculate average salary by department.
with dep as 
(select dept_id,avg(salary) as de from emp group by dept_id)
select * from dep;
-- Q159. Use a CTE to find departments with average salary greater than 60000.
with av as 
(select avg(salary) as de from emp group by dept_id)
select dept_id from emp as e
cross join av as a where e.salary > a.de;
-- Q160. Create two CTEs: one for department statistics and one for high-paying departments.
WITH DeptStats AS (
    SELECT 
        dept_id,
        COUNT(emp_id) AS total_employees,
        AVG(salary) AS avg_department_salary,
        SUM(salary) AS total_department_salary
    FROM emp
    GROUP BY dept_id
),
Hig AS (
    SELECT 
        dept_id,
        total_employees,
        avg_department_salary,
        total_department_salary
    FROM DeptStats
    WHERE avg_department_salary > 60000
)
SELECT 
    dept_id,
    total_employees,
    ROUND(avg_department_salary, 2) AS avg_salary,
    ROUND(total_department_salary, 2) AS total_salary
FROM Hig;
-- Q161. Use a CTE to calculate total salary by city and filter cities above a chosen threshold.
with tol as
(select city,sum(salary) as tola from emp group by city)
select * from tol where tola > 100000;
-- Q162. Use a CTE to find the highest salary in each department 
with high as 
(select dept_id,max(salary) as sal from emp group by dept_id)
select * from high; 
-- Q163. Use a CTE to find employees earning above their department average.
with avg_s as
(select dept_id,avg(salary) as sal from emp group by dept_id)
select e.emp_name,e.salary from emp as e
inner join avg_s as a
on e.dept_id = a.dept_id
where e.salary > a.sal;
-- Q164. Use a CTE to rank employees by salary.
with es as 
(select emp_name,salary,RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM emp)
select * from es;
-- Q165. Use a CTE to find the top 2 highest-paid employees.
with es as 
(select emp_name,salary,RANK() OVER (ORDER BY salary DESC) AS salary_rank FROM emp)
select emp_name from es where salary_rank <= 2;
-- Q166. Use a CTE with ROW_NUMBER to find the highest-paid employee in each department.
WITH RankedEmployees AS (
    SELECT emp_id,dept_id,salary,ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS row_num FROM emp)
SELECT * FROM RankedEmployees WHERE row_num = 1;
-- Q167. Use a CTE with DENSE_RANK to find the second-highest salary in each department.
with es as 
(select emp_name,salary,dense_rank() OVER (ORDER BY salary DESC) AS salary_rank FROM emp)
select * from es where salary_rank = 2;
-- Q168. Create a CTE that joins employees and departments, then filter the result.
with sr as 
(select e.emp_name,e.salary,d.location from emp as e 
inner join dept as d 
on e.dept_id = d.dept_id)
select * from sr where location = 'Hyderabad' and salary > 10000;
-- Q169. Create a CTE containing departments with employee counts and filter departments with more than 3
-- employees.
with con as
(select dept_id,count(emp_name) as conu from emp group by dept_id)
select conu from con where conu >= 2;
-- Q170. Create multiple dependent CTEs where the second CTE uses the first CTE.
WITH Deptics AS (SELECT dept_id,AVG(salary) AS avg_salary,COUNT(emp_id) AS total_employees FROM emp GROUP BY dept_id),
Hig AS (SELECT dept_id,avg_salary,total_employees FROM Deptics ORDER BY avg_salary DESC LIMIT 1)
SELECT dept_id,ROUND(avg_salary, 2) AS top_avg_salary,total_employees FROM Hig;
-- Q171. Assign a unique row number to all employees ordered by salary descending.
select emp_name,salary,row_number() over(order by salary desc) as ros from emp;
-- Q172. Assign a row number to employees within each department ordered by salary descending.
select emp_name,salary,dept_id,row_number() over(order by salary desc) as rew from emp;
-- Q173. Rank employees by salary using RANK().
select salary,rank() over(order by salary desc) as ranking from emp;
-- Q174. Rank employees by salary using DENSE_RANK().
select salary,dense_rank() over(order by salary desc) as den from emp;
-- Q175. Compare ROW_NUMBER, RANK, and DENSE_RANK on duplicate salary values.
select salary,row_number()over(order by salary desc) as rew ,rank() over(order by salary desc) as ranking,
dense_rank() over(order by salary desc) as den from emp;
-- Q176. Display the company average salary beside every employee using AVG() OVER().
select emp_name,avg(salary) over() from emp;
-- Q177. Display the department average salary beside every employee using PARTITION BY.
select emp_name,avg(salary) over(partition by dept_id) from emp;
-- Q178. Calculate a running total of salary ordered by hire_date.
SELECT emp_id,emp_name,hire_date,salary,SUM(salary) OVER (ORDER BY hire_date, emp_id) AS run_to_sal FROM emp;
-- Q179. Use LAG() to display the previous employee's salary when ordered by hire_date.
SELECT emp_id,emp_name,hire_date,salary,lag(salary) OVER (ORDER BY hire_date, emp_id) AS pre FROM emp;
-- Q180. Use LEAD() to display the next employee's salary when ordered by hire_date.
SELECT emp_id,emp_name,hire_date,salary,lead(salary) OVER (ORDER BY hire_date, emp_id) AS nex FROM emp;
-- Q181. Find the top 3 highest-paid employees in every department, including ties if appropriate. Hint: Compare
-- ROW_NUMBER, RANK, and DENSE_RANK before choosing one
with high as
(select emp_name,salary,dept_id,row_number() 
over(partition by dept_id order by salary desc) as ms from emp)
select emp_name,salary,dept_id from high order by ms <= 3;
-- Q182. Find the employee whose salary is closest to the average salary of their department. Hint: Calculate
-- department average with a window function, then compare absolute differences

