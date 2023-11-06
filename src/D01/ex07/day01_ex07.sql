SELECT DISTINCT person_order.order_date as action_date, CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order,
     person
WHERE person.id = person_order.person_id
ORDER BY action_date ASC, person_information ASC;