select OWNER as SchemaName, VIEW_NAME as TableName, TEXT as Definition
from ALL_VIEWS
where OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
order by VIEW_NAME
