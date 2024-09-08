/* Write your T-SQL query statement below */
                 
select name as results
from (
        select *, rank() over(order by cnt desc, name asc) as rnk
        from (select u.name, count(u.user_id) as cnt
                        from MovieRating mr
                        join Movies m
                        on mr.movie_id = m.movie_id
                        join Users u
                        on mr.user_id = u.user_id
                        group by u.name) s) d
where rnk = 1                        

union all

select title as results
from 
    (
        select *, rank() over(order by rating desc, title asc) as rnk
        from (select m.title, avg(mr.rating * 1.0) as rating
                        from MovieRating mr
                        join Movies m
                        on mr.movie_id = m.movie_id
                        where format(created_at, 'yyyy-MM') = '2020-02'
                        group by m.title) s) d
where rnk = 1