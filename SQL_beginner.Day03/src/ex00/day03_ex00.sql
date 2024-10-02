SELECT pizza_name,
    price,
    pz.name AS pizzeria_name,
    visit_date
FROM person_visits AS po
    JOIN pizzeria AS pz ON po.pizzeria_id = pz.id
    JOIN menu m ON pz.id = m.pizzeria_id
    JOIN person p ON po.person_id = p.id
WHERE p.name = 'Kate'
    AND price BETWEEN 800 AND 1000
ORDER BY pizza_name,
    price,
    pz.name