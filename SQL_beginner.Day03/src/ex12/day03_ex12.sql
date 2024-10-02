WITH pers AS (
    SELECT COUNT(*) AS cnt
    FROM person
),
orders AS (
    SELECT COUNT(*) AS cnt
    FROM person_order
),
min AS (
    SELECT MIN(p.id) AS id
    FROM person AS p
),
max AS (
    SELECT MAX(p.id) AS id
    FROM person AS p
),
greek AS (
    SELECT m.id
    FROM menu AS m
    WHERE m.pizza_name = 'greek pizza'
)
INSERT INTO person_order
SELECT GENERATE_SERIES(orders.cnt + 1, orders.cnt + pers.cnt) AS id,
    GENERATE_SERIES(min.id, max.id) AS person_id,
    greek.id AS menu_id,
    '2022-02-25' AS order_date
FROM pers,
    orders,
    min,
    max,
    greek;