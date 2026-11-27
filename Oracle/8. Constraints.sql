select
    c.OWNER as SchemaName,
    c.TABLE_NAME as TableName,
    c.CONSTRAINT_NAME as ConstraintName,
    c.CONSTRAINT_TYPE as ConstraintTypeText,
    case c.CONSTRAINT_TYPE when 'P' then 1 when 'R' then 2 when 'U' then 3 when 'C' then 4 end as ConstraintType,
    col.COLUMN_NAME as FieldName,
    r.TABLE_NAME as ForeignTable,
    rc.COLUMN_NAME as ForeignField,
    r.OWNER as ForeignSchema,
    null as UpdateRule,
    c.DELETE_RULE as DeleteRule,
    coalesce(col.POSITION, 1) as FieldPosition,
    c.SEARCH_CONDITION_VC as Definition
from ALL_CONSTRAINTS c
join ALL_TABLES t on t.OWNER = c.OWNER and t.TABLE_NAME = c.TABLE_NAME
left join ALL_CONS_COLUMNS col on col.OWNER = c.OWNER and col.CONSTRAINT_NAME = c.CONSTRAINT_NAME
left join ALL_CONSTRAINTS r on r.OWNER = c.R_OWNER and r.CONSTRAINT_NAME = c.R_CONSTRAINT_NAME
left join ALL_CONS_COLUMNS rc on rc.OWNER = r.OWNER and rc.CONSTRAINT_NAME = r.CONSTRAINT_NAME and rc.POSITION = col.POSITION
where c.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') and c.CONSTRAINT_TYPE in ('P', 'R', 'U', 'C')
order by c.TABLE_NAME, c.CONSTRAINT_NAME, FieldPosition, col.COLUMN_NAME
