USE [UmbrellaPharmaceuticlssss]
GO
ALTER DATABASE [UmbrellaPharmaceuticlssss]
SET RECOVERY FULL;
use master;
--create full backup
backup database UmbrellaPharmaceuticlssss
to disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/FullBacup.bak'
with init;

--create differential backup
backup database UmbrellaPharmaceuticlssss
to disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/DiffBacup.bak' with differential;

--create transactional backup
backup log UmbrellaPharmaceuticlssss
to disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/TransacLogBacup.bak';

--restore full backup
restore database UmbrellaPharmaceuticlssss
from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/FullBacup.bak' with norecovery;

--restore differential backup
restore database UmbrellaPharmaceuticlssss
from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/DiffBacup.bak' with recovery;

--restore transactional backup
restore log UmbrellaPharmaceuticlssss
from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/TransacLogBacup.bak' 
with file = 1, norecovery;

restore log UmbrellaPharmaceuticlssss
from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/TransacLogBacup.bak' 
with file = 2, norecovery;

--perform transactional log restoration 3-20
restore log UmbrellaPharmaceuticlssss
from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/TransacLogBacup.bak' 
with file = 4,
stopat = '2021-04-01 21:40:00',
recovery;


restore headeronly from disk = 'C:/Users/Naza Zuhair/Documents/SQL Server Management Studio/TransacLogBacup.bak' 
