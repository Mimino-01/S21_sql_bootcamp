WITH max_id AS (
    SELECT COALESCE(MAX(id), 0) AS max_id
    FROM menu
),
pizzeria_id AS (
    SELECT id
    FROM pizzeria
    WHERE name = 'Dominos'
)
INSERT INTO menu (id, pizza_name, pizzeria_id, price)
SELECT max_id.max_id + 1,
    'sicilian pizza',
    pizzeria_id.id,
    900
FROM max_id,
    pizzeria_id;