select
    SCHEMA_NAME(t.schema_id) as SchemaName,
    t.name as TableName,
    i.name as IndexName,
    c.name as FieldName,
    case when ic.key_ordinal > 0 then ic.key_ordinal else ic.index_column_id end as FieldPosition,
    i.is_unique as IsUnique,
    i.type_desc as IndexType,
    i.is_primary_key as IsPrimary
from sys.indexes as i
join sys.index_columns as ic on ic.object_id = i.object_id and ic.index_id = i.index_id
join sys.columns as c on c.object_id = ic.object_id and c.column_id = ic.column_id
join sys.tables as t on t.object_id = i.object_id
where t.is_ms_shipped = 0 and i.is_hypothetical = 0 and i.name is not null
    and (ic.key_ordinal > 0 or i.type in (3, 4, 5, 6))
order by SchemaName, TableName, IndexName, FieldPosition;
