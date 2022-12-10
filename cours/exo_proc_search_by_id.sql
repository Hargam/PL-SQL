Exercice
: Ecrire une procédure Search_By_ID qui AFFICHE le nom, prenom, telephone du client dont l’id est passé en paramètre si le client existe si non la procédure affiche - client inexistant-


CREATE OR REPLACE PROCEDURE Search_By_ID
(p_id int) 
AS
 vPrenom client.prenom%type;
 vNom client.nom%type;
 vTel client.tel%type;
 vNum int := 0;
BEGIN
  select count(*)
  into vNum
  from client
  where id=p_id;
  if vNum > 0 then
  select nom , prenom , tel
  into vNom
  ,vPrenom,vTel from client where id = p_id;
dbms_output.put_line
('Le client existe:'||vNom ||' ' ||vPrenom|| ' ' ||vTel );
  else
    dbms_output.put_line
('le client n''existe pas:'||p_id );
end
if;
END Search_By_ID ;

execute Search_By_ID
(2);

select *
from client;


CREATE OR REPLACE PROCEDURE Search_By_ID
(p_id int) 
AS
 venrg client%rowtype;
 vNum int := 0;
BEGIN
  select count(*)
  into vNum
  from client
  where id=p_id;
  if vNum > 0 then
  select *
  into venrg
  from client
  where id = p_id;
  dbms_output.put_line
  ('Le client existe:'||venrg.nom ||' ' ||venrg.prenom|| ' ' ||venrg.tel );
else
    dbms_output.put_line
('le client n''existe pas:'||p_id );
end
if;
END Search_By_ID ;


execute Search_By_ID
(2);
execute Search_By_ID
(5);
