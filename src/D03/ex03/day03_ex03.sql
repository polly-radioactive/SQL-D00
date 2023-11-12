WITH who_visit AS (SELECT person_visits.pizzeria_id,
                          pizzeria.name AS pizzeria_name,
                          person.gender
                   FROM person_visits
                      JOIN person ON person_visits.person_id = person.id
                      JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id),
   visit_women AS (SELECT *
                   FROM who_visit
                   WHERE who_visit.gender = 'female'),
     visit_men AS (SELECT *
                   FROM who_visit
                   WHERE who_visit.gender = 'male'),
  commom_visit AS (SELECT visit_women.pizzeria_id, visit_women.pizzeria_name
                   FROM visit_women
                   INTERSECT ALL
                   SELECT visit_men.pizzeria_id, visit_men.pizzeria_name
                   FROM visit_men),
    more_women AS (SELECT visit_women.pizzeria_name
                   FROM visit_women
                   EXCEPT ALL 
                   SELECT commom_visit.pizzeria_name
                   FROM commom_visit),
      more_men AS (SELECT visit_men.pizzeria_name
                   FROM visit_men
                   EXCEPT ALL 
                   SELECT commom_visit.pizzeria_name
                   FROM commom_visit)
SELECT * 
FROM more_women
UNION ALL
SELECT * 
FROM more_men
ORDER BY 1;