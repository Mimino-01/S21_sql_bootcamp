-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;
-- FIRST SESSION
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- SECOND SESSION
UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';
COMMIT;
-- FIRST SESSION: the "Non-Repeatable Reads" anomaly shows that in the first
-- session within one transaction we can observe different outputs on the
-- output of the tuple, since between them on the side the transaction of the 
-- second session can complete
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;
-- BOTH SESSIONS
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';