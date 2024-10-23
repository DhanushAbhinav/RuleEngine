## Rule Engine with Abstract Syntax Tree (AST)


--This project is a simple 3-tier Rule Engine built with Spring Boot. It determines user eligibility based on attributes like age, department, income, spend, etc., by dynamically creating and modifying conditional rules represented as an Abstract Syntax Tree (AST). The application provides a simple UI, an API for rule creation, combination, and evaluation, and uses a relational database to store the rules.

Features

--Dynamic Rule Creation: Supports creating rules dynamically using a string-based rule syntax.

--Rule Combination: Allows the combination of multiple rules into a single Abstract Syntax Tree (AST) to optimize and evaluate user data.

--Rule Evaluation: Evaluates user data against complex rules and returns a result indicating whether the user qualifies for the rule or not.

--AST Representation: Uses a tree data structure to represent and evaluate conditional rules.

--Error Handling & Validation: Handles invalid rule strings or malformed data, with proper validations for supported attributes.


## Technologies Used

--Spring Boot: Backend framework

--Java: Programming language

--H2/SQLite: In-memory database for development and SQLite for production

--Thymeleaf: Simple UI for rule creation and testing

--SQL: To define database schema and store rules

--Maven: Build tool to run the application
