USE arpajon
;

-- Suppression de toutes les lignes dans STUDENTS avant ajout
DELETE 
FROM arpajon.students
WHERE id_stud > 0 -- pour passer le mode safe
;

-- Ajout de lignes dans la table STUDENTS
-- Méthode SQL standard
INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(1, 'Waya', '2000-05-26', 'F', '06 12 54 89 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(2, 'Christine', '2000-11-02', 'F', '06 12 54 09 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(3, 'Abdoul', '1989-07-12', 'M', '07 12 54 89 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(4, 'Adil', '1998-02-01', 'M', '07 22 54 89 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(5, 'Arnaud', '1994-07-12', 'M', '07 55 61 45 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(6, 'Fabrice', '1991-08-22', 'M', '01 12 33 89 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(7, 'Gaël', '1990-01-06', 'M', '06 78 54 89 21')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(8, 'Gore', '1980-07-12', 'M', '06 55 54 11 71')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(9, 'Emmanuel', '1996-03-04', 'M', '06 11 22 33 44')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(10, 'Peter', '1983-08-16', 'M', '06 05 05 81 79')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(11, 'Quentin', '1995-04-15', 'M', '07 80 91 52 46')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(12, 'Philippe', '1991-06-07', 'M', '06 64 54 89 00')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(13, 'Zackaria', '1998-09-25', 'M', '06 21 00 89 79')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(14, 'Kamel', '2002-10-06', 'M', '07 11 54 22 99')
;

INSERT INTO arpajon.students(id_stud, fname, dob, sex, tel)
VALUES(15, 'Xavier', '1993-12-10', 'M', '06 00 00 00 00')
;

-- Check de l'ajout des lignes
SELECT *
FROM arpajon.students
;

-- Ajout de lignes dans la table TEACHERS
-- Méthode MySQL/MariaDB
INSERT INTO arpajon.teachers(id_teach, fname, grade, dos) 
VALUES 
	(1, 'Nadjet', null, '2020-09-15'),
   	(2, 'Martin', null, '2021-10-20'),
	(3, 'Saman', null, '2021-03-11'),
	(4, 'Lesly', 4, '1994-04-05')
;

-- Check de l'ajout des lignes
SELECT *
FROM arpajon.teachers
;