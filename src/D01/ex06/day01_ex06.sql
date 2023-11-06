SELECT DISTINCT person_order.order_date as action_date, person.name as person_name
FROM person_order,
     person_visits,
     person
WHERE person_order.person_id = person_visits.person_id
  AND person_order.order_date = person_visits.visit_date
  AND person.id = person_order.person_id
ORDER BY action_date ASC, person_name DESC;