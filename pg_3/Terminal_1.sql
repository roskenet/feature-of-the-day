--| The first terminal

BEGIN;
UPDATE idx_test SET name = 'Margret' WHERE id = 1;
UPDATE idx_test SET name = 'Anne' WHERE id = 3;

SELECT * FROM idx_test WHERE id BETWEEN 1 AND 3;

-- SELECT * FROM idx_wrongname;

-- COMMIT;
ROLLBACK;
