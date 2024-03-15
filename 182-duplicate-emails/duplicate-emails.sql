/* Write your T-SQL query statement below */
select email as Email
from (
    select email, count(email) as ce
    from Person
    group by email
    having count(email) >1) as em