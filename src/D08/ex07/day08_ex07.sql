-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 1.1 WHERE id = 1;
UPDATE pizzeria SET rating = 3.3 WHERE id = 2;
COMMIT;

-- Session 2
BEGIN;
UPDATE pizzeria SET rating = 2.2 WHERE id = 2;
UPDATE pizzeria SET rating = 4.4 WHERE id = 1;
COMMIT;