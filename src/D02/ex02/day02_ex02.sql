SELECT 
    CASE WHEN person.name IS NULL THEN '-' ELSE  person.name END as person_name,
    CASE WHEN person_visits.visit_date IS NULL THEN NULL ELSE person_visits.visit_date END as visit_date,
    CASE WHEN pizzeria.name IS NULL THEN '-' ELSE  pizzeria.name END as pizzeria_name 
FROM 
    person_visits
RIGHT JOIN 
    person ON person.id = person_visits.person_id
    AND person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-03'
FULL JOIN 
    pizzeria ON person_visits.pizzeria_id = pizzeria.id
ORDER BY 
    person_name, visit_date, pizzeria_name;
