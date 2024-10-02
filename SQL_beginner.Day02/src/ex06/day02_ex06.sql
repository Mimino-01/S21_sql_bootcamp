SELECT menu.pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order AS po
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON person.id = po.person_id
WHERE person.name in ('Denis', 'Anna')
ORDER BY 1,
    2