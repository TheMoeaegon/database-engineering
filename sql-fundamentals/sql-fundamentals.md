## SQL Fundamentals

← Previous: [Databases](../databases/databases.md) | [Index](../README.md) | Next → [SQL Commands](../sql-commands/sql-commands.md)

### Quick Overview
- What is a **query**? → request information from the database.
- What is a **statement**? → complete instruction.
- What is a **clause**? → a logical section of a statement (see below).

### SQL Statement
- Definition: An SQL statement is a complete instruction written in SQL that tells a database to perform an operation.
- A statement can retrieve data, insert records, update existing records, delete records, or modify the database structure.

**Examples:**
```sql
    -- Retrieve data
    SELECT * FROM users;

    -- Insert a record
    INSERT INTO users (name, age)
    VALUES ('Ram', 20);

    -- Update a record
    UPDATE users
    SET age = 21
    WHERE name = 'Ram';

    -- Create a table
    CREATE TABLE products (
        id INT,
        name VARCHAR(100)
    );
```
Each example is a complete SQL statement.

**Common categories of SQL statements:**
- **DQL (Data Query Language):** Retrieves data, primarily using `SELECT`.
- **DML (Data Manipulation Language):** Modifies data using commands such as `INSERT`, `UPDATE`, and `DELETE`.
- **DDL (Data Definition Language):** Defines or modifies database structures using commands such as `CREATE`, `ALTER`, and `DROP`.
- **DCL (Data Control Language):** Manages database permissions.
- **TCL (Transaction Control Language):** Manages transactions using commands such as `COMMIT` and `ROLLBACK`.

### SQL Query
- Definition: A query is generally a request to retrieve or examine information stored in a database. In everyday development, the term is also frequently used more broadly to refer to SQL instructions in general.

**Example:**
```sql
    SELECT name, age
    FROM users
    WHERE age >= 18;
```
This query requests the names and ages of users who are at least 18 years old.

**Query vs Statement:**
- The terms *query* and *statement* are often used interchangeably, but their meanings are not always identical.
  - A **statement** is a complete SQL instruction.
  - A **query**, in its narrower sense, requests information from a database.
  - For example, `SELECT` is typically used for querying data, while `INSERT` is a statement that adds data.

### SQL Clause
- Definition: A clause is a logical section of an SQL statement that performs a specific role in the instruction.

Consider this query:
```sql
    SELECT name, age
    FROM users
    WHERE age >= 18
    ORDER BY name;
```

It contains the following clauses:

| Clause           | Purpose                            |
| ---------------- | ---------------------------------- |
| SELECT name, age | Specifies which columns to return. |
| FROM users       | Specifies the source table.        |
| WHERE age >= 18  | Filters rows based on a condition. |
| ORDER BY name    | Sorts the results by name.         |
**Other commonly used clauses:**
- **GROUP BY** — groups rows that share values.
- **HAVING** — filters groups based on a condition.
- **LIMIT** — restricts the number of returned rows in databases such as PostgreSQL and MySQL.
- **OFFSET** — skips a specified number of rows.
- **JOIN** — combines related data from tables.

> Note: A clause is generally not a complete statement on its own. For example, `WHERE age >= 18` is a clause that must be part of a suitable SQL statement.

### SQL Operator
- Definition: An operator is a symbol or keyword that performs an operation on one or more operands, such as calculating a value, comparing values, or combining conditions.
- An **operand** is a value or other input on which an operator acts.

### Summary: How These Concepts Fit Together

Consider this complete SQL statement:
```sql
    SELECT name, price
    FROM products
    WHERE price >= 100
      AND category_id IN (2, 3, 4)
    ORDER BY price DESC;
```

The statement can be understood at several levels:

| Concept   | Example                                         |
| --------- | ----------------------------------------------- |
| Statement | The entire SQL instruction.                     |
| Query     | The request to retrieve product information.    |
| Clause    | WHERE price >= 100 AND category_id IN (2, 3, 4) |
| Operator  | >= and AND                                      |
| Predicate | price >= 100                                    |
| Predicate | category_id IN (2, 3, 4)                        |
| Operand   | price, 100, category_id                         |

The important distinction is that each term describes a different aspect of SQL:
- **Statement** describes the complete instruction.
- **Query** describes a request for information, usually in the narrower sense.
- **Clause** describes a section of the instruction.
- **Operator** describes an operation performed on values or conditions.
- **Predicate** describes a condition that evaluates to TRUE, FALSE, or potentially UNKNOWN.
