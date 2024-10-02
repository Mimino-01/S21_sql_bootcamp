-- FIRST SESSION
BEGIN;
-- SECOND SESSION
BEGIN;
-- FIRST SESSION
UPDATE pizzeria
SET rating = 3.0
WHERE id = 1;
-- SECOND SESSION
UPDATE pizzeria
SET rating = 2.0
WHERE id = 2;
-- FIRST SESSION
UPDATE pizzeria
SET rating = 4.0
WHERE id = 2;
-- SECOND SESSION: after successive updates of one tuple in each session
-- (different in relation to each other), we try with the next update in the
-- first session to change the tuple that was changed in the second session. 
-- Let us remember task 01, where in this case we froze waiting for the end of 
-- the transaction of the second session, the same thing happens here. Now, 
-- returning to the second session and performing the same manipulations in 
-- relation to the first session, in theory, we should get the same expectation.
-- But this essentially vicious circle; neither will complete the transaction 
-- until they wait for each other. Therefore, in the second session we will be
-- blocked. As a result, the data will only be relevant consisting of changes
-- from first session. Yes, a little complicated, but not that much, of course.
UPDATE pizzeria
SET rating = 5.0
WHERE id = 1;
-- FIRST SESSION
COMMIT;
-- SECOND SESSION
COMMIT;