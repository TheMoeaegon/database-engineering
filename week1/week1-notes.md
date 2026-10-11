\- Database is like of container. it is kind of organized collection of data
why database?
-  database organized data in such a way that it is easier to access, manage and search.
    this process is fast, effiecinet.
- can handle large amount of data 
- more secure to store data, controll who can access what.

why dbms?
- mulitple users are interacting with database at same time. so we need some kind of software to manage the request comming to database (because database is just kind of container that only store data), handle who can execute query against the database, which query to run, how to process request.
so, dbms is software which is going to manage database.

##### Types of Database
- Relational Database 
- Key value pair database (redis, amazon db)
- Column based database (main purpose is to search for data) (apache cassandra)
- Graph (neo4j)
- Document  (mongodb)

##### Database structure
- we have server (and in server we can have multiple database) inside database we have schema (which are logical containers, it can be used to organize the table in the database) and inside schema we have multiple tables which are row and column.
	![[img1.png]]

##### SQL Command
- Data definition lanaguage - command used to defined structure (we have, create, alter and delete)
-  Data manipulation languege - command used to manpilutate the data that is store in database (Insert, Delete, Update)
- Data Query Lanauge - now we have to data to analysis the store data we use this command. and we have SELECT command.

	![[img3.png]]

##### Sql
\- What is query? -> request infromation from database
\- What is statemetn? -> complete instruction
\- what is clause? 

##### clause
- select
- distinct 
- top (filter based on row number)
- from
- where (filter data before aggregation)
- group by
- having (filter data after aggregation)
- order by

###### Group by clause
\- combine rows with the same value
\- aggregate a column by another column

\- group by rule: all columns in the select clause must be either aggregrated or include in group by.
\- result of group by is determined by the unique values of the grouped columns.

###### Alias
\- shorthand name (label) assigned to column or table in a query. it doens't exist in table and only exist inside the query.

###### Having Clause
\- filters data after aggregation
\- can be used with group by

###### Distinct
\- Removes Duplicates (Repeated Values)
\- each value appear only onces

Note: Don't use distinct unless it's necessary; it can slow down your query.

###### Top
\- Restrict the number of rows returned

###### Execution Order vs Coding order

![[img4.png]]

Execution Order

![[img5.png]]


###### Static Values
\- we can have mix value from database and static value.

![[img6.png]]


#### Data Definition Language (DDL)
\- Define structure of your data
\- this command will never return data but change strucutre of the database
\- We have CREATE, ALERT and DROP statement
#### Data Manipulation Lanage (DML)
\- Modify (manipulate) your data
\- we have insert, update and delete
\- Insert data we have to two may manually where we type whole command insert into ...
- To insert data into table we must have matching data type, constraints and column count.
- and second way we can insert with select statement.
\- we can use update statement to update the value of single column or multiple column.
\- to whole data in a table we have delete and truncate.

##### Filtering Data

\- Operators
- an operator is a symbol or keyword that performs an operation on values or expressions. Logical operators are a specific category of operators used to combine or reverse conditions.

![[img7.png]]

\- Expression
- An SQL expression is a combination of one or more values, operators, columns, and functions that the database engine evaluates to return a single data value. Expressions do not run as standalone commands; instead, they are embedded within SQL statements—such as `SELECT`, `WHERE`, `HAVING`, and `ORDER BY` clauses—to manipulate, filter, or calculate data.

\- Condition
- a condition (often called a predicate or Boolean expression) is a specific type of expression that evaluates to a **Boolean value** (`TRUE`, `FALSE`, or `UNKNOWN`). It is used to filter or control logic, typically inside `WHERE`, `HAVING`, or `ON` clauses. 

 ![[img8.png]]	


\- Definition of an Expression in SQL
- An expression is any combination of values (literals), column references, functions, and operators that the database evaluates to produce a single value.
	• Examples of values: 5, 'hello', CURRENT_DATE
	• Examples with operators: 2 + 3 (evaluates to 5), price * 1.1
	• Examples with functions: UPPER(name), COUNT(*)

\- Are 2 and 3 > 2 Expressions?
	• 2 is an expression: It is a literal value (specifically a numeric literal) that evaluates to 2.
	• 3 > 2 is an expression (specifically a Boolean expression): It combines two values (3 and 2)                with a comparison operator (>). It evaluates to a Boolean value: TRUE.
	
\- Is a Comparison Condition Called a "Condition" or an "Expression"?
- It is both. In SQL terminology, a condition is just a specialized type of expression that evaluates to a Boolean value (TRUE, FALSE, or UNKNOWN).
	• Expression perspective: Anything that returns a value is an expression. Because a comparison like 3 > 2 returns TRUE or FALSE, it fits the formal definition of an expression.
	• Condition perspective: When you place that same logic inside a filtering clause (like WHERE or HAVING) to decide which rows to keep or discard, it functions as a condition.

In short: All conditions in SQL are expressions (specifically, ones that yield a true/false result), though not all expressions are used as conditions (e.g., an arithmetic expression like 2 + 3 yields a number, not a truth value).

###### comparison operator
 ![[img9.png]]