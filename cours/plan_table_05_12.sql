-- Oracle à fait un plan d'execution qu'il PEUT stocké dans PLAN_TABLE
-- Pour qu'il stock dans cette table, il faut lui demander de le faire :
explain
plan for
select *
from employees;
-- en ce moment le plan d'executuon est ecrit dans la table
select *
from plan_table;
-- utilisation du package DBMS_XPLA pour afficher le plan d'execution
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));


-- TP Ajout de la table test + ajout de 100 valeurs + vérification des coûts des requêtes select *, select info1, select info1, info2

create table test
(
  info1 varchar2(255),
  info2 varchar2(255),
  info3 varchar2(255),
  info4 varchar2(255),
  info5 varchar2(255)
);

SELECT *
FROM test(DBMS_XPLAN.DISPLAY(plan_table));

SELECT info1
FROM test(DBMS_XPLAN.DISPLAY(plan_table));

SELECT info1, info2
FROM test(DBMS_XPLAN.DISPLAY(plan_table));