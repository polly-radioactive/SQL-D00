SELECT person.name
FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'female' 
AND menu.pizza_name = 'pepperoni pizza'
AND person.name IN (SELECT person.name
FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'female'				   
AND menu.pizza_name = 'cheese pizza'				   
				   )
ORDER BY person.name ASC;