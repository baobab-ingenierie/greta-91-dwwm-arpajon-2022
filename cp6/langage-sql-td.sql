USE arpajon
;

-- Projection : toutes les colonnes 
SELECT *
FROM courses
;

-- Projection : colonnes choisies
SELECT id_cur, title
FROM courses
;

-- Question : trouvez le résultat
SELECT 'Lesly', 15/5*2-4, 5.5, title, coeff * 5
FROM courses
;

-- Question : lister le code des cours à partir de la table FOLLOW
SELECT DISTINCT id_cur
FROM follow
;

-- Question : afficher la liste des cours de la manière 
-- suivante => "CP1 - Maquettage"
SELECT CONCAT(id_cur, ' - ', title) -- expression
FROM courses
;

SELECT CONCAT(id_cur, ' - ', title) AS Cours -- alias
FROM courses
;

SELECT CONCAT(id_cur, ' - ', title) AS Liste_des_cours -- alias
FROM courses
;

SELECT CONCAT(id_cur, ' - ', title) AS "Liste des cours" -- alias
FROM courses
;

-- Gestion des NULL
SELECT id_cur, 
	title, 
    COALESCE(id_teach, 'N/A') AS Code_Prof, -- SQL standard
    IFNULL(id_teach, 'N/A') AS Code_Prof2 -- MySQL
FROM courses
;

-- Sélection : quelques lignes
SELECT fname, tel
FROM students
WHERE sex = 'f'
;

SELECT *
FROM students
WHERE id_stud IN (2,8,4,19)
;

SELECT *
FROM students
WHERE fname BETWEEN 'b' AND 'g'
;

SELECT *
FROM students
WHERE fname LIKE '_a%e%'
;

SELECT *
FROM students
WHERE fname LIKE '%a%e%'
;

-- Sans jointures
SELECT *
FROM courses
; -- 11

SELECT *
FROM teachers
; -- 6

SELECT courses.title, teachers.fname
FROM courses, teachers 
; -- produit cartésien

SELECT courses.title, teachers.fname
FROM courses, teachers 
WHERE courses.id_teach = teachers.id_teach -- condition de jointure
; -- jointure (à l'ancienne)

SELECT c.title, t.fname
FROM courses c, teachers t 
WHERE c.id_teach = t.id_teach
; -- avec nom de corrélation

SELECT c.title, t.fname
FROM courses c JOIN teachers t ON t.id_teach = c.id_teach
; -- jointure interne (moderne et fortement recommandée)

SELECT c.title, t.fname
FROM courses c JOIN teachers t USING(id_teach)
; -- jointure interne (avec USING)

SELECT c.title, t.fname
FROM courses c NATURAL JOIN teachers t 
; -- jointure naturelle (peu recommandée)

-- Fonctions numériques
SELECT ROUND(1234.56789), 
		ROUND(1234.1223),
        ROUND(3.14159, 2),
        ROUND(3.14159, 3),
		ROUND(1789.56, -2)
;

SELECT CEIL(1234.00000001),
		CEIL(1234.999855479999)
; -- entier supérieur

SELECT FLOOR(1234.00000001),
		FLOOR(1234.999855479999)
; -- entier inférieur

SELECT TRUNCATE(1234.56789, 2),
		TRUNCATE(1294.56789, -2)
; -- troncature

-- Fonctions date et heure
SELECT DAY('1998-07-12'),
		MONTH('1998-07-12'),
        YEAR('1998-07-12'),
		HOUR('1998-07-12 22:50:16'),
		MINUTE('1998-07-12 22:50:16'),
		SECOND('1998-07-12 22:50:16')
;

SELECT NOW(),
		CURRENT_TIMESTAMP(),
        DATE_ADD(NOW(), INTERVAL 15 MONTH)
;

SELECT DATEDIFF('1998-07-12', '2018-07-15'),
		DATEDIFF('2018-07-15', '1998-07-12'), -- en jours
		DATEDIFF('2018-07-15', '1998-07-12') / 365.25,
        FLOOR(DATEDIFF('2018-07-15', '1998-07-12') / 365.25)
;

-- Fonctions chaine de caractères
SELECT UPPER('Hello world!'), -- UCASE
		LOWER('Hello world!'), -- LCASE
        SUBSTR('Toto aime les gâteaux', 6),
        SUBSTR('Toto aime les gâteaux', 6, 4), -- SUBSTRING
        LENGTH('Tata aime le chocolat noir'),
        INSTR('Titi fait cuicui', 'i'),
        LOCATE('u', 'Tutu m''a vu', 5)
;

SELECT 'Toto mange trop' AS sentence,
		-- SUBSTR('Toto mange trop', 6, 5),
		-- SUBSTR('Toto bouffe trop', 6, 5),
		SUBSTR('Emmanuel mange trop', LOCATE(' ', 'Emmanuel mange trop') + 1 , 5),
		SUBSTR('Toto bouffe trop', LOCATE(' ', 'Toto bouffe trop') + 1 , 5),
		LOCATE(' ', 'Toto bouffe trop', LOCATE(' ', 'Toto bouffe trop') + 1),
        SUBSTR(
			'Toto bouffe trop', 
            LOCATE(' ', 'Toto bouffe trop') + 1, 
            LOCATE(' ', 'Toto bouffe trop', LOCATE(' ', 'Toto bouffe trop') + 1) - (LOCATE(' ', 'Toto bouffe trop') + 1)
		)
;

-- Structure CASE simple
SELECT sex,
		CASE sex
			WHEN 'F' THEN 'Madame'
			WHEN 'M' THEN 'Monsieur'
            ELSE 'Pané'
        END AS civilite,
		fname,
		dob
FROM students
;

-- Structure CASE élaborée
/*
SELECT fname,
		dob,
        CASE MONTH(dob)
			CASE 1 THEN 1
			CASE 2 THEN 1
			CASE 3 THEN 1
            ...
            CASE 12 THEN 4
            ELSE 0
        END AS trimestre,
FROM students
;
*/

SELECT fname,
		dob,
        CASE
			WHEN MONTH(dob) < 4 THEN 1
			WHEN MONTH(dob) < 7 THEN 2
			WHEN MONTH(dob) < 10 THEN 3
			WHEN MONTH(dob) < 13 THEN 4
            ELSE 0
        END AS trimestre
FROM students
;
-- Opérations ensemblistes

-- UNION
SELECT CONCAT('T', id_teach) AS code,  fname, dos
FROM teachers
UNION
SELECT CONCAT('S', id_stud), fname, dob 
FROM students
;

-- INTERSECTION : prénoms en commun dans les tables
INSERT INTO teachers(id_teach, fname, grade, dos, email)
VALUES(7, 'Emmanuel', 1, '2022-02-04', 'maniasse@matheux.fr')
;

SELECT fname 
FROM teachers t
WHERE EXISTS (SELECT fname 
				FROM students s
                WHERE s.fname = t.fname)
;

-- EXCEPTION : prénoms dans une table mais pas dans l'autre
SELECT fname 
FROM teachers t
WHERE NOT EXISTS (SELECT fname 
				FROM students s
                WHERE s.fname = t.fname)
;
-- Inverse
SELECT fname 
FROM students s
WHERE NOT EXISTS (SELECT fname 
				FROM teachers t
                WHERE s.fname = t.fname)
;


