WITH date_series AS (
    SELECT generate_series(
            '2022-01-01'::date,
            '2022-01-10'::date,
            '1 day'::interval
        )::date AS day
),
visits AS (
    SELECT DISTINCT visit_date::date
    FROM person_visits
    WHERE person_id = 1
        OR person_id = 2
)
SELECT date_series.day AS missing_date
FROM date_series
    LEFT JOIN visits ON date_series.day = visits.visit_date
WHERE visits.visit_date IS NULL
ORDER BY missing_date;