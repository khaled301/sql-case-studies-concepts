--  Postgres | The below solution is a brute-force solution and not the most efficient
--  Step 1: extract years, months and sum of total paid
--  Step 2: group years revenue by years
--  Step 3: sum revenues of all years
--  Step 4: union the steps

select extract(year from start_timestamp) as yrs 
, extract(month from start_timestamp) as mnth 
, sum(total_paid) as revenue
from rental 
group by yrs, mnth
union all
select extract(year from start_timestamp) as yrs 
, null as mnth 
, sum(total_paid) as revenue
from rental 
group by yrs
union all
select null as yrs 
, null as mnth 
, sum(total_paid) as revenue
from rental 
order by yrs, mnth