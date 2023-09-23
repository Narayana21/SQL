--practice-6


--1. Write a query for the HR department to produce the addresses of all the departments. Use the 
--LOCATIONS and COUNTRIES tables. Show the location ID, street address, city, state or 
--province, and country in the output. Use a NATURAL JOIN to produce the results

--select * from locations;
--select * from countries;

-- with ON clause
select l.location_id, l.street_address,l.city,l.state_province ,c.country_name
from locations l  join countries c on l.country_id=c.country_id;

-- with NATURAL JOIN (OPTIONAL USING CLAUSE)
select location_id, street_address,city,state_province,country_name
from locations  Natural join countries;

--The HR department needs a report of all employees. Write a query to display the last name, 
--department number, and department name for all the employees.

select e.last_name,e.department_id,d.department_name from employees e join departments d 
on e.department_id = d.department_id;


--The HR department needs a report of employees in Toronto. Display the last name, job, 
--department number, and the department name for all employees who work in Toronto

select e.last_name,e.job_id,e.department_id,d.department_name from employees e join departments d 
on e.department_id = d.department_id join locations l on l.location_id = d.location_id where l.city='Toronto';

--Create a report to display employees’ last name and employee number along with their 
--manager’s last name and manager number. Label the columns Employee, Emp#, Manager, 
--and Mgr#, respectively. Save your SQL statement as lab_06_04.sql. Run the query

select w.last_name employee,w.employee_id "#EMP", m.last_name manager,m.employee_id "#MGR" from employees w left join employees m 
on m.employee_id = w.manager_id order by 2;


SELECT worker.last_name emp,worker.employee_id emp, manager.last_name mgr,manager.employee_id mgr
FROM employees worker JOIN employees manager
ON (worker.manager_id = manager.employee_id);


--Create a report for the HR department that displays employee last names, department 
--numbers, and all the employees who work in the same department as a given employee. Give 
--each column an appropriate label. Save the script to a file named lab_05_06.sql.



select e.department_id,e.last_name employee,c.last_name colleague
from employees e join employees c
on e.department_id=c.department_id 
where
e.employee_id!=c.employee_id
order by 1 ,2, 3;





--The HR department needs a report on job grades and salaries. To familiarize yourself with the 
--JOB_GRADES table, first show the structure of the JOB_GRADES table. Then create a query 
--that displays the name, job, department name, salary, and grade for all employees.

desc JOB_GRADES;
--ERROR:
--ORA-04043: object JOB_GRADES does not exist

--EXTRA CHALLENGE

--The HR department wants to determine the names of all the employees who were hired after 
--Davies. Create a query to display the name and hire date of any employee hired after employee 
--Davies.

select last_name ,hire_date from employees where last_name='Davies';

SELECT e.last_name, e.hire_date 
FROM   employees e JOIN employees davies 
ON     (davies.last_name = 'Davies') 
WHERE  davies.hire_date < e.hire_date;


--The HR department needs to find the names and hire dates of all the employees who were hired 
--before their managers, along with their managers’ names and hire dates. Save the script to a file 
--named lab_06_09.sql.

select e.last_name,e.hire_date,m.last_name,m.hire_date from employees e join employees m
on e.manager_id=m.employee_id 
where e.hire_date<m.hire_date;