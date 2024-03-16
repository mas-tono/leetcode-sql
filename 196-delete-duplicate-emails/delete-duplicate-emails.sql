/* Write your T-SQL query statement below */

-- select min(id)
-- from Person
-- GROUP BY email

DELETE from Person
WHERE id NOT IN (select min(id)
from Person
GROUP BY email)