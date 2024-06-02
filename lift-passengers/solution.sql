WITH 

	cte AS 

		(SELECT 

			l.id AS lifts_ID, 
			l.capacity_kg,
            p.id AS passengers_ID,
            p.passenger_name,
            p.weight_kg,
            p.lift_id,

		SUM(p.weight_kg) OVER(PARTITION BY l.id ORDER BY l.id, p.weight_kg) AS cum_sum,

		CASE WHEN l.capacity_kg >= SUM(p.weight_kg) OVER(PARTITION BY l.id ORDER BY l.id, p.weight_kg)
				THEN 1 ELSE 0 END AS flag

		FROM sql_pp.lifts l 
		JOIN sql_pp.lift_passengers p 
		ON l.id = p.lift_id
		ORDER BY l.id, p.weight_kg)

SELECT lift_id, GROUP_CONCAT(passenger_name SEPARATOR ',') AS passengers 
FROM cte 
WHERE flag=1
GROUP BY lift_id;