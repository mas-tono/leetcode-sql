/* Write your T-SQL query statement below */

-- can't join country_name null = null, 
        -- this issue arises because of how SQL treats NULL values when comparing them. In SQL, NULL values are not considered equal to any other value, including other NULLs. Therefore, when you do a JOIN on the country column where one of the values is NULL, the JOIN condition will fail, and it won’t match any rows.

        -- In the query, the LEFT JOIN uses the condition f.country = a.country, which fails for rows where country is NULL because NULL = NULL is not true in SQL.
        -- Solution:

        -- To handle this issue, we need to explicitly treat NULL values in the country column as matching each other. You can modify the JOIN condition using COALESCE to replace NULL with a string like 'abc' for comparison.

-- use coalesce to change null to something else: 'abc'
-- in final query, use 'nullif' to change 'abc' back to null

with firstt as (select format(trans_date, 'yyyy-MM') as month, 
        coalesce(country, 'abc') as country, 
        count(coalesce(country, 'abc')) as trans_count,
        sum(amount) as trans_total_amount
from Transactions
group by format(trans_date, 'yyyy-MM'), country),

approved as (select format(trans_date, 'yyyy-MM') as month, 
        coalesce(country, 'abc') as country,
        count(state) as approved_count, 
        sum(amount) as approved_total_amount 
from Transactions
where state = 'approved' 
group by format(trans_date, 'yyyy-MM'), country)


select f.month, 
        nullif(f.country, 'abc') as country,
        f.trans_count, 
        coalesce(a.approved_count, 0) as approved_count, 
        f.trans_total_amount, 
        coalesce(a.approved_total_amount,0) as approved_total_amount
from firstt f
left join approved a
on f.month = a.month and f.country = a.country

