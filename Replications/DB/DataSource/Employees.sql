CREATE TABLE [dbo].[Employees](
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[company_name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](50) NULL,
	[city] [nvarchar](50) NOT NULL,
	[county] [nvarchar](50) NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[zip] [nvarchar](50) NOT NULL,
	[phone1] [nvarchar](50) NOT NULL,
	[phone2] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[web] [nvarchar](250) NULL
) ON [PRIMARY]
GO
