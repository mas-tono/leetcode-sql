/* Write your T-SQL query statement below */

-- look for unregistered manager from employee list
-- compare employee list-manager VS unregistered manager & salary

select employee_id
from Employees
where manager_id in (select e1.manager_id
                from Employees e1
                left join Employees e2
                on e1.manager_id = e2.employee_id
                where e1.manager_id is not null and e2.employee_id is null) and salary < 30000
order by employee_id