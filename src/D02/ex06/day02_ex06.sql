SELECT menu.pizza_name, pizzeria.name
FROM person_order
    JOIN menu ON menu.id = person_order.menu_id
    JOIN person ON person.id = person_order.person_id
    JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY menu.pizza_name, pizzeria.name;