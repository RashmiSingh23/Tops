-- 1) Display the maximum, minimum and average salary and commission earned.    
select max(salary),min(salary),avg(salary),sum(commission_pct) from employees;

-- 2) Display the department number, total salary payout and total commission payout for each department.  
select department_id,sum(salary),sum(commission_pct) from employees
group by department_id;
   
-- 3) Display the department number and number of employees in each department. 
select department_id,count(*) from employees
group by department_id;

-- 4) Display the department number and total salary of employees in each department.   
select department_id,sum(salary) from employees
group by department_id;

-- 5) Display the employee's name who doesn't earn a commission. Order the result set without using the column name   
select concat(first_name,last_name)as Name from employees
where commission_pct is null;

-- 6) Display the employees name, department id and commission. If an Employee doesn't earn the commission, then display as 'No commission'. Name the columns appropriately 
select concat(first_name,last_name)as Name,department_id,
ifnull (commission_pct,'no commission') as commission from employees;

-- 7) Display the employee's name, salary and commission multiplied by 2. If an Employee doesn't earn the commission, then display as 'No commission. Name the columns appropriately  
select concat(first_name,last_name)as Name,salary,
case
  when commission_pct is null then 'No commission'
  else commission_pct * 2
end as Commission
from employees;

-- 8)Display the employee's name, department id who have the first name same as another employee in the same department  
select e1.first_name, e1.Department_id
from employees as e1
where e1.first_name IN (
    select first_name
    from employees as e2
    where e1.Department_id = e2.Department_id
    group by first_name
    having COUNT(*) > 1);

-- 9) Display the sum of salaries of the employees working under each Manager.   
select manager_id,sum(salary) from employees
group by manager_id
having manager_id is not null;

-- 10) Select the Managers name, the count of employees working under and the department ID of the manager.   
select manager_id,count(*),department_id from employees
group by manager_id,department_id;

-- 11)Select the employee name, department id, and the salary. Group the result with the manager name and the employee last name should have second letter 'a!   
select concat(first_name,' ',last_name)as Name,department_id,salary  from employees
where last_name like '_a%';

 -- manager name doesn't exist in the table---

-- 12) Display the average of sum of the salaries and group the result with the department id. Order the result with the department id.   
select department_id,sum(salary) from employees
group by department_id;

-- 13) Select the maximum salary of each department along with the department id   
select department_id,max(salary) from employees
group by department_id;

-- 14) Display the commission, if not null display 10% of salary, if null display a default value 1 
select 
case
  when commission_pct is null then 1
  else salary*0.1
end as Commission
from employees;