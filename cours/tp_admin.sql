alter session
set "_ORACLE_SCRIPT"
=true;

SELECT TABLESPACE_NAME
          , FILE_ID
          , FILE_NAME
          , STATUS
FROM DBA_DATA_FILES;

-- 1 :
create user appli
identified by appli;

--2
grant connect, resource to appli;

--3 
create tablespace esp_appli datafile
 'C:\ORACLE_SETUP\ORADATA\ORCL\APPLI01.DBF'
 size 20M AUTOEXTEND ON NEXT 500K MAXSIZE 25M;


-- 4 select file_name from dba_data_files;
alter user appli quota unlimited on esp_appli;

-- (suite) définir cette espace comme espace par défaut
alter user appli default tablespace esp_appli;

-- étape 5 créer une connexion pour le nouveau compte (sqlDevelopper)

--creer la connexion 

-- création de table
create table tt
(
  col1 varchar2(50)
);

insert into tt
values
  ('val 1') ;