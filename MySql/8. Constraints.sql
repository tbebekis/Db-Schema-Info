select distinct
    Constraints.constraint_schema                     as SchemaName,
    Constraints.constraint_name                       as ConstraintName,
    coalesce(Constraints.constraint_type, '')         as ConstraintTypeText,
    case coalesce(Constraints.constraint_type, '')
        when 'PRIMARY KEY' then 1
        when 'FOREIGN KEY' then 2
        when 'UNIQUE' then 3
        when 'CHECK' then 4
        when 'NOT NULL' then 5
        else 0
    end                                               as ConstraintType,
    Constraints.table_name                             as TableName,
    KeyColumns.column_name                            as FieldName,
    coalesce(KeyColumns.REFERENCED_TABLE_NAME, '')    as ForeignTable,
    coalesce(KeyColumns.REFERENCED_COLUMN_NAME, '')   as ForeignField,
    coalesce(KeyColumns.REFERENCED_TABLE_SCHEMA, '')  as ForeignSchema,
    coalesce(Refs.update_rule, '')                      as UpdateRule,
    coalesce(Refs.delete_rule, '')                      as DeleteRule,
    coalesce(KeyColumns.ordinal_position, 0)          as FieldPosition,
    coalesce(Checks.check_clause, '')                 as Definition
from
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS Constraints
        left join INFORMATION_SCHEMA.KEY_COLUMN_USAGE KeyColumns
            on  (Constraints.constraint_catalog = KeyColumns.constraint_catalog or Constraints.constraint_catalog is null)
            and Constraints.constraint_schema = KeyColumns.constraint_schema
            and Constraints.constraint_name = KeyColumns.constraint_name
            and Constraints.table_name = KeyColumns.table_name
        left join INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS Refs
            on (Constraints.constraint_catalog = Refs.constraint_catalog or Constraints.constraint_catalog is null)
            and Constraints.constraint_schema = Refs.constraint_schema
            and Constraints.constraint_name = Refs.constraint_name
            and Constraints.table_name = Refs.table_name
        left join INFORMATION_SCHEMA.CHECK_CONSTRAINTS Checks
            on Constraints.constraint_type = 'CHECK'
            and Constraints.constraint_catalog = Checks.constraint_catalog
            and Constraints.constraint_schema = Checks.constraint_schema
            and Constraints.constraint_name = Checks.constraint_name
where
    Constraints.constraint_schema = DATABASE()
order by
    TableName,
    ConstraintName,
    FieldPosition
