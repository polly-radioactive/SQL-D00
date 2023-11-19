-- Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';