/* Write your T-SQL query statement below */
select Class
from Courses
group by Class
having count(class) >= 5