select
    c.TABLE_SCHEMA                                      as SchemaName,
    c.TABLE_NAME                                        as TableName,
    c.COLUMN_NAME                                       as FieldName,
    c.COLUMN_TYPE                                       as DataType,
    ''                                                  as DataSubType,
    case c.IS_NULLABLE when 'YES' then 1 else 0 end     as IsNullable,
    coalesce(c.CHARACTER_MAXIMUM_LENGTH, 0)             as SizeInChars,
    coalesce(c.CHARACTER_OCTET_LENGTH, 0)               as SizeInBytes,
    coalesce(c.NUMERIC_PRECISION, 0)                    as DecimalPrecision,
    coalesce(c.NUMERIC_SCALE, 0)                        as DecimalScale,
    coalesce(c.COLUMN_DEFAULT, '')                      as DefaultValue,
    coalesce(c.GENERATION_EXPRESSION, '')                               as Expression,
    c.ORDINAL_POSITION                                  as OrdinalPosition,
    case when c.EXTRA like '%auto_increment%' then 1 else 0 end as IsIdentity,
    case when c.EXTRA in ('VIRTUAL GENERATED', 'STORED GENERATED') then 1 else 0 end as IsComputed
from
    INFORMATION_SCHEMA.COLUMNS c
        inner join INFORMATION_SCHEMA.VIEWS v
            on  c.TABLE_SCHEMA = v.TABLE_SCHEMA
            and c.TABLE_NAME = v.TABLE_NAME
where
    v.TABLE_SCHEMA = DATABASE()
 order by
    c.TABLE_SCHEMA,
    c.TABLE_NAME,
    c.ORDINAL_POSITION
