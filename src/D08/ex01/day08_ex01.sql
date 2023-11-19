-- Session 1
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';

-- Session 2
SHOW TRANSACTION ISOLATION LEVEL;
BEGIN;
select * from pizzeria where name  = 'Pizza Hut';
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;
select * from pizzeria where name  = 'Pizza Hut';