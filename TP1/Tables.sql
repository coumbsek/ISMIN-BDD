CREATE TABLE Etudiant (
	Num_Et NUMBER(3) PRIMARY KEY,
	Nom_Et VARCHAR2(10),
	Prenom_Et VARCHAR2(10),
	Adr_Et VARCHAR2(10),
	CP_Et VARCHAR2(5),
	Ville_Et VARCHAR2(10),
	Annee NUMBER(1) CHECK(Annee>0 AND Annee<3),
	Groupe NUMBER(1) CHECK(Groupe>0 AND Groupe<7)
);

CREATE TABLE Prof (
	Num_Prof NUMBER(3) PRIMARY KEY,
	Nom_Prof VARCHAR2(10),
	Prenom_Prof VARCHAR2(10),
	Adr_Prof VARCHAR2(10),
	CP_Prof VARCHAR2(5),
	Ville_Prof VARCHAR2(10)--,
	--FOREIGN KEY (Mat_Spec) REFERENCES Matiere(Code)
);

alter table prof 
	add mat_spec varchar(4) constraint FK_mat_spec references matiere(code);

CREATE TABLE Matiere (
	Code VARCHAR2(4) PRIMARY KEY,
	Libelle VARCHAR2(20),
	H_Cours_Prev NUMBER(3),
	H_Cours_Rea NUMBER(3),
	H_TP_Prev NUMBER(3),
	H_TP_Rea NUMBER(3),
	Discipline VARCHAR2(15) CHECK(Discipline in ('Langues','Maths','Informatique','Gestion','Communication') OR Discipline iS NULL),
	Coeff_Test NUMBER(3) CHECK(Coeff_Test>-1 AND Coeff_Test<101),
	Coeff_CC NUMBER(3) CHECK(Coeff_CC>-1 AND Coeff_CC<101)--,
	--FOREIGN KEY (Resp) REFERENCES PROF(Nom_Prof)
);

CREATE TABLE Enseignt (
	CONSTRAINT Code FOREIGN KEY (Code) REFERENCES Matiere(Code),
	CONSTRAINT Num_Prof FOREIGN KEY (Num_Prof) REFERENCES Prof(Num_Prof),
	CONSTRAINT Num_Et FOREIGN KEY (Num_Et) REFERENCES Etudiant(Num_Et),
	PRIMARY KEY (Code, Num_Prof, Num_Et)
);

CREATE TABLE Notation (
	CONSTRAINT Num_Et FOREIGN KEY (Num_Et) REFERENCES Etudiant(Num_Et),
	CONSTRAINT Code FOREIGN KEY (Code) REFERENCES Matiere(Code),
	Note_CC NUMBER(3) CHECK(Note_CC>-1 AND Note_CC<21),
	Note_Test NUMBER(2) CHECK(Note_Test>-1 AND Note_Test<21),
	PRIMARY KEY (Num_Et, Code)
);

ALTER TABLE Prof
	ADD FOREIGN KEY (Mat_Spec) REFERENCES Matiere(Code);