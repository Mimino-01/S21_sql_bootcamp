-- FIRST SESSION
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- SECOND SESSION
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
-- FIRST SESSION
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;
-- SECOND SESSION
UPDATE pizzeria
SET rating = 3.0
WHERE name = 'Pizza Hut';
COMMIT;
-- FIRST SESSION: as in task 4, when we compared REPEATABLE READ and
-- SERIALIZABLE using the example of “Non-Repeatable Reads”, the same thing
-- happens here. SERIALIZABLE protects the transaction of the first session
-- from changes in the second by simulating their operation as if they were
-- executed sequentially (but only if they do not conflict with each other)
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;
COMMIT;
-- BOTH SESSIONS
SELECT SUM(rating)
FROM pizzeria
HAVING SUM(rating) > 20;