USE [UmbrellaPharmaceuticlssss]
GO

alter table ResearchProject
add res_result_encrypted varbinary(256)

 --create symmetric key2
 create symmetric key symkey2
 with algorithm = AES_256
 encryption by certificate cert1;

 select * from sys.symmetric_keys
 Select * from sys.certificates


  --using the symmetric key2
 open symmetric key symkey2
 decryption by certificate cert1;

 update ResearchProject 
 set res_result_encrypted = ENCRYPTBYKEY(KEY_GUID('symkey2'), res_result)
 from ResearchProject


 close symmetric key symkey2


 select * from ResearchProject