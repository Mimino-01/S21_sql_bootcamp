WITH female_order AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
        JOIN person ON person.id = person_order.person_id
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender = 'female'
),
male_order AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_order
        JOIN person ON person.id = person_order.person_id
        JOIN menu ON menu.id = person_order.menu_id
        JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
    WHERE person.gender = 'male'
)
SELECT fo.pizzeria_name
FROM female_order fo
EXCEPT
SELECT mo.pizzeria_name
FROM male_order mo
ORDER BY pizzeria_name;