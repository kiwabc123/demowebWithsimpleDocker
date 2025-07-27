IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'mydb')
BEGIN
    CREATE DATABASE mydb;
END
GO

USE mydb;
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'datasets')
BEGIN
    CREATE TABLE datasets (
        id INT PRIMARY KEY IDENTITY(1,1),
        name NVARCHAR(255),
        description NVARCHAR(MAX),
        tags NVARCHAR(255),
        last_updated DATETIME,
        record_count INT,
        owner NVARCHAR(100),
        source_system NVARCHAR(100),
        is_public BIT,
        created_at DATETIME
    );
END
GO
