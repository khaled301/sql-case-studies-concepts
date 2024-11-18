--  Postgres
--  Problem(7):
-- Next, Emily would like data about memberships purchased in 2023, with
-- subtotals and grand totals for all the different combinations of membership
-- types and months.
-- Display the total revenue from memberships purchased in 2023 for each
-- combination of month and membership type. Generate subtotals and
-- grand totals for all possible combinations. There should be 3 columns:
-- membership_type_name , month , and total_revenue .
-- Sort the results by membership type name alphabetically and then
-- chronologically by month.


    --  1.  total membership revenue for each month specific to each membership type
    --  2.  total membership revenue for each month
            -- select name
            -- , extract(month from start_date) as mnth 
            -- , sum(total_paid) as total_revenue
            -- from membership m 
            -- join membership_type mt on mt.id = m.membership_type_id
            -- group by name, mnth
            -- order by name, mnth
    --  3.  total membership revenue specific to each membership type
            -- select name
            -- , null as mnth 
            -- , sum(total_paid) as total_revenue
            -- from membership m 
            -- join membership_type mt on mt.id = m.membership_type_id
            -- group by name, mnth
            -- order by name, mnth
    --  4.  total membership revenue
            -- select null as name
            -- , null as mnth 
            -- , sum(total_paid) as total_revenue
            -- from membership m 
            -- group by ()
            -- order by name, mnth



-- #1 Approach | Using => Group By Grouping Sets
    --  advantage: we can explicitly provide multiple list of columns to group by using grouping sets 
    --  disadvantage: verbose and hard to read if there are too many columns

select name
, extract(month from start_date) as mnth 
, sum(total_paid) as total_revenue
from membership m 
join membership_type mt on mt.id = m.membership_type_id
group by grouping sets ( (name, mnth), (name), (mnth), () )
order by name, mnth

-- #2 Approach | Using => Group By Cube (columns: c1, c2 and c3)
    --  When we need to group by for all possible combinations of the provided columns

    -- SQL will create the below combinations of group by
        -- [(c1, c2, c3)] 
        -- [(c1, c2)]
        -- [(c1, c3)]
        -- [(c2, c3)]
        -- [(c1)]
        -- [(c2)]
        -- [(c3)]
        -- [()]

select name
, extract(month from start_date) as mnth 
, sum(total_paid) as total_revenue
from membership m 
join membership_type mt on mt.id = m.membership_type_id
group by cube(name, mnth)
order by name, mnth


-- #3 Approach | Using =>  Group By Rollup (columns: c1, c2 and c3)
    --  SQL will create the below combinations of group by
    --  (here c1 is hierarchically higher than c2 and c2 is hierarchically higher than c3)
        -- [(c1, c2, c3)] 
        -- [(c1, c2)]
        -- [(c1)]
        -- [()]
    --  advantage: we can provide multiple list of columns to group by using grouping sets 
    --  disadvantage: verbose and hard to read if there are too many columns