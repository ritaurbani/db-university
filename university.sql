-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT COUNT(*)
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990

-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT COUNT(*)
FROM `courses`
WHERE CFU > 10

-- 3. Selezionare tutti gli studenti che hanno più di 30 anni

SELECT *
FROM `students`
WHERE curdate() - `date_of_birth` > 30

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)

SELECT COUNT(*)
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1


-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)

SELECT COUNT(*)
FROM `exams`
WHERE `hour` > "14:00"
AND `date` = "2020-06-20"


-- 6 . Selezionare tutti i corsi di laurea magistrale (38)

SELECT COUNT(*)
FROM `degrees`
WHERE `name` LIKE "%Magistrale%"


-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT COUNT(*)
FROM `departments`

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT COUNT(*)
FROM `teachers`
WHERE `phone` IS NULL


                                                            -- GROUP BY --


-- 1. Contare quanti iscritti ci sono stati ogni anno


SELECT COUNT(*), enrolment_date
FROM `students`
group by enrolment_date
order by enrolment_date

-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio

SELECT `office_address`, count(*)
FROM `teachers`
group by `office_address`

-- 3. Calcolare la media dei voti di ogni appello d'esame

SELECT  `exam_id`, AVG(`vote`) as vote_avg
FROM `exam_student`
group by `exam_id`


-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento

SELECT  `department_id`, Count(`name`)
FROM `degrees`
group by `department_id`

///////////////////

