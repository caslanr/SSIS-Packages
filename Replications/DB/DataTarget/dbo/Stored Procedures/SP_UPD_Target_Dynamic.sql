CREATE PROC dbo.SP_UPD_Target_Dynamic(
		@TableNameSource sysname,
		@TableNameTarget sysname,
		@UpdateFieldExcluded varchar(500)
		)

as
SET NOCOUNT ON 
declare @QueryUpdate nvarchar(max)

declare  @TableColumnExcluded table (
	id int identity(1,1) primary key,
	FieldName sysname
	)
insert into @TableColumnExcluded
select  FieldName = value from string_split(@UpdateFieldExcluded,',')
 

select @QueryUpdate = COALESCE( @QueryUpdate + ',' , '') +quotename(COLUMN_NAME) +' = src.'+quotename(COLUMN_NAME)+ char(13)
from  INFORMATION_SCHEMA.columns clm 
where '['+TABLE_SCHEMA+'].['+TABLE_NAME +']'= @TableNameTarget and
		COLUMN_NAME not in (select FieldName from @TableColumnExcluded)

select @QueryUpdate =
					'update trg' + char(13)+
					' set '+ char(13)+ char(12)+ @QueryUpdate+
					' from ' +  @TableNameSource + ' as src' + char(13)+
					' join ' + @TableNameTarget + ' as trg on src.UniqueKey = trg.UniqueKey --and src.HashValue !=trg.HashValue'+ char(13) +
					' where src.ActionType =''U'''

EXEC sp_executesql @QueryUpdate

select @@ROWCOUNT