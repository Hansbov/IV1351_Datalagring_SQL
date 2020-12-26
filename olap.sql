
/*number of instruments rented per month for specified year*/
CREATE VIEW rentals_per_month AS
SELECT EXTRACT(MONTH FROM start_date) AS month, COUNT(*) AS total_rentals
FROM rental
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date);

/*rented instruments of each type sorted by number of rentals*/
CREATE VIEW inst_type_per_month
SELECT EXTRACT(MONTH FROM start_date) AS month, type_of_instrument as instrument, Count(type_of_instrument) as amount_rented
FROM rental as r INNER JOIN instrument_to_rent as i ON r.instrument_id=i.id
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date), type_of_instrument
ORDER BY EXTRACT(MONTH FROM start_date), amount_rented DESC;


/*Average number of rentals each month of a specified year*/
CREATE VIEW average_rentals_per_month AS
SELECT AVG(a.total_rentals) AS average_rental_per_month
(SELECT EXTRACT(MONTH FROM start_date) AS month, COUNT(*) AS total_rentals
FROM rental
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date)) AS a;


/*Number of lessons given per month of a specified year*/
CREATE VIEW lessons_per_month AS
SELECT EXTRACT(MONTH FROM date) AS month, COUNT(*) AS lessons_given
FROM appointment
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date);


/*Number of lessons of each type per month of a specified year*/
CREATE VIEW type_per_month AS
SELECT 
EXTRACT(MONTH FROM date) AS month, 
COUNT(ap.group_lesson_id) AS group_lessons_given, 
COUNT(ap.ensemble_id) as ensable_lessons_given,
COUNT(i.appointment_id) as individual_lessons_given,
COUNT(aud.appointment_id) as auditions_given
FROM appointment as ap LEFT JOIN individual_lesson as i ON ap.id =i.appointment_id LEFT JOIN audition as aud ON ap.id=aud.appointment_id
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date)
ORDER BY EXTRACT(MONTH FROM date);


/*average number of lessons per month for whole year*/
CREATE VIEW average_per_month AS
SELECT AVG(a.lessons_given) AS avg_lessons_per_month
FROM(
SELECT EXTRACT(MONTH FROM date) AS month, COUNT(id) AS lessons_given
FROM appointment
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date)) as a;

/*List all instructors who has given more than a specific number of lessons during the current month*/
CREATE VIEW lesson_amount_warning AS
SELECT i.employment_id as instructor, Count(a.id) as number_of_lessons
FROM instructor as i
INNER JOIN instructor_appointment as ia 
    ON i.person_id = ia.instructor_id
INNER JOIN appointment as a
    ON ia.appointment_id = a.id
WHERE EXTRACT(YEAR FROM a.date) = EXTRACT(YEAR FROM CURRENT_DATE) AND EXTRACT(MONTH FROM a.date) = EXTRACT(MONTH FROM CURRENT_DATE)
GROUP BY instructor
HAVING  Count(a.id) > 0 AND EXTRACT(DAY FROM a.date) <= EXTRACT(DAY FROM CURRENT_DATE)
ORDER BY number_of_lessons DESC;



/*List three instructors having given most lessons during last month, sorted by number of lessons*/
CREATE VIEW most_worked_instructors AS
SELECT i.employment_id as instructor, Count(a.id) as number_of_lessons
FROM instructor as i
INNER JOIN instructor_appointment as ia 
    ON i.person_id = ia.instructor_id
INNER JOIN appointment as a
    ON ia.appointment_id = a.id
WHERE (EXTRACT(YEAR FROM a.date) = EXTRACT(YEAR FROM CURRENT_DATE) AND EXTRACT(MONTH FROM a.date) = (EXTRACT(MONTH FROM CURRENT_DATE)-1))
    OR (EXTRACT(YEAR FROM a.date) = (EXTRACT(YEAR FROM CURRENT_DATE)-1) AND EXTRACT(MONTH FROM a.date) = '12')
GROUP BY instructor
ORDER BY number_of_lessons DESC
LIMIT 3;


/*
List all ensembles held during the next week, sorted by music genre and weekday. 
For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.
*/
CREATE MATERIALIZED VIEW next_week_ensables AS
SELECT e.genre as genre, a.date as appointment_date, 
(CASE 
    WHEN COUNT(student_id) = e.max_students THEN 'all seats filled'
    WHEN COUNT(student_id) <= e.max_students-2 THEN '3 or more seats left'
    ELSE 'less than 3 seats left' END) as booking_status
FROM ensemble as e
INNER JOIN appointment as a
    ON e.id = a.ensemble_id
INNER JOIN student_appointment as sa
    ON a.id = sa.appointment_id
WHERE (EXTRACT(YEAR FROM a.date) = EXTRACT(YEAR FROM CURRENT_DATE) AND EXTRACT(WEEK FROM a.date) = (EXTRACT(WEEK FROM CURRENT_DATE)+1)) 
    OR (EXTRACT(YEAR FROM a.date) = (EXTRACT(YEAR FROM CURRENT_DATE)+1) AND EXTRACT(WEEK FROM a.date) = 1)
GROUP BY e.genre, a.date, e.max_students;

/*test for above*/
SELECT e.genre as genre, a.date as appointment_date, 
(CASE 
    WHEN COUNT(student_id) = e.max_students THEN 'all seats filled'
    WHEN COUNT(student_id) <= e.max_students-2 THEN '3 or more seats left'
    ELSE 'less than 3 seats left' END) as booking_status
FROM ensemble as e
INNER JOIN appointment as a
    ON e.id = a.ensemble_id
INNER JOIN student_appointment as sa
    ON a.id = sa.appointment_id
WHERE EXTRACT(YEAR FROM a.date) = 2021 AND EXTRACT(WEEK FROM a.date) = 2
GROUP BY e.genre, a.date, e.max_students;

/*
List the three instruments with the lowest monthly rental fee. 
For each instrument tell whether it is rented or available to rent. 
Also tell when the next group lesson for each listed instrument is scheduled.
*/
CREATE MATERIALIZED VIEW lowest_rental_fee AS
SELECT i.instrument_tag as instrument, i.fee as fee, i.is_available as available_to_rent,
(CASE 
WHEN a.date >= CURRENT_DATE THEN a.date
ELSE NULL END) as next_group_lesson
FROM instrument_to_rent as i
INNER JOIN instrument as inst
    ON inst.type_of_instrument = i.type_of_instrument
INNER JOIN group_lesson as gr 
    ON inst.id = gr.instrument_id
INNER JOIN appointment as a 
    ON gr.id = a.group_lesson_id
GROUP BY instrument, fee, available_to_rent, next_group_lesson
ORDER BY fee
LIMIT 3;