USE [UmbrellaPharmaceuticlssss]
GO

--create DDL trigger 
create table indexLogs
(
	EventType varchar(200),
	ObjectName varchar(200),
	WhoExecuted varchar (1000),
	DataExecuted Datetime,
	StatementExecuted varchar(4000)
)

create trigger ddlTrigger
on database
for ddl_database_level_events
as 
Begin
	Declare @evntype varchar(200) = eventdata().value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(200)')
	Declare @objName varchar(200) = eventdata().value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(200)')
	Declare @sql varchar(200) = eventdata().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'varchar(1000)')
	Insert into indexLogs values (@evntype, @objName, SYSTEM_USER, GETDATE(), @sql)
End


CREATE TABLE [dbo].[newexp](
	[res_id] [varchar] (9) NOT NULL)
ALTER TABLE [newexp]	
ADD [res_type] [varchar](45) NOT NULL
DROP TABLE [newexp]

Select * from indexLogs



