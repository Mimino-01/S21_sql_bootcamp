SELECT address,
    ROUND(
        MAX(age)::NUMERIC - (MIN(age)::NUMERIC / MAX(age)),
        2
    ) AS formula,
    ROUND(AVG(age), 2) AS average,
    CASE
        WHEN (
            MAX(age)::NUMERIC - (MIN(age)::NUMERIC / MAX(age))
        ) > AVG(age) THEN 'true'
        ELSE 'false'
    END AS comparison
FROM person
GROUP BY address
ORDER BY address;