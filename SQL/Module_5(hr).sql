-- 1. Write a query to display the last name and hire date of any employee in the same department as SALES.   
   select last_name,hire_date,department_name
   from departments,employees
   where department_name='sales';
   
-- 2. Create a query to display the employee numbers and last names of all employees who earn more than the average salary. Sort the results in ascending order of salary.   
    select  employee_id,last_name,salary from employees
    where salary > (select avg(salary) from employees) 
    order by salary ;
    
-- 3. Write a query that displays the employee numbers and last names of all employees who work in a department with any employee whose last name contains a' u   
	SELECT employee_id, last_name
	FROM employees
	WHERE department_id IN 
         (SELECT department_id FROM employees WHERE last_name like '%u%');
    
-- 4. Display the last name, department number, and job ID of all employees whose department location is ATLANTA.   
      select last_name,department_id,job_id,city
      from employees,locations
      where city='Atlanta';
      
-- 5. Display the last name and salary of every employee who reports to FILLMORE.   
      	
-- 6. Display the department number, last name, and job ID for every employee in the OPERATIONS department.   
   	SELECT e.department_id,e.last_name,e.job_id,d.department_name 
    from employees e join departments d
    where department_name='Operations';
    
-- 7. Modify the above query to display the employee numbers, last names, and salaries of all employees who earn more than the average salary and who work in a department with any employee with a 'u'in their name.   
	SELECT employee_id, last_name, salary
	FROM employees
	WHERE department_id IN (SELECT department_id FROM employees WHERE last_name like '%u%') AND salary > (SELECT AVG(salary)FROM employees);
    
-- 8. Display the names of all employees whose job title is the same as anyone in the sales dept.   
      select first_name from employees
      where job_id=(select job_id from jobs where job_title= 'sales');
      
-- 9. Write a compound query to produce a list of employees showing raise percentages,employee IDs, and salaries.Employees in department 1 and 3 are given a 5% raise,employees in department 2 are given a 10% raise, employees in departments 4 and 5 are given a 15% raise,and employees in department 6 are not given a raise.   
    select employee_id,salary,
    case
     when department_id in (1,3) then salary*1.05
     when department_id= 2 then salary*1.10
	 when department_id in (4,5) then salary*1.15
     when department_id= 6 then salary
     else salary
	end as raise_percentage
    from employees;
 
-- 10. Write a query to display the top three earners in the EMPLOYEES table. Display their last names and salaries.   
      select last_name,salary from employees
      order by salary desc
	  limit 3;
      
-- 11. Display the names of all employees with their salary and commission earned. Employees with a null commission should have O in the commission column   
       select concat(first_name,last_name),salary,
       ifnull (commission_pct,0) as commission from employees;
       
-- 12. Display the Managers (name) with top three salaries along with their salaries and department information. 
       -- manager name doesn't exist in the table---




