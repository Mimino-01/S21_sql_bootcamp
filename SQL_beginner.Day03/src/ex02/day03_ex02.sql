SELECT pizza_name,
    price,
    pz.name AS pizzeria_name
FROM menu
    JOIN pizzeria pz ON menu.pizzeria_id = pz.id
WHERE NOT EXISTS (
        SELECT 1
        FROM person_order
        WHERE menu.id = person_order.menu_id
    )
ORDER BY 1,
    2