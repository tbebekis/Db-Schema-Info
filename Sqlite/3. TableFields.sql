select
    'main'                                              as SchemaName,
    t.name                                              as TableName,
    ti.name                                             as FieldName,
    ti.type                                             as DataType,
    ''                                                  as DataSubType,
    case
        when ti.[notnull] = 1 or (
            ti.pk = 1
            and upper(trim(ti.type)) = 'INTEGER'
            and (select count(*) from pragma_table_xinfo(t.name, 'main') where pk > 0) = 1
            and not exists (select 1 from pragma_index_list(t.name, 'main') where origin = 'pk')
        ) then 0
        else 1
    end                                                 as IsNullable,
    case
        when instr(upper(ti.type), 'CHAR') > 0
            and instr(ti.type, '(') > 0 and instr(ti.type, ')') > instr(ti.type, '(')
        then cast(substr(ti.type, instr(ti.type, '(') + 1, instr(ti.type, ')') - instr(ti.type, '(') - 1) as integer)
        else 0
    end                                                 as SizeInChars,
    0                                                   as SizeInBytes,
    0                                                   as DecimalPrecision,
    0                                                   as DecimalScale,
    coalesce(ti.dflt_value, '')                         as DefaultValue,
    ''                                                  as Expression,
    ti.cid + 1                                          as OrdinalPosition,
    case
        when ti.pk = 1
            and upper(trim(ti.type)) = 'INTEGER'
            and (select count(*) from pragma_table_xinfo(t.name, 'main') where pk > 0) = 1
            and not exists (select 1 from pragma_index_list(t.name, 'main') where origin = 'pk')
        then 1
        else 0
    end                                                 as IsIdentity,
    case when ti.hidden in (2, 3) then 1 else 0 end     as IsComputed
from
    main.sqlite_master t
        inner join pragma_table_xinfo(t.name, 'main') ti
where
    t.type = 'table'
order by
    SchemaName,
    TableName,
    OrdinalPosition
