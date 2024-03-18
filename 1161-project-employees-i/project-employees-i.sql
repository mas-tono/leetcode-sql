/* Write your T-SQL query statement below */
-- round(cast(sum(experience_years) as float)/ count(project_id), 2)

with firstt as (
    select project_id, round(avg(experience_years * 1.0), 2) as average_years 
    from (
        select Project.project_id, Employee.experience_years
        from Project
        left join Employee
        on Project.employee_id = Employee.employee_id)t
    group by project_id)

select *
from firstt
order by project_id
