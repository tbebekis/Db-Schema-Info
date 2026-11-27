select
    p.OWNER as SchemaName,
    p.OBJECT_NAME as ProcedureName,
    p.OBJECT_TYPE as ProcedureType,
    (
        select XMLAGG(XMLELEMENT(e, s.TEXT).EXTRACT('//text()') order by s.LINE).GETCLOBVAL()
        from ALL_SOURCE s
        where s.OWNER = p.OWNER and s.NAME = p.OBJECT_NAME and s.TYPE = p.OBJECT_TYPE
    ) as Definition
from ALL_PROCEDURES p
where p.OWNER = SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA')
    and p.PROCEDURE_NAME is null and p.OBJECT_TYPE in ('PROCEDURE', 'FUNCTION', 'PACKAGE')
order by p.OBJECT_NAME
