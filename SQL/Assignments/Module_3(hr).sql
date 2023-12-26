-- 1. Write a query that displays the employee's last names only from the string's 2-5th position with the first letter capitalized and all other letters lowercase, Give each column an appropriate label.     
     select CONCAT(UPPER(SUBSTRING(last_name,2,1)),LOWER(SUBSTRING(last_name,3,5))) as Lname
     from employees;
     
-- 2. Write a query that displays the employee's first name and last name along with a " in between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displaysthe month on which the employee has joined.  
     select concat(first_name,' - ',last_name),month(hire_date) from employees;
     
-- 3. Write a query to display the employee's last name and if half of the salary is greater than ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 1500 each. Provide each column an appropriate label.   
      select last_name,salary,
      case 
      when (salary/2)>10000 then salary*1.1+1500
      else (salary*1.115)+1500
      end as new_salary
	  from employees;
      
-- 4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, department id, salary and the employee name all in Upper case, if the employee name consists of 'z' replace it with '$!   
       SELECT CONCAT(LEFT(employee_id, 2), '00',mid(employee_id,3), 'E') AS new_emp_id,department_id,salary,
       REPLACE(UPPER(first_name), 'A', '$!') AS ename FROM employees;

-- 5. Write a query that displays the employee's last names with the first letter capitalized and all other letters lowercase, and the length of the names, for all employees whose name starts with J, A, or M. Give each column an appropriate label. Sort the results by the employees' last names   
     select CONCAT(UPPER(SUBSTRING(last_name,1,1)),LOWER(SUBSTRING(last_name,2))) AS LNAME,char_length(concat(first_name,last_name)) as len from employees
     WHERE first_name LIKE 'J%'OR first_name LIKE 'M%'OR first_name LIKE 'A%' 
     ORDER BY first_name ;
     
-- 6. Create a query to display the last name and salary for all employees. Format the salary to be 15 characters long, left-padded with $. Label the column SALARY   
    select last_name, LPAD(salary,15,'$') AS "SALARY" 
    from employees;
    
-- 7. Display the employee's name if it is a palindrome   
     select first_name from employees
	 WHERE first_name=REVERSE(first_name);

-- 8) Display First names of all employees with initcaps. 
 select concat(upper(substring(first_name,1,1)),lower(substring(first_name,2))) as initacaps from employees;
 
 -- 9) From LOCATIONS table, extract the word between first and second space from the STREET ADDRESS column.
select substring(street_address,position(' ' in street_address ),position(' ' in street_address )) as sub_string from locations;  

-- 10.Extract first letter from First Name column and append it with the Last Name. Also add "@systechusa.com" at the end. Name the column as e-mail address.All characters should be in lower case.  Display this along with their First Name.   
       select CONCAT(lower(LEFT(first_name, 1)),lower(last_name),'@systechusa.com') as email_address,first_name 
       from employees;

-- 11) Display the names and job titles of all employees with the same job as sales.
select e.first_name,e.last_name,j.job_title from employees as e join jobs as j 
on e.job_id=j.job_id
where j.job_title like "sales%";

-- 12) Display the names and department name of all employees working in the same city as Trenna.

select e.first_name,e.last_name,d.department_name,l.city from employees as e 
join departments as d 
on e.department_id=d.department_id
join locations as l
on l.location_id=d.location_id
where l.city = "trenna";

-- 13. Display the name of the employee whose salary is the lowest.   
      SELECT first_name FROM employees 
      Where salary = (SELECT MIN(salary) FROM employees);
      
-- 14. Display the names of all employees except the lowest paid.
      SELECT first_name FROM employees 
      Where salary != (SELECT MIN(salary) FROM employees);