SELECT pr.id AS person_id,
    pr.name AS person_name,
    pr.age,
    pr.gender,
    pr.address,
    pz.id AS pizzeria_id,
    pz.name AS pizzeria_name,
    pz.rating
FROM person AS pr
    CROSS JOIN pizzeria AS pz
ORDER BY person_id ASC,
    pizzeria_id ASC;