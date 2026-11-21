select
    tl.[schema]                                         as SchemaName,
    t.name                                              as TableName,
    ti.name                                             as FieldName,
    ti.type                                             as DataType,
    ''                                                  as DataSubType,
    case
        when ti.[notnull] = 1 or (
            ti.pk = 1
            and upper(trim(ti.type)) = 'INTEGER'
            and (select count(*) from pragma_table_xinfo(t.name) where pk > 0) = 1
            and not exists (select 1 from pragma_index_list(t.name) where origin = 'pk')
        ) then 0
        else 1
    end                                                 as IsNullable,
    0                                                   as SizeInChars,
    0                                                   as SizeInBytes,
    0                                                   as DecimalPrecision,
    0                                                   as DecimalScale,
    coalesce(ti.dflt_value, '')                         as DefaultValue,
    ''                                                  as Expression,
    ti.cid + 1                                          as OrdinalPosition,
    case
        when ti.pk = 1
            and upper(trim(ti.type)) = 'INTEGER'
            and (select count(*) from pragma_table_xinfo(t.name) where pk > 0) = 1
            and not exists (select 1 from pragma_index_list(t.name) where origin = 'pk')
        then 1
        else 0
    end                                                 as IsIdentity,
    case when ti.hidden in (2, 3) then 1 else 0 end     as IsComputed
from
    sqlite_master t
        inner join pragma_table_list(t.name) tl on tl.name = t.name
        inner join pragma_table_xinfo(t.name) ti
where
    t.type = 'table'
order by
    SchemaName,
    TableName,
    OrdinalPosition
