SELECT COALESCE(person.name, '-') AS person_name,
    pv.visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM (
        SELECT *
        FROM person_visits
        WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) AS pv
    full JOIN person ON person.id = pv.person_id
    full JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
ORDER BY 1,
    2,
    3