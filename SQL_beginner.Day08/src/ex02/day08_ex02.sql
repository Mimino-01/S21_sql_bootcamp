-- FIRST SESSION
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SECOND SESSION
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
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
-- In this case, upon completion of the transaction of the first session,
-- changes to the same tuple in the second will be accompanied by an error
-- BOTH SESSIONS
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut';