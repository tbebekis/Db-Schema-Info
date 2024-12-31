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

#### Tables
- SchemaName
- TableName
#### Views
- SchemaName
- TableName
- Definition
#### Table and View Fields
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
#### Indexes
- SchemaName
- TableName
- IndexName
- FieldName 
- FieldPosition
- IsUnique     
- IndexType 
#### Triggers
- SchemaName
- TableName
- TriggerName
- TriggerType
- Definition
#### Procedures
- SchemaName
- ProcedureName
- ProcedureType
- Definition
#### Constraints
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
#### Sequences
- SchemaName
- SequenceName
- CurrentValue
- InitialValue
- IncrementBy	

## Sample Database
This repository contains `sql` files to create the widely used `dvdrental` sample database and feed it with data. That database can be used to test the SQL SELECT statements that return Database Schema information.

## How to create the sample Database

I use the community edition of the excellent [Dbeaver](https://dbeaver.io/) tool. As their site states _DBeaver Community is a free cross-platform database tool for developers, database administrators, analysts, and everyone working with data. It supports all popular SQL databases like MySQL, MariaDB, PostgreSQL, SQLite, Apache Family, and more_.

Some databases can be created using a tool like Dbeaver. Others require [CLI tools](https://en.wikipedia.org/wiki/Command-line_interface).

#### FirebirdSql

I didn't find a way to create a Firebird database with Dbeaver.

The [`isql`](https://www.firebirdsql.org/file/documentation/html/en/firebirddocs/isql/firebird-isql.html) Firebird tool may used in creating a new Firebird database.

  - Run a terminal as administrator
  - `cd` to where the `isql` is installed, e.g. `C:\Program Files\Firebird\Firebird_5_0`,
  - in terminal type in the following 3 lines, and hit `Enter` key after each one.

```
isql

CREATE DATABASE 'C:\path\to\DVD.fdb' USER 'SYSDBA' PASSWORD 'YourPassword' PAGE_SIZE 8192 DEFAULT CHARACTER SET UTF8;

exit;
```
 
Here is a copy of my terminal.

```
C:\>cd C:\Program Files\Firebird\Firebird_5_0
C:\Program Files\Firebird\Firebird_5_0>isql
Use CONNECT or CREATE DATABASE to specify a database
SQL> CREATE DATABASE 'C:\path\to\DVD.fdb' USER 'SYSDBA' PASSWORD 'YourPassword' PAGE_SIZE 8192 DEFAULT CHARACTER SET UTF8;
SQL> exit;
C:\>
```

#### MsSql
Using Dbeaver.
  - Add a connection to a Microsoft Sql Server, e.g. localhost,
  - expand the connection tree node,
  - right click on the `Databases` tree node
  - click on the `Create New Database` menu item
  - in the `Create...` dialog box provide a database name, e.g. `DVD`
  - click on `OK` button


#### MySql or MariaDb
Using Dbeaver. 

  - Add a connection to a MySql or MariaDb Server, e.g. localhost,
  - expand the connection tree node,
  - right click on the `Databases` tree node
  - click on the `Create New Database` menu item
  - in the `Create...` dialog box provide a database name, e.g. `DVD`
  - click on `OK` button

#### PostgreSql
Using Dbeaver. 

  - Add a connection to a PostgreSql Server, e.g. localhost,
  - expand the connection tree node,
  - right click on the `Databases` tree node
  - click on the `Create New Database` menu item
  - in the `Create...` dialog box provide a database name, e.g. `DVD`
  - click on `OK` button

#### Sqlite
Using Dbeaver. 
  - Click the menu `Database | New Database Connection`,
  - select the Sqlite driver,
  - in the Connection dialog box provide a path for the database file, e.g. `C:\Temp\DVD.db3` and 
  - click on the `Create` button.

## How to drop the sample Database

#### FirebirdSql
Close any connection to the database.

Go to database's folder and delete the database file.
#### MsSql
Close any connection to the database.

In Dbeaver select the database and hit the Delete key.
#### MySql or MariaDb
Close any connection to the database.

In Dbeaver select the database and hit the Delete key.
#### PostgreSql
Close any connection to the database.

In Dbeaver select the database and hit the Delete key.
#### Sqlite
Close any connection to the database.

Go to database's folder and delete the database file.

## Oracle Databases

In an Oracle Server, there are several types of databases that can be created. Two of them are the most common:

- Container Database (CDB): A database that contains multiple pluggable databases (PDBs), introduced in Oracle 12c.
- Pluggable Database (PDB): A self-contained database that can be plugged into a CDB, providing improved manageability and scalability.

Common users are users that exist in the root container (`CDB$ROOT`) 
and can be accessed from any pluggable database (PDB) in the CDB.

Trying to create a common user in a CDB database as
```
    CREATE USER User_Name IDENTIFIED BY Password ACCOUNT UNLOCK;
```

results in the following error:
```
    ORA-65096: invalid common user or role name
```

To create a common user in a CDB database the user name must be prefixed with `C##` or `c## `
```
    CREATE USER c##User_Name IDENTIFIED BY Password ACCOUNT UNLOCK;
```

#### Oracle Database, Schema and User

In Oracle a database is a collection of Schemas.

A Schema is owned by a User. User and Schema share the same name. In Oracle, users and schemas are essentially the same thing.

A Schema is a collection of database objects, such as tables, views, indexes, etc.

That is a Schema/User has his own collection of tables, views, etc., in a database.

#### The `sqlplus` Command Line Tool

The [`sqlplus`](https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlqr/SQL-Plus-Commands.html) Command Line Tool provides access to the Oracle dabases. Using the `sqlplus` the user can 

- Startup and shutdown an Oracle database
- Connect to an Oracle database
- Enter and execute SQL commands and PL/SQL blocks
- Format and print query results

The [`sqlplus`] must be in the system `path`.

To connect to `sqlplus` the following is used

```
    sqlplus SYSTEM/YourPassword@localhost as SYSDBA
```


#### To find out already existing Pluggable Databases (PDBs)

Connect ot `sqlplus`.
```
    sqlplus SYSTEM/YourPassword@localhost as SYSDBA
```

And then any of the following
```
    Show pdbs; 
    select * from DBA_PDBS;
    select name, open_mode from v$pdbs;  
``` 
 
#### To create a Pluggable Database (PDB)

The following uses the PDBSEED to create a Pluggable Database, meaning that the PDBSEED is used as a template.

The following assumes that [Oracle Database Express Edition (XE)](https://www.oracle.com/database/technologies/appdev/xe.html) is used and it is installed in C:\Oracle.
 
```
    sqlplus SYSTEM/Password@localhost as SYSDBA

    create pluggable database PDB1 admin user User_Name identified by "Password"
        ROLES = (dba) 
        default tablespace PDB1_USERS
        datafile 'C:\Oracle\oradata\XE\PDB1\pdb1_users01.dbf' size 250m autoextend on
        storage (maxsize 10g max_shared_temp_size 10g)
        file_name_convert=('C:\Oracle\oradata\XE\pdbseed', 'C:\Oracle\oradata\XE\PDB1\');

    alter pluggable database  PDB1 open read write force;   
``` 
 
#### To create a User in a Pluggable Database (PDB)

Connect ot `sqlplus`.
```
    sqlplus SYSTEM/YourPassword@localhost as SYSDBA
```

List the pluggable databases.

```
    select name, open_mode from v$pdbs;  
```

Get a name of a pluggable database from the previous list, e.g. XEPDB1 and open it.
```
    alter session set container=XEPDB1;
    alter pluggable database XEPDB1 open;
```

Create the user.

```
    create user YourUserName identified by YourPassword ACCOUNT UNLOCK;
    grant all privileges to YourUserName identified by YourPassword;
```

There is a lot of variations in [granting privileges](https://www.atlassian.com/data/admin/how-to-create-a-user-and-grant-permissions-in-oracle) to a user.

#### To drop a Pluggable Database (PDB)

Connect ot `sqlplus`.
```
    sqlplus SYSTEM/YourPassword@localhost as SYSDBA    
```

Close any connection.

```
    alter pluggable database PDB1 close immediate instances=ALL; 
```

To drop a pluggable database and keep its datafiles.
```
    drop pluggable database PDB1 keep datafiles;     
```
 

To drop a pluggable database along with its datafiles.
```
    drop pluggable database PDB1 including datafiles;
```
  

## Create the sample Database for Oracle

```
    sqlplus SYSTEM/YourPassword@localhost as SYSDBA

    create pluggable database DVD admin user User_Name identified by "Password"
        ROLES = (dba) 
        default tablespace DVD_USERS
        datafile 'C:\Oracle\oradata\XE\DVD\dvd_users01.dbf' size 250m autoextend on
        storage (maxsize 10g max_shared_temp_size 10g)
        file_name_convert=('C:\Oracle\oradata\XE\pdbseed', 'C:\Oracle\oradata\XE\DVD\');

    alter pluggable database DVD open read write force;   

    alter session set container=DVD;

    alter pluggable database DVD open;     

    create user YourUserName identified by YourPassword ACCOUNT UNLOCK;   

    grant all privileges to YourUserName identified by YourPassword;
```


