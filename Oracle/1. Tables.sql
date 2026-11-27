select OWNER as SchemaName, TABLE_NAME as TableName
from ALL_TABLES
where OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
order by TABLE_NAME
