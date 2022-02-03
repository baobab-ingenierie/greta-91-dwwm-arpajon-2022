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