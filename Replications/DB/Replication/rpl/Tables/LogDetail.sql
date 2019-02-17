CREATE TABLE [rpl].[LogDetail] (
    [Log_Detail_id]  BIGINT              IDENTITY (1, 1) NOT NULL,
    [Log_id]         BIGINT           NOT NULL,
    [execution_id]   UNIQUEIDENTIFIER NULL,
    [file_id]        INT              NULL,
    [status]         SMALLINT         NULL,
    [task_id]        UNIQUEIDENTIFIER NULL,
    [parent_task_id] UNIQUEIDENTIFIER NULL,
    [task_name]      NVARCHAR (255)   NULL,
    [message]        NVARCHAR (MAX)   NULL,
    [Created_by]     [sysname]        NULL,
    [start_time]     DATETIME2 (7)    DEFAULT (getdate()) NOT NULL,
    [end_time]       DATETIME2 (7)    NULL,
    PRIMARY KEY CLUSTERED ([Log_Detail_id] ASC)
);

