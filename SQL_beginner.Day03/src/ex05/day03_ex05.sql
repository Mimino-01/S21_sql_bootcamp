-- Получаем список пиццерий, которые Андрей посещал
SELECT p.name AS pizzeria_name
FROM person_visits pv
    INNER JOIN public.pizzeria p ON p.id = pv.pizzeria_id
WHERE pv.person_id = (
        SELECT id
        FROM person
        WHERE name = 'Andrey'
    )
EXCEPT -- Получаем список пиццерий, где Андрей делал заказы
SELECT p2.name AS pizzeria_name
FROM person_order po
    INNER JOIN public.menu m ON m.id = po.menu_id
    INNER JOIN public.pizzeria p2 ON p2.id = m.pizzeria_id
WHERE po.person_id = (
        SELECT id
        FROM person
        WHERE name = 'Andrey'
    )
ORDER BY pizzeria_name;