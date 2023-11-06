SELECT menu.pizza_name, pizzeria.name, menu.price
FROM menu
LEFT JOIN pizzeria ON pizzeria.id=menu.pizzeria_id
WHERE pizza_name = 'pepperoni pizza' or pizza_name = 'mushroom pizza'
ORDER BY pizza_name, name;