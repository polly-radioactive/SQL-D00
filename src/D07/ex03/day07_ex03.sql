WITH pizzeria_visits AS (
        SELECT
            pizzeria.name AS name,
            COUNT(*) AS count
            FROM pizzeria
                INNER JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id
        GROUP BY pizzeria.name
        ORDER BY count DESC
),
pizzeria_order AS (
        SELECT
            pizzeria.name AS name,
            COUNT(*) AS count
            FROM pizzeria
                INNER JOIN menu ON pizzeria.id = menu.pizzeria_id
                INNER JOIN person_order ON menu.id = person_order.menu_id
        GROUP BY pizzeria.name
        ORDER BY count DESC
), pizzeria_all AS (
        SELECT * FROM pizzeria_visits
        UNION ALL
        SELECT * FROM pizzeria_order
)

SELECT name, SUM(count) AS total_count FROM pizzeria_all
GROUP BY name
ORDER BY total_count DESC, name ASC;