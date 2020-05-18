CREATE DATABASE if not exists Universita;

USE Universita;

DROP TABLE if exists Corso_Laurea;
CREATE TABLE Corso_Laurea(
  Codice numeric(10) not null check(Codice>0),
  Nome varchar(30) not null,
  Descrizione varchar(50),
  primary key (Codice)
);

DROP TABLE if exists Studente;
CREATE TABLE Studente(
  Matricola_studente numeric(6) check(Matricola_studente>0) not null ,
  Corso_l numeric(10) not null,
  Nome varchar(30) not null,
  Cognome varchar(30) not null,
  Data_nascita date,
  Codice_fiscale varchar(16) not null,
  Foto blob NULL,
  primary key(Matricola_studente),
  FOREIGN KEY (Corso_l) REFERENCES Corso_Laurea(Codice)
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
  primary key(Matricola_docente)
);


DROP TABLE if exists Modulo;
CREATE TABLE Modulo(
  Codice numeric(10) not null check(Codice>0),
  Nome varchar(30) not null,
  Descrizione varchar(50),
  CFU numeric(2) not null check(CFU>0),
  primary key(Codice)
);

DROP TABLE if exists Esame;
CREATE TABLE Esame(
  Matricola_s numeric(6) check(Matricola_s>0) not null,
  Codice_modulo numeric(10),
  Matricola_d numeric(6)not null check (Matricola_d>0),
  Data date,
  Voto numeric(2) not null check(Voto<=30),
  Note varchar(50),
  primary key (Voto),
  FOREIGN KEY (Matricola_s) REFERENCES Studente(Matricola_studente),
  FOREIGN KEY(Matricola_d) REFERENCES Docente(Matricola_docente),
  FOREIGN KEY (Codice_modulo) REFERENCES Modulo(Codice)
);


DROP TABLE if exists Dipartimento;
CREATE TABLE Dipartimento(
  Codice_d numeric(10) not null check(Codice_d>0),
  Nome varchar(50),
  primary key (Codice_d)
);


DROP TABLE if exists Sede;
CREATE TABLE Sede(
  Codice_s varchar(40) not null,
  Indirizzo varchar(50),
  Citta varchar(20) not null,
  primary key (Codice_s)
);

DROP TABLE if exists Sede_Dipartimento;
CREATE TABLE Sede_Dipartimento(
  Codice_sede varchar(40)not null,
  Codice_dipartimento numeric(10)not null check(Codice_dipartimento>0),
  Note varchar(50),
  primary key (Note),
  FOREIGN KEY (codice_dipartimento) REFERENCES Dipartimento(codice_d),
  FOREIGN KEY (Codice_sede) REFERENCES Sede(Codice_s)
);

Insert into Corso_Laurea(Codice,Nome,Descrizione)
  values(100718991,'ICD',NULL);
Insert into Corso_Laurea(Codice,Nome,Descrizione)
  values(100718990,'SA',NULL);

insert into Studente(Matricola_studente,Corso_l,Nome,Cognome,Data_nascita,Codice_fiscale,Foto)
  values(123456,'100718991','Matteo','Dinoi','1998-12-29','MTTDNI98T29D761U', NULL);
insert into Studente(Matricola_studente,Corso_l,Nome,Cognome,Data_nascita,Codice_fiscale,Foto)
  values(679487,'100718990','Giovanni','Saracino','1997-10-16','GVNSRC97V16S554B', NULL);
insert into Studente(Matricola_studente,Corso_l,Nome,Cognome,Data_nascita,Codice_fiscale,Foto)
    values(679488,'100718990','Giovanni','Grande','1990-10-16','GVNGRC97V16S554B', NULL);

insert into Docente(Matricola_docente,Dipartimento,Nome,Cognome,Data_nascita,Codice_fiscale, Foto)
  values(155998,'Informatica','Miguel','Ceriani','1976-06-12','MGLCRN12G12I555E',NULL);
insert into Docente(Matricola_docente,Dipartimento,Nome,Cognome,Data_nascita,Codice_fiscale, Foto)
  values(155487,'Fisica','Rosalia','Miglietta','1970-10-20','RSLMGL20S15L324S',NULL);
insert into Docente(Matricola_docente,Dipartimento,Nome,Cognome,Data_nascita,Codice_fiscale, Foto)
    values(155488,'Linguaggi di progr','Giuseppe','Miglia','1950-10-20','GSPMGL20F18K317E',NULL);

  Insert into Modulo(Codice,Nome,Descrizione,CFU)
    values(1025508776,'Informatica',NULL,9);
  Insert into Modulo(Codice,Nome,Descrizione,CFU)
    values(1025508771,'Matematica',NULL,12);
    Insert into Modulo(Codice,Nome,Descrizione,CFU)
      values(1025508775,'BDD',NULL,9);

Insert into Esame(Matricola_s,Codice_modulo,Matricola_d,Data,Voto,Note)
 values(123456,1025508776,155998,'2020-04-20',18,NULL);
Insert into Esame(Matricola_s,Codice_modulo,Matricola_d,Data,Voto,Note)
 values(679487,1025508771,155488,'2020-04-18',27,NULL);
 Insert into Esame(Matricola_s,Codice_modulo,Matricola_d,Data,Voto,Note)
  values(123456,1025508775,155998,'2020-04-18',25,NULL);


Insert into Dipartimento(codice_d,Nome)
  values(6001000001,'Matematica');
Insert into Dipartimento(Codice_d,Nome)
  values(6001000022,'Informatica');
  Insert into Dipartimento(Codice_d,Nome)
    values(6001000021,'Fisica');

Insert into Sede(Codice_s,Indirizzo,Citta)
  values('Informatica e produzione del software','Via Alessandro Magno 23','Bari');
Insert into Sede(Codice_s,Indirizzo,Citta)
  values('Biologia','Via Roma 18','Brindisi');
Insert into Sede(Codice_s,Indirizzo,Citta)
  values('Informatica e comunicazione digitale','Via bell Acqua 34','Taranto');

Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values('Informatica e produzione del software',6001000001,'Dipartimento di: Informatica');
Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values('Biologia',6001000022,'Dipartimento di: Biologia');
Insert into Sede_Dipartimento(Codice_sede,Codice_dipartimento,Note)
  values('Informatica e comunicazione digitale',6001000021,'Dipartimento di:Scienze naturali');



select * from Corso_Laurea;
select * from Studente;
select * from Docente;
select * from Modulo;
select * from Esame;
select * from Dipartimento;
select * from Sede;
select * from Sede_Dipartimento;


/*Mostrare ncome e descrizione di tutti i moduli da 9 CFU'*/
select Nome,CFU
from Modulo
where CFU = 9;

/*Mostrare matricola, nome e cognome dei docenti che hanno più di 60 anni*/
select Matricola_docente,Nome,Cognome,Data_nascita
from Docente
where TIMESTAMPDIFF(YEAR,Data_nascita,CURDATE()) <1960;

/*Mostrare nome, cognome e nome del dipartimento di ogni docente, ordinati dal più giovane al più anziano*/
select Nome,Cognome,Dipartimento
from Docente
ORDER BY Data_nascita desc;

/*Mostrare città e indirizzo di ogni sede del dipartimento di codice "INFO"*/
select Citta,Indirizzo
from Sede
where Codice_s LIKE '%Info%';

/*Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo.*/
select Dipartimento.Nome,Sede.Citta,Sede.Indirizzo
from Sede_Dipartimento JOIN Sede on Codice_s=Codice_sede
join Dipartimento on Codice_d=Codice_dipartimento
ORDER BY Nome asc;

/*Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo.*/
select Dipartimento.Nome,Sede.Citta,Sede.Indirizzo
from Sede_Dipartimento JOIN Sede on Codice_s=Codice_sede
join Dipartimento on Codice_d=Codice_dipartimento
ORDER BY Citta asc;

/*Mostrare nome del dipartimento, città e indirizzo di ogni sede di ogni dipartimento, ordinate alfabeticamente prima per nome dipartimento, poi per nome città e infine per indirizzo.*/
select Dipartimento.Nome,Sede.Citta,Sede.Indirizzo
from Sede_Dipartimento JOIN Sede on Codice_s=Codice_sede
join Dipartimento on Codice_d=Codice_dipartimento
ORDER BY Indirizzo asc;

/*Mostrare il nome di ogni dipartimento che ha una sede a Bari.*/
select Dipartimento.Nome
from Sede_Dipartimento JOIN Sede on Codice_s=Codice_sede
join Dipartimento on Codice_d=Codice_dipartimento
where Citta='Bari';

/*Mostrare il nome di ogni dipartimento che non ha sede a Brindisi.*/
select Dipartimento.Nome
from Sede_Dipartimento JOIN Sede on Codice_s=Codice_sede
join Dipartimento on Codice_d=Codice_dipartimento
where not Citta='Brindisi';

/*Mostrare media, numero esami sostenuti e totale CFU acquisiti dello studente con matricola 123456.*/
select AVG(Esame.Voto) AS MediaVoto, Sum(Modulo.CFU) AS CFUACQUISITI, Count(Studente.Matricola_Studente) AS EsamiSostenuti
FROM Esame Join Studente on Matricola_studente=Matricola_s
JOIN Modulo on Codice=Codice_modulo
where Matricola_studente=123456;

/*Mostrare nome, cognome, nome del corso di laurea, media e numero esami sostenuti dello studente con matricola 123456*/
SELECT Studente.Nome,Studente.cognome,Studente.Corso_l, AVG(Esame.Voto) AS MediaVoto,Count(Studente.Matricola_studente)AS EsamiSostenuti
FROM Esame Join Studente on Matricola_studente=Matricola_s
JOIN Modulo on Codice=Codice_modulo
where Matricola_studente=123456;

/*Mostrare codice, nome e voto medio di ogni modulo, ordinati dalla media più alta alla più bassa.*/
SELECT Modulo.Codice,Modulo.Nome,AVG(Esame.Voto) AS MediaVoto
FROM Esame RIGHT JOIN Modulo on Codice_modulo=Codice
ORDER BY MediaVoto desc;

/*Mostrare nome e cognome del docente, nome e descrizione del modulo per ogni docente ed ogni modulo di cui quel docente abbia tenuto almeno un esame; il risultato deve includere anche i docenti che non abbiano tenuto alcun esame, in quel caso rappresentati con un'unica tupla in cui nome e descrizione del modulo avranno valore NULL.*/
SELECT Docente.nome,Docente.Cognome,Modulo.Nome,Modulo.Descrizione
FROM Docente LEFT JOIN Esame ON Esame.Matricola_d=Docente.Matricola_docente
LEFT JOIN Modulo ON Modulo.Codice=Esame.Codice_modulo
HAVING Count(Esame.Matricola_d)>1 OR Count(Esame.Matricola_d)=0;
GROUP BY Docente.Matricola_docente


/*Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente.*/
SELECT Studente.matricola_studente,Studente.Nome,Studente.Cognome,Studente.Data_nascita,Count(Esame.Matricola_s) AS EsamiSostenuti,AVG(Esame.Voto)AS MediaVoti
FROM Studente LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
ORDER BY Studente.Matricola_studente asc;
GROUP BY Studente.Matricola_studente

/*Mostrare matricola, nome, cognome, data di nascita, media e numero esami sostenuti di ogni studente del corso di laurea di codice "ICD" che abbia media maggiore di 27.*/
SELECT Studente.Matricola_studente,Studente.Nome,Studente.Cognome,Studente.Data_nascita,Count(Esame.Matricola_s) AS EsamiSostenuti, AVG(Esame.Voto)AS MediaVoti
FROM Studente LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
HAVING AVG(Esame.Voto)>27;
GROUP BY Studente.Matricola_Studente

/*Mostrare nome, cognome e data di nascita di tutti gli studenti che ancora non hanno superato nessun esame.*/
SELECT Studente.Nome,Studente.Cognome,Studente.Data_nascita
FROM Studente LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
HAVING Count(Esame.Matricola_s)=0 OR MAX(Esame.Voto)<=18;
GROUP BY Studente.Matricola_studente

/*Mostrare la matricola di tutti gli studenti che hanno superato almeno un esame e che hanno preso sempre voti maggiori di 26
SELECT Studente.Matricola_studente
FROM Studente LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
GROUP BY Studente.
HAVING Count(Esame.Matricola_s)>0 OR AVG(Esame.Voto)>=27;*/


/*Mostrare, per ogni modulo, il numero degli studenti che hanno preso tra 18 e 21, quelli che hanno preso tra 22 e 26 e quelli che hanno preso tra 27 e 30 (con un'unica interrogazione).
SELECT Count(Studente.Matricola)AS Numero_di_Studenti
FROM Studenti LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
GROUP BY Studente.Matricola_Studente
HAVING AVG(Esame.Voto)>=18<=21 OR AVG(Esame.Voto)>=22<=26 OR AVG(Esame.Voto)>=27<=30;*/

/*Mostrare matricola, nome, cognome e voto di ogni studente che ha preso un voto maggiore della media nel modulo "BDD"*/
SELECT Studente.Matricola_studente,Studente.Cognome,Studente.Nome,Esame.voto,AVG(Esame.Voto)
FROM Studente LEFT JOIN Esame ON Studente.Matricola_studente=Esame.Matricola_s
LEFT JOIN Modulo ON Modulo.Codice=Esame.Codice_modulo
GROUP BY Studente.Matricola_studente
HAVING (Esame.Voto)>AVG(Esame.Voto)
