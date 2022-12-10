create table client
(
  id int primary key,
  nom varchar(50),
  prenom varchar(50),
  cp varchar(5),
  tel varchar(15),
  adresse varchar(100)
);

drop sequence client_sql;
create sequence client_seq increment by 1 start with 1 ;

CREATE OR REPLACE PROCEDURE ajout_client
(p_nom VARCHAR, p_prenom VARCHAR,
p_cp VARCHAR, p_tel VARCHAR, p_adresse VARCHAR) 
AS
BEGIN
  INSERT INTO CLIENT
  VALUES
    (client_seq.NEXTVAL, UPPER(p_nom) ,
      initcap( p_prenom) , p_cp , p_tel , p_adresse );
END
ajout_client;

-----------------------------------------------

