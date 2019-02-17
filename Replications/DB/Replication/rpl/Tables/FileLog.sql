CREATE TABLE [rpl].[FileLog]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FileName] [varchar](255) NOT NULL,
	[FileLoadDate] [datetime] NOT NULL,
	[RowTotal] [int] NOT NULL,
	[RowValid] [int] NOT NULL,
	[RowInValid] [int] NULL,
	[RowInserted] [int] NULL,
	[RowUpdated] [int] NULL,
	[FileSizeInByte] [int] NOT NULL,
	[LastWriteTime] [datetime] NOT NULL,
	[Status] [smallint] NOT NULL 
)
