/* Write your T-SQL query statement below */
with firstt as (select *
from Students st
cross join Subjects su),

secondd as (select f.student_id as student_id, 
        f.student_name as student_name, 
        f.subject_name as subject_name, 
        case
            when e.student_id is null then 0 else 1
        end as status
from firstt f
left join Examinations e
on f.student_id = e.student_id and f.subject_name = e.subject_name)

select student_id, student_name, subject_name, sum(status) as attended_exams
from secondd
group by student_id, student_name, subject_name