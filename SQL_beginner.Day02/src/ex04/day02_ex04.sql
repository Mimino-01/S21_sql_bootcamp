SELECT pizza_name,
    pz.name,
    price
FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE m.pizza_name IN (
        'mushroom pizza',
        'pepperoni pizza'
    )
ORDER BY 1,
    2