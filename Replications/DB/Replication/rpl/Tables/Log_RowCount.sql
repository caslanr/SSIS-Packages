CREATE TABLE [rpl].[Log_RowCount]
(
	[Id] [bigint] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Log_id]  [bigint]      NOT NULL,
	[ReplicationType] [varchar](50) not null,
	[SourceName] [varchar](255) NOT NULL,
	[RowTotal] [int] NOT NULL,
	[RowValid] [int]  NULL,
	[RowInValid] [int] NULL,
	[RowInserted] [int] NULL,
	[RowUpdated] [int] NULL,
	[Status] [smallint] NOT NULL 
)
