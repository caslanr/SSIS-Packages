/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/* Insert Data Sources that you will have replication on. Can add more */
DECLARE @DataSource TABLE(
	[Id] smallint NOT NULL PRIMARY KEY, 
    [name] varchar(50) NOT NULL
);

INSERT INTO @DataSource ([Id],[name])
VALUES	(1,'MSSQL'),
		(2,'FlatFile')

SET IDENTITY_INSERT [rpl].[DataSource] ON
INSERT INTO [rpl].[DataSource] ([Id],[name])
SELECT	src.[Id],
		src.[name]
FROM	@DataSource src
LEFT JOIN [rpl].[DataSource] trg on src.[name] = trg.[name]
where trg.[name] IS NULL
SET IDENTITY_INSERT [rpl].[DataSource] OFF
/* Insert Status Types */
DECLARE @Status TABLE(
	[Id] smallint NOT NULL PRIMARY KEY, 
    [name] varchar(50) NOT NULL
);

INSERT INTO @Status ([Id],[name])
VALUES	(1,'Valid'),
		(2,'InValid'),
		(3,'Waiting'),
		(4,'Running'),
		(5,'Successed'),
		(6,'Failed')
SET IDENTITY_INSERT [rpl].[Status] ON  
INSERT INTO [rpl].[Status] ([Id],[name])
SELECT	src.[Id],
		src.[name]
FROM	@Status src
LEFT JOIN [rpl].[Status] trg on src.[name] = trg.[name]
where trg.[name] IS NULL
SET IDENTITY_INSERT [rpl].[Status] OFF  