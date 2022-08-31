USE [UmbrellaPharmaceuticlssss]
GO

create table auditJobSHistory 
(
	HistoryID int IDENTITY,
	whoAttempted varchar(100),
	actionAttempted varchar(100),
	attemptedTimestamp datetime
)

create trigger LabTrigger
on Laboratories
instead of delete, update
as
Begin
	declare @action varchar (100);

	if exists (select * from inserted) and exists(select * from deleted)
	Begin
		set @action = 'Update Record';
	End
	else if exists (select * from deleted)
	Begin
		set @action = 'Deleted Record';
	End

	insert into auditJobSHistory (whoAttempted, actionAttempted, attemptedTimestamp)
	select system_user, @action, GETDATE() from deleted;
	print 'Sorry ' + @action + ' is not allowed.';
End


delete from Laboratories where lab_id = 'Lab1-01';

select * from Laboratories;

select * from auditJobSHistory;