-- Session 1
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
select * from pizzeria where name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';