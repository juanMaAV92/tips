# Relationships, Keys and Constrains

## Type of relationships

*   One to One: 
    *   One row in a table is linked to one and only one row in another table.
    *   Example: A person has one passport and a passport belongs to one person.

*   One to Many:
    *   One row in a table is linked to one or more rows in another table.
    *   Example: A person has many credit cards and a credit card belongs to one person.    

* Self Joining:
    *   A table is joined to itself.
    *   Example: A person can be a parent to another person.

* Many to Many:
    *   One or more rows in a table is linked to one or more rows in another table.
    *   Example: A person can have many hobbies and a hobby can belong to many people.
    >   Many to Many relationships are not allowed in relational databases. 
    >   They are broken down into two __one to many__ relationships using a third table called a junction table.


## Keys

*   Primary Key:
    *   A primary key is a column or a set of columns that uniquely identifies each row in a table.

* Super Key:
    * It is a set of columns that uniquely identifies each row in a table.
    * It is a super set of a candidate keys.

* Candidate Key:
    *   A candidate key is a minimal set of columns that uniquely identifies each row in a table.

* Foreign Key:
    *   A foreign key is a column or a set of columns that references a candidate key in another table.

* Composite Key:
    *   A composite key is a key that consists of two or more columns that uniquely identifies each row in a table.




