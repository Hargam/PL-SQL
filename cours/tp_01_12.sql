------------------- Retour sur les types Oracle
--- créer table avec une colonne de longueur variables,
--- puis une table avec colonne de longueur fixe
-- peupler les 2 table avec 10000 enregistrements
--- comparer l'espace utiliser par les 2 tables
--- Solution
-- table avec col de longueur variable
create table table1
(
  col1 varchar2(50)
);
-- table avec col de longueur fixe
create table table2
(
  col1 char(50)
);
-- peupler les 2 tables avec 10000 enregistrements
-- 20 min
--- exemple pour peupler une table
drop table table22;
create table table11
(
  col1 varchar(50)
);
create table table22
(
  col1 varchar(50)
);
select
from table1;
selectfrom table2;
-- 100 enregistrements dans la table ?

declare 
v_char varchar
(50);
v_longAleatoire int;
begin
  for i in 1 .. 1000
      loop 
          v_longAleatoire := DBMS_RANDOM.VALUE
  ( 1,50);
v_char := DBMS_RANDOM.STRING
( 'a',v_longAleatoire);
insert into table11
values
  (v_char);
insert into table22
values
  (v_char);
dbms_output.put_line
('chaine insérée :'v_char);
end loop;
end;
select segment_name, segment_type, sum(bytes) octets
from user_segments
where segment_name like 'TABLE%'
group by segment_name,segment_type;

declare 
v_char varchar
(50);
v_longAleatoire int;
begin
  for i in 1 .. 1000
      loop 
          v_longAleatoire := DBMS_RANDOM.VALUE
  ( 1,50);
v_char := DBMS_RANDOM.STRING
( 'a',v_longAleatoire);
insert into table11
values
  (v_char);
insert into table22
values
  ('x');
dbms_output.put_line
('chaine insérée :'v_char);
end loop;
end;

-- pour éviter un "gaspillage"  d'espace utiliser char uniquement si c'est justifié : longueur fixe.