-- Brute Force Without CTE (Common Table Expression)

-- Inner Subquery(select customer_id, count(1) as rental_count):
    -- This subquery groups by customer_id and calculates the rental_count for each customer.

--  Middle Subquery(select rental_count):
    -- This subquery categorizes each rental_count into 'more than 10', 'between 5 and 10', or 'fewer than 5'.

-- Outer Query(select rental_count_category, count(*) as customer_count):
    -- This final query groups by rental_count_category and counts the number of customers in each category, 
    -- providing a single row for each category with the aggregated count.

select 
rental_count_category,
count(*) as customer_count
from (
	select rental_count
	,	case	
			when rental_count > 10 then 'more than 10'
			when rental_count between 5 and 10 then 'between 5 and 10'
			else 'fewer than 5'
		end as rental_count_category
	from (
		select customer_id, count(1) as rental_count
		from rental
		group by customer_id
	) as rental_counts
) as category_counts
group by rental_count_category
order by customer_count;


-- With CTE (Common Table Expression)
with cte as 
	(
		select customer_id, count(1)
		,	case
				when count(1) > 10 then 'more than 10'
				when count(1) between 5 and 10 then 'between 5 and 10'
				else 'fewer than 5'
			end as category
		from rental
		group by customer_id
	)
select category as rental_count_category, count(*) as customer_count
from cte 
group by rental_count_category 
order by customer_count
