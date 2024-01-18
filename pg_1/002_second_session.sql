--| A second session to show transactions and MVCC

SELECT xmin, xmax, * FROM test_table order by id LIMIT 10;