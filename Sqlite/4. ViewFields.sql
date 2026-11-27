select
    'main'                                              as SchemaName,
    t.name                                              as TableName,
    ti.name                                             as FieldName,
    ti.type                                             as DataType,
    ''                                                  as DataSubType,
    case when ti.[notnull] = 1 or 0 then 0 else 1 end   as IsNullable,
    0                                                   as SizeInChars,
    0                                                   as SizeInBytes,
    0                                                   as DecimalPrecision,
    0                                                   as DecimalScale,
    ti.dflt_value                                       as DefaultValue,
    ''                                                  as Expression,
    ti.cid + 1                                          as OrdinalPosition,
    case when 0 then 1 else 0 end                       as IsIdentity,
    case when ti.hidden in (2, 3) then 1 else 0 end     as IsComputed
from
    main.sqlite_master t
        inner join pragma_table_xinfo(t.name, 'main') ti
where
    t.type = 'view'
order by
    SchemaName,
    TableName,
    OrdinalPosition
