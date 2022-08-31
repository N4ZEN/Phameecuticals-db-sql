CREATE DATABASE [UmbrellaPharmaceuticlssss]

USE [UmbrellaPharmaceuticlssss]
GO

CREATE TABLE [dbo].[Scientist](
	[sci_id] [varchar](9) PRIMARY KEY NOT NULL,
	[sci_role] [varchar](30) NOT NULL,
	[sci_specialty] [varchar](30) NOT NULL,
	[sci_name] [varchar](45) NOT NULL,
	[sci_phoneno] [varchar](20) NULL)
GO

CREATE TABLE [dbo].[Laboratories](
	[lab_id] [varchar](8)PRIMARY KEY NOT NULL,
	[lab_name] [varchar](40) NOT NULL,
	[lab_Purpose] [varchar](30) NOT NULL,
	[chief_sci_id] [varchar] (9) NOT NULL
		REFERENCES Scientist(sci_id))
GO

CREATE TABLE [dbo].[ResearchProject](
	[res_id] [varchar] (9) PRIMARY KEY NOT NULL,
	[res_type] [varchar](45) NOT NULL,
	[res_start] [date] NOT NULL,
	[res_end] [date] NULL,
	[res_status] [varchar](12) NOT NULL,
	[res_result] [varchar](240) NULL,
	[lab_id] [varchar] (8)NOT NULL
		REFERENCES Laboratories(lab_id))
GO

ALter table [ResearchProject]
add [sci_id] [varchar](9) NULL
	REFERENCES Scientist(sci_id);

CREATE TABLE [dbo].[TestSubject](
	[ts_id] [varchar](9) PRIMARY KEY NOT NULL,
	[ts_type] [varchar](20) NOT NULL,
	[ts_gender] [varchar](25) NULL,
	[ts_age] [int]  NULL,
	[ts_date_taken] [date] NOT NULL,
	[res_id] [varchar](9) NOT NULL
		REFERENCES ResearchProject(res_id),
	[sci_id] [varchar](9) NOT NULL
		REFERENCES Scientist(sci_id))
GO


CREATE TABLE [dbo].[ExperimentalDetails](
	[exp_id] [varchar] (9) PRIMARY KEY NOT NULL,
	[exp_type] [varchar](45) NOT NULL,
	[exp_start] [datetime] NOT NULL,
	[exp_end] [datetime] NULL,
	[exp_status] [varchar](12) NOT NULL,
	[exp_result] [varchar](240) NULL,
	[res_id] [varchar] (9)NOT NULL
		REFERENCES ResearchProject(res_id))
GO

CREATE TABLE [dbo].[Sci_lab](
	[sci_id] [varchar](9) NOT NULL
		REFERENCES Scientist(sci_id),
	[lab_id] [varchar] (8) NOT NULL
		REFERENCES Laboratories(lab_id),
	PRIMARY KEY (sci_id, lab_id))
GO

CREATE TABLE [dbo].[ResInvolves_Sci](
	[sci_id] [varchar](9) NOT NULL
		REFERENCES Scientist(sci_id),
	[res_id] [varchar](9) NOT NULL
		REFERENCES ResearchProject(res_id),
	PRIMARY KEY (sci_id, res_id))
GO

SELECT * FROM sysobjects WHERE xtype='U' 

--Insert data into Scientist table
INSERT INTO SCIENTIST VALUES ('Emp2546', 'Chief Researcher', 'Antidote Testing','Landon Moore', '0135675436');
INSERT INTO SCIENTIST VALUES ('Emp9876', 'Chief Reseacher', 'Antidote Testing','Tony Stark', '0179846990');
INSERT INTO SCIENTIST VALUES ('Emp2773', 'Chief Reseacher', 'Antidote Testing','Derrick Land', '0156789432');
INSERT INTO SCIENTIST VALUES ('Emp2933', 'Chief Researcher', 'Viral Testing','Peter Parker', '0115633235');
INSERT INTO SCIENTIST VALUES ('Emp6789', 'Chief Reseacher', 'Viral Testing','Mark Rober', '0178654786');
INSERT INTO SCIENTIST VALUES ('Emp5379', 'Chief Reseacher', 'Viral Testing','Mary Lind', '0176543810');
INSERT INTO SCIENTIST VALUES ('Emp7422', 'Chief Researcher', 'Vaccine Testing','Laurel Lane', '015987435');
INSERT INTO SCIENTIST VALUES ('Emp2943', 'Chief Researcher', 'Vaccine Testing','Mary Poppins', '0178543565');
INSERT INTO SCIENTIST VALUES ('Emp5663', 'Chief Reseacher', 'Vaccine Testing','Fanny Grover', '0146578974');
INSERT INTO SCIENTIST VALUES ('Emp1123', 'Chief Reseacher', 'Vaccine Testing','Powell Waters', '011548762');


INSERT INTO SCIENTIST VALUES ('Emp2233', 'Scientist', 'Antidote Testing','Laurel Lane', '0116752435')
INSERT INTO SCIENTIST VALUES ('Emp4533', 'Scientist', 'Antidote Testing','Martin Laurence', '0123456785')
INSERT INTO SCIENTIST VALUES ('Emp2783', 'Scientist', 'Antidote Testing','Bruce Wayne', '0117842435')
INSERT INTO SCIENTIST VALUES ('Emp0542', 'Scientist', 'Antidote Testing','Matt Barnes', '0124768979')
INSERT INTO SCIENTIST VALUES ('Emp2479', 'Scientist', 'Antidote Testing','Draymont Green', '0113758689')
INSERT INTO SCIENTIST VALUES ('Emp2568', 'Scientist', 'Antidote Testing','James Harden', '014572477')
INSERT INTO SCIENTIST VALUES ('Emp2745', 'Scientist', 'Antidote Testing','Lebron James', '0152474274')
INSERT INTO SCIENTIST VALUES ('Emp2427', 'Scientist', 'Antidote Testing','Kevin Durant', '013264786')



INSERT INTO SCIENTIST VALUES ('Emp9766', 'Scientist', 'Vaccine Testing','Jimmy Fallon', '0154325432')
INSERT INTO SCIENTIST VALUES ('Emp4867', 'Scientist', 'Vaccine Testing','Allen Powers', '0154324623')
INSERT INTO SCIENTIST VALUES ('Emp2547', 'Scientist', 'Vaccine Testing','Bradley Martin', '016432652652')
INSERT INTO SCIENTIST VALUES ('Emp3461', 'Scientist', 'Vaccine Testing','Ben Simmons', '0123657688')
INSERT INTO SCIENTIST VALUES ('Emp4367', 'Scientist', 'Vaccine Testing','Giannis Antono', '015476868')
INSERT INTO SCIENTIST VALUES ('Emp1356', 'Scientist', 'Vaccine Testing','Luka Donkic', '011357676')

INSERT INTO SCIENTIST VALUES ('Emp5673', 'Scientist', 'Viral Testing','Gabriel Maurice', '0167899035')
INSERT INTO SCIENTIST VALUES ('Emp6452', 'Scientist', 'Viral Testing','Naza Zuhair', '014567936')
INSERT INTO SCIENTIST VALUES ('Emp6436', 'Scientist', 'Viral Testing','James Gordan', '016578905')
INSERT INTO SCIENTIST VALUES ('Emp8658', 'Scientist', 'Viral Testing','Jimmy Kimmel', '0163422254')
INSERT INTO SCIENTIST VALUES ('Emp2357', 'Scientist', 'Viral Testing','Damian Lillard', '012464778')
INSERT INTO SCIENTIST VALUES ('Emp5741', 'Scientist', 'Viral Testing','Stephen Curry', '01246576879')
INSERT INTO SCIENTIST VALUES ('Emp1364', 'Scientist', 'Viral Testing','Kale Cobwey', '0143624879')
INSERT INTO SCIENTIST VALUES ('Emp1366', 'Scientist', 'Viral Testing','Klay Thompson', '0114685352')
INSERT INTO SCIENTIST VALUES ('Emp2477', 'Scientist', 'Viral Testing','Martin Lorne', '01143757688')
GO



--Insert data into Laboratories table

INSERT INTO LABORATORIES VALUES ('Lab1-01', 'Barkley Laboratory', 'Antidote testing', 'Emp2546');
INSERT INTO LABORATORIES VALUES('Lab3-02', 'Chicago Laboratory', 'Antidote testing', 'Emp9876');
INSERT INTO LABORATORIES VALUES ('Lab2-05', 'Mains Laboratory', 'Antidote testing', 'Emp2773');

INSERT INTO LABORATORIES VALUES ('Lab2-01', 'LosAngeles Laboratory', 'Vaccine testing', 'Emp2943');
INSERT INTO LABORATORIES VALUES ('Lab1-04', 'Carolina Laboratory', 'Vaccine testing', 'Emp7422' );
INSERT INTO LABORATORIES VALUES('Lab1-05', 'Maxim Laboratory', 'Vaccine testing', 'Emp5663');
INSERT INTO LABORATORIES VALUES('Lab2-04', 'Washington Laboratory', 'Vaccine testing', 'Emp1123');

INSERT INTO LABORATORIES VALUES ('Lab1-02', 'Charlotte Laboratory', 'Viral testing', 'Emp2933');
INSERT INTO LABORATORIES VALUES ('Lab2-02', 'Madison Laboratory', 'Viral testing', 'Emp6789');
INSERT INTO LABORATORIES VALUES ('Lab3-09', 'Chase Laboratory', 'Viral testing', 'Emp5379');
GO


--Insert data into ResearchProject table
Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res2-783', 'Sea snake antivenom development', '2019-06-13', 'active', 'Lab1-01')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res2-121', 'Vipera treatment', '2020-10-20', 'active', 'Lab2-05')
GO


Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res1-543', 'Hepatitis B treatment', '2020-01-12', 'active', 'Lab2-04')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res1-084', 'Polio Virus development', '2020-03-13', 'active', 'Lab1-05')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res1-798', 'Tuberculosis treatment', '2020-05-22', 'active', 'Lab1-04')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_end], [res_status], [res_result], [lab_id])
Values ('Res1-642', 'Tuberculosis treatment', '2019-10-22', '2020-02-09', 'completed', 'The results show variable effectiveness against adult pulmonary TB and shows potential inference with tuberculin skin test reactivity.', 'Lab1-04')
GO


Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_end], [res_status], [res_result], [lab_id])
Values ('Res3-334', 'Rare disease treatment', '2018-04-12', '2019-11-09', 'completed', 'From the research it was found that the treatment was 98.6% effective with minimal less severe side effects.', 'Lab2-02')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res3-677', 'Chickenpox treatment', '2019-05-20', 'active', 'Lab3-09')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_end], [res_status], [res_result], [lab_id])
Values ('Res3-432', 'Measles treatment', '2017-12-22', '2020-02-09', 'completed', 'This vaccine protects against measles, mumps and rubella. Recommended dosage is first dose at 12 through 15 months of age, and the second dose at 4 through 6 years of age.', 'Lab1-02')
GO

Insert [dbo]. [ResearchProject] ([res_id], [res_type], [res_start], [res_status], [lab_id])
Values ('Res3-543', 'Measles treatment', '2016-12-03', 'inactive', 'Lab1-02')
GO



UPDATE ResearchProject SET sci_id = 'Emp2546' WHERE lab_id = 'Lab1-01';
UPDATE ResearchProject SET sci_id = 'Emp2933' WHERE lab_id = 'Lab1-02';
UPDATE ResearchProject SET sci_id = 'Emp2943' WHERE lab_id = 'Lab2-01';
UPDATE ResearchProject SET sci_id = 'Emp7422' WHERE lab_id = 'Lab1-04';
UPDATE ResearchProject SET sci_id = 'Emp2773' WHERE lab_id = 'Lab2-05';
UPDATE ResearchProject SET sci_id = 'Emp6789' WHERE lab_id = 'Lab2-02';
UPDATE ResearchProject SET sci_id = 'Emp5379' WHERE lab_id = 'Lab3-09';
UPDATE ResearchProject SET sci_id = 'Emp5663' WHERE lab_id = 'Lab1-05';
UPDATE ResearchProject SET sci_id = 'Emp9876' WHERE lab_id = 'Lab3-02';
UPDATE ResearchProject SET sci_id = 'Emp1123' WHERE lab_id = 'Lab2-04';



--Insert data into TestSubjct table
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values ('TS-786-89', 'Mouse', 'M','2','2018-08-24', 'Res3-334', 'Emp2477')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-756-84', 'Mouse', 'M','3','2018-09-02', 'Res3-334', 'Emp1366' )
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-673-87', 'Mouse', 'F','2','2018-07-24', 'Res3-334', 'Emp1364')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-232-45', 'Monkey', 'F','1','2019-11-5', 'Res2-783', 'Emp2479')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-532-48', 'Monkey', 'M','2','2019-12-24', 'Res2-783', 'Emp0542')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-466-95', 'Rat', 'M','2','2020-04-27', 'Res1-543', 'Emp1356')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-235-25', 'Rat', 'M','2','2020-03-29', 'Res1-543', 'Emp4367')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-453-74', 'Mouse', 'M','3','2020-04-27', 'Res1-084', 'Emp3461')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-214-98', 'Rat', 'M','2','2019-07-20', 'Res3-677', 'Emp5741')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-465-75', 'Rat', 'M','2','2019-08-09', 'Res3-677', 'Emp2357')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-235-06', 'Chimpanzee', 'M','2','2020-12-24', 'Res2-121', 'Emp2427')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-436-65', 'Chimpanzee', 'M','2','2020-12-24', 'Res2-121', 'Emp2745')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-235-86', 'Chimpanzee','2','2020-12-24', 'Res2-121', 'Emp2568')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-654-74', 'Mouse', 'M','2','2020-07-24', 'Res1-798', 'Emp2547')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-257-98', 'Mouse', 'M','2','2019-12-29', 'Res1-642', 'Emp4867')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-836-63', 'Mouse', 'M','2','2019-12-23', 'Res1-642', 'Emp9766')
GO

Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-087-23', 'Hamster', 'M','4','2018-03-20', 'Res3-432', 'Emp8658')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender] ,[ts_age] ,[ts_date_taken] ,[res_id],[sci_id] )
Values('TS-676-23', 'Hamster', 'M','4','2018-03-17', 'Res3-432', 'Emp6436')
GO
Insert [dbo].[TestSubject]([ts_id] ,[ts_type] ,[ts_gender], [ts_date_taken] ,[res_id],[sci_id] )
Values('TS-453-63', 'Rabbit', 'M','2017-03-17', 'Res3-543', 'Emp6452')
GO


--Insert data into ExperimentDetails table
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_end], [exp_status], [exp_result], [res_id])
Values ('Exp5422', 'Rare disease treatment', '2018-10-12 13:23:44', '2019-09-09 15:45:21', 'success', 'From the research it was found that the treatment was 98.6% effective with minimal less severe side effects.', 'Res3-334')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp7923', 'Sea snake antivenom development', '2020-01-03 15:43:44', 'pending', 'Res2-783')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp8090', 'Hepatitis B treatment', '2020-05-12 13:23:44', 'pending', 'Res1-543')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp9669', 'Polio Virus development', '2020-05-13 07:55:44', 'pending', 'Res1-084')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp7933', 'Chickenpox treatment', '2019-10-20 19:22:19', 'pending', 'Res3-677')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp0850', 'Vipera treatment', '2021-01-20 08:01:22', 'pending', 'Res2-121')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_status], [res_id])
Values ('Exp7983', 'Tuberculosis treatment', '2020-08-22 08:01:22', 'pending', 'Res1-798')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_end], [exp_status], [exp_result], [res_id])
Values ('Exp2331', 'Tuberculosis treatment', '2020-01-05 10:11:22', '2020-02-05 12:10:21', 'fail', 'The results show variable effectiveness against adult pulmonary TB and shows potential inference with tuberculin skin test reactivity.', 'Res1-642')
GO
Insert [dbo].[ExperimentalDetails]([exp_id], [exp_type], [exp_start], [exp_end], [exp_status], [exp_result], [res_id])
Values ('Exp9870', 'Measles treatment', '2018-04-22 12:26:22', '2019-02-01 12:10:2', 'success', 'The vaccine protects against measles, mumps and rubella. Recommended dosage is first dose at 12 through 15 months of age, and the second dose at 4 through 6 years of age.', 'Res3-432')
GO




--Insert data into ResInvolves_Sci table
--sci not having ts
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp1366')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp1364')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp2477')
GO

INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-783', 'Emp2783')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-121', 'Emp4533')
GO
--chief-sci
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-783', 'Emp2546')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-543', 'Emp2933')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-798', 'Emp7422')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp5379')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-084', 'Emp5663')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-543', 'Emp1123')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-121', 'Emp2773')
GO
--sci with ts

INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-783', 'Emp2479')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-783', 'Emp0542')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-543', 'Emp1356')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-543', 'Emp4367')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-084', 'Emp3461')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp5741')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-677', 'Emp2357')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-121', 'Emp2427')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-121', 'Emp2745')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res2-121', 'Emp2568')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res1-798', 'Emp2547')
GO
INSERT [dbo].[ResInvolves_Sci]([res_id], [sci_id])
Values ('Res3-543', 'Emp6452')
GO



--Insert data into Sci_lab table

INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-01', 'Emp2783')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-05', 'Emp4533')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab3-09', 'Emp2477')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab3-09', 'Emp1364')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab3-09', 'Emp1366')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-05', 'Emp3461')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab3-09', 'Emp2357')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab3-09', 'Emp5741')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-02', 'Emp6452')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-02', 'Emp8658')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-02', 'Emp6436')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-01', 'Emp0542')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-01', 'Emp2479')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-05', 'Emp2568')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-05', 'Emp2745')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-05', 'Emp2427')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-04', 'Emp2547')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-04', 'Emp9766')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab1-04', 'Emp4867')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-04', 'Emp1356')
GO
INSERT  [dbo].[Sci_lab]([lab_id],[sci_id])
Values ('Lab2-04', 'Emp4367')
GO

