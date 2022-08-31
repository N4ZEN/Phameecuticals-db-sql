USE [UmbrellaPharmaceuticlssss]
GO

create table auditJobSHistory 
(
	HistoryID int IDENTITY,
	whoAttempted varchar(100),
	actionAttempted varchar(100),
	attemptedTimestamp datetime
)

create trigger insertProject
on ResearchProject
After Insert 
as
Begin
	Insert into auditJobSHistory (whoAttempted, actionAttempted, attemptedTimestamp)
	Select SYSTEM_USER, 'Insert New Research Project', GETDATE() from inserted;
	print 'New Research has been created!'
End

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res2-743', 'Sea snake antivenom development', '2019-06-13', 'active', 'Lab1-01');

select * from ResearchProject

select * from auditJobSHistory