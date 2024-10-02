CREATE VIEW v_symmetric_union AS WITH R AS (
    SELECT *
    FROM person_visits
    WHERE visit_date < '2022-01-03'
),
S AS (
    SELECT *
    FROM person_visits
    WHERE visit_date >= '2022-01-06'
)
SELECT *
FROM (
        SELECT *
        FROM R
        EXCEPT
        SELECT *
        FROM S
    )
UNION
SELECT *
FROM (
        SELECT *
        FROM S
        EXCEPT
        SELECT *
        FROM R
    )
ORDER BY person_id