-- Suppression de la BDD si elle existe
DROP DATABASE IF EXISTS arpajon
;

-- Création de la BDD arpajon
CREATE DATABASE arpajon
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_general_ci
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

-- Création index sur la colonne FNAME de la table STUDENTS
CREATE INDEX idx_students_fname
	ON arpajon.students (fname)
;

-- Suppression de la table si elle existe
DROP TABLE IF EXISTS arpajon.teachers
;

-- Création de la table TEACHERS
-- id_teach TINYINT PK AI
-- fname VARCHAR NN
-- grade TINYINT (valeur entre 1 et 5)
-- dos DATE
-- email VARCHAR UQ
CREATE TABLE arpajon.teachers(
	id_teach TINYINT PRIMARY KEY AUTO_INCREMENT,
	fname VARCHAR(30) NOT NULL,
    grade TINYINT CHECK (grade BETWEEN 1 AND 5),
    dos DATE,
    email VARCHAR(100) UNIQUE
)
ENGINE=InnoDB
;

-- Création de la table COURSES
-- Préfixes pour les contraintes :
-- Clé primaire : PK
-- Clé étrangère : FK
-- Unique : UQ
-- Check : CK
-- Not null : NN
-- Default : DF
CREATE TABLE arpajon.courses(
	-- Colonnes
    id_cur CHAR(5),
    title VARCHAR(255),
    coeff TINYINT,
    id_teach TINYINT,
    book MEDIUMBLOB,
    -- Contraintes
    CONSTRAINT pk_courses PRIMARY KEY (id_cur),
    CONSTRAINT nn_courses_title CHECK (title IS NOT NULL), -- simule NOT NULL via CHECK
    CONSTRAINT ck_courses_coeff CHECK (coeff BETWEEN 1 AND 12),
    CONSTRAINT fk_courses_teachers FOREIGN KEY (id_teach) 
		REFERENCES arpajon.teachers(id_teach)
)
ENGINE=InnoDB
;

-- Création de la table FOLLOWS
-- id_stud TINYINT + FK de la table STUDENTS
-- id_cur CHAR(5) + FK de la table COURSES
-- score TINYINT + CK (entre 1 et 20)
-- PK sur id_stud et id_cur
CREATE TABLE arpajon.follow(
	-- Colonnes
	id_stud TINYINT,
    id_cur CHAR(5),
    score TINYINT,
    -- Contraintes
    CONSTRAINT fk_follow_students FOREIGN KEY (id_stud) 
		REFERENCES arpajon.students(id_stud),
	CONSTRAINT fk_follow_courses FOREIGN KEY (id_cur) 
		REFERENCES arpajon.courses(id_cur),
	CONSTRAINT pk_follow PRIMARY KEY (id_stud, id_cur),
    CONSTRAINT ck_follow_score CHECK (score BETWEEN 1 AND 20)
) ENGINE=InnoDB
;

-- Modification de la table STUDENTS pour ajout de colonne
ALTER TABLE arpajon.students
	ADD COLUMN tel VARCHAR(15),
    ADD CONSTRAINT uq_students_tel UNIQUE (tel),
    MODIFY COLUMN fname VARCHAR(40)
;

-- Vérif création tables
SHOW TABLES
;