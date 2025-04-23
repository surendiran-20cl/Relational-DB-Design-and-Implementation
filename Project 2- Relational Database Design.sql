/*
Problem Statement:
How to convert a relational design into tables in SQL Server?

Topics:
In this project, you will work on converting a relational design that enlists various
users, their roles, user accounts and their statuses into different tables in SQL
Server and insert data into them. Having at least two rows in each of the tables,
you have to ensure that you have created respective foreign keys.

Tasks To Be Performed:
● Define relations/attributes
● Define primary keys
● Create foreign keys

Project Goal:

Create a relational schema to manage:

- Users

- Roles

- User Accounts

- Account Status

✅ Step 1: Designing the Schema
We'll define the following tables:

Roles – list of possible user roles (e.g., Admin, Editor)

Statuses – account statuses (e.g., Active, Inactive)

Users – user information (e.g., name, email)

UserAccounts – links users to roles and statuses

🔁 Relationships
UserAccounts will reference:

Users (foreign key)

Roles (foreign key)

Statuses (foreign key)

*/

-- Step 2: SQL Code to Create Tables with Keys & Comments

-- Create the Roles table
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1), -- Auto-increment primary key
    RoleName VARCHAR(50) NOT NULL
);

-- Create the Statuses table
CREATE TABLE Statuses (
    StatusID INT PRIMARY KEY IDENTITY(1,1),
    StatusName VARCHAR(50) NOT NULL
);

-- Create the Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL
);

-- Create the UserAccounts table with foreign keys
CREATE TABLE UserAccounts (
    AccountID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    RoleID INT,
    StatusID INT,
    CreatedDate DATETIME DEFAULT GETDATE(),

    -- Foreign key relationships
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID),
    FOREIGN KEY (StatusID) REFERENCES Statuses(StatusID)
);

/*
 Explanation:

IDENTITY(1,1) auto-increments IDs

Foreign keys enforce referential integrity, ensuring no orphan references

UserAccounts connects everything: which user plays what role and their status
*/

-- Step 3: Inserting Sample Data

-- Insert sample roles
INSERT INTO Roles (RoleName) VALUES ('Admin'), ('User');

-- Insert sample statuses
INSERT INTO Statuses (StatusName) VALUES ('Active'), ('Inactive');

-- Insert sample users
INSERT INTO Users (UserName, Email)
VALUES ('Alice Smith', 'alice@example.com'),
       ('Bob Johnson', 'bob@example.com');

-- Insert user accounts with proper foreign keys
-- Assume IDs are: Alice=1, Bob=2 | Admin=1, User=2 | Active=1, Inactive=2
INSERT INTO UserAccounts (UserID, RoleID, StatusID)
VALUES (1, 1, 1), -- Alice as Admin, Active
       (2, 2, 2); -- Bob as User, Inactive

--Step 4: Deleting All Data from Tables

-- Delete from child table first due to foreign key constraints
DELETE FROM UserAccounts;
DELETE FROM Users;
DELETE FROM Roles;
DELETE FROM Statuses;

/*
Explanation:

We must delete from child to parent (reverse order of creation)

Otherwise, SQL Server will throw foreign key constraint errors
*/
