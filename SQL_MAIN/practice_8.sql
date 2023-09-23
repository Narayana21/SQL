-- PRACTICE - 8 

-- The HR department needs a list of department IDs for departments that do not contain the job 
--ID ST_CLERK. Use the set operators to create this report

-- FROM NET

select department_id from departments
minus
select  department_id from employees
where job_id = 'ST_CLERK';
---================================================================================================================================
--The HR department needs a list of countries that have no departments located in them. Display 
--the country ID and the name of the countries. Use the set operators to create this report.
--c_id,c_name no depts

--select * from countries;
--select * from departments;
--select * from locations;

--own 

select country_id,country_name from countries
minus
(select c.country_id,c.country_name from countries c , locations l ,departments d
where c.country_id=l.country_id
and l.location_id=d.location_id);

--from net
SELECT
	country_id,
	country_name
FROM
	countries MINUS
	SELECT
		l.country_id,
		c.country_name
	FROM
		locations l
		JOIN countries c ON (l.country_id = c.country_id)
		JOIN departments d ON d.location_id = l.location_id;

--from net   
SELECT country_id,country_name
FROM countries
MINUS
SELECT l.country_id,c.country_name
FROM locations l JOIN countries c
ON (l.country_id = c.country_id)
JOIN departments d
ON d.location_id=l.location_id;

--==================================================================================================================
--Produce a list of jobs for departments 10, 50, and 20, in that order. Display the job ID and 
--department ID by using the set operators

-- FROM NET

SELECT distinct job_id, department_id
FROM employees
WHERE department_id = 10
UNION 
SELECT DISTINCT job_id, department_id
FROM employees
WHERE department_id = 50
UNION 
SELECT DISTINCT job_id, department_id
FROM employees
WHERE department_id = 20;


--ON OWN

-- HERE ORDER DOSE NOT FOLLOW LIKE 10 50 20

select distinct job_id, department_id from employees
intersect
select distinct job_id,department_id from employees 
where department_id in (10,50,20);

--=========================================================================================================

--Create a report that lists the employee IDs and job IDs of those employees who currently have a 
--job title that is the same as their job title when they were initially hired by the company (that is, 
--they changed jobs but have now gone back to doing their original job)

--select * from job_history;

--OWN

select employee_id,job_id from employees
intersect
select employee_id,job_id from job_history;

--=====================================================================================================================


-- The HR department needs a report with the following specifications:
--• Last name and department ID of all employees from the EMPLOYEES table, regardless of 
--whether or not they belong to a department
--• Department ID and department name of all departments from the DEPARTMENTS table, 
--regardless of whether or not they have employees working in them
--Write a compound query to accomplish this.

-- on own
select last_name,department_id,to_char(null) department_name from employees
union 
select to_char(null) last_name ,department_id,department_name from departments;


-- from net

SELECT last_name,department_id,TO_CHAR(null)
FROM employees
UNION
SELECT TO_CHAR(null),department_id,department_name
FROM departments;










