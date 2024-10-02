CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
    SELECT pizzeria.name AS pizzeria
    FROM person_visits
        JOIN pizzeria ON pizzeria.id = pizzeria_id
        JOIN menu ON pizzeria.id = menu.pizzeria_id
    WHERE person_id IN (
            SELECT id
            FROM person
            WHERE name = 'Dmitriy'
        )
        AND visit_date = '2022-01-08'
        AND price <= 800
)