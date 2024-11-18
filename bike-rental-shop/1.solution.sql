-- Emily would like to know how many bikes the shop owns by category. 
-- Can you get this for her?
-- Display the category name and the number of bikes the shop owns in
-- each category (call this column number_of_bikes ). Show only the categories
-- where the number of bikes is greater than 2 

-- Explanation:
    -- SELECT category, COUNT() AS total_count*: This selects the category and counts the number of rows in each category.

    -- FROM your_table_name: Replace your_table_name with the actual name of your table.

    -- WHERE some_column > 0: Add any necessary condition to filter the rows (e.g., only include rows where a certain column has a value greater than 0).

    -- GROUP BY category: This groups the results by the category column.

    -- HAVING COUNT() > 2*: The HAVING clause filters the groups, ensuring only categories with a count greater than 2 are included.

select category
, count(category) as total
from bike 
group by category
having count(category) > 2
order by category


-- Usage: Counts the number of rows.
-- How it works: 1 is a constant that exists for each row in the result set. 
-- Counting 1 essentially counts the number of rows because every row will have a 1.
-- Efficiency: Internally, this is usually optimized the same way as COUNT(*).
select category
, count(1) as number_of_bikes
from bike 
group by category
having count(1) > 2