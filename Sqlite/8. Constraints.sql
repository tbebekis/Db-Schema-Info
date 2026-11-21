select *
from (
    select
        tl.[schema]                                     as SchemaName,
        ''                                              as ConstraintName,
        'PRIMARY KEY'                                   as ConstraintTypeText,
        1                                               as ConstraintType,
        t.name                                          as TableName,
        ti.name                                         as FieldName,
        ''                                              as ForeignTable,
        ''                                              as ForeignField,
        ''                                              as UpdateRule,
        ''                                              as DeleteRule,
        ti.pk                                           as FieldPosition,
        'pk'                                            as ConstraintId
    from
        sqlite_master t
            inner join pragma_table_list(t.name) tl on tl.name = t.name
            inner join pragma_table_xinfo(t.name) ti
    where
        t.type = 'table'
        and ti.pk > 0

    union all

    select
        tl.[schema]                                     as SchemaName,
        ''                                              as ConstraintName,
        'FOREIGN KEY'                                   as ConstraintTypeText,
        2                                               as ConstraintType,
        t.name                                          as TableName,
        fk.[from]                                       as FieldName,
        fk.[table]                                      as ForeignTable,
        coalesce(
            fk.[to],
            (select parent.name
             from pragma_table_xinfo(fk.[table], tl.[schema]) parent
             where parent.pk = fk.seq + 1)
        )                                               as ForeignField,
        fk.on_update                                    as UpdateRule,
        fk.on_delete                                    as DeleteRule,
        fk.seq                                          as FieldPosition,
        cast(fk.id as text)                             as ConstraintId
    from
        sqlite_master t
            inner join pragma_table_list(t.name) tl on tl.name = t.name
            inner join pragma_foreign_key_list(t.name) fk
    where
        t.type = 'table'

    union all

    select
        tl.[schema]                                     as SchemaName,
        il.name                                         as ConstraintName,
        'UNIQUE'                                        as ConstraintTypeText,
        3                                               as ConstraintType,
        t.name                                          as TableName,
        ii.name                                         as FieldName,
        ''                                              as ForeignTable,
        ''                                              as ForeignField,
        ''                                              as UpdateRule,
        ''                                              as DeleteRule,
        ii.seqno                                        as FieldPosition,
        il.name                                         as ConstraintId
    from
        sqlite_master t
            inner join pragma_table_list(t.name) tl on tl.name = t.name
            inner join pragma_index_list(t.name) il
            inner join pragma_index_info(il.name) ii
    where
        t.type = 'table'
        and il.origin = 'u'
)
order by
    SchemaName,
    TableName,
    ConstraintType,
    ConstraintId,
    FieldPosition
