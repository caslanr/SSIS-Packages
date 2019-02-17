CREATE proc [rpl].[INS_LogDetail] (
				@LogId	bigint, 
				@ExecutionID uniqueidentifier,
				@TaskID uniqueidentifier,
				@TaskName nvarchar(255),
				@Status smallint,
				@Message nvarchar(max),
				@ParentTaskID uniqueidentifier=null,
				@FileID int =null
			)
as
begin
declare @LogDetailId bigint = null,@oldstatus smallint
if(@LogId)=0
set @LogId = null 

select top 1
		@LogDetailId = [Log_Detail_id],@oldstatus=[status]
from	rpl.[LogDetail]
where	[execution_id]	= @ExecutionID and
		[task_id]		= @TaskID
--update if parent 
if(@oldstatus=0)
begin
update prn
set [message]	= 'Running',
	[status]	= 4
from rpl.[LogDetail] chl
join rpl.[LogDetail] prn on chl.[parent_task_id]=prn.task_id 
where   chl.[Log_Detail_id]	=	@LogDetailId	and 
		prn.[status]		=	3				and 
		prn.[message]		=	'Waiting'
end
if(@oldstatus=3) -- update for waiting one
	begin
			update rpl.[LogDetail]
			set [message]	= @Message,
				[end_time]	= getdate(),
				[status]	= @Status,
				[file_id]	= @FileID
			where [Log_Detail_id] = @LogDetailId
			-- update file id for previous steps
			update rpl.[LogDetail]
			set  [file_id]	= @FileID
			where Log_id = @LogId and [Log_Detail_id] < @LogDetailId and [file_id] =0
			 
	end
if(@LogDetailId) is null -- if not exists create new row
	begin
		insert into rpl.[LogDetail](
			[Log_id],
			[execution_id] ,
			[status] ,
			[task_id],
			[parent_task_id],
			[task_name],
			[message]  ,
			[file_id] 
			)
		values(
			@LogId,
			@ExecutionID,
			@Status,
			@TaskId,
			@ParentTaskID,
			@TaskName,
			@Message,
			@FileID 
			)
	end
select LogDetailId = isnull(@LogDetailId,SCOPE_IDENTITY())
end