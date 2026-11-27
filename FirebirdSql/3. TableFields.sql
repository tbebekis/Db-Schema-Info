select
  trim(t.RDB$OWNER_NAME)                               as SchemaName,
  trim(tf.RDB$RELATION_NAME)                           as TableName,
  coalesce(t.RDB$VIEW_SOURCE, '')                      as Definition,
  trim(tf.RDB$FIELD_NAME)                              as FieldName,
  trim(case
    when f.RDB$FIELD_TYPE in (7, 8, 16, 26) and f.RDB$FIELD_SUB_TYPE = 1 then 'NUMERIC'
    when f.RDB$FIELD_TYPE in (7, 8, 16, 26) and f.RDB$FIELD_SUB_TYPE = 2 then 'DECIMAL'
    else case f.RDB$FIELD_TYPE
    when 7   then 'SMALLINT'
    when 8   then 'INTEGER'
    when 9   then 'QUAD'
    when 10  then 'FLOAT'
    when 11  then 'D_FLOAT'
    when 12  then 'DATE'
    when 13  then 'TIME'
    when 14  then 'CHAR'
    when 16  then 'INT64'
    when 23  then 'BOOLEAN'
    when 24  then 'DECFLOAT(16)'
    when 25  then 'DECFLOAT(34)'
    when 26  then 'INT128'
    when 27  then 'DOUBLE'
    when 28  then 'TIME WITH TIME ZONE'
    when 29  then 'TIMESTAMP WITH TIME ZONE'
    when 35  then 'TIMESTAMP'
    when 37  then 'VARCHAR'
    when 40  then 'CSTRING'
    when 261 then 'BLOB'
    else ''
  end end)                                             as DataType,
  trim(case
    when (f.RDB$FIELD_TYPE = 261) and (f.RDB$FIELD_SUB_TYPE = 1)  then 'TEXT'
    when (f.RDB$FIELD_TYPE = 261) and (f.RDB$FIELD_SUB_TYPE = 0)  then 'BINARY'
    else ''
  end)                                                 as DataSubType,
  case when tf.RDB$NULL_FLAG = 1 or f.RDB$NULL_FLAG = 1 then 0 else 1 end as IsNullable,
  coalesce(f.RDB$CHARACTER_LENGTH, 0)                  as SizeInChars,
  f.RDB$FIELD_LENGTH                                   as SizeInBytes,
  coalesce(f.RDB$FIELD_PRECISION, 0)                   as DecimalPrecision,
  -coalesce(f.RDB$FIELD_SCALE, 0)                      as DecimalScale,
  coalesce(tf.RDB$DEFAULT_SOURCE, f.RDB$DEFAULT_SOURCE, '') as DefaultValue,
  coalesce(f.RDB$COMPUTED_SOURCE, '')                  as Expression,
  tf.RDB$FIELD_POSITION + 1                            as OrdinalPosition,
  case when tf.RDB$IDENTITY_TYPE is not null then 1 else 0 end as IsIdentity,
  case when f.RDB$COMPUTED_BLR is not null then 1 else 0 end as IsComputed
from
  RDB$RELATION_FIELDS tf
    left join RDB$RELATIONS t ON tf.RDB$RELATION_NAME = t.RDB$RELATION_NAME
    left join RDB$FIELDS f ON tf.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME
where
      (tf.RDB$SYSTEM_FLAG is null  or tf.RDB$SYSTEM_FLAG = 0)
  and (t.RDB$SYSTEM_FLAG  is null  or t.RDB$SYSTEM_FLAG  = 0)
  and t.RDB$VIEW_BLR is null       -- is not null (for View Fields)
order by
  tf.RDB$RELATION_NAME,
  tf.RDB$FIELD_POSITION
