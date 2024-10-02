SELECT p.address,
    pz.name,
    COUNT(*) AS count_of_orders
FROM person_order
    JOIN menu ON person_order.menu_id = menu.id
    JOIN pizzeria pz ON pz.id = menu.pizzeria_id
    JOIN person p ON p.id = person_order.person_id
GROUP BY p.address,
    pz.name
ORDER BY 1,
    2