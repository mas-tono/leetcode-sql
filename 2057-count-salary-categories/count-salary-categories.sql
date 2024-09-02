/* Write your T-SQL query statement below */

-- steps:
    -- we need to make a new table 'SalaryCategory' contains: 'High Salary', 'Average Salary', 'Low Salary' 

    -- make calculation

    -- left/right join as calculation with table SalaryCategory

with firstt as (select *, case
            when income < 20000 then 'Low Salary'
            when income >= 20000 and income <= 50000 then 'Average Salary'
            when income > 50000 then 'High Salary'
        end as category
from Accounts),

secondd as (select 'High Salary' as SalaryCategory
                    union all 
                    select 'Average Salary'
                    union all
                    select 'Low Salary'
),

thirdd as (select f.category, coalesce(count(f.category), 0) as cnt, s.SalaryCategory
        from firstt f
        right join secondd s
        on f.category = s.SalaryCategory
        group by f.category, s.SalaryCategory)

select SalaryCategory as category, cnt as accounts_count 
from thirdd       