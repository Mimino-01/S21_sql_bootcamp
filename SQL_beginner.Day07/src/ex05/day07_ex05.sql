SELECT DISTINCT p.name
FROM person_order po
    JOIN person p ON p.id = po.person_id
ORDER BY p.name ASC;