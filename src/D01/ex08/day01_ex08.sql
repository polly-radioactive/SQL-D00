SELECT DISTINCT person_order.order_date AS action_date, 
       CONCAT(person.name, ' (age:', person.age, ')') AS person_information
FROM person_order 
NATURAL JOIN person
ORDER BY action_date ASC, person_information ASC;