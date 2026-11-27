select
    c.TABLE_SCHEMA as SchemaName,
    c.TABLE_NAME as TableName,
    c.COLUMN_NAME as FieldName,
    c.DATA_TYPE as DataType,
    coalesce(c.DOMAIN_NAME, '') as DataSubType,
    case c.IS_NULLABLE when 'YES' then 1 else 0 end as IsNullable,
    coalesce(c.CHARACTER_MAXIMUM_LENGTH, 0) as SizeInChars,
    coalesce(c.CHARACTER_OCTET_LENGTH, 0) as SizeInBytes,
    coalesce(c.NUMERIC_PRECISION, 0) as DecimalPrecision,
    coalesce(c.NUMERIC_SCALE, 0) as DecimalScale,
    coalesce(c.COLUMN_DEFAULT, '') as DefaultValue,
    '' as Expression,
    c.ORDINAL_POSITION as OrdinalPosition
from INFORMATION_SCHEMA.COLUMNS as c
join INFORMATION_SCHEMA.VIEWS as v
    on v.TABLE_SCHEMA = c.TABLE_SCHEMA and v.TABLE_NAME = c.TABLE_NAME
order by SchemaName, TableName, OrdinalPosition;
