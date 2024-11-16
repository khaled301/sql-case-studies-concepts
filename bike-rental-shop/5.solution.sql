-- Postgres
--   Grouping Sets
    --  Same table
    --  Group data depends on different columns
--  Performance
    --  Grouping sets is faster than groupe by in this case
        -- One query 
        -- One group by
        -- Better readability and maintainability

select extract(year from start_timestamp) as yrs
, extract(month from start_timestamp) as mnths
, sum(total_paid) as revenue
from rental
group by grouping sets ( (yrs, mnths), (yrs), () )
order by yrs, mnths