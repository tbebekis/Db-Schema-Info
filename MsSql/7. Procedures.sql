select
    SCHEMA_NAME(p.schema_id) as SchemaName,
    p.name as ProcedureName,
    'PROCEDURE' as ProcedureType,
    OBJECT_DEFINITION(p.object_id) as Definition
from sys.procedures as p
where p.is_ms_shipped = 0
order by SchemaName, ProcedureName;
