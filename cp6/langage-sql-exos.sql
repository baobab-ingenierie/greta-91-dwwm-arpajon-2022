-- TP 2-1 et 2-2 : projections
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