/* Write your T-SQL query statement below */
with firstt as (select reports_to, 
                count(reports_to) as reports_count , 
                round(avg(age * 1.0) , 0) as average_age 
from Employees
where reports_to is not null
group by reports_to)

select e.employee_id, 
        e.name, 
        f.reports_count, 
        f.average_age
from firstt f
left join Employees e
on f.reports_to = e.employee_id