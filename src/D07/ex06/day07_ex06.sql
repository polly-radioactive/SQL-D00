SELECT
	pizzeria.name AS name,
	COUNT(po.id) AS count_of_orders,
	ROUND(AVG(m.price), 2) AS average_price,
	MAX(m.price) AS max_price,
	MIN(m.price) AS min_price
FROM pizzeria
   INNER JOIN menu m ON pizzeria.id = m.pizzeria_id
   INNER JOIN person_order po ON m.id = po.menu_id
GROUP BY pizzeria.name
ORDER BY name;