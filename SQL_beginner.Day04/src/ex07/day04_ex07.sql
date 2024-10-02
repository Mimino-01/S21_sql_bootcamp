INSERT INTO person_visits
VALUES (
        (
            SELECT id
            FROM person_visits
            ORDER BY 1 DESC
            LIMIT 1
        ) + 1, (
            SELECT id AS person_id
            FROM person
            WHERE name LIKE 'Dmi%'
        ),
        3,
        '2022-01-08'
    );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;
SELECT *
FROM mv_dmitriy_visits_and_eats;