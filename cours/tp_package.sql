-------------------------------------------------------------
----------------- PACKAGES ----------------------------
-------------------------------------------------------
--- création de package
-- PArtie 1 : déclarative (spécification)
create or replace package  produit_pkg as
    procedure Ajout_prd
(p_desp varchar2, p_DATE_DEBUT date, p_CATEGORIE_ID int);
    procedure Supp_prd
(p_id int);
    function chercherProdById
(p_id int)
return varchar;
end produit_pkg;
-- dans les autres languages de dev : dans quoi on met uniquement les noms de méthodes à utiliser ?
--- Classe et Interface 

-- partie 2 : corpt (définition)
create or replace package BODY produit_pkg as
        procedure Ajout_prd
(p_desp varchar2, p_DATE_DEBUT date, p_CATEGORIE_ID int)
        as
begin
                dbms_output.put_line
('procédure ajout ...');
end;
        -- fin de la procedure ajout
            procedure Supp_prd
(p_id int) 
            as
begin
               dbms_output.put_line
('procédure supp ...');
end Supp_prd;
            -- fin de la procédure  Supp_prd
        function chercherProdById
(p_id int)
return varchar
is
begin
  return 'hello depuis ma fonction';
end
chercherProdById;
end produit_pkg;
exec produit_pkg.Supp_prd
(10) ;