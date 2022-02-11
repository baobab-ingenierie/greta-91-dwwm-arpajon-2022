USE information_schema
;

SHOW tables
;

SELECT table_schema, table_name, table_rows, create_time, engine
FROM information_schema.tables
WHERE table_schema = 'arpajon'
;

SELECT table_schema AS "schema", 
	table_name AS "table", 
    table_rows AS "nbRows", 
    create_time AS "createdDate", 
    engine AS "engine"
FROM information_schema.tables
WHERE table_schema = 'arpajon'
;