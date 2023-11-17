CREATE INDEX idx_person_name ON person (UPPER(name));

SET enable_indexscan = ON;
SET enable_seqscan = FALSE;
EXPLAIN ANALYZE 
SELECT name FROM person
WHERE UPPER(name) IS NOT NULL;