-- FIRST SESSION
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- SECOND SESSION
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- FIRST SESSION
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
-- SECOND SESSION
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
COMMIT;
-- FIRST SESSION: compared to the output of REPEATABLE READ, “Non-Repeatable
-- Reads” is not visible here. Since SERIALIZABLE isolates transactions from
-- each other as much as possible until session 1's transaction completes, it
-- will not see the result of session 2's transaction
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';
COMMIT;
-- BOTH SESSIONS
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';