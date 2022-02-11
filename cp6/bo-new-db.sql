-- Création de 2 bases de données pour tester
-- l'affichage dynamique du back-office
DROP DATABASE IF EXISTS mydb
;
CREATE DATABASE IF NOT EXISTS mydb
;
DROP DATABASE IF EXISTS mydb2
;
CREATE DATABASE IF NOT EXISTS mydb2
;
CREATE TABLE mydb2.mytable(
	myid INT PRIMARY KEY AUTO_INCREMENT,
    mycol VARCHAR(30)
);
INSERT INTO mydb2.mytable VALUES
	(1, 'Fabrice'),
	(2, 'Manu'),
	(3, 'Tintin'),
	(4, 'Gogo'),
	(5, 'Didil')
;
    
SELECT schema_name
FROM information_schema.schemata
WHERE schema_name NOT LIKE '%schema'
AND schema_name NOT IN ('mysql','phpmyadmin','sys')
ORDER BY schema_name
;



