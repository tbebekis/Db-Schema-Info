select
    c.OWNER as SchemaName,
    c.TABLE_NAME as TableName,
    c.COLUMN_NAME as FieldName,
    c.DATA_TYPE as DataType,
    c.DATA_TYPE_OWNER as DataSubType,
    case c.NULLABLE when 'Y' then 1 else 0 end as IsNullable,
    c.CHAR_LENGTH as SizeInChars,
    c.DATA_LENGTH as SizeInBytes,
    c.DATA_PRECISION as DecimalPrecision,
    c.DATA_SCALE as DecimalScale,
    null as DefaultValue,
    null as Expression,
    c.COLUMN_ID as OrdinalPosition
from ALL_TAB_COLUMNS c
join ALL_VIEWS v on v.OWNER = c.OWNER and v.VIEW_NAME = c.TABLE_NAME
where c.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
order by c.TABLE_NAME, c.COLUMN_ID
