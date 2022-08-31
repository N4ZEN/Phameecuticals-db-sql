--limit no of connections for users


--create trigger
create trigger limitConnection
on all server
for logon
as 
Begin
	If((select count(*)
		from sys.dm_exec_sessions
		where is_user_process = 1
		and original_login_name = ORIGINAL_LOGIN()) > 4)
	Begin
		print 'Only 4 connections allowed per user at a time. '
	End
End

--view no of connections by each user
select is_user_process, original_login_name, *
from sys.dm_exec_sessions
where is_user_process =1
order by login_name desc
