CREATE proc [rpl].[INS_Log] (
				@ExecutionID uniqueidentifier,
				@PackageID uniqueidentifier,
				@PackageName nvarchar(255),
				@Status smallint,
				@Message nvarchar(max),
				@ParentId bigint,
				@LogId bigint
			)
as
begin

if(@ParentId =-1)
set @ParentId = null
--select top 1 @LogId = [Log_id]
--from rpl.[Log]
--where	[execution_id]	= @ExecutionID and
--		[parent_id]		= @ParentId
if(@LogId)=0
set @LogId = null 

if(@LogId) >0 --if log is already exists, update only waiting and running rows.
	begin
			update rpl.[Log]
			set [message]	= @Message,
				[end_time]	= getdate(),
				[status]	= @Status		
			where	--[execution_id] = @ExecutionID and
					[Log_id] = @LogId and
					[status] in (3,4)
	end
else
	begin
		insert into rpl.[Log](
			[execution_id] ,
			[package_id]  ,
			[package_name]  ,
			[status] ,
			[message] ,
			[parent_id]
			)
		values(
			@ExecutionID,
			@PackageID,
			@PackageName,
			@Status,
			@Message,
			@ParentId
			)
	end
select LogId = isnull(@LogId,SCOPE_IDENTITY())
end