with ConstraintFields as
(
    select
        k.parent_object_id as TableId,
        k.name as ConstraintName,
        case k.type when 'PK' then 'PRIMARY KEY' else 'UNIQUE' end as ConstraintTypeText,
        case k.type when 'PK' then 1 else 3 end as ConstraintType,
        c.name as FieldName,
        '' as ForeignTable,
        '' as ForeignField,
        '' as ForeignSchema,
        '' as UpdateRule,
        '' as DeleteRule,
        ic.key_ordinal as FieldPosition,
        '' as Definition
    from sys.key_constraints as k
    join sys.index_columns as ic on ic.object_id = k.parent_object_id and ic.index_id = k.unique_index_id
    join sys.columns as c on c.object_id = ic.object_id and c.column_id = ic.column_id
    where ic.key_ordinal > 0

    union all

    select
        f.parent_object_id, f.name, 'FOREIGN KEY', 2, c.name,
        r.name, rc.name, SCHEMA_NAME(r.schema_id),
        REPLACE(f.update_referential_action_desc, '_', ' '),
        REPLACE(f.delete_referential_action_desc, '_', ' '),
        fc.constraint_column_id, ''
    from sys.foreign_keys as f
    join sys.foreign_key_columns as fc on fc.constraint_object_id = f.object_id
    join sys.columns as c on c.object_id = fc.parent_object_id and c.column_id = fc.parent_column_id
    join sys.tables as r on r.object_id = fc.referenced_object_id
    join sys.columns as rc on rc.object_id = fc.referenced_object_id and rc.column_id = fc.referenced_column_id

    union all

    select
        k.parent_object_id, k.name, 'CHECK', 4, coalesce(c.name, ''),
        '', '', '', '', '', 0, k.definition
    from sys.check_constraints as k
    left join sys.columns as c on c.object_id = k.parent_object_id and c.column_id = k.parent_column_id
)
select
    SCHEMA_NAME(t.schema_id) as SchemaName,
    t.name as TableName,
    f.ConstraintName,
    f.ConstraintTypeText,
    f.ConstraintType,
    f.FieldName,
    f.ForeignTable,
    f.ForeignField,
    f.ForeignSchema,
    f.UpdateRule,
    f.DeleteRule,
    f.FieldPosition,
    f.Definition
from ConstraintFields as f
join sys.tables as t on t.object_id = f.TableId
where t.is_ms_shipped = 0
order by SchemaName, TableName, ConstraintName, FieldPosition;
