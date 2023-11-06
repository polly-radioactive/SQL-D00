SELECT person.name
FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
WHERE person.gender = 'male' 
AND menu.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
AND person.address IN ('Moscow', 'Samara')
ORDER BY person.name DESC;