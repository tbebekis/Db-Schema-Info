execute block
returns (
    SchemaName varchar(63) character set utf8,
    SequenceName varchar(63) character set utf8,
    CurrentValue bigint,
    InitialValue bigint,
    IncrementBy integer
)
as
begin
    for
        select trim(RDB$OWNER_NAME), trim(RDB$GENERATOR_NAME),
               RDB$INITIAL_VALUE, RDB$GENERATOR_INCREMENT
        from RDB$GENERATORS
        where coalesce(RDB$SYSTEM_FLAG, 0) = 0
        order by RDB$GENERATOR_NAME
        into SchemaName, SequenceName, InitialValue, IncrementBy
    do
    begin
        execute statement 'select gen_id("' || replace(SequenceName, '"', '""') ||
            '", 0) from RDB$DATABASE'
            into CurrentValue;
        suspend;
    end
end
