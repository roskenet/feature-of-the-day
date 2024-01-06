--| Create test db

DROP TABLE IF EXISTS idx_test;
CREATE TABLE idx_test (id SERIAL, name TEXT, active BOOLEAN DEFAULT true);

BEGIN;
INSERT INTO idx_test (name) SELECT 'Antonio'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name) SELECT 'Lucas'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name) SELECT 'Abd'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name) SELECT 'Michal'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name) SELECT 'Ivan'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name) SELECT 'Rebecca'
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Pablo', false
   FROM generate_series(1, 2000000);
ROLLBACK;
-- COMMIT;

SELECT count(*) FROM idx_test;
SELECT * FROM idx_test;

BEGIN;
UPDATE idx_test SET name = 'Taras', active = true WHERE id%3=0;
SELECT * FROM idx_test;
COMMIT;
-- ROLLBACK;
