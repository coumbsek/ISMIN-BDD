create table etudiant(
	num_et decimal(3,0) primary key,
	nom_et varchar(10),
	prenom_et varchar(10),
	adr_et varchar(28),
	cp_et varchar(5),
	ville_et varchar(10),
	annee decimal(1,0) check ((annee=1) or (annee=2)),
	groupe decimal(1,0) check ((groupe>=1) and (groupe<=6)));

create table prof(
	num_prof decimal(3,0) primary key,
	nom_prof varchar(10),
	prenom_prof varchar(10),
	adr_prof varchar(20),
	cp_prof varchar(5),
	ville_prof varchar(10));

create table matiere(
	code varchar(4) primary key,
	libelle varchar(20),
	h_cours_prev decimal(3,0),
	h_cours_rea decimal(3,0),
	h_tp_prev decimal(3,0),
	h_tp_rea decimal(3,0),
	discipline varchar(15) check(discipline in ('Langues', 'Maths', 'Informatique', 'Gestion', 'Communication')),
	coeff_test decimal(3,0) check ((coeff_test>=0) and (coeff_test <=100)),
	coeff_cc decimal(3,0) check ((coeff_cc>=0) and (coeff_cc<=100)),
	resp decimal(3,0) references prof(num_prof));

alter table prof add mat_spec varchar(4) constraint FK_prof_mat_spec references matiere(code);

create table enseignt(
	code varchar(4) references matiere(code),
	num_prof decimal(3,0) references prof(num_prof),
	num_et decimal(3,0) references etudiant(num_et),
	primary key(code, num_prof,num_et));

create table notation(
	num_et decimal(3,0) references etudiant(num_et),
	code varchar(4) references matiere(code),
	primary key(num_et, code),
	note_cc decimal(2,0) check ((note_cc>=0) and (note_cc <=20)),
	note_test decimal(2,0) check ((note_test>=0) and (note_test <=20)));
