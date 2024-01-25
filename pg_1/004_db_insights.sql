--| Sizes:
SET TIMEZONE = 'Europe/Berlin';

--| Overall table size:
SELECT
   relname  AS table_name,
   pg_size_pretty(pg_relation_size(relid)) AS heap_size,
   pg_size_pretty(pg_indexes_size(relid)) AS index_size,
   pg_size_pretty(pg_total_relation_size(relid)) AS total_size
   FROM pg_catalog.pg_statio_user_tables ORDER BY pg_total_relation_size(relid) DESC;

--| Show size of indexes
SELECT indexrelname AS index_name ,
       pg_size_pretty(pg_relation_size(quote_ident(indexrelname))) as size
FROM pg_catalog.pg_stat_user_indexes ORDER BY pg_relation_size(quote_ident(indexrelname)) DESC;

--| Show usage of seq_scan / idx_scan
SELECT schemaname, relname, seq_scan, seq_tup_read,
       seq_tup_read / seq_scan AS avg, idx_scan
FROM pg_stat_user_tables
WHERE seq_scan > 0
ORDER BY seq_tup_read DESC LIMIT 25;

SELECT * FROM pg_stat_database;
SELECT * FROM pg_stat_user_tables WHERE schemaname = 'public';
SELECT * FROM pg_statio_user_tables;
