SELECT 
  p.name AS name, 
  m.pizza_name, 
  m.price, 
  CAST 
    ((m.price-(m.price*pd.discount/100)) AS bigint) 
    AS discount_price, 
  pz.name AS pizzeria_name
FROM person_order po
JOIN person p 
  ON po.person_id=p.id
JOIN menu m 
  ON m.id=po.menu_id
JOIN pizzeria pz 
  ON m.pizzeria_id=pz.id
JOIN person_discounts pd 
  ON p.id=pd.person_id AND pz.id=pd.pizzeria_id
ORDER BY name, pizza_name;