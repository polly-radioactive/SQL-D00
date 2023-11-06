SELECT 
    (SELECT name (CASE 
        WHEN name = 'Denis' THEN 1
        ELSE 0
        end) as check_name 
        FROM person 
        WHERE id = person_id)
FROM person_order                                                                                                
WHERE menu_id IN (13, 14, 18)
AND order_date = '2022-01-07';