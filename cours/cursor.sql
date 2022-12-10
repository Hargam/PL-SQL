-- Calcul de la moyenne des salaires des employes

declare
    cursor empCursor is
select *
from EMPLOYEE;
employeeRec employee%ROWTYPE;
    maxSal employee.SALary%TYPE := 0;
begin
        open empCursor;
        loop
        /* Accès à chacun des tuples */
        fetch empCursor
        into employeeRec;
exit when empCursor%NOTFOUND;

/* traitement du tuple */
if maxSal < employeeRec.salary then 
                  maxSal := employeeRec.salary;
end
if;
             /* fin traitement tuple */

    end loop; 
      DBMS_OUTPUT.PUT_LINE
('Salaire Maximum: '|| maxsal);
close empCursor;
end;


-- On veut  la somme des salaires pour les employés dont l’id est pair et la somme des salaires pour les employés dont l’id est impair

DECLARE
-- 3 variables : 
cursor c_emp_sommeSal is
select *
from employees;
v_salPair employees.salary%type := 0;
v_salImpair employees.salary%type := 0;
v_ligne employees%rowtype;
BEGIN
        -- Ouvrir le curseur
        open c_emp_sommeSal;
        DBMS_OUTPUT.PUT_LINE
        (' début de traitement');
loop

fetch c_emp_sommeSal
into v_ligne;
   exit when c_emp_sommeSal%notfound;
   --- traitement (todo)
   DBMS_OUTPUT.PUT_LINE
(' -- traitement de l''employé do,nt l''id est :'v_ligne.EMPLOYEE_ID);
if (mod(v_ligne.EMPLOYEE_ID,2) = 0) then
     v_salPair := v_salPair + v_ligne.salary;
   else
     v_salImpair := v_salImpair + v_ligne.salary;
end
if;

end loop;
close c_emp_sommeSal;
DBMS_OUTPUT.PUT_LINE
('\n -- fin traitement : PAIR :'v_salPair ' sal IMPAIR 'v_salImpair);
  DBMS_OUTPUT.PUT_LINE
('');
  DBMS_OUTPUT.PUT_LINE
('');
  DBMS_OUTPUT.PUT_LINE
('fin de l''algo');
END;