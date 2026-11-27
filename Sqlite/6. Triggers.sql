select
    'main'                                  as SchemaName,
    t.tbl_name                              as TableName,
    t.name                                  as TriggerName,
    ''                                      as TriggerType,
    t.sql                                   as Definition
from
    main.sqlite_master t
where
    t.[type] = 'trigger'
order by
    t.tbl_name,
    t.name
