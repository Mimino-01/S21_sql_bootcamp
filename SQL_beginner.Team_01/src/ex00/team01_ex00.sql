WITH latest_currency_rates AS (
    SELECT id,
        name,
        rate_to_usd,
        ROW_NUMBER() OVER (
            PARTITION BY id
            ORDER BY updated DESC
        ) as rn
    FROM currency
)
SELECT COALESCE(u.name, 'not defined') as name,
    COALESCE(u.lastname, 'not defined') as lastname,
    b.type,
    SUM(b.money) as volume,
    COALESCE(lcr.name, 'not defined') as currency_name,
    COALESCE(lcr.rate_to_usd, 1) as last_rate_to_usd,
    SUM(b.money) * COALESCE(lcr.rate_to_usd, 1) as total_volume_in_usd
FROM balance b
    LEFT JOIN "user" u ON b.user_id = u.id
    LEFT JOIN latest_currency_rates lcr ON b.currency_id = lcr.id
    AND lcr.rn = 1
GROUP BY COALESCE(u.name, 'not defined'),
    COALESCE(u.lastname, 'not defined'),
    b.type,
    COALESCE(lcr.name, 'not defined'),
    COALESCE(lcr.rate_to_usd, 1)
ORDER BY name DESC,
    lastname ASC,
    type ASC;