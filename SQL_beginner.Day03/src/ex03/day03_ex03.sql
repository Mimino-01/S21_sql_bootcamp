WITH female_visits AS (
    SELECT pizzeria.name AS pizzeria_name,
        COUNT(*) AS female_count
    FROM person_visits
        JOIN person ON person.id = person_visits.person_id
        JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'female'
    GROUP BY pizzeria.name
),
male_visits AS (
    SELECT pizzeria.name AS pizzeria_name,
        COUNT(*) AS male_count
    FROM person_visits
        JOIN person ON person.id = person_visits.person_id
        JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
    WHERE person.gender = 'male'
    GROUP BY pizzeria.name
) (
    SELECT fv.pizzeria_name
    FROM female_visits fv
        LEFT JOIN male_visits mv ON fv.pizzeria_name = mv.pizzeria_name
    WHERE fv.female_count > COALESCE(mv.male_count, 0)
)
UNION ALL
(
    SELECT mv.pizzeria_name
    FROM male_visits mv
        LEFT JOIN female_visits fv ON mv.pizzeria_name = fv.pizzeria_name
    WHERE mv.male_count > COALESCE(fv.female_count, 0)
)
ORDER BY pizzeria_name;