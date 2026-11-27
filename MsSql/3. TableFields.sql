select
    c.TABLE_SCHEMA as SchemaName,
    t.name as TableName,
    c.COLUMN_NAME as FieldName,
    c.DATA_TYPE as DataType,
    coalesce(c.DOMAIN_NAME, '') as DataSubType,
    sc.is_nullable as IsNullable,
    coalesce(c.CHARACTER_MAXIMUM_LENGTH, 0) as SizeInChars,
    coalesce(c.CHARACTER_OCTET_LENGTH, 0) as SizeInBytes,
    coalesce(c.NUMERIC_PRECISION, 0) as DecimalPrecision,
    coalesce(c.NUMERIC_SCALE, 0) as DecimalScale,
    coalesce(c.COLUMN_DEFAULT, '') as DefaultValue,
    coalesce(cc.definition, '') as Expression,
    c.ORDINAL_POSITION as OrdinalPosition,
    sc.is_identity as IsIdentity,
    -- Rowversion values are assigned by SQL Server on insert and update.
    case when sc.is_computed = 1 or c.DATA_TYPE in ('timestamp', 'rowversion') then 1 else 0 end as IsComputed
from INFORMATION_SCHEMA.COLUMNS as c
join sys.schemas as s on s.name = c.TABLE_SCHEMA
join sys.tables as t on t.schema_id = s.schema_id and t.name = c.TABLE_NAME
join sys.columns as sc on sc.object_id = t.object_id and sc.name = c.COLUMN_NAME
left join sys.computed_columns as cc on cc.object_id = sc.object_id and cc.column_id = sc.column_id
where t.is_ms_shipped = 0
order by SchemaName, TableName, OrdinalPosition;
