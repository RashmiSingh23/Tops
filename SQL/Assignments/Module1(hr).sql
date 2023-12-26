-- 1.Display all information of table EMP and DEPT.
select * from employees,departments;

-- 2.Display only the hire date and employee name for each employee.
select concat(first_name,last_name) as Name, hire_date 
from employees;

-- 3.Display the ename concatenated with job id,separated by a comma and space and name the column employee_title.
select concat_ws(' , ',first_name,job_id) as employee_title 
from employees;

-- 4.Display hire date,name and department number of all clerks.
select hire_date,concat(first_name,last_name) as Name, department_id from employees
where job_id in ('PU_CLERK','ST_CLERK','SH_CLERK');

-- 5.display all the data from the employee table sepearated by a comma.Name the column THE_OUTPUT.
select concat_ws(",",first_name,last_name,job_id,hire_date,salary,manager_id,department_id) as THE_OUTPUT from employees;

-- 6.Display the name and salaries of all employees with a salary greater than 20000.
select first_name,salary from employees
where salary > 20000;
 
-- 7.Display the names and dates of employees with the column headers"Name" and "startDate".
select concat(first_name,last_name) as Name, hire_date as StartDate from employees;

-- 8.Display the names and hiredate in the order they hired. 
select concat(first_name,last_name) as Name, hire_date from employees
order by hire_date asc;
 
-- 9.Display the names and salaries of all employees in reverse salary order. 
select concat(first_name,last_name) as Name,salary from employees
order by salary desc;

-- 10. Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.   
select concat(first_name,last_name) as ename,department_id from employees
where commission_pct is not null
order by salary desc;

-- 11. Display the last name and job title of all employees who do not have a manager   
select last_name,job_id from employees
where job_id not in ('MK_MAN','PU_MAN','ST_MAN','SA_MAN');

-- 12. Display the last name, job, and salary for all employees whose job is sales representative or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000
select last_name,job_id,salary from employees
where job_id IN ('SA_REP','ST_CLERK') AND salary NOT IN (2500,3500,5000);
