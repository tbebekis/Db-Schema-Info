select
    TABLE_OWNER as SchemaName,
    TRIGGER_NAME as TriggerName,
    TABLE_NAME as TableName,
    TRIGGER_TYPE || ' ' || TRIGGERING_EVENT as TriggerType,
    TRIGGER_BODY as Definition
from ALL_TRIGGERS
where OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA') and TABLE_OWNER = OWNER and BASE_OBJECT_TYPE = 'TABLE'
order by TABLE_NAME, TRIGGER_NAME
