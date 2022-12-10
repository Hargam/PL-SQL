CREATE OR REPLACE PROCEDURE ajout_client
(p_nom VARCHAR, p_prenom VARCHAR,
p_cp VARCHAR, p_tel VARCHAR, p_adresse VARCHAR) 
AS
BEGIN
  IF length(p_tel) != 10 then
        dbms_output.put_line
  ('Le numéro renseigner n''est pas valide:');
ELSIF length
(p_cp) NOT IN
(5,6) then
        dbms_output.put_line
('Le code postal renseigner n''est pas valide:');
        ELSE
INSERT INTO CLIENT
VALUES
  (client_seq.NEXTVAL, UPPER(p_nom) ,
    initcap( p_prenom) , p_cp , p_tel , p_adresse );
dbms_output.put_line
('Utilisateur entrer avec succès:');
END
IF;
END;
ajout_client;