/* Write your T-SQL query statement below */
select *
from Users
where right(mail, 13) = '@leetcode.com' and 
        left(mail, len(mail) - 13) like '[a-zA-Z]%' and
        left(mail, len(mail) - 13) not like '%[^A-Za-z0-9_.-]%'
