select
    SCHEMA_NAME(t.schema_id) as SchemaName,
    t.name as TableName
from sys.tables as t
where t.is_ms_shipped = 0
order by SchemaName, TableName;
