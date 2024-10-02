CREATE VIEW v_price_with_discount AS
SELECT p.name,
    m.pizza_name,
    m.price,
    CAST(m.price * 0.9 AS INTEGER) AS discount_price
FROM person_order po
    JOIN menu m ON m.id = po.menu_id
    JOIN person p ON p.id = po.person_id
ORDER BY p.name,
    m.pizza_name;