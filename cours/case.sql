-- Entrée une date, récupérer le numéro du jour et afficher si ce jour est durant le week-end ou pas
declare
vNumJour number;
vDate varchar
(20);
begin
   vDate := '&vDate';
   DBMS_OUTPUT.PUT_LINE
('le string  saisie est :'|| vDate);
-- on suppose que la saise est correcte
-- on récupère le numéro du jour dans : vNumJour
select to_char(to_date(vDate),'D')
into vNumJour
from dual;
DBMS_OUTPUT.PUT_LINE
('le numéro du jour est :'|| vNumJour);
     case vNumJour
         when '6' then  DBMS_OUTPUT.PUT_LINE
('Samedi, WE');
         when '7' then  DBMS_OUTPUT.PUT_LINE
('Dimance, WE');
         else  DBMS_OUTPUT.PUT_LINE
('Autre jour de semaine, Non WE');
end case;
end;

-----------------------------------------------

declare 
vNum number;
BEGIN
  vNum := &vNum;
  CASE  
    WHEN vNum > 0 THEN
        dbms_output.put_line
('le nombre est POSITIF');
    WHEN vNum < 0 THEN 
        dbms_output.put_line
('le nombre est NEGATIF');
    ELSE dbms_output.put_line
('le nombre est NUL');
END CASE;
END;