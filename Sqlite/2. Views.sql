select
    'main'             as SchemaName,
    t.name             as TableName,
    t.sql              as Definition
from
    main.sqlite_master t
where
   t.type = 'view'
order by
    t.name
