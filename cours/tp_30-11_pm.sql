---------------------------------- 
------------  Créer une fonction ChercherProduitParId et puis fonction  ------------
Create or replace function ChercherProduitParId
(p_id int)
return varchar2
is
v_ret varchar2
(255);
begin
  select DESIGNATION||' - ' ||ACTIF ||' - '||DATE_DEBUT
  into v_ret
  from produit
  where id = p_id;
  return v_ret;
end;
-- toujours select
select ChercherProduitParId(100)
from dual;
--------------------------------------------------------------------
Create or replace function ChercherCategorieParId
(p_id int)
return varchar2
is
v_ret varchar2
(255);
begin
  select LIBELLE||' - ' ||DESCRIPTIF
  into v_ret
  from Categorie
  where CATEGORIE_ID = p_id;
  return v_ret;
end;
-- desc categorie
-- desc produit
------- Créer une requête qui donne la liste des produits avec le libellé des catégories.
select *
from produit
joint
categorie c on
(c.CATEGORIE_ID)
--- ajouter l'id catégorie dans la table Produit
alter table  produit add CATEGORIE_ID int ;
alter table produit add constraint FK_Categorie
foreign key (CATEGORIE_ID) references categorie (CATEGORIE_ID);
----
select *
from produit p
  join categorie c on (c.CATEGORIE_ID =p.CATEGORIE_ID);
-------
select *
from produit p
  join categorie c     using (CATEGORIE_ID );
------------------
select *
from produit p
natural join  categorie ;
----
select *
from produit p, categorie c
where p.CATEGORIE_ID = c.CATEGORIE_ID;
----
select *
from produit p
  full join categorie c     using (CATEGORIE_ID );

desc produit;
desc categorie;

create view v_ProdCat
as
  select *
  from produit p
    full join categorie c     using (CATEGORIE_ID );
select *
from v_ProdCat;