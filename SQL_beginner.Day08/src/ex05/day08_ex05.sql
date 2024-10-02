-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;
-- FIRST SESSION
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;
-- SECOND SESSION
UPDATE pizzeria
SET rating = 1.0
WHERE name = 'Pizza Hut';
COMMIT;
-- FIRST SESSION: as a result, within the framework of one transaction in the
-- first session, you can see that the set of rows issued before and after the
-- completion of the transaction of the second session differs
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;
COMMIT;
-- BOTH SESSIONS
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;