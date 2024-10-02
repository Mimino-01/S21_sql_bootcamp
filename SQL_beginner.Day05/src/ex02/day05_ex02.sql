CREATE INDEX idx_person_name ON person(upper(name));
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT name
FROM person
WHERE upper(name) = 'DENIS';
SET enable_seqscan = on;