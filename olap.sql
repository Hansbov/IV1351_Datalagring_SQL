
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
ORDER BY EXTRACT(MONTH FROM start_date), amount_rented;


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

/*Number of lessons of each type per month of a specified year/*



/*average number of lessons per month for whole year*/

/*List all instructors who has given more than a specific number of lessons during the current month/*

/*List three instructors having given most lessons during last month, sorted by number of lessons/*

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