/* Write your T-SQL query statement below */
select contest_id, round((count(user_id) * 100.0 / (select count(user_id) from Users)), 2) as percentage 
from Register
group by contest_id
order by round((count(user_id) * 100.0 / (select count(user_id) from Users)), 2) desc, contest_id