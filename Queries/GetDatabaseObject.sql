-- Search for table in database
select * from information_schema.tables where table_name like '%Exclusive%'

-- Search for field in database
select * from information_schema.columns where column_name like '%PublishedDiscount%'

-- Search for SP in database
select ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_DEFINITION from INFORMATION_SCHEMA.ROUTINES
where ROUTINE_TYPE='PROCEDURE' and routine_name like '%System%'

