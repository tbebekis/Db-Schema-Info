select
    SCHEMA_NAME(s.schema_id) as SchemaName,
    s.name as SequenceName,
    TRY_CONVERT(bigint, s.current_value) as CurrentValue,
    TRY_CONVERT(bigint, s.start_value) as InitialValue,
    TRY_CONVERT(bigint, s.increment) as IncrementBy
from sys.sequences as s
where s.is_ms_shipped = 0
order by SchemaName, SequenceName;
