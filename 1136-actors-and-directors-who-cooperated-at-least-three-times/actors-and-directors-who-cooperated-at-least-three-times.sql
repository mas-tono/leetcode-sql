/* Write your T-SQL query statement below */

select actor_id, director_id
from (
    select actor_id, director_id, 
        concat(actor_id, director_id) as pair, 
        count(concat(actor_id, director_id)) as count_pair
    from ActorDirector
    group by actor_id, director_id, 
        concat(actor_id, director_id)) a
where count_pair >= 3        