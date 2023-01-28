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

Add column as foreign key

`ALTER TABLE table_name ADD COLUMN column_name DATATYPE CONSTRAINT REFERENCES referenced_table_name(referenced_column_name);`

Add foreign key

`ALTER TABLE table_name ADD CONSTRAINT constraint_name FOREIGN KEY(column_name) REFERENCES referenced_table_name(referenced_column_name);`

(default **constraint_name** for foreign key is **{table_name}_{column_name}_fkey**) 

Set non null

`ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;`

add unique

`ALTER TABLE table_name ADD UNIQUE (column1, column2,...);`

`ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column1, column2,...);`

(default **constraint_name** for unique is **{table_name}_{column_name(s)}_key**) 

Delete unique

`ALTER TABLE table_name DROP CONSTRAINT constraint_name;`

## Values

Insert values

`INSERT INTO table_name (column1_name, column2_name) VALUES ( value1, value2 );`

Update values

`UPDATE table_name SET column1 = value1, column2 = value2.... WHERE [condition];`

Delete values

`DELETE FROM table_name WHERE [condition];`

## Joins

<img src="https://static.wixstatic.com/media/2f98e9_5cc72f0a2de74a8294ec89801d9fa83c~mv2.png/v1/fill/w_925,h_693,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/2f98e9_5cc72f0a2de74a8294ec89801d9fa83c~mv2.png" alt="inner join" width="400" />

```
SELECT columns FROM tableA
INNER JOIN tableB
ON tableA.column_match = tableB.coulmn_match;
```

<img src="https://static.wixstatic.com/media/2f98e9_f8065163bb29435ea9a83710f4129543~mv2.png/v1/fill/w_925,h_664,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/2f98e9_f8065163bb29435ea9a83710f4129543~mv2.png" alt="full outer join" width="400" />

```
SELECT columns FROM tableA
FULL JOIN tableB
ON tableA.column_match = tableB.coulmn_match;
```

<img src="https://static.wixstatic.com/media/2f98e9_2ba24252fac0469199b0f66475ff62ca~mv2.png/v1/fill/w_925,h_658,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/2f98e9_2ba24252fac0469199b0f66475ff62ca~mv2.png" alt="left join" width="400" />

```
SELECT columns FROM tableA
LEFT JOIN tableB
ON tableA.column_match = tableB.coulmn_match;
```

<img src="https://static.wixstatic.com/media/2f98e9_ccbb7663fdc14bedaff9017afd760b38~mv2.png/v1/fill/w_925,h_654,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/2f98e9_ccbb7663fdc14bedaff9017afd760b38~mv2.png" alt="right join" width="400" />

```
SELECT columns FROM tableA
RIGHT JOIN tableB
ON tableA.column_match = tableB.coulmn_match;
```



