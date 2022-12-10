


desc dep;
desc emp;
--- quelle est la liste (le code) des départements pour lesquels on a des employés
-- (le départements pourvus d'employés
select distinct DEPARTMENT_ID
from emp;
-- 50 40 110 90 30 70 10 20 60 100 80 
-- la liste des départements qui n'ont pas d'employés ?
select *
from dep
where DEPARTMENT_ID not in
(select DEPARTMENT_ID
from emp
where DEPARTMENT_ID is not null);
explain plan for
select *
from dep
where DEPARTMENT_ID not in
(select DEPARTMENT_ID
from emp
where DEPARTMENT_ID is not null);
----
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));


explain plan for
select *
from dep
where DEPARTMENT_ID not in
(select DEPARTMENT_ID
from emp
where DEPARTMENT_ID is not null);
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
---
explain plan for
select *
from dep
where not exists 
(select department_id
from emp
where emp.department_id = dep.department_id);
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
---------------------------------------------------------
select department_id
from dep
where not exists 
(select department_id
from emp
where emp.department_id = dep.department_id)
;
---------------------------
explain plan for
select department_id
from dep
minus
(
select department_id
from emp
)
;
---------------------------- LES EMPLOYES SANS DEPT
explain plan for
select DEPARTMENT_ID, DEPARTMENT_NAME
from dep
  left join emp using (department_id)        
minus
select DEPARTMENT_ID, DEPARTMENT_NAME
from dep
  join emp using (department_id) 
;
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
desc emp;
-----------------------------------
explain plan for
select d.DEPARTMENT_ID, DEPARTMENT_NAME
from dep d, emp e
where d.DEPARTMENT_ID = e.DEPARTMENT_ID(+)
minus
select d.DEPARTMENT_ID, DEPARTMENT_NAME
from dep d, emp e
where d.DEPARTMENT_ID = e.DEPARTMENT_ID;
---------------------------------------
-- remarque le (+) permet de faire  des JOINTURES EXTERNES

--- y a t-il une autre manière pour reformuler la requete ? (5 min)
SELECT PLAN_TABLE_OUTPUT
FROM TABLE(DBMS_XPLAN.DISPLAY('PLAN_TABLE'));
-- 120 - 130 - 140
