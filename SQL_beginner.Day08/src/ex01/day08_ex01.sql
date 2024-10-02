SHOW TRANSACTION ISOLATION LEVEL;
-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;
-- FIRST SESSION
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- SECOND SESSION
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- FIRST SESSION
UPDATE pizzeria
SET rating = 4.0
WHERE name = 'Pizza Hut';
-- SECOND SESSION: the table data will not be updated in the second session
-- until the transaction of the first session is completed
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
-- FIRST SESSION
COMMIT;
-- SECOND SESSION
COMMIT;
-- It turns out that with two consecutive commits, the updated data of the
-- first session will be lost
-- BOTH SESSIONS
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';