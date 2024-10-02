-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');
WITH currency_in_usd_cte AS (
    SELECT balance.user_id,
        balance.money,
        currency.id AS currency_id,
        currency.name AS currency_name,
        -- Находим курс в прошлом
        (
            SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
                AND currency.updated <= balance.updated -- Курс из текущей таблицы по дате должен быть меньше или равен дате баланса
            ORDER BY currency.updated DESC
            LIMIT 1
        ) AS rate_min,
        -- Курс в будущем
        (
            SELECT currency.rate_to_usd
            FROM currency
            WHERE currency.id = balance.currency_id
                AND currency.updated > balance.updated -- Курс из текущей таблицы по дате должен быть больше даты баланса
            ORDER BY currency.updated ASC
            LIMIT 1
        ) AS rate_max
    FROM balance
        JOIN currency ON currency.id = balance.currency_id
    GROUP BY balance.user_id,
        balance.money,
        currency.id,
        currency.name,
        balance.updated,
        balance.currency_id
)
SELECT COALESCE("user".name, 'not defined') AS name,
    COALESCE("user".lastname, 'not defined') AS lastname,
    currency_in_usd_cte.currency_name,
    currency_in_usd_cte.money * COALESCE(
        currency_in_usd_cte.rate_min,
        currency_in_usd_cte.rate_max
    ) AS currency_in_usd
FROM currency_in_usd_cte
    LEFT JOIN "user" ON "user".id = currency_in_usd_cte.user_id
ORDER BY name DESC,
    lastname,
    currency_name;