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
    case when c.VIRTUAL_COLUMN = 'NO' then c.DATA_DEFAULT_VC end as DefaultValue,
    case when c.VIRTUAL_COLUMN = 'YES' then c.DATA_DEFAULT_VC end as Expression,
    c.COLUMN_ID as OrdinalPosition,
    case c.IDENTITY_COLUMN when 'YES' then 1 else 0 end as IsIdentity,
    case c.VIRTUAL_COLUMN when 'YES' then 1 else 0 end as IsComputed
from ALL_TAB_COLS c
join ALL_TABLES t on t.OWNER = c.OWNER and t.TABLE_NAME = c.TABLE_NAME
where c.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') and c.USER_GENERATED = 'YES'
order by c.TABLE_NAME, c.COLUMN_ID
