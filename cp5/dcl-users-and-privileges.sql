-- Fonctions de cryptage : MD5, SHA1 ou SHA2
-- Test avec 'Lesly'
SELECT MD5('Lesly')
; -- c29635160b6764295727819ffac15558 = 32 car.

SELECT MD5('Gu@de10Up3')  -- Guadeloupe
; -- 52919b66fd86952abf1ae1301468551d

SELECT SHA1('Salut')
; -- 9f57098c5534762dd32802302db78ada1ba864f5 = 40 car.

SELECT SHA1('Il&T1fois')
; -- d32e41609825188054cf82ced54c86b43b827be4

SELECT SHA2('Bonjour', 256)
; -- 9172e8eec99f144f72eca9a568759580edadb2cfd154857f07e657569493bc44 = 64 car.

-- Création d'un user : simple
CREATE USER 'chris'@'localhost'
IDENTIFIED BY 'secret'
;

-- Création d'un user : expiration
CREATE USER 'manu'@'localhost'
IDENTIFIED BY 'secret'
PASSWORD EXPIRE
;

-- Création d'un user : mode d'authentification pour connexion phpMyAdmin
CREATE USER 'zack'@'localhost' 
IDENTIFIED WITH mysql_native_password BY 'secret'
;

-- Requête pour recharger les privilèges de connexion (obligatoire)
FLUSH PRIVILEGES
;

-- Création d'une user avec privilèges
CREATE USER 'fab'@'localhost'
IDENTIFIED BY 'secret'
;

GRANT CREATE
ON arpajon.*
TO  'fab'@'localhost'
;

GRANT CREATE, SELECT, UPDATE
ON arpajon.students
TO  'fab'@'localhost'
;

GRANT SELECT, INSERT, DELETE
ON arpajon.courses
TO  'fab'@'localhost'
;

-- Retrait de privilèges
REVOKE CREATE
ON arpajon.*
FROM  'fab'@'localhost'
;

-- Suppression user
DROP USER 'manu'@'localhost'
;

-- Création d'un superuser : admin
CREATE USER 'admin'@'localhost'
IDENTIFIED BY 'secret'
;

GRANT ALL PRIVILEGES
ON *.*
TO 'admin'@'localhost'
;

-- Création d'un user pour le CP6
CREATE USER 'lesly'@'localhost'
IDENTIFIED WITH mysql_native_password BY 'secret'
;

GRANT SELECT
ON arpajon.*
TO 'lesly'@'localhost'
;






