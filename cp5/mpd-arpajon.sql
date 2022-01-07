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

-- Suppression de la table si elle existe
DROP TABLE IF EXISTS arpajon.students
;

-- Création de la table STUDENTS
CREATE TABLE arpajon.students(
	id_stud TINYINT PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(30) NOT NULL,
    dob DATE,
    sex ENUM('F', 'M') NOT NULL
)
ENGINE=InnoDB 
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci
;

-- Création de la table TEACHERS
-- id_teach TINYINT PK AI
-- fname VARCHAR NN
-- grade TINYINT (valeur entre 1 et 5)
-- begin DATE
-- email VARCHAR UQ


-- Vérif création tables
SHOW TABLES
;









