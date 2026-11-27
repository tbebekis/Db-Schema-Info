select *
from (
    select
        'main'                                          as SchemaName,
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
        main.sqlite_master t
            inner join pragma_table_xinfo(t.name, 'main') ti
    where
        t.type = 'table'
        and ti.pk > 0

    union all

    select
        'main'                                          as SchemaName,
        ''                                              as ConstraintName,
        'FOREIGN KEY'                                   as ConstraintTypeText,
        2                                               as ConstraintType,
        t.name                                          as TableName,
        fk.[from]                                       as FieldName,
        fk.[table]                                      as ForeignTable,
        coalesce(
            fk.[to],
            (select parent.name
             from pragma_table_xinfo(fk.[table], 'main') parent
             where parent.pk = fk.seq + 1)
        )                                               as ForeignField,
        fk.on_update                                    as UpdateRule,
        fk.on_delete                                    as DeleteRule,
        fk.seq                                          as FieldPosition,
        cast(fk.id as text)                             as ConstraintId
    from
        main.sqlite_master t
            inner join pragma_foreign_key_list(t.name, 'main') fk
    where
        t.type = 'table'

    union all

    select
        'main'                                          as SchemaName,
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
        main.sqlite_master t
            inner join pragma_index_list(t.name, 'main') il
            inner join pragma_index_info(il.name, 'main') ii
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
