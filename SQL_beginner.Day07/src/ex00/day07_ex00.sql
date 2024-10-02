SELECT person_id,
    COUNT(*) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY person_id DESC,
    count_of_visits DESC