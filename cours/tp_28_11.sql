CREATE  TABLE Utilisateurs(
Id_utilisateur int GENERATED by default as identity primary key ,
Nom varchar
(100) NOT NULL,
Prenom varchar
(100) NOT NULL,
DateAdhesion Date,
Adresse varchar
(200),
Email varchar
(100) NOT NULL
);

CREATE  TABLE Categories(
Id_Categorie int GENERATED by default as identity primary key ,
Categorie varchar
(200) NULL,
Info varchar
(200) NULL
);

CREATE TABLE Produits(
Id_produit int GENERATED by default as identity primary key ,
Designation varchar
(200) NOT NULL
);


/***** Object: Table dbo.ArticleAnnotation ******/
CREATE TABLE ArticleAnnotations
(
  Id_utilisateur int ,
  Id_produit int ,
  Note varchar(200) NULL,
  DateAnnotation Date
);


/****** Object: Table dbo.Commande ******/
CREATE TABLE Commandes(
Id_commande int GENERATED by default as identity primary key,
Id_Utilisateur int ,
Datec date NULL,
Total decimal
(7, 2) NULL,
NBart decimal
(3, 0) NULL);


/****** Object: Table dbo.facture ******/
CREATE TABLE Factures(
Id_facture int GENERATED by default as identity primary key,
Id_commande int ,
Total decimal
(7, 2) NULL,
Statut varchar
(1) NULL,
Dataf date NULL,
Info varchar
(255) NULL);


/****** Object: Table dbo.LigneCommande ******/
CREATE TABLE LgCommandes
(
  Id_commande int ,
  Id_produit int,
  Qte decimal(5, 0) NULL,
  PrixLigne decimal(7, 2) NULL
);

-----------------------------------------------------

ALTER TABLE Utilisateurs ADD CONSTRAINT contrainteAdresse CHECK (length(adresse) >5 ) ;
ALTER TABLE Utilisateurs ADD CONSTRAINT contrainteEmail CHECK (Email like '%@%' ) ;
ALTER TABLE Utilisateurs ADD CONSTRAINT contrainteEmail2 CHECK (Email like '%.%' ) ;
ALTER TABLE Categories ADD CONSTRAINT contrainteInfo CHECK (length(Info) >3 ) ;
ALTER TABLE Produits ADD CONSTRAINT contrainteDesignation CHECK (length(Designation) >2 ) ;
ALTER TABLE Produits ADD Id_Categorie INT;
ALTER TABLE Produits ADD CONSTRAINT ProduitCategorie FOREIGN KEY (Id_Categorie) REFERENCES Categories(Id_Categorie) ;
alter table Produits add Prix decimal (7, 2) NOT NULL ;
alter table Produits add Photo varchar (200) ;
alter table Produits add  Descriptif varchar (200) not null ;
ALTER TABLE Produits ADD CONSTRAINT contrainteDescriptif CHECK (length(Descriptif) >=3 ) ;
ALTER TABLE Commandes ADD CONSTRAINT CommandesUtilisateurs FOREIGN KEY (Id_Utilisateur) REFERENCES Utilisateurs(Id_utilisateur);
ALTER TABLE Factures ADD CONSTRAINT FacturesCommandes FOREIGN KEY (Id_commande) REFERENCES Commandes(Id_commande);
ALTER TABLE LgCommandes ADD CONSTRAINT LgCommandesCommandes FOREIGN KEY (Id_commande) REFERENCES Commandes(Id_commande);
ALTER TABLE LgCommandes ADD CONSTRAINT LgCommandesProduit FOREIGN KEY (Id_produit) REFERENCES Produits(Id_produit);







