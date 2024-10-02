CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
        pperson varchar DEFAULT 'Dmitriy',
        pprice numeric DEFAULT 500,
        pdate date DEFAULT '2022-01-08'
    ) RETURNS TABLE (pizzeria_name varchar) AS $$ BEGIN RETURN QUERY
SELECT DISTINCT p.name AS pizzeria_name
FROM person_visits pv
    JOIN person pe ON pv.person_id = pe.id
    JOIN pizzeria p ON pv.pizzeria_id = p.id
    JOIN menu m ON p.id = m.pizzeria_id
WHERE pe.name = pperson
    AND pv.visit_date = pdate
    AND m.price < pprice;
END;
$$ LANGUAGE plpgsql;
-- Вызов функции с изменением только цены
SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);
-- Вызов функции с изменением всех параметров
SELECT *
FROM fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );