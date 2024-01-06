--| Create the test db
--| Connect to postgres@localhost

CREATE USER test PASSWORD 'test';
CREATE DATABASE test OWNER test;