
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
ORDER BY amount_rented;




/*Average number of rentals each month of a specified year*/


/*Number of lessons given per month of a specified year*/