-- Suppression de la BDD si elle existe
DROP DATABASE IF EXISTS arpajon
;

-- Création de la BDD arpajon
CREATE DATABASE arpajon
;

-- Vérif création BDD
SHOW DATABASES
;

-- Active la BDD
USE arpajon
;

-- Création de la table STUDENTS
CREATE TABLE arpajon.students(
	id_stud INTEGER,
    fname VARCHAR(30)
);







