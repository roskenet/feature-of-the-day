--| Just in Time expression compiler (since PostgreSQL 11)
SET JIT=OFF;

EXPLAIN ANALYSE
SELECT * FROM idx_test WHERE id=1;

EXPLAIN ANALYZE
SELECT * from idx_test LIMIT 10;

EXPLAIN ANALYZE
SELECT * FROM idx_test WHERE active = true ORDER BY id LIMIT 10;

--| First try:
CREATE INDEX my_idx_id ON idx_test(id);
DROP INDEX my_idx_id;

CREATE INDEX my_idx_active ON idx_test(active);
DROP INDEX my_idx_active;

--| Generally on 'active':
CREATE INDEX my_idx_id_active ON idx_test(id, active);
DROP INDEX my_idx_id_active;

--| Selectivity of an Index:
CREATE INDEX my_idx_id_active_true ON idx_test(id, active) WHERE active = true;
DROP INDEX my_idx_id_active_true;