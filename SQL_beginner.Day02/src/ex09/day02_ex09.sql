SELECT name
FROM person
WHERE gender = 'female'
    AND id IN (
        SELECT po1.person_id
        FROM person_order po1
            JOIN menu m1 ON po1.menu_id = m1.id
        WHERE m1.pizza_name = 'pepperoni pizza'
    )
    AND id IN (
        SELECT po2.person_id
        FROM person_order po2
            JOIN menu m2 ON po2.menu_id = m2.id
        WHERE m2.pizza_name = 'cheese pizza'
    );