SELECT DISTINCT p.name AS person_name
FROM person p
JOIN person_order po ON p.id = po.person_id
ORDER BY person_name;