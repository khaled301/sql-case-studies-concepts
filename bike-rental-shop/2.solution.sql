select name, count(customer_id) as membership_count
from customer c 
left join membership m on c.id = m.customer_id
group by name
order by count(1) desc

select c.name, count(m.id) as membership_count
from membership m
right join customer c on c.id = m.customer_id
group by c.name
order by count(1) desc


-- COALESCE is a very handy SQL function used to handle NULL values. 
-- It returns the first non-NULL value in a list of arguments. 
-- This can be incredibly useful when you want to ensure that a result is never NULL, 
-- replacing it with a default value instead.
select name, coalesce(count(customer_id), 0) as membership_count
from customer c 
left join membership m on c.id = m.customer_id
group by name
order by count(1) desc