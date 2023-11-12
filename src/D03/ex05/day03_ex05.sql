WITH visited_pizzerias AS (
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
JOIN person ON person_visits.person_id = person.id
WHERE person.name = 'Andrey' ), 
ordered_pizzerias AS (
SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM pizzeria
LEFT JOIN menu ON pizzeria.id = menu.pizzeria_id
LEFT JOIN person_order ON menu.id = person_order.menu_id
LEFT JOIN person ON person_order.person_id = person.id
WHERE person.name = 'Andrey'
)
SELECT * FROM visited_pizzerias
EXCEPT
SELECT * FROM ordered_pizzerias
ORDER BY 1;