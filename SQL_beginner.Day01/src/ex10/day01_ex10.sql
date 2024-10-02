SELECT person.name AS person_name,
    menu.pizza_name AS pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order
    JOIN person ON person.id = person_id
    JOIN menu ON menu.id = menu_id
    JOIN pizzeria ON pizzeria.id = pizzeria_id
ORDER BY person_name,
    pizza_name,
    pizzeria_name