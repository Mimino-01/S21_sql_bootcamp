SELECT order_date,
    name || ' ' || '(age:' || age || ')' AS person_information
FROM person AS p(person_id)
    NATURAL JOIN person_order
ORDER BY order_date ASC,
    person_information ASC;