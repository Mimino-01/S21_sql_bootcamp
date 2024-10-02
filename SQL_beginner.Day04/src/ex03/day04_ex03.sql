SELECT generated_date
FROM v_generated_dates
EXCEPT
SELECT visit_date
FROM person_visits
ORDER BY 1