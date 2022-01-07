-- Script de création de la BDD hotels
DROP DATABASE IF EXISTS hotels
;

CREATE DATABASE hotels
	CHARACTER SET utf8mb4
    COLLATE utf8mb4_general_ci
;

USE hotels
;

-- Script généré par LOOPING
CREATE TABLE groupes(
   codgrp SMALLINT,
   nom VARCHAR(50) NOT NULL,
   PRIMARY KEY(codgrp)
);

CREATE TABLE hotels(
   codhot SMALLINT,
   nom VARCHAR(50) NOT NULL,
   classement CHAR(5),
   codgrp SMALLINT,
   PRIMARY KEY(codhot),
   FOREIGN KEY(codgrp) REFERENCES groupes(codgrp)
);

CREATE TABLE chambres(
   codchb SMALLINT,
   numero SMALLINT NOT NULL,
   prix DECIMAL(6,2),
   etage TINYINT,
   codhot SMALLINT NOT NULL,
   PRIMARY KEY(codchb),
   FOREIGN KEY(codhot) REFERENCES hotels(codhot)
);

CREATE TABLE categories(
   codcat SMALLINT,
   _desc VARCHAR(50) NOT NULL,
   PRIMARY KEY(codcat)
);

CREATE TABLE clients(
   codcli SMALLINT,
   nom VARCHAR(50) NOT NULL,
   courriel VARCHAR(100) NOT NULL,
   tel VARCHAR(15) NOT NULL,
   PRIMARY KEY(codcli),
   UNIQUE(courriel),
   UNIQUE(tel)
);

CREATE TABLE avoir(
   codchb SMALLINT,
   codcat SMALLINT,
   PRIMARY KEY(codchb, codcat),
   FOREIGN KEY(codchb) REFERENCES chambres(codchb),
   FOREIGN KEY(codcat) REFERENCES categories(codcat)
);

CREATE TABLE reserver(
   codchb SMALLINT,
   codcli SMALLINT,
   codresa SMALLINT NOT NULL,
   date_resa DATETIME NOT NULL,
   entree DATETIME NOT NULL,
   sortie DATETIME NOT NULL,
   type VARCHAR(50),
   PRIMARY KEY(codchb, codcli),
   FOREIGN KEY(codchb) REFERENCES chambres(codchb),
   FOREIGN KEY(codcli) REFERENCES clients(codcli)
);