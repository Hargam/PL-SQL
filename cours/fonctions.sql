set echo off;
set verify off;


create or replace function test_fun
(p_id number, donne varchar2)
return varchar
is
begin
  end;

-------------------------------------------

create or replace function test_fun
(p_id number, donnee varchar2)
return varchar
is
begin
       dbms_output.put_line
('début de la fonction ....');
return p_id||'  '||donnee;
end;

---------------------------------------------

create or replace function 
Search_By_Id
(p_id number)
return varchar
is
  vChaine varchar
(100);
begin
  select last_name||' - '||first_name||' - '||PHONE_NUMBER
  into vChaine
  from employees
  where employee_id =  p_id;
  return vChaine;
end;
desc employees;

select Search_By_Id(100)
from dual;


CREATE OR REPLACE FUNCTION check_date
(p_id number, p_date DATE)
RETURN VARCHAR
IS
    v_date DATE ;
BEGIN
  select sysdate
  into v_Date
  from dual
  ;
  return v_Date;

  IF p_date >= v_Date THEN
  UPDATE produits SET DateDebut = p_date WHERE id_produit = p_id;
END
IF;
END;