CREATE TABLE ETUDIANT (
Num_Et NUMBER(3) PRIMARY KEY,
Nom_Et VARCHAR2(10),
Prenom_Et VARCHAR2(10),
Adr_Et VARCHAR2(28),
CP_Et VARCHAR2(5),
Ville_Et VARCHAR2(10),
Annee NUMBER(1) CHECK( Annee >= 1 AND Annee <= 2),
Groupe NUMBER(1) CHECK(Groupe >= 1 AND Groupe <= 6)
);

CREATE TABLE PROF (
Num_Prof NUMBER(3) PRIMARY KEY,
Nom_Prof VARCHAR2(10),
Prenom_Prof VARCHAR2(10),
Adr_Prof VARCHAR2(20),
CP_Prof VARCHAR2(5),
Ville_Prof VARCHAR2(10),
Mat_Spec VARCHAR2(4)
);

CREATE TABLE MATIERE (
Code VARCHAR2(4) PRIMARY KEY,
Libelle VARCHAR2(20),
H_Cours_Prev NUMBER(3),
H_Cours_Rea NUMBER(3),
H_TP_Prev NUMBER(3),
H_TP_Rea NUMBER(3),
Discipline VARCHAR2(15) CHECK(Discipline in ('Langues','Maths','Informatique','Gestion','Communication') OR Discipline IS NULL),
Coeff_Test NUMBER(3) CHECK(Coeff_Test >= 0 AND Coeff_Test <= 100),
Coeff_CC NUMBER(3) CHECK(Coeff_CC >= 0 AND Coeff_CC <= 100),
Resp NUMBER(3)
);

ALTER TABLE PROF
ADD CONSTRAINT Prof_Mat_Spec_FK FOREIGN KEY (Mat_Spec) REFERENCES MATIERE (Code);

ALTER TABLE MATIERE
ADD CONSTRAINT Matiere_Resp_FK FOREIGN KEY (Resp) REFERENCES PROF (Num_Prof);

CREATE TABLE ENSEIGNT (
Code VARCHAR2(4),
Num_Prof NUMBER(3),
Num_Et NUMBER(3),
PRIMARY KEY (Code,Num_Prof,Num_Et)
);

ALTER TABLE ENSEIGNT
ADD CONSTRAINT Enseignt_Code_FK FOREIGN KEY(Code) REFERENCES MATIERE(Code);

ALTER TABLE ENSEIGNT
ADD CONSTRAINT Enseignt_Num_Prof_FK FOREIGN KEY(Num_Prof) REFERENCES PROF(Num_Prof);

ALTER TABLE ENSEIGNT
ADD CONSTRAINT Enseignt_Num_Et_FK FOREIGN KEY(Num_Et) REFERENCES ETUDIANT(Num_Et);

CREATE TABLE NOTATION (
Num_Et NUMBER(3),
Code VARCHAR2(4),
Note_CC NUMBER(2) CHECK(Note_CC >= 0 AND Note_CC <= 20),
Note_Test NUMBER(2) CHECK(Note_Test >= 0 AND Note_Test <=20),
PRIMARY KEY(Num_Et,Code)
);

ALTER TABLE NOTATION
ADD CONSTRAINT Notation_Num_Et_FK FOREIGN KEY(Num_Et) REFERENCES ETUDIANT (Num_Et);

ALTER TABLE NOTATION
ADD CONSTRAINT Notation_Code_FK FOREIGN KEY(Code) REFERENCES MATIERE (Code);
