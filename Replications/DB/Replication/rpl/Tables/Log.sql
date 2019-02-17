CREATE TABLE [rpl].[Log] (
    [Log_id]       BIGINT              IDENTITY (1, 1) NOT NULL,
    [parent_id]    BIGINT              NULL,
    [execution_id] UNIQUEIDENTIFIER NULL,
    [package_id]   UNIQUEIDENTIFIER NOT NULL,
    [package_name] NVARCHAR (255)   NULL,
    [status]       SMALLINT         NULL,
    [message]      NVARCHAR (MAX)   NULL,
    [Created_by]   [sysname]        NULL,
    [start_time]   DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [end_time]     DATETIME2 (7)    NULL,
    PRIMARY KEY CLUSTERED ([Log_id] ASC)
);

