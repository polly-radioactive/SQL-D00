WITH who_order AS (SELECT person.gender,
                          pizzeria.name AS pizzeria_name
                     FROM person_order
                        JOIN person ON person_order.person_id = person.id
                        JOIN menu ON person_order.menu_id = menu.id
                        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id),
    order_women AS (SELECT *
                    FROM who_order
                    WHERE who_order.gender = 'female'),
    order_men AS (SELECT *
                    FROM who_order
                    WHERE who_order.gender = 'male'),
    only_women AS (SELECT pizzeria_name FROM order_women
                   EXCEPT
                   SELECT pizzeria_name FROM order_men),
    only_men AS (SELECT pizzeria_name FROM order_men
                   EXCEPT
                   SELECT pizzeria_name FROM order_women)
SELECT pizzeria_name FROM only_women
UNION
SELECT pizzeria_name FROM only_men
ORDER BY 1;