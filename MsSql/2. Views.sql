select
    SCHEMA_NAME(v.schema_id) as SchemaName,
    v.name as TableName,
    OBJECT_DEFINITION(v.object_id) as Definition
from sys.views as v
where v.is_ms_shipped = 0
order by SchemaName, TableName;
