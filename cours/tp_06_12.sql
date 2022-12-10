-- Créer une table emp3 à partir de la table employée.
-- Créer une table dept3 à partir de la table departments.
-- Créer une requete1 : select nom, prenom et nom du departement 
-- afficher le coût
-- Créer un index bitmap depuis la table table emp3 sur l'attribut nom de dept3 .
-- Refaire la requete requete1, réestimer le cout.

select last_name, dpt_name
from emp3
  join dpt3
  on emp3.dpt_id = dpt.id
;

select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));

create bitmap index emp3_dep3_name_idx
on emp3
(dpt3.name)
from emp3, dpt3
on emp3.dpt_id = dpt3.id;