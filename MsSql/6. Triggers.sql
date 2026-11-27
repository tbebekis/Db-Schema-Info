select
    SCHEMA_NAME(t.schema_id) as SchemaName,
    tr.name as TriggerName,
    t.name as TableName,
    RTRIM(
        case when tr.is_instead_of_trigger = 1 then 'instead of ' else 'after ' end
        + case when OBJECTPROPERTY(tr.object_id, 'ExecIsInsertTrigger') = 1 then 'insert ' else '' end
        + case when OBJECTPROPERTY(tr.object_id, 'ExecIsUpdateTrigger') = 1 then 'update ' else '' end
        + case when OBJECTPROPERTY(tr.object_id, 'ExecIsDeleteTrigger') = 1 then 'delete ' else '' end
    ) as TriggerType,
    tr.is_disabled as IsInactive,
    OBJECT_DEFINITION(tr.object_id) as Definition
from sys.triggers as tr
join sys.tables as t on t.object_id = tr.parent_id
where tr.parent_class = 1 and tr.is_ms_shipped = 0 and t.is_ms_shipped = 0
order by SchemaName, TableName, TriggerName;
