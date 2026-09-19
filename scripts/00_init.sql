

-- Create the data warehouse database
CREATE DATABASE data_warehouse;
GO

-- Switch to the new database
USE data_warehouse;
GO

-- Create Medallion architecture schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO