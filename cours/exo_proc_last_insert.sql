--- exercice -- comment faire un select * dans un bloc PL
-- comment récupérer le dernier id inséré

CREATE OR REPLACE PROCEDURE ajout_client
(p_nom VARCHAR, p_prenom VARCHAR,
p_cp VARCHAR, p_tel VARCHAR, p_adresse VARCHAR) 
AS
  vId client.id%type;
  vNom client.nom%type;
BEGIN
  INSERT INTO CLIENT
  VALUES
    (client_seq.NEXTVAL, UPPER(p_nom) ,
      initcap( p_prenom) , p_cp , p_tel , p_adresse );
  vId := client_seq.currval;
  select nom
  into vNom
  from client
  where id = vId;
  dbms_output.put_line
  ('le client inséré a pour id:'||vId ||' son nom: '||vNom );
END ajout_client;
-------- execution
execute ajout_client
('toto4','coco4','77000','0101010101','Rue du Parc');
select *
from client;