--| Just in Time expression compiler (since PostgreSQL 11)
SET JIT=OFF;

EXPLAIN ANALYSE
SELECT * FROM test_table WHERE id=1;

EXPLAIN ANALYZE
SELECT count(1) from test_table WHERE active = true;

--| This is our "standard" query:
EXPLAIN ANALYZe
SELECT * FROM test_table WHERE active = true ORDER BY id; -- LIMIT 10;

--| First try:
CREATE INDEX my_idx_id ON test_table(id);
DROP INDEX my_idx_id;

--| Generally on 'active':
CREATE INDEX my_idx_active ON test_table(active);
DROP INDEX my_idx_active;

--| Selectivity of an Index:
CREATE INDEX my_idx_active_true ON test_table(active) WHERE active = true;
DROP INDEX my_idx_active_true;
