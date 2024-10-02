WITH visit AS (
    SELECT pizzeria_id,
        COUNT(*) AS count
    FROM person_visits
    GROUP BY pizzeria_id
),
orders AS (
    SELECT pizzeria_id,
        COUNT(*) AS count
    FROM person_order
        JOIN menu ON person_order.menu_id = menu.id
    GROUP BY pizzeria_id
)
SELECT pz.name,
    COALESCE(v.count, 0) + COALESCE(o.count, 0) AS total_count
FROM pizzeria pz
    LEFT JOIN visit v ON v.pizzeria_id = pz.id
    LEFT JOIN orders o ON o.pizzeria_id = pz.id
ORDER BY total_count DESC,
    pz.name ASC