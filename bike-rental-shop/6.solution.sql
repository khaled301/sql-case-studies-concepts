SELECT name AS membership_type_name
, EXTRACT(year from start_date) AS year
, EXTRACT(month from start_date) AS month
, SUM(total_paid) AS total_revenue
FROM membership m
LEFT JOIN membership_type mt on m.membership_type_id = mt.id
GROUP BY year, month, name
ORDER BY year, month, name