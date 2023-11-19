-- Session 1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';
COMMIT;

-- Session 2
select * from pizzeria where name  = 'Pizza Hut';
select * from pizzeria where name  = 'Pizza Hut';