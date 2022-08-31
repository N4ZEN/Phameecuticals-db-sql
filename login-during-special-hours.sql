--create logon trigger for login during special hours (12:00 to 01:00 am)
create trigger timeLogonTrigger
on all server
for logon
as 
Begin
	Declare @LoginName varchar (2000) = original_login()
	if (DATEPART(HOUR, GETDATE()) between 00 and 01)
	Begin
		if (@LoginName not in ('sa'))
		Begin
			print 'Login attempt outside allowed hours'
			Rollback
		End
	End
End
