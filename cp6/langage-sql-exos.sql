USE arpajon
;

-- ##################################################
-- TP 2-1 et 2-2 : projections (SELECT ... FROM)
-- ##################################################

-- Afficher tous les cours
SELECT *
FROM courses
;

-- Afficher le prénom, le grade et la date de début de service 
-- des intervenants. Si grade NULL alors afficher 0
SELECT fname, COALESCE(grade, 0) AS grade, dos
FROM teachers
;

-- Afficher les notes à partir de la table FOLLOW
SELECT score
FROM follow
;

SELECT DISTINCT score
FROM follow
;

-- ##################################################
-- TP 2-3 : sélections (WHERE)
-- ##################################################

-- Afficher la liste des notes du module 5
-- comprises entre 12 et 16
SELECT score
FROM follow
WHERE score BETWEEN 12 AND 16
AND id_cur = 'CP5'
;

-- Afficher le prénom et la date de naissance des 
-- étudiants nés entre le 12/07/1998 et le 15/07/2018
SELECT fname, dob
FROM students
WHERE dob BETWEEN '1998-07-12' AND '2018-07-15'
-- WHERE dob BETWEEN '1998/07/12' AND '2018/07/15' -> conversion implicite
;

-- Afficher tous les cours traitant de 'e-commerce' ou 
-- de 'données' et ayant le coefficient 1
SELECT title, coeff
FROM courses
WHERE (title LIKE '%E-Commerce%'
OR title LIKE '%données%')
AND coeff = 1
;

-- OU

SELECT title, coeff
FROM courses
WHERE REGEXP_LIKE(title, 'e-commerce|données')
AND coeff = 1
;

-- Afficher la liste des filles nées entre mars et septembre
-- ou des garçons nés avant 1990 et contenant un multiple de 11
-- dans son numéro de téléphone (11, 22, 33 ...)
SELECT fname
FROM students
WHERE (sex = 'F' AND MONTH(dob) BETWEEN 3 AND 9)
OR (sex = 'M' AND YEAR(dob) < 1990 
AND (tel LIKE '%11%'
OR tel LIKE '%22%'
OR tel LIKE '%33%'
OR tel LIKE '%44%'
OR tel LIKE '%55%'
OR tel LIKE '%66%'
OR tel LIKE '%77%'
OR tel LIKE '%88%'
OR tel LIKE '%99%'))
-- OR (sex = 'M' AND YEAR(dob) < 1990 AND REGEXP_LIKE(tel, '11|22|33|44|55|66|77|88|99')) -- MySQL 8.0
-- OR (sex = 'M' AND YEAR(dob) < 1990 AND tel REGEXP '11|22|33|44|55|66|77|88|99') -- MySQL 5.6
;

-- ##################################################
-- TP 2-4 : tris (ORDER BY)
-- ##################################################

-- Afficher la liste des étudiants triée par sexe dans 
-- l'ordre croissant et par date de naissance dans 
-- l'ordre décroissant
SELECT fname, sex, dob 
FROM students
ORDER BY sex, dob DESC
;

-- Liste des notes triée par ID du cours décroissant et 
-- par note croissant
SELECT id_cur, score
FROM follow
ORDER BY id_cur DESC, score 
;

-- ##################################################
-- TP 2-5 : jointures internes
-- ##################################################

-- Afficher le prénom des formateurs et l'intitulé des 
-- cours dont le coefficient est supérieur à 1
SELECT t.fname, c.title, c.coeff
FROM teachers t JOIN courses c ON t.id_teach = c.id_teach
WHERE c.coeff > 1
;

-- Afficher le prénom des étudiantes ainsi que leur 
-- note sur le CP7
SELECT s.fname, f.score, f.id_cur
FROM students s JOIN follow f ON s.id_stud = f.id_stud
WHERE s.sex ='F'
AND f.id_cur = 'CP7'
;

-- Afficher le prénom de l'étudiant n° 14 ainsi que 
-- l'intitulé des cours qu'il suit
SELECT s.fname, c.title
FROM students s JOIN follow f ON s.id_stud = f.id_stud
				JOIN courses c ON f.id_cur = c.id_cur
WHERE s.id_stud = 14
;

-- ##################################################
-- TP 2-5 : jointures externes
-- ##################################################

-- Lister les profs associés à leur matières (ou pas)
SELECT t.fname, c.title
FROM teachers t JOIN courses c ON t.id_teach = c.id_teach
; -- interne

SELECT t.fname, c.title
FROM teachers t LEFT JOIN courses c ON t.id_teach = c.id_teach
; -- externe à gauche

SELECT t.fname, c.title
FROM teachers t RIGHT JOIN courses c ON t.id_teach = c.id_teach
; -- externe à droite

SELECT t.fname, c.title
FROM teachers t LEFT JOIN courses c ON t.id_teach = c.id_teach
UNION
SELECT t.fname, c.title
FROM teachers t RIGHT JOIN courses c ON t.id_teach = c.id_teach
; -- simulation d'un full

-- ##################################################
-- TP 3-1 : fonctions
-- ##################################################

-- Afficher le prénom en majuscule et la date de naissance 
-- des étudiants ayant plus de 30 ans
SELECT UPPER(fname) AS prenom,
		dob
FROM students
WHERE FLOOR(ABS(DATEDIFF(dob, NOW())) / 365.25) >= 30
;

-- A quelle date chaque étudiant partira à la retraite (62 ans)
-- et combien d'années cela représente par arpport à aujourd'hui
SELECT UPPER(fname) AS prenom,
		DATE_ADD(dob, INTERVAL 62 YEAR) date_depart,
        FLOOR(DATEDIFF(DATE_ADD(dob, INTERVAL 62 YEAR), NOW())/365.25) AS nb_annees
FROM students
;

-- Afficher le deuxième mot du titre de chaque cours
-- Aide : LOCATE, LENGTH et SUBSTR
SELECT SUBSTR(
	title, 
    LOCATE(' ', title) + 1, 
    LOCATE(' ', title, LOCATE(' ', title) + 1) - (LOCATE(' ', title) + 1)
    ) AS 2nd_mot
    , title
FROM courses
;
-- REGEXP_SUBSTR

-- ##################################################
-- TP 3-2 : regroupements (GROUP BY ... HAVING)
-- ##################################################

-- Afficher la moyenne (AVG) des notes obtenues par les 
-- filles sur le cours CP5
SELECT AVG(score) AS moyenne
FROM students s JOIN follow f ON s.id_stud = f.id_stud
WHERE sex = 'F'
-- AND id_cur LIKE '%CP5%'
AND id_cur = 'CP5'
;

-- Qui a obtenu la meilleure note (MAX) en CP4 chez
-- les garçons ?
SELECT s.fname, MAX(score) AS meilleure_note -- exécutée en 5ème
FROM follow f JOIN students s ON f.id_stud = s.id_stud -- exécutée en 1er
WHERE sex = 'M' AND id_cur = 'CP4' -- exécutée en 2ème
GROUP BY s.fname -- exécutée en 3ème
HAVING MAX(score) > 19 -- exécutée en 4ème
-- HAVING meilleure_note > 19 -- exécutée en 4ème / PROPRE A MYSQL
ORDER BY meilleure_note DESC -- exécutée en 6ème
LIMIT 3
;
-- Qui des filles ou des garçons ont la meilleure
-- moyenne générale (AVG) ?
SELECT s.sex, AVG(f.score) AS moyenne
FROM students s JOIN follow f ON s.id_stud = f.id_stud
GROUP BY s.sex
;

-- Moyenne des notes par génération
SELECT TRUNCATE(YEAR(s.dob), -1) AS decennie, AVG(f.score) AS moyenne
FROM students s JOIN follow f ON s.id_stud = f.id_stud
GROUP BY TRUNCATE(YEAR(s.dob), -1) 
;

-- Quel formateur/trice a le meilleur rendement : 
-- meilleure moyenne (AVG) sur les notes obtenues par 
-- leurs élèves ?
SELECT t.fname, AVG(f.score) AS moyenne
FROM  courses c JOIN follow f ON c.id_cur = f.id_cur
				JOIN teachers t ON t.id_teach = c.id_teach
GROUP BY t.fname
ORDER BY moyenne DESC LIMIT 1
;