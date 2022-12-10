---------------------------------------------------------
--------------------- LES DATES --------------------------
---------------------------------------------------------
-- sysdate
select sysdate
from dual;
select sysdate+3
from dual;

-- Convertir from char to Date
select to_date('29/11/2022')+3
from dual;

-- date = 11/29/2022 comment faire date + 3?
select to_date('11/29/2022','MM/DD/YYYY') + 3
from dual;

-- 2022/03/23 + 7
select to_date ('2022/03/23','YYYY/MM/DD')+7
from dual;

-- 20-05-2022 + 7 ?
select to_date('20-05-2022','DD-MM-YYYY')+5
from dual;

-- 05122022 + 3 ?
select to_date('05122022','DDMMYYYY') + 3
from dual;

-- 150422 + 3 
select to_date('150422','DDMMYY') -11
from dual;

---- to_char -- convertir UNE DATE en STRING DANS UN FORMAT
-- le n° du jour de la date d'aujourd'hui - : Lundi n°1, Mardi n°2, ...
select to_char(sysdate,'D')
from dual;
select to_char(sysdate,'DAY')
from dual;

-- quel était le jour du 15/11/2022
select to_char(to_date('15/11/2022'),'DAY')
from dual;

-- quel était le jour du 31/12/2021
select to_char(to_date('31/12/2021'),'DAY')
from dual;

-- le n° du jour dans le mois 
select to_char(sysdate,'dd')
from dual;

-- afficher le mois
select to_char(sysdate,'mm')
from dual;
select to_char(sysdate+30,'MON')
from dual;
select to_char(sysdate+30,'MONTH')
from dual;

--- année
select to_char(sysdate+30,'YY')
from dual;
select to_char(sysdate+30,'YYYY')
from dual;
select to_char(sysdate+30,'YEAR')
from dual;
select to_char(sysdate+30,'DAY,ddth MONTH YEAR')
from dual;

--- quel est ton jour de naissance
select to_char(to_date('31/12/1972','dd/mm/yyyy'),'DAY,ddth MONTH YEAR')
from dual;
------------ 
select to_char(sysdate,'HH')
from dual;
select to_char(sysdate,'HH24')
from dual;
select to_char(sysdate,'mi')
from dual;
select to_char(sysdate,'ss')
from dual;