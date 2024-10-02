SELECT (
        SELECT p.name
        FROM person AS p
        WHERE p.id = i.person_id
    ) AS name
FROM person_order AS i
WHERE (
        i.menu_id = 13
        OR i.menu_id = 14
        OR i.menu_id = 18
    )
    AND i.order_date = '2022-01-07';