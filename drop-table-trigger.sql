USE [UmbrellaPharmaceuticlssss]
GO

create trigger dropTable
on database
for DROP_TABLE
as 
Begin
	Print 'A database level event has just been performed! You have to just dropped a table.'
End


CREATE TABLE [dbo].[newProject](
	[res_id] [varchar] (9) NOT NULL,
	[res_type] [varchar](45) NOT NULL)
DROP TABLE [newProject]
