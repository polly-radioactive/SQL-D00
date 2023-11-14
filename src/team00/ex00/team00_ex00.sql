CREATE TABLE nod (
  point1 TEXT,
  point2 TEXT,
  cost INTEGER
);

INSERT INTO nod (point1, point2, cost) VALUES 
    ('a', 'b', 10),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('c', 'a', 15),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('b', 'd', 25),
    ('d', 'b', 25),
    ('c', 'd', 30),
    ('d', 'c', 30);


WITH RECURSIVE all_journey AS (
  SELECT point1, point2, cost, point2 AS tour, cost AS total_cost
  FROM nod
  WHERE point1 = 'a'
  
  UNION 
  
  SELECT nod.point1, nod.point2, nod.cost, all_journey.tour || ',' || nod.point2, all_journey.total_cost + nod.cost
  FROM nod
  INNER JOIN all_journey ON nod.point1 = all_journey.point2
  WHERE all_journey.tour NOT LIKE '%' || nod.point2 || '%'
),

right_journey AS (
	SELECT total_cost,
           '{' || point2 || ',' || tour || '}' AS tour
    FROM all_journey
    WHERE tour LIKE '%,a' AND length(tour) = 7
    ORDER BY total_cost, tour
)


SELECT total_cost, tour 
FROM right_journey
WHERE total_cost = (SELECT MIN(total_cost) FROM right_journey);
