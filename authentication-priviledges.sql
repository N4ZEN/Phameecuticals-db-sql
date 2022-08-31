
USE [UmbrellaPharmaceuticlssss]
GO


--creating server level login
--1
create login laura
with password = '#$*t7oW6Kh@28I51Y',
default_database = UmbrellaPharmaceuticlssss,
check_expiration = on,
check_policy = on;

--2
create login Allenn
with password = '#$*t7oW6Kh@28I51Y',
default_database = UmbrellaPharmaceuticlssss,
check_expiration = on,
check_policy = on;

--3
create login Gabriell
with password = '#$*t7oW6Kh@28I51Y',
default_database = UmbrellaPharmaceuticlssss,
check_expiration = on,
check_policy = on;

--4
create login managers
with password = '#$*t7oW6Kh@28I51Y',
default_database = UmbrellaPharmaceuticlssss,
check_expiration = on,
check_policy = on;

--creating database level users(corresponds to each of the server level users)
--1
create user Emp7422
for login laura;

--2
create user Emp4867
for login Allenn;

--3
create user Emp5673
for login Gabriell;

--4
create user manager
for login managers;


--creating roles

create role CR1_04;

create role NS;

create role viral_sp;
create role vaccine_sp;

create role MG;



--assigning privilages to CR(Lab1-04) role
--1
create view sciview
as
select * from Scientist 
where sci_id = user_name();

create view labView
as 
select * from Laboratories 
where lab_id = 'Lab1-04'
with check option;


create view ResProjView
as 
select * from ResearchProject
where lab_id = 'Lab1-04'
with check option;

create view scilabView
as 
select * from Sci_lab
where lab_id = 'Lab1-04'
with check option;

Grant select, update 
on sciview
to CR1_04;

Grant select 
on LabView
to CR1_04;

Grant select, update, insert, delete 
on ResProjView
to CR1_04
with grant option;

Grant select, update, insert, delete 
on scilabView
to CR1_04;

Grant select, update, insert, delete 
on ResInvolves_Sci
to CR1_04;


--assigning privilages to NS role
--2
create view expView
as 
select ex.exp_id, ex.exp_type, ex.exp_start, ex.exp_end, ex.exp_status, ex.exp_result
from ExperimentalDetails as ex
join ResInvolves_Sci as rs
on ex.res_id = rs.res_id
where rs.sci_id = user_name()
with check option;

create view testsubView
as 
select * from TestSubject
where sci_id = user_name()
with check option;

create scilabView
as 
select sl.sci_id, sl.lab_id, l.lab_name, l.lab_Purpose, l.chief_sci_id
from Sci_lab as sl
join Laboratories as l
on sl.lab_id = l.lab_id
where sl.sci_id = user_name();


create view resView
as 
select r.res_id,r.res_type, r.res_start, r.res_end, r.res_status, r.res_result, r.lab_id, r.sci_id as chief_researcher
from ResearchProject as r
join ResInvolves_Sci as rs
on rs.res_id = r.res_id
where rs.sci_id = user_name();

Grant select
on scilabView
to NS;

Grant select, insert, update, delete
on testsubView
to NS;

Grant select
on resView
to NS;

Grant select, insert, update
on expView
to NS;

Grant select, update 
on sciview
to NS;


--assigning privilages to Viral_Sp role
--3
create view viralView
as
select * from ResearchProject 
where res_id LIKE 'Res3%'
with check option;

create view viralexpView
as
select * from [ExperimentalDetails] 
where res_id LIKE 'Res3%'
with check option;

Grant select  
on viralexpView
to viral_sp;

Grant select  
on viralView
to viral_sp;

--assigning privilages to vaccine_sp role
--4
create view vaccineView
as
select * from ResearchProject 
where res_id LIKE 'Res1%'
with check option;

create view vaccexpView
as
select * from [ExperimentalDetails] 
where res_id LIKE 'Res1%'
with check option;

Grant select  
on vaccexpView
to vaccine_sp;

Grant select  
on vaccineView
to vaccine_sp;


--assigning privilages to manager role
--5
Grant select, insert, update, delete
on Scientist
to MG
with grant option;

Grant select, insert, update, delete
on Laboratories
to MG
with grant option;

Grant select, insert, update, delete
on ResearchProject
to MG
with grant option;

Grant select, insert, update, delete
on ExperimentalDetails
to MG
with grant option;

Grant select, insert, update, delete
on TestSubject
to MG
with grant option;



--assignning roles to users
--1
alter role CR1_04
add member Emp7422;
alter role NS
add member Emp7422;
alter role vaccine_sp
add member Emp7422;
--2
alter role NS
add member Emp4867;
alter role vaccine_sp
add member Emp4867;
--3
alter role viral_sp
add member Emp5673;
alter role NS
add member Emp5673;
--4
alter role MG
add member manager;


