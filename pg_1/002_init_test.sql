--| Create test db

DROP TABLE IF EXISTS idx_test;
CREATE TABLE idx_test (id SERIAL, name TEXT, active BOOLEAN DEFAULT true);

INSERT INTO idx_test (name, active) SELECT 'Charles', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Camilla', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'William', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Kate', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Harry', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Meghan', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'George', false
   FROM generate_series(1, 2000000);
INSERT INTO idx_test (name, active) SELECT 'Charlotte', false
   FROM generate_series(1, 2000000);

SELECT * FROM idx_test;

BEGIN;
UPDATE idx_test SET name = 'Louis', active = false WHERE id%3=0;
SELECT * FROM idx_test;
ROLLBACK;
-- COMMIT;

INSERT INTO idx_test (name)
    VALUES ('Antonio'), ('Ivan'), ('Lucas'), ('Michal'), ('Abd'), ('Taras'), ('Rebecca');