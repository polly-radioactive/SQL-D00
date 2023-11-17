CREATE UNIQUE INDEX idx_person_discounts_unique 
  ON person_discounts(person_id,pizzeria_id);
SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT * FROM person_discounts
WHERE pizzeria_id=1 AND person_id=7;