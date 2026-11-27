select
    ix.TABLE_OWNER as SchemaName,
    ix.TABLE_NAME as TableName,
    ix.INDEX_NAME as IndexName,
    case when e.COLUMN_POSITION is null then c.COLUMN_NAME end as FieldName,
    c.COLUMN_POSITION as FieldPosition,
    case ix.UNIQUENESS when 'UNIQUE' then 1 else 0 end as IsUnique,
    ix.INDEX_TYPE as IndexType,
    e.COLUMN_EXPRESSION as FieldExpression
from ALL_INDEXES ix
join ALL_TABLES t on t.OWNER = ix.TABLE_OWNER and t.TABLE_NAME = ix.TABLE_NAME
join ALL_IND_COLUMNS c on c.INDEX_OWNER = ix.OWNER and c.INDEX_NAME = ix.INDEX_NAME
left join ALL_IND_EXPRESSIONS e on e.INDEX_OWNER = ix.OWNER and e.INDEX_NAME = ix.INDEX_NAME and e.COLUMN_POSITION = c.COLUMN_POSITION
where ix.TABLE_OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
order by ix.TABLE_NAME, ix.INDEX_NAME, c.COLUMN_POSITION
