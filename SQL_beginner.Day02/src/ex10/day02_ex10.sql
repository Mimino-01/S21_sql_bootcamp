WITH person1 AS (
    SELECT *
    FROM person
)
SELECT p.name AS person_name1,
    p1.name AS person_name2,
    p.address
FROM person p
    JOIN person1 p1 ON p.address = p1.address
WHERE p.id > p1.id
ORDER BY 1,
    2,
    3