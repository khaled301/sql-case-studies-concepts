-- Postgres

-- Emily is preparing a sales report. She needs to know the total revenue
-- from rentals by month, the total by year, and the all-time across all the
-- years.
-- Bike rental shop  SQL Case study5Display the total revenue from rentals for each month, the total for each
-- year, and the total across all the years. Do not take memberships into
-- account. There should be 3 columns: year , month , and revenue .
-- Sort the results chronologically. Display the year total after all the month
-- totals for the corresponding year. Show the all-time total as the last row.
-- The resulting table looks something like this:
-- year month revenue
-- 2022     11      200.00
-- 2022     12      150.00
-- 2022     null    350.00
-- 2023     1       110.00
-- ...
-- 2023     10      335.00
-- 2023     null    1370.00
-- null     null    1720.00


--      Grouping Sets
--      Same table
--      Group data depends on different columns
--      Performance
--      Grouping sets is faster than groupe by in this case
--      One query 
--      One group by
--      Better readability and maintainability

select extract(year from start_timestamp) as yrs
, extract(month from start_timestamp) as mnths
, sum(total_paid) as revenue
from rental
group by grouping sets ( (yrs, mnths), (yrs), () )
order by yrs, mnths