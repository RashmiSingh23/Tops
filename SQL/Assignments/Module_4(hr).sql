-- 1. Write a query to display the last name, department number, department name for all employees.
    SELECT E.last_name, E.department_id, D.department_name 
    FROM employees E 
    JOIN departments D 
    ON E.department_id = D.department_id;
    
-- 2. Create a unique list of all jobs that are in department 40. Include the location of the department in the output.   
select distinct(d.department_name) ,l.city, l.location_id from departments as d
join locations as l
on d.location_id=l.location_id;

-- since this dataset is not containing departmnet number   
-- if it was there the query will be like 

select distinct(d.department_name) ,l.city, l.location_id from departments as d
join locations as l
on d.location_id=l.location_id
where d.department_number=4;

-- 3. Write a query to display the employee last name,department name,location id and city of all employees who earn commission.   
	SELECT e.last_name, d.department_name, d.location_id, l.city
	FROM employees e, departments d, locations l
	WHERE e.department_id = d.department_id
	AND d.location_id = l.location_id
	AND e.commission_pct IS NOT NULL;
    
-- 4. Display the employee last name and department name of all employees who have an 'a' in their last name   
	   SELECT last_name, department_name
	   FROM employees, departments
	   WHERE employees.department_id = departments.department_id
	   AND last_name LIKE '%a%';

-- 5. Write a query to display the last name,job,department number and department name for all employees who work in ATLANTA..   
   SELECT e.last_name, e.job_id, e.department_id,d.department_name
   FROM employees e JOIN departments d
   ON e.department_id = d.department_id
   JOIN locations l
   ON d.location_id = l.location_id
   WHERE l.city = 'ATLANTA';
   
-- 6. Display the employee last name and employee number along with their manager's last name and manager number. 

select last_name ,employee_id , manager_id from employees
where manager_id is not null; 

-- since there is no managers last_name 
-- if it wass there then query looks like

select last_name ,employee_id , manager_last_name, manager_id from employees
where manager_id is not null; 

-- 7. Display the employee last name and employee number along with their manager's last name and manager number (including the employees who have no manager). 

-- since there is no managers last_name 
-- if it wass there then query looks like

select last_name ,employee_id , manager_last_name, manager_id from employees
where manager_id is not null; 
        
-- 8. Create a query that displays employees last name,department number,and all the employees who work in the same department as a given employee.   
	SELECT department_id,last_name,count(*) from employees
    group by department_id,last_name;
    
-- 9. Create a query that displays the name,job,department name,salary,grade for all employees. Derive grade based on salary(>=5000=A, >=3000=B,<3000=C) 
select e.first_name ,e.last_name , j.job_title , d.department_name , e.salary ,
case 
	when salary >= 5000 then "A"
    when salary >= 3000 then "B"
    else "C"
    end as Grade
from employees as e
join departments as d
on e.department_id=d.department_id
join jobs as j 
on j.job_id=e.job_id;
      
      
-- 10. Display the names and hire date for all employees who were hired before their managers along withe their manager names and hire date.Label the columns as Employee name, emp_hire_date,manager name,man_hire_date      
         -- manager name doesn't exist in the table---
