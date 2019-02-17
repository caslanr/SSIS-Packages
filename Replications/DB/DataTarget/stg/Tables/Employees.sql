CREATE TABLE [stg].[Employees]
(
--Household Fields
    [UniqueKey]		[varchar](32)	NOT NULL, 
    [HashValue]		[varchar](32)	NOT NULL,
	[CreatedAt]		[datetime]		NOT NULL,
    [UpdatedAt]		[datetime]			NULL,
	[DataSourceID]	[smallint]		NOT NULL,
	[ActionType]	[nchar](1)			NULL,
	--[FileLogId]		[int]				NULL, -- optional; if source is file and want to know which rows came from which file.
-- Source Fields
	[Email]			[nvarchar](255) NOT NULL,
	[FirstName]		[nvarchar](50)		NULL,
	[LastName]		[nvarchar](50)		NULL,
	[CompanyName]	[nvarchar](50)		NULL,
	[Address]		[nvarchar](50)		NULL,
	[City]			[nvarchar](50)		NULL,
	[County]		[nvarchar](50)		NULL,
	[State]			[nvarchar](5)		NULL,
	[Zip]			[nvarchar](10)		NULL,
	[Phone1]		[nvarchar](12)		NULL,
	[Phone2]		[nvarchar](12)		NULL, 
	[Web]			[nvarchar](255)		NULL, 
	PRIMARY KEY ([UniqueKey], [DataSourceID])
)
GO
