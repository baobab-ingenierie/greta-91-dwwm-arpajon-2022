USE information_schema
;

SHOW tables
;

SELECT table_schema, table_name, table_rows, create_time, engine
FROM information_schema.tables
WHERE table_schema = 'arpajon'
;