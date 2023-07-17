# Data definition Languaje (create, alter, drop)


## CREAT A DB
```sql
CREATE SCHEMA db_name DEFAULT CHARACTER SET utf8;

USE db_name;
```

## CREAT A TABLE
```sql
CREATE TABLE db_name.table_name (
    id INT NOT NULL AUTO_INCREMENT,
    field_1 varchar(255) NULL ,
    field_1 TEXT DEFAULT 'default Value',
    field_2 TIMESTAMP,
    foreign_id INT NOT NULL,
    PRIMARY KEY ( id ),
    UNIQUE INDEX field_1_UNIQUE ( field_1 ASC )
);

```

## DELETE A TABLE OR DB
```sql
DROP TABLE db_name.table_name;

DROP SCHEMA db_name;
```

## CREAT A VIEW
```sql
CREATE VIEW 'view_name' AS
    SELECT field_1, ..., field_n
    FROM db_name.table_name
    WHERE fielx = " ";
```

## Modify Table
```sql
ALTER TABLE db_name.table_name
ADD COLUMN new_column_name TYPE_HERE NULL AFTER some_field;

ALTER TABLE db_name.table_name
CHANGE COLUMN column_name new_column_name NEW_TYPE_HERE;

ALTER TABLE db_name.table_name
DROP COLUMN column_name;
```

## Foreign keys
```sql
ALTER TABLE db_name.table_name
ADD INDEX localTableName_foreignTableName_idx  ( local_field_id ASC):

ALTER TABLE db_name.table_name
ADD CONSTRAINT localTableName_foreignTableName
    FOREIGN KEY (local_field_id)
    REFERENCES db_name.table_foreign_name ( foreign_field )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
```

- On Update and On Delete with foreign keys option:
    * CASCADE
    * NO ACTION
    * RESTRICT
    * SET NULL

