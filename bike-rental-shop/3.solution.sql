SELECT id, category
, price_per_hour as old_price_per_hour
, 	CASE
		WHEN category = 'electric' THEN ROUND(price_per_hour - (price_per_hour * (10.0 / 100)), 2)
		WHEN category = 'mountain bike' THEN ROUND(price_per_hour - (price_per_hour * (20.0 / 100)), 2)
		ELSE ROUND(price_per_hour - (price_per_hour * (50.0 / 100)), 2)
	END AS new_price_per_hour
, price_per_day as old_price_per_day
, 	CASE 
		WHEN category = 'electric' THEN ROUND(price_per_day - (price_per_day * (20.0 / 100)), 2)
		WHEN category = 'mountain bike' THEN ROUND(price_per_day - (price_per_day * (50.0 / 100)), 2)
		ELSE ROUND(price_per_day - (price_per_day * (50.0 / 100)), 2)
	END AS new_price_per_day
FROM bike