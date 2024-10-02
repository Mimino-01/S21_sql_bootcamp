CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts (person_id, pizzeria_id);
-- Demonstrate the usage of the index
SET enable_seqscan = OFF;
EXPLAIN ANALYZE
SELECT person_id
FROM person_discounts