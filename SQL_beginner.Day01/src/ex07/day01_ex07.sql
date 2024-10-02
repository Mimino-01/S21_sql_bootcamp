SELECT order_date,
    person.name || ' (age:' || age || ')' AS person_information
FROM person_order
    JOIN person ON person.id = person_id
ORDER BY order_date,
    person_information