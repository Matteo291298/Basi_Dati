CREATE DATABASE if not exists Universita;

USE Universita;

DROP TABLE if exists Studente;
CREATE TABLE Studente(
  Matricola_studente numeric(6) check(Matricola_studente>0) not null ,
  Corso_l varchar (30) references Corso_Laurea(Nome),
  Nome varchar(20) not null,
  Cognome varchar(30) not null,
  Data_nascita date,
  Codice_fiscale varchar(16) not null,
  Foto blob NULL,
  primary key(Matricola_studente,Codice_fiscale)
);


DROP TABLE if exists Docente;
CREATE TABLE Docente(
  Matricola_docente numeric(6) not null check(Matricola_docente>0),
  Dipartimento varchar(50) not null,
  Nome varchar(20) not null,
  Cognome varchar(30) not null,
  Data_nascita date,
  Codice_fiscale varchar(16) not null,
  Foto blob NULL,
  primary key(Matricola_docente,Codice_fiscale)
);


DROP TABLE if exists Modulo;
CREATE TABLE Modulo(
  Codice numeric(10) not null check(Codice>0),
  Nome varchar(30) not null,
  Descrizione varchar(50),
  CFU numeric(2) not null check(CFU>0),
  primary key(Codice,CFU)
);

DROP TABLE if exists Esame;
CREATE TABLE Esame(
  Matricola_s numeric(6) references Studente(Matricola_studente),
  Codice_modulo numeric(10)references Modulo(Codice),
  Matricola_d numeric(6) references Docente(Matricola_docente),
  Data date,
  Voto numeric(2) not null check(Voto>0),
  Note varchar(50),
  primary key (Codice_modulo,Data)
);

DROP TABLE if exists Corso_Laurea;
CREATE TABLE Corso_Laurea(
  Codice numeric(10) not null check(Codice>0),
  Nome varchar(30) not null,
  Descrizione varchar(50),
  primary key (Codice,Nome)
);

DROP TABLE if exists Dipartimento;
CREATE TABLE Dipartimento(
  Codice numeric(10) not null check(Codice>0),
  Nome varchar(50),
  primary key (Nome,Codice)
);


DROP TABLE if exists Sede;
CREATE TABLE Sede(
  Codice numeric(10) not null check(Codice>0),
  Indirizzo varchar(50),
  Citta varchar(20) not null,
  primary key (Codice)
);

DROP TABLE if exists Sede_Dipartimento;
CREATE TABLE Sede_Dipartimento(
  Codice_sede numeric(10) references Sede(Codice),
  Codice_dipartimento numeric(10) references Dipartimento(Codice),
  Note varchar(50),
  primary key (Codice_sede,Codice_dipartimento)
);

insert into Studente(Matricola_studente,Corso_l,Nome,Cognome,Data_nascita,Codice_fiscale,Foto)
  values(679488,'ICD','Matteo','Dinoi','1998-12-29','MTTDNI98T29D761U', NULL);
insert into Studente(Matricola_studente,Corso_l,Nome,Cognome,Data_nascita,Codice_fiscale,Foto)
  values(679487,'SA','Giovanni','Saracino','1997-10-16','GVNSRC97V16S554B', NULL);

insert into Docente(Matricola_docente,Dipartimento,Nome,Cognome,Data_nascita,Codice_fiscale, Foto)
  values(155998,'Informatica','Miguel','Ceriani','1976-06-12','MGLCRN12G12I555E',NULL);
insert into Docente(Matricola_docente,Dipartimento,Nome,Cognome,Data_nascita,Codice_fiscale, Foto)
  values(155487,'Fisica','Rosalia','Miglietta','1970-10-20','RSLMGL20S15L324S',NULL);

Insert into Esame(Matricola_s,Codice_modulo,Matricola_d,Data,Voto,Note)
 values(679488,1025508776,155998,'2020-07-20',23,NULL);
Insert into Esame(Matricola_s,Codice_modulo,Matricola_d,Data,Voto,Note)
 values(679487,1025508771,155487,'2020-07-18',27,NULL);

Insert into Modulo(Codice,Nome,Descrizione,CFU)
  values(1025508776,'Informatica',NULL,9);
Insert into Modulo(Codice,Nome,Descrizione,CFU)
  values(1025508771,'Informatica',NULL,12);

Insert into Corso_Laurea(Codice,Nome,Descrizione)
  values(100718991,'ICD',NULL);
Insert into Corso_Laurea(Codice,Nome,Descrizione)
  values(100718990,'SA',NULL);

Insert into Dipartimento(Codice,Nome)
  values(6001000001,'Matematica');
Insert into Dipartimento(Codice,Nome)
  values(6001000022,'Informatica');

Insert into Sede(Codice,Indirizzo,Citta)
  values(1300001210,'Via Alessandro Magno 23','Milano');
Insert into Sede(Codice,Indirizzo,Citta)
  values(1300001211,'Via Roma 18','Roma');
Insert into Sede(Codice,Indirizzo,Citta)
  values(1300001212,'Via bell Acqua 34','Taranto');

Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values(1300001210,6001000001,NULL);
Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values(1300001211,6001000022,NULL);
Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values(1300001212,6001000022,NULL);


select * from Modulo;
select * from Dipartimento;
select * from Sede_Dipartimento;
select * from Sede;
select * from Studente;
select * from Esame;
select * from Docente;
select * from Corso_Laurea;
