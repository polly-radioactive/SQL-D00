WITH set1 AS (
    SELECT 
        menu.pizza_name,
        pizzeria.name AS pizzeria_name,
        menu.price,
        pizzeria.id AS pizzeria_id
    FROM 
        menu
    JOIN 
        pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT 
    set2.pizza_name,
    set2.pizzeria_name AS pizzeria_name_1,
    set1.pizzeria_name AS pizzeria_name_2,
    set2.price
FROM 
    set1 set2
JOIN 
    set1 ON set2.price = set1.price 
    AND set2.pizza_name = set1.pizza_name 
    AND set2.pizzeria_id > set1.pizzeria_id
ORDER BY 
    set2.pizza_name;