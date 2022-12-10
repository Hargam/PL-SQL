-- Trigger pour afficher un message à chaque insert dans la table client

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER client_insert_trig
AFTER
INSERT ON
client
FOR
EACH
ROW
BEGIN
 dbms_output.put_line
('Changement bien pris en compte : un nouveau client a été ajouter');
END;

-----------------------------------------

-- Pour insérer dans log lors un ajout dans client

CREATE OR REPLACE TRIGGER client_insert_trig2
AFTER
INSERT ON
client
FOR
EACH
ROW
BEGIN
  INSERT INTO log
    (info)
  VALUES
    ('Insertion de :' || :NEW.NOM || 'Date :' || SYSDATE);
END;

-------------------------------------------

-- EXOS :
--Trigger mis à jour log à chaque modification sur la table client

CREATE OR REPLACE TRIGGER client_modif_trig
BEFORE
INSERT OR
UPDATE OR DELETE 
ON client
    FOR EACH ROW
BEGIN
  IF INSERTING THEN
  INSERT INTO LOG
    (info)
  VALUES
    ('INSERTION' || 'DATE :' || SYSDATE || 'NOM :' || :NEW.NOM);
END
IF;
    IF UPDATING THEN
INSERT INTO LOG
  (info)
VALUES
  ('MISE A JOUR' || 'DATE :' || SYSDATE || ' ANCIEN NOM :' || :OLD.NOM || 'NOUVEAU NOM :' || :NEW.NOM);
END
IF;
    IF DELETING THEN
INSERT INTO LOG
  (info)
VALUES
  ('SUPRESSION' || 'DATE :' || SYSDATE || 'CLIENT SUPPRIMER :' || :OLD.NOM);
END
IF;
END;
