-- Q1. Create a database named company_db
CREATE DATABASE company_db;

-- Q2. Select and use the company_db database
USE company_db;

-- Q3–Q8. Create employees table with constraints
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,              
    employee_name VARCHAR(100) NOT NULL,      
    department_id INT,
    salary DECIMAL(10,2) CHECK (salary > 0),  
    city VARCHAR(50) DEFAULT 'Hyderabad',     
    hire_date DATE,
    email VARCHAR(100) UNIQUE                 
);

-- Q9–Q10. Create departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(12,2)
);

-- Q11. Create projects table
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    department_id INT,
    budget DECIMAL(12,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Q12. Add FOREIGN KEY from employees.department_id to departments.department_id
ALTER TABLE employees
ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments(department_id);


-- Q13. Insert one employee record
INSERT INTO employees (employee_id, employee_name, department_id, salary, city, hire_date, email)
VALUES (1, 'Ravi Kumar', 101, 50000, 'Hyderabad', '2024-06-01', 'ravi.kumar@example.com');

-- Q14. Insert five employee records in a single INSERT
INSERT INTO employees (employee_id, employee_name, department_id, salary, employee_city, hire_date, email)
VALUES
(7, 'abhi Sharma', 110, 80000, 'Delhi', '2025-07-01', 'abhi.sharma@example.com'),
(8, 'abhinav Reddy', 111, 58000, 'hyd', '2023-07-15', 'abhinav.reddy@example.com'),
(9, 'Meeta Gupta', 112, 90000, 'Mumbai', '2026-08-01', 'meeta.gupta@example.com'),
(10, 'Alter Singh', 113, 76000, 'hyd', '2022-08-10', 'alter.singh@example.com'),
(11, 'ram Nair', 114, 95000, 'Chennai', '2021-08-20', 'ram.nair@example.com');
select * from employees;

-- Q15. Insert a department record
INSERT INTO departments (department_id, department_name, location, budget)
VALUES (113, 'Sales', 'Hyderabad', 2000000),
(115, 'HR', 'Delhi', 1500000),
(116, 'IT', 'Mumbai', 3000000),
(117, 'Finance', 'Chennai', 2500000);

-- Q16. Create students table with constraints
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age > 0),
    city VARCHAR(50) DEFAULT 'Hyderabad'
);

-- Q17. Create attendance table
CREATE TABLE attendance (
    employee_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);


-- Q18. Create a table only if it does not already exist
CREATE TABLE IF NOT EXISTS projects_backup (
    project_id INT,
    project_name VARCHAR(100)
);

-- Q19. Describe/display structure of employees table
DESCRIBE employees;

-- Q20. Drop a temporary table named temp_data if it exists
DROP TABLE IF EXISTS temp_data;

-- 2. Basic SELECT & Filtering (21–45)
-- Q21. Display all columns from the employees table.
select * from employees;

-- Q22. Display only employee_name and salary.
select employee_name,salary from employees;

-- Q23. Display employees who live in Hyderabad.
select * from employees where city = "hyderabad";

-- Q24. Display employees whose salary is greater than 60000.
select * from employees where salary > 60000;

-- Q25. Display employees whose salary is less than or equal to 50000.
select * from employees where salary <=50000;

-- Q26. Display employees whose salary is between 50000 and 70000.
select * from employees where salary between 5000 and 70000;

-- Q27. Display employees who live in Hyderabad, Bangalore, or Mumbai using IN.
select * from employees where city in ('hyderabad','bangalore','mumbai');

-- Q28. Display employees who do not live in Hyderabad.
select * from employees where city !='hyderabad';

-- Q29. Display employees whose names start with 'A'.
select * from employees where employee_name like "a%";

-- Q30. Display employees whose names end with 'a'.
select * from employees where employee_name like "%a";

-- Q31. Display employees whose names contain the letter 'i'.
select * from employees where employee_name like  "%i%";

-- Q32. Display employees whose department is NULL.
select * from employees where department_id = null;

-- Q33. Display employees whose department is NOT NULL.
select * from employees where department_id is not null;

-- Q34. Display employees hired after 2022-01-01.
select * from employees where hire_date > '2024-06-10'; 

-- Q35. Display employees hired between two given dates.
select * from employees where hire_date between "2024-07-01" and"2024-08-10";

-- Q36. Display employees with salaries greater than 50000 AND who live in Hyderabad.
select * from employees where salary > 50000 and city = 'hyderabad';

-- Q37. Display employees who live in Hyderabad OR earn more than 70000.
select * from employees where  city = 'hyderabad' or salary >70000;

-- Q38. Display employees who are NOT in the HR department.
select * from employees as e
right join departments as d
on e.department_id = d.department_id where department_name != 'hr';

-- Q39. Display distinct cities from the employees table.
select distinct city from employees ;

-- Q40. Display distinct departments from the employees table.
select distinct department_id from employees ;

-- Q41. Display employees sorted by salary in ascending order.
select * from employees order by salary ;

-- Q42. Display employees sorted by salary in descending order.
select * from employees order by salary desc ;

-- Q43. Display employees sorted first by department and then by salary descending.
select * from employees order by department_id desc, salary desc ;

-- Q44. Display the first 5 employees after sorting by employee_id.
select * from employees order by employee_id desc limit 5;

-- Q45. Display the top 3 highest-paid employees.
select * from employees order by salary desc limit 3;

-- 3. UPDATE, DELETE, ALTER & Basic Functions (46–65)
-- Q46. Update the salary of one employee using employee_id.
update employees set  salary = 52000 where employee_id=5;

-- Q47. Increase the salary of all employees by 10 percent.
update employees set salary = salary+(salary*0.10) ;

-- Q48. Increase the salary of employees in the Data Science department by 5000.
update employees set salary =salary+5000 
where department_id =
(select department_id from departments where department_name="hr");

-- Q49. Change the city of all employees currently living in Bangalore to Bengaluru.
update employees set city="hyd" where city = "hyderabad";

-- Q50. Delete one employee using employee_id.
delete from employees where employee_id = 3;

-- Q51. Delete employees whose salary is below a specified amount.
delete from employees where salary < 56000;

-- Q52. Add an email column to the employees table.


-- Q53. Add a phone_number column to the employees table.
alter table employees add column phone_num bigint not null;

-- Q54. Modify the length of the employee_name column.
alter table employees modify employee_name varchar(50) ;

-- Q55. Rename the city column to employee_city.
alter table employees change column city  employee_city varchar(30) not null;

-- Q56. Drop the phone_number column.
alter table employees
drop column phone_num ;

-- Q57. Display employee names in uppercase.
select upper(employee_name) from employees;

-- Q58. Display employee names in lowercase.
select lower(employee_name) from employees;

-- Q59. Display the length of every employee name.
select length(employee_name) from employees;

-- Q60. Display the first three characters of every employee name.
select left(employee_name,3) from employees;

-- Q61. Display employee_name and salary rounded to the nearest thousand using an appropriate expression.
select employee_name ,round(salary,-3) from employees;

-- Q62. Display the current date.
select current_date();

-- SQL Practice Bank • Page 2
-- Q63. Calculate how many years each employee has worked using hire_date.
select  timestampdiff(year,hire_date,curdate()) as emp_worked from employees ;
 
-- Q64. Replace NULL department values with 'Unassigned' in the query result.
select employee_id,employee_name,ifnull(department_id, 'Unassigned') as department
from employees;

-- Q65. Use CASE to label employees as Low, Medium, or High salary based on salary ranges
select employee_name ,salary , 
case 
when salary < 70000 then "low"
when salary >70000 and salary < 73000 then "medium"
when salary > 73000 then "high"  
end as employee_id from employees ;

-- 4. Aggregate Functions, GROUP BY & HAVING (66–90)
-- Q66. Find the total number of employees.
select count(*) from employees;

-- Q67. Find the total salary paid to all employees.
select sum(salary) from employees;

-- Q68. Find the average salary of all employees.
select avg(salary) from employees;

-- Q69. Find the highest salary.
select max(salary) from employees;

-- Q70. Find the lowest salary.
select min(salary) from employees;

-- Q71. Find the number of employees in Hyderabad.
select count(*) from employees where employee_city = "hyd";

-- Q72. Find the total salary paid to employees in Mumbai.
select sum(salary) from employees where employee_city = "delhi";

-- Q73. Find the average salary of employees in Bangalore.
select avg(salary) from employees where employee_city = "hyd";

-- Q74. Find the number of employees in each department.
select count(*),department_id from employees group by department_id;

-- Q75. Find the average salary in each department.
select avg(salary),department_id from employees group by department_id;

-- Q76. Find the maximum salary in each department.
select max(salary),department_id from employees group by department_id;

-- Q77. Find the minimum salary in each department.
select min(salary),department_id from employees group by department_id;

-- Q78. Find the total salary in each department.
select sum(salary) , department_id from employees group by department_id;

-- Q79. Find the number of employees in each city.
select count(*) from employees group by employee_city;

-- Q80. Find the average salary in each city.
select avg(salary) from employees group by employee_city;

-- Q81. Find departments having more than 5 employees.
select department_id from employees group by department_id having count(employee_name) >5;

-- Q82. Find departments whose average salary is greater than 60000.?
select department_id, salary from employees  where salary > ( select avg(salary) from employees);

-- Q83. Find cities whose total salary is greater than 200000.
select location from departments where employees.salary  > 200000 ;

-- Q84. Find the department with the highest total salary.
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;

-- Q85. Find the department with the highest average salary.
SELECT department_id, AVG(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
LIMIT 1;

-- Q86. Display employee count and average salary for each department and city combination.
SELECT department_id, employee_city,
       COUNT(*) AS employee_count,
       AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id, employee_city;

-- Q87. Find the difference between the maximum and minimum salary in each department.
select department_id,max(salary) - max(salary) as diff from employees as e 
group by department_id;

 -- /////////////////
select d.department_name , max(salary) - max(salary) as diff from employees e 
join departments d
on e.department_id= d.department_id
group by department_name;

-- Q88. Find departments where the maximum salary is greater than 70000.
select max(salary) ,d.department_name from employees e join departments d
on e.department_id= d.department_id
group by department_name
having max(salary) > 70000;

-- Q89. Find cities having at least 3 employees with salary above 60000.

select count(*),employee_city  from employees 
where salary > 60000
group by employee_city
having count(*) >=3;


-- Q90. Find the total number of distinct departments and distinct cities.
select distinct department_name from departments;

select avg(salary) from employees;

-- Q136. Find employees whose salary is greater than the overall average salary.
select employee_name , salary from employees where salary > (select avg(salary) from employees);

-- Q137. Find the employee or employees with the highest salary using a subquery.
select employee_name, salary from employees where salary=(select max(salary) from employees) ;

-- Q138. Find the employee or employees with the lowest salary using a subquery.
select employee_name, salary from employees where salary=(select min(salary) from employees) ;

-- Q139. Find employees who earn the same salary as Alice.
select employee_name, salary from employees where salary=(select salary from employees where employee_name ='alter singh') ;

-- Q140. Find employees who earn more than Alice.
select employee_name, salary from employees where salary>(select salary from employees where employee_name ='alter singh') ;

-- Q141. Find employees working in the same department as Alice.
select employee_name , department_id from employees
where department_id = 
(select department_id from employees 
where employee_name ='arjun singh');

-- Q142. Find employees whose salary is greater than the average salary of their department.
select employee_name,salary from employees e where salary >
(select avg(salary)from employees  where department_id = e.department_id) ;

-- Q143. Find employees whose salary is less than the average salary of their department.
select employee_name,salary from employees e where salary <
(select avg(salary)from employees  where department_id = e.department_id) ;

-- Q144. Find the department with the highest average salary using a subquery.
select department_id , avg(salary) as avg_sal from employees 
group by department_id 
having avg(salary) = (select max(dept_sal) 
from (select avg(salary) as dept_sal from employees group by department_id) as t);

-- Q145. Find departments whose average salary is greater than the company average salary.
select department_id,avg(salary) as avg_sal from employees 
group by department_id
having avg_sal > (select avg(salary) as com_sal from employees);

-- Q146. Find employees who work in departments located in Hyderabad using a subquery.
select employee_name, employee_city from employees where department_id in (select employee_name from employees where employee_city = "hyd");
-- Q147. Find employees who do not belong to any existing department using NOT IN or NOT EXISTS.
-- Q148. Find departments that have at least one employee using EXISTS.
-- Q149. Find departments that have no employees using NOT EXISTS.
-- Q150. Find employees whose salary is greater than every employee in the HR department.
-- Q151. Find employees whose salary is greater than at least one employee in the Finance department.
-- Q152. Find the second-highest distinct salary using a subquery.
-- Q153. Find the third-highest distinct salary using a subquery.
-- Q154. Find employees with the second-highest distinct salary.
-- Q155. Use a correlated subquery to find employees earning above their department average.





