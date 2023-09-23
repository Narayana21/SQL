select last_name from employees where salary =x (select max(salary) from employees);
select name,cgpa from ece where cgpa in (select max(cgpa) from ece);

select name,cgpa from cse where cgpa in (select max(cgpa) from cse);

select * from cse where gender='F' ;--where name like '%Amurtha%';

select * from employees;

select e.department_id,d.department_name,max(salary), sum(salary) 
from employees e join departments d
on e.department_id = d.department_id 
where e.department_id is not null
group by e.department_id ,d.department_name
having sum(salary)>50000
order by e.department_id;


