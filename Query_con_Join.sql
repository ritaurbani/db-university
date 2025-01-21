-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT *
FROM `students`
join `degrees`
on `students`.`degree_id`= `degrees`.`id`
where `degrees`.`name` = "Corso di Laurea in Economia"

--2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
SELECT *
FROM `departments`
JOIN `degrees`
ON `departments`.`id`=`degrees`.`department_id`
WHERE `degrees`.`level` = "magistrale"
AND `departments`.`name`= "Dipartimento di Neuroscienze"

--3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT *
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id`=`course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
WHERE `teachers`.`id`= 44

--4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
--relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`name`,`students`.`surname`,`degrees`.`name` as `degree`,`departments`.`name` as `department`
FROM `students`
JOIN `degrees`
ON `students`.`degree_id`=`degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id`=`departments`.`id`
order by `students`.`name`, `students`.`surname`

--5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name`as`degree`,`courses`.`name` as `course`, `teachers`.`name` as `teacher_name`, `teachers`.`surname` as `teacher_Last_Name`
FROM `degrees`
JOIN `courses`
ON `degrees`.`id`=`courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id`= `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`=`teachers`.`id`

--6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`id`, `teachers`.`name` as `teacher_name`, `teachers`.`surname` as `teacher_Last_Name`, `departments`.`name` as `department_name`
FROM `departments`
JOIN `degrees` 
ON `departments`.`id`=`degrees`.`department_id`
JOIN `courses` 
ON `degrees`.`id`= `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id`= `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id`=`teachers`.`id`
WHERE `departments`.`id`= 5
order by `teachers`.`id`

--7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
--superare ciascuno dei suoi esami
SELECT `students`.`name`, COUNT(`exams`.`id`)
FROM `students`
INNER JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams`
ON `exams`.`id` = `exam_student`.`exam_id`
JOIN courses
ON exams.course_id = courses.id
GROUP BY `students`.`id`, courses.id
ORDER BY `students`.`name`

