select
    'main'                                              as SchemaName,
    i.tbl_name                                          as TableName,
    i.name                                              as IndexName,
    coalesce(ii.name, '')                               as FieldName,
    ii.seqno                                            as FieldPosition,
    il.[unique]                                         as IsUnique,
    'INDEX'                                             as IndexType,
    i.sql                                               as Definition
from
    main.sqlite_master i
        inner join pragma_index_info(i.name, 'main') ii
        inner join pragma_index_list(i.tbl_name, 'main') il on il.name = i.name
where
    i.type = 'index'
    and il.origin not in ('pk', 'u')
order by
    SchemaName,
    TableName,
    IndexName,
    FieldPosition
