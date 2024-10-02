WITH menu1 AS (
    SELECT pizza_name,
        pz.name AS pizzeria_name1,
        price
    FROM menu
        JOIN pizzeria pz ON menu.pizzeria_id = pz.id
),
menu2 AS (
    SELECT pizza_name,
        pz.name AS pizzeria_name2,
        price
    FROM menu
        JOIN pizzeria pz ON menu.pizzeria_id = pz.id
)
SELECT m1.pizza_name,
    m1.pizzeria_name1,
    m2.pizzeria_name2,
    m1.price
FROM menu1 m1
    JOIN menu2 m2 ON m1.pizza_name = m2.pizza_name
    AND m1.price = m2.price
    AND m1.pizzeria_name1 < m2.pizzeria_name2
ORDER BY m1.pizza_name;