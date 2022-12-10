-- 80% du temps ce sera de cette manière

-- dl le fichier et le placer dans un dossier import
-- créer la table 
-- créer un fichier ctl (fichier de controle)

LOAD DATA
  INFILE
'nom_fichier_csv'
  INTO TABLE nom_de_table
  FIELS TERMINATED BY ', ou ;'
(nom des colonnes séparé par une virgule)

-- dans la console taper la commande :

sqlldr nom_connexion/mdp
(hr/hr) control=nom_fichier.ctl

-- Vérifier le fichier log
-- Faire un select de la table pour vérifier que les infos soient entrer.


-- 20 % du temps de cette façon

-- 1 Créer un répertoire virtuel
DECLARE 
  V1 VARCHAR2
(32767); 
  F1 UTL_FILE.FILE_TYPE ; 
   v_code departement.num_dep%type;
   v_nom departement.dep_name%type;
   v_region departement.region_name%type;
   v_pos_1 int;
   v_pos_2 int;
BEGIN 
  F1 := UTL_FILE.FOPEN
('REP1','departements-region.csv','R',256); 
 loop
   UTL_FILE.GET_LINE
(F1,V1,256); 
    -- code jusuq'a la postion de la virgule = position de la 1ere virgule -1
    -- nom : entre premeire et 2 eme virgule
    -- region : à partie de la 2ème virgule jusqu'a la fin
    -- pour récupérér la position d'un caractère dans un string 
    -- on utilise la fonction instr(
    v_pos_1 := instr
(v1,',',1,1);
    v_pos_2 := instr
(v1,',',1,2);
    --substr
    v_code := substr
(v1,1,v_pos_1-1);
    v_nom := substr
(v1,v_pos_1+1,v_pos_2-v_pos_1-1);
    v_region := substr
(v1,v_pos_2+1);

insert into departement
values
  (v_code, v_nom, v_region);
dbms_output.put_line
(v_code||'#'||v_nom||'#'||v_region);


end loop;
   UTL_FILE.FCLOSE
(F1); 
   exception when others then
    dbms_output.put_line
('fin du fichier');
END;

