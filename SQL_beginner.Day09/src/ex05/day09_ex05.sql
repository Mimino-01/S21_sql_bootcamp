-- Удаление предыдущих функций
DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();
-- Создание новой параметризованной функции fnc_persons
CREATE OR REPLACE FUNCTION fnc_persons(pgender varchar DEFAULT 'female') RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
    ) AS $$
SELECT id,
    name,
    age,
    gender,
    address
FROM person
WHERE gender = pgender;
$$ LANGUAGE SQL;