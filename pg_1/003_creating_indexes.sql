--| Just in Time expression compiler (since PostgreSQL 11)
SET JIT=OFF;

EXPLAIN ANALYSE
SELECT * FROM idx_test WHERE id=100000;

EXPLAIN ANALYZE
SELECT * from idx_test LIMIT 10;

EXPLAIN ANALYZE
SELECT * FROM idx_test WHERE active = true ORDER BY id LIMIT 10;

--| First try:
CREATE INDEX ON idx_test(id);
DROP INDEX idx_test_id_idx;

--| Generally on 'active':
CREATE INDEX ON idx_test(id, active);
DROP INDEX idx_test_id_active_idx;

CREATE INDEX ON idx_test(id, active);
DROP INDEX idx_test_id_active_idx;

--| Selectivity of an Index:
CREATE INDEX ON idx_test(id, active) WHERE active = true;
