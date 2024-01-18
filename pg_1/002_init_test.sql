--| Create test db

DROP TABLE IF EXISTS test_table;
CREATE TABLE test_table (id SERIAL, name TEXT, active BOOLEAN DEFAULT true);

INSERT INTO test_table (name, active) SELECT 'Charles', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'Camilla', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'William', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'Kate', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'Harry', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'Meghan', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'George', false
   FROM generate_series(1, 2000000);
INSERT INTO test_table (name, active) SELECT 'Charlotte', false
   FROM generate_series(1, 2000000);

SELECT * FROM test_table where active=true;

BEGIN;
UPDATE test_table SET name = 'Louis', active = false WHERE id%3=0;
SELECT xmin, xmax, * FROM test_table order by id LIMIT 10;
ROLLBACK;
-- COMMIT;

INSERT INTO test_table (name)
    VALUES ('Antonio'), ('Ivan'), ('Lucas'), ('Michal'), ('Abd'), ('Taras'), ('Rebecca'), ('Amine'), ('Manuka');
