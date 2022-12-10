desc test;
select *
from test;
select count(*)
from test;

explain plan for
select *
from test
where 
info1 like '%tiIhJbE%';-- XRDZelHRdepSYtjZXhecSthHKIyhRemAzpmskDhuPEbUgehgaNlzDJLhZCGwPtRdTcLJwRUnmFwyYPnlVjhUnxhZstoAxzYjgmdcvBTNShybYySvmnQDrzDMVzJtQsWTsZbTRGyoRfwLwAVehEEozbvClnWMuphLHavpFRjDTNPoAYrDENiQUSWeMygLwfzYGsBCSFiARTdzAmGpAFcOIDpUYcACxjcZFQqSdZEWhLPVFcTND';
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));
-- impact de l'indexe

create index index1 on test (info1);
explain plan for
select *
from test
where 
info1 = 'cjIBwtTiIYrBjlaNPFPeBOJybCQfDPvJzWSyBuBjbUdYWYVguUYQKWrDmYgAJPsIvJzkfcxrZsDYneeVXovNmnNlvzyKJurWedJCBSYUMboxAVYJNcOvCFtqJyvoWoODVMaowCpjQkLnImvJbMFLzlNnbEqYHmYhnPmxYOteNZiKroAlLBAWacrwRRMEpNREAxkgAonpmnWraNYnGquhPPeEhyCNbKiNWTrsdnaxpWNApPjXIHmEcvIhwntczVC';-- XRDZelHRdepSYtjZXhecSthHKIyhRemAzpmskDhuPEbUgehgaNlzDJLhZCGwPtRdTcLJwRUnmFwyYPnlVjhUnxhZstoAxzYjgmdcvBTNShybYySvmnQDrzDMVzJtQsWTsZbTRGyoRfwLwAVehEEozbvClnWMuphLHavpFRjDTNPoAYrDENiQUSWeMygLwfzYGsBCSFiARTdzAmGpAFcOIDpUYcACxjcZFQqSdZEWhLPVFcTND';
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));
-- avec l'indexe on passe de 1600 à 5 en cout de cpu

explain plan for
select *
from test
where 
info1 like '%aNPFPeBOJybCQfDPvJzWSyBuBj%';
-- bUdYWYVguUYQKWrDmYgAJPsIvJzkfcxrZsDYneeVXovNmnNlvzyKJurWedJCBSYUMboxAVYJNcOvCFtqJyvoWoODVMaowCpjQkLnImvJbMFLzlNnbEqYHmYhnPmxYOteNZiKroAlLBAWacrwRRMEpNREAxkgAonpmnWraNYnGquhPPeEhyCNbKiNWTrsdnaxpWNApPjXIHmEcvIhwntczVC';-- XRDZelHRdepSYtjZXhecSthHKIyhRemAzpmskDhuPEbUgehgaNlzDJLhZCGwPtRdTcLJwRUnmFwyYPnlVjhUnxhZstoAxzYjgmdcvBTNShybYySvmnQDrzDMVzJtQsWTsZbTRGyoRfwLwAVehEEozbvClnWMuphLHavpFRjDTNPoAYrDENiQUSWeMygLwfzYGsBCSFiARTdzAmGpAFcOIDpUYcACxjcZFQqSdZEWhLPVFcTND';
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));
-- avec l'indexe et like, like elimine les avantage percues

-- tri avec join 
explain plan for
select last_name, first_name, department_name
from emp e, dep d
where e.DEPARTMENT_ID = d.DEPARTMENT_ID
order by last_name;
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));

-----------------------
explain plan for
select last_name, first_name, department_name
from emp
  join dep using(DEPARTMENT_ID) 
order by last_name;
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));

-- indexons department name depuis la table dep
create bitmap index emp_dep_name_idx 
on emp
(dep.department_name)
from emp, dep
on emp.DEPARTMENT_ID = dep.DEPARTMENT_ID;
---

explain plan for
select last_name, first_name, department_name
from emp
  join dep using(DEPARTMENT_ID) 
where department_name = 'Purchasing'
;
select plan_table_output
from table(DBMS_XPLAn.display('plan_table'));
