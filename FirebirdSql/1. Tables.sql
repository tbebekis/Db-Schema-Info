select              
  RDB$OWNER_NAME                  as SchemaName,    
  RDB$RELATION_NAME               as TableName,  
  COALESCE(RDB$VIEW_SOURCE, '')   as Definition               
from                                                
  RDB$RELATIONS                                     
where                                               
  (RDB$SYSTEM_FLAG is null or RDB$SYSTEM_FLAG = 0)  
  and RDB$VIEW_BLR is null                          
order by                                            
  RDB$RELATION_NAME  