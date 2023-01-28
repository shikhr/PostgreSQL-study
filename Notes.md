## psql

login: 
```
psql -U username [-d database]
```

`> \l` : List all databases

`> \c database_name` : connect to database_name

`> \d` : display all tables, views, and sequences

`> \dt` : display all tables

`> \d table_name` : (table definition) lists all columns, their types, collection, whether they are nullable or not, and their default value

`> \d+ table_name` : (additional table definition) including description and physical disk size

## Database

Create database

`CREATE DATABASE database_name WITH OWNER username;`

Drop database

`DROP DATABASE IF EXISTS database_name;`

Rename database

`ALTER DATABASE old_name RENAME TO new_name;`

## Table

Create table

```
CREATE TABLE table_name(
  column_name column_type,
  column_name column_type
);
```

Delete table

`DROP TABLE IF EXISTS table_name CASCADE;`

Add column

`ALTER TABLE table_name ADD COLUMN column_name data_type [constraints];`

Delete column

`ALTER TABLE table_name DROP COLUMN column_name;`

Rename column

`ALTER TABLE table_name RENAME COLUMN old_name TO new_name;`

## Constraints

Add primary key

`ALTER TABLE table_name ADD PRIMARY KEY (column_1, column_2);`

to change constraint name of primary key

`ALTER TABLE table_name ADD CONSTRAINT constraint_name PRIMARY KEY(column1, column2,...);`

Delete primary key

`ALTER TABLE table_name DROP CONSTRAINT constraint_name;`

(default **constraint_name** for primary key is **{table_name}_pkey**) 

Set non null

`ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`

add unique

`ALTER TABLE table_name ADD UNIQUE (column1, column2,...);`

`ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column1, column2,...);`

(default **constraint_name** for unique is **{table_name}_{column_name(s)}_pkey**) 

Delete unique

`ALTER TABLE table_name DROP CONSTRAINT constraint_name;`

# Values

Insert values

`INSERT INTO table_name (column1_name, column2_name) VALUES ( value1, value2 );`





