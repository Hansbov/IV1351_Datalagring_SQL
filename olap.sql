
/*number of instruments rented per month for specified year*/
SELECT EXTRACT(MONTH FROM start_date) AS month, COUNT(*) AS total_rentals
FROM rental
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date);

/*rented instruments of each type sorted by number of rentals*/
SELECT EXTRACT(MONTH FROM start_date) AS month, type_of_instrument as instrument, Count(type_of_instrument) as amount_rented
FROM rental as r INNER JOIN instrument_to_rent as i ON r.instrument_id=i.id
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date), type_of_instrument
ORDER BY EXTRACT(MONTH FROM start_date), amount_rented DEC;


/*Average number of rentals each month of a specified year*/
SELECT AVG(a.total_rentals) AS average_rental_per_month
(SELECT EXTRACT(MONTH FROM start_date) AS month, COUNT(*) AS total_rentals
FROM rental
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date)) AS a;


/*Number of lessons given per month of a specified year*/
SELECT EXTRACT(MONTH FROM date) AS month, COUNT(*) AS lessons_given
FROM appointment
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date);


/*Number of lessons of each type per month of a specified year*/
SELECT 
EXTRACT(MONTH FROM date) AS month, 
COUNT(group_lesson_id) AS group_lessons_given, 
COUNT(ensable_id) as ensable_lessons_given,
COUNT(i.appointment_id) as individual_lessons_given,
COUNT(aud.appointment_id) as auditions_given
FROM appointment as ap LEFT JOIN individual_lesson as i ON ap.id =i.appointment_id LEFT JOIN audition as aud ON ap.id=aud.appointment_id
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date);


/*average number of lessons per month for whole year*/
SELECT AVG(a.lessons_given) AS avg_lessons_per_month
FROM(
SELECT EXTRACT(MONTH FROM date) AS month, COUNT(id) AS lessons_given
FROM appointment
WHERE EXTRACT(YEAR FROM date) = '2020'
GROUP BY EXTRACT(MONTH FROM date)) as a;

/*List all instructors who has given more than a specific number of lessons during the current month*/
SELECT i.employment_id as instructor, Count(a.id) as number_of_lessons
FROM instructor as i
INNER JOIN instructor_appointment as ia 
    ON i.id = ia.instructor_id
INNER JOIN appointment as a
    ON ia.appointment_id = a.id
HAVING number_of_lessons > 3
WHERE EXTRACT(YEAR FROM a.date) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP), EXTRACT(MONTH FROM a.date) = EXTRACT(MONTH FROM CURRENT_TIMESTAMP)
GROUP BY instructor
ORDER BY number_of_lessons DEC;



/*List three instructors having given most lessons during last month, sorted by number of lessons*/
SELECT i.employment_id as instructor, Count(a.id) as number_of_lessons
FROM instructor as i
INNER JOIN instructor_appointment as ia 
    ON i.id = ia.instructor_id
INNER JOIN appointment as a
    ON ia.appointment_id = a.id
WHERE EXTRACT(YEAR FROM a.date) = EXTRACT(YEAR FROM CURRENT_TIMESTAMP), EXTRACT(MONTH FROM a.date) = (EXTRACT(MONTH FROM CURRENT_TIMESTAMP)-1)
GROUP BY instructor
ORDER BY number_of_lessons DEC
LIMIT 3;
/*higher grade*/

/*
List all ensembles held during the next week, sorted by music genre and weekday. 
For each ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.
*/


/*
List the three instruments with the lowest monthly rental fee. 
For each instrument tell whether it is rented or available to rent. 
Also tell when the next group lesson for each listed instrument is scheduled.
*/