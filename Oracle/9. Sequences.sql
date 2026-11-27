-- LAST_NUMBER is the persisted cache boundary. MIN_VALUE is the lower bound.
select
    SEQUENCE_OWNER as SchemaName,
    SEQUENCE_NAME as SequenceName,
    case when LAST_NUMBER between -9223372036854775808 and 9223372036854775807 then LAST_NUMBER end as CurrentValue,
    case when MIN_VALUE between -9223372036854775808 and 9223372036854775807 then MIN_VALUE end as InitialValue,
    case when INCREMENT_BY between -9223372036854775808 and 9223372036854775807 then INCREMENT_BY end as IncrementBy
from ALL_SEQUENCES
where SEQUENCE_OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
order by SEQUENCE_NAME
