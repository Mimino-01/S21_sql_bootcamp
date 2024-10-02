CREATE VIEW v_generated_dates AS
SELECT generate_series(
        '2022-01-01'::DATE,
        '2022-01-31'::DATE,
        '1 day'::INTERVAL
    )::DATE AS generated_date
ORDER BY generated_date;