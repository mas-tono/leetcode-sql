/* Write your T-SQL query statement below */

-- #1. find pids which have same tiv_2015 with other pid
-- #2. find pids which have same lat-lon pairs
-- make query to find sum(tiv_2016) and subquery that include #1 and exclude #2

select round(sum(tiv_2016), 2) as tiv_2016 
from Insurance
where pid in (select DISTINCT i1.pid
                from Insurance i1
                cross JOIN Insurance i2
                where i1.pid <> i2.pid and i1.tiv_2015 = i2.tiv_2015)
    
    and pid not in (SELECT i1_pid 
                  FROM (select i1.pid as i1_pid, 
                        	i1.lat as i1_lat, 
                        	i1.lon AS i1_lon, 
                        	i2.pid as i2_pid, 
                        	i2.lat as i2_lat,
                        	i2.lon as i2_lon
                        from Insurance i1
                        cross JOIN Insurance i2
                        where i1.lat = i2.lat AND i1.lon = i2.lon and i1.pid <> i2.pid) s)
