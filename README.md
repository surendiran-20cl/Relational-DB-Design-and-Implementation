# Relational Database Design and Implementation in SQL Server

## Project Overview

This project involves designing and implementing a relational database schema in Microsoft SQL Server Management Studio (SSMS). It focuses on defining and establishing relationships between users, roles, user accounts, and account statuses using primary and foreign keys.

## Objectives

- Design a normalized relational schema
- Create SQL tables with appropriate constraints
- Define and enforce relationships using foreign keys
- Insert sample data into each table
- Practice deleting data while maintaining referential integrity

## Database Schema Design

The following tables were designed and implemented:

1. **Roles**: Stores available user roles (e.g., Admin, User)
2. **Statuses**: Contains possible account statuses (e.g., Active, Inactive)
3. **Users**: Stores user information such as name and email
4. **UserAccounts**: Maps each user to a role and status, and records account creation details

## Relationships

- Each `UserAccount` is linked to:
  - One `User`
  - One `Role`
  - One `Status`
- These relationships are enforced using foreign key constraints to ensure data consistency.

## SQL Concepts Applied

- **CREATE TABLE** with primary and foreign key constraints
- **INSERT** statements for sample data
- **DELETE** operations in order of dependencies to maintain referential integrity
- Use of `IDENTITY` for auto-incrementing primary keys
- Use of `DEFAULT GETDATE()` for automatic timestamping

## Tasks Completed

1. Created tables with appropriate primary and foreign key constraints.
2. Inserted at least two sample records into each table.
3. Demonstrated how to delete records from all tables while respecting referential constraints.

## Files Included

- `relational_schema.sql`: Contains SQL commands to create tables, insert data, and delete data.
- `README.md`: Project documentation file.

## How to Use

1. Open Microsoft SQL Server Management Studio (SSMS).
2. Connect to your SQL Server instance.
3. Run the `relational_schema.sql` file in a new query window.
4. Verify table creation, data insertion, and referential constraints by running SELECT queries or viewing the table relationships in the Object Explorer.

## Acknowledgements

- Intellipaat SQL Certification Program for providing the project structure and learning support.
