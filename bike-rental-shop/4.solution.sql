SELECT category
,	COUNT( CASE WHEN status = 'available' THEN 1 END) AS available_bike_count
, 	COUNT(CASE WHEN status = 'rented' THEN 1 END) AS rented_bike_count
FROM bike
GROUP BY category