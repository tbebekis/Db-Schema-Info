# Database Schema information for various RDBMS

This repository contains a number of SQL SELECT statements to get Database Schema information for the following RDBMS

- FirebirdSql
- MsSql
- MySql
- PostgreSql
- Sqlite
- Oracle

## Returned Field Lists of the SELECT statements
The SELECT statements return the following Field Lists.

### Tables
- SchemaName
- TableName
### Views
- SchemaName
- TableName
- Definition
### Table and View Fields
- SchemaName
- TableName
- FieldName
- DataType 
- DataSubType 
- IsNullable
- SizeInChars
- SizeInBytes
- DecimalPrecision
- DecimalScale
- DefaultValue
- Expression
- OrdinalPosition
### Indexes
- SchemaName
- TableName
- IndexName
- FieldName 
- FieldPosition
- IsUnique     
- IndexType 
### Triggers
- SchemaName
- TableName
- TriggerName
- TriggerType
- Definition
### Procedures
- SchemaName
- ProcedureName
- ProcedureType
- Definition
### Constraints
- SchemaName
- ConstraintName
- ConstraintType
- TableName
- FieldName
- ForeignTable
- ForeignField
- UpdateRule
- DeleteRule
- FieldPosition
### Sequences
- SchemaName
- SequenceName
- CurrentValue
- InitialValue
- IncrementBy	
 


