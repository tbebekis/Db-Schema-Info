select
    trim(t.RDB$OWNER_NAME)                             as SchemaName,
    trim(i.RDB$RELATION_NAME)                          as TableName,
    trim(i.RDB$INDEX_NAME)                             as IndexName,
    trim(isg.RDB$FIELD_NAME)                           as FieldName,
    (isg.RDB$FIELD_POSITION + 1)                       as FieldPosition,
    i.RDB$UNIQUE_FLAG                                  as IsUnique,
    coalesce(trim(rc.RDB$CONSTRAINT_TYPE), '')         as IndexType,
    i.RDB$SEGMENT_COUNT                                as FieldCount,
    coalesce(i.RDB$INDEX_INACTIVE, 0)                  as IsInactive,
    coalesce(trim(i.RDB$FOREIGN_KEY), '')              as ForeignKey,
    i.RDB$EXPRESSION_SOURCE                            as Definition
from
    RDB$INDICES i
        left join RDB$INDEX_SEGMENTS isg on isg.RDB$INDEX_NAME = i.RDB$INDEX_NAME
        left join RDB$RELATION_CONSTRAINTS rc on rc.RDB$INDEX_NAME = isg.RDB$INDEX_NAME
        left join RDB$RELATIONS t on i.RDB$RELATION_NAME = t.RDB$RELATION_NAME
where
    (i.RDB$SYSTEM_FLAG is null or i.RDB$SYSTEM_FLAG  = 0)
order by
    i.RDB$RELATION_NAME,
    i.RDB$INDEX_NAME,
    isg.RDB$FIELD_POSITION
