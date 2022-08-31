USE [UmbrellaPharmaceuticlssss]
GO

select * from Scientist 
alter table Scientist add sci_icno varbinary(128) NULL


--DMK (password % SMK) > certificate > symmetric key > data
 --create DMK
 create master key
 encryption by password = '7PQHC&g67v*&&Kim6';

 --create certificate for encryption with DMK
 create certificate cert1
 with subject = 'Umbrella Pham';

 --create symmetric key1
 create symmetric key symkey1
 with algorithm = AES_128
 encryption by certificate cert1;


 select * from sys.symmetric_keys
 Select * from sys.certificates

 --using the symmetric key1
 open symmetric key symkey1
 decryption by certificate cert1;

 update Scientist
 set sci_icno = ENCRYPTBYKEY(KEY_GUID('symkey1'), '6871-9890-799')
 where sci_id = 'Emp2233'


 select sci_id, sci_role, sci_specialty, sci_name, sci_phoneno, 
 CONVERT(varchar(128), DECRYPTBYKEY(sci_icno)) from Scientist


 close symmetric key symkey1









 insert into scientist values (..., ENCRYPTBYKEY(KEY_GUID(symkey1), ''))

 select sci_id, sci_name, CONVERT(varchar(128), DECRYPTBYKEY(sci_phoneno)) from Scientist

 close symmetric key symkey1


 create procedure encrpytscicno
  @sci_id varchar(8)

as
begin
 open symmetric key symkey1
 decryption by certificate cert1;


 insert into scientist values (@sci_id, @sci_name ENCRYPTBYKEY(KEY_GUID(symkey1), ''))


 close symmetric key symkey1

end

--call 
exec encrpytscicno @sci_id = 'Emp0990'

