# Database Engineering — Notes

A personal knowledge base for database concepts — organized by topic for quick look-up and re-understanding, not by week.

## Reading Order

Each note has **Previous / Next** links at the top, so you can read straight through:

1. [Databases](databases/databases.md)
2. [SQL Fundamentals](sql-fundamentals/sql-fundamentals.md)
3. [SQL Commands](sql-commands/sql-commands.md)
4. [Clauses](clauses/clauses.md)
5. [Filtering Data](filtering/filtering.md)
6. [Combining Data](combining-data/combining-data.md)
7. [Joins](joins/joins.md)
8. [Set Operators](set-operators/set-operators.md)

## Foundations

| Topic | What's inside |
| --- | --- |
| [Databases](databases/databases.md) | What a database is, why we need one, why DBMS, types of databases, database structure (server → database → schema → table) |
| [SQL Fundamentals](sql-fundamentals/sql-fundamentals.md) | Statement, query, clause, operator, operand, predicate and how they fit together |
| [SQL Commands](sql-commands/sql-commands.md) | Command categories (DDL, DML, DQL) and the DDL/DML commands |

## Querying

| Topic | What's inside |
| --- | --- |
| [Clauses](clauses/clauses.md) | SELECT, FROM, WHERE, GROUP BY, HAVING, ORDER BY, DISTINCT, TOP, ALIAS, execution order, static values |
| [Filtering Data](filtering/filtering.md) | Operators, expressions, conditions, comparison / logical / range / membership / search operators |

## Combining Data

| Topic | What's inside |
| --- | --- |
| [Combining Data](combining-data/combining-data.md) | Sets vs joins overview |
| [Joins](joins/joins.md) | Why we join, basic joins (inner, left, right, full), advanced joins (anti joins, cross join), multi-table join |
| [Set Operators](set-operators/set-operators.md) | UNION, UNION ALL, EXCEPT, INTERSECT and their rules |

## Practice

SQL scripts used while practising: [`sql/`](sql)

- [dml-ddl-and-filtering.sql](sql/dml-ddl-and-filtering.sql)
- [joins.sql](sql/joins.sql)
- [set-operators.sql](sql/set-operators.sql)
- [challenges.sql](sql/challenges.sql)
