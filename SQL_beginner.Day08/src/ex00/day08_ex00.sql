-- FIRST SESSION:
BEGIN;
UPDATE pizzeria
SET rating = 5.0
WHERE name = 'Pizza Hut';
-- SECOND SESSION: check changes (changes should not be visible)
SELECT *
FROM pizzeria;
-- FIRST SESSION:
COMMIT;
-- SECOND SESSION: After committing the transaction, changes should occur
-- in the second session
SELECT *
FROM pizzeria;