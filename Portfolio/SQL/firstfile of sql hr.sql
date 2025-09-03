show databases;
Use hr;
select * from departments;
# * means all
select * from employees;
select department_id, location_id from departments;
select last_name, salary, salary+300 from employees;
select last_name, salary * 12 from employees;

select last_name, salary, 12*salary+100 from employees;
SELECT 
    last_name, salary, 12 * (salary + 100)
FROM
    employees;
    SELECT 
    last_name, job_id, salary, commission_pct
FROM
    employees;
    SELECT
    last_name, 12*salary*commission_pct
    FROM
    employees;
select 
last_name AS name, commission_pct comm
From 
employees;
select 
last_name As "Peculiar", commission_pct "tale" 
from employees;
select 
last_name "Name", salary*12 "Annual salary" 
from employees;
SELECT 
    department_id
FROM
    employees;
select
distinct department_id 
from 
employees;
select 
last_name, job_id, department_id
from employees
where last_name = 'Whalen';
select last_name 
from employees 
where hire_date = '1997-06-17';
select hire_date 
from employees;
select last_name 
from employees 
where hire_date = '1987-06-17';
select last_name, salary 
from employees
where salary <= 3000;
select 
last_name, salary
from employees
where salary between 2500 and 3500;
select 
employee_id, last_name, salary, manager_id
from employees
where manager_id IN (100,101,201);
	select 
employee_id, last_name, salary, manager_id
from employees
where manager_id IN (100,101,201);
select  
first_name
from employees 
where first_name like 's%';
select  
first_name
from employees 
where first_name like '_o%';
select last_name, manager_id
from employees
where manager_id IS NULL ;
select last_name, manager_id
from employees 
where manager_id is null;
select employee_id, last_name, job_id, salary
from employees
where salary >= 10000
OR Job_id LIKE '%MAN%'; 
select 
last_name, lower(last_name),ucase(last_name)
 from employees;
 select job_id, left(job_id,2)department,substring(job_id,4)job_title
 from employees;