
/*number of instruments rented per month for specified year*/
SELECT EXTRACT(MONTH FROM start_date) AS month, COUNT(*) AS total_rentals
FROM rental
WHERE EXTRACT(YEAR FROM start_date) = '2020'
GROUP BY EXTRACT(MONTH FROM start_date);

/*
SELECT COUNT(*) WHERE EXTRACT(YEAR FROM r.start_date) = '2019' as "total rentals", 
EXTRACT(MONTH FROM r.start_date) as "rental month"
FROM rental as r 
GROUP BY EXTRACT(MONTH FROM start_date)
ORDER BY EXTRACT(MONTH FROM start_date);


KANSKE??
SELECT COUNT(*) WHERE EXTRACT(YEAR FROM T1.start_date) = '2019' as "total rentals", 
EXTRACT(MONTH FROM T1.start_date) as "rental month"
FROM rental AS T1
INNER JOIN 

SELECT 
COUNT(type_of_instrument) WHERE type_of_instrument="guitar" as "guitars rented",
COUNT(type_of_instrument) WHERE type_of_instrument="cello" as "cellos rented",
COUNT(type_of_instrument) WHERE type_of_instrument="trumpet" as "trumpets rented",
COUNT(type_of_instrument) WHERE type_of_instrument="flute" as "flutes rented"
FROM instrument_to_rent AS T2 ON T1.id = T2.rental_id


GROUP BY EXTRACT(MONTH FROM T1.start_date);
////

SELECT ( 
    SELECT COUNT(*)
        FROM rental r
        WHERE EXTRACT(YEAR FROM r.start_date) = '2019'
        GROUP BY EXTRACT(MONTH FROM r.start_date)) as "Total rentals",
        (SELECT COUNT(i.)
        FROM instrument_to_rent as i
        ) 
)

SELECT FROM rental AS all
WHERE EXTRACT(YEAR FROM start_date) = '2019'
COUNT(all) AS total
GROUP BY EXTRACT(MONTH FROM start_date)
SELECT FROM instrument_to_rent AS i
WHERE i.rental_id = all.id*/

/*rented instruments of each type sorted by number of rentals*/
SELECT 
COUNT(type_of_instrument) WHERE type_of_instrument="guitar" as "guitars rented",
COUNT(type_of_instrument) WHERE type_of_instrument="cello" as "cellos rented",
COUNT(type_of_instrument) WHERE type_of_instrument="trumpet" as "trumpets rented",
COUNT(type_of_instrument) WHERE type_of_instrument="flute" as "flutes rented"
WHERE EXTRACT(YEAR FROM start_date) = '2019'
FROM
(SELECT id, start_date FROM rental WHERE EXTRACT(YEAR FROM start_date) = '2019') t1
INNER JOIN instrument_to_rent t2 ON 
t1.id = t2.rental_id
GROUP BY EXTRACT(MONTH FROM start_date)




/*Average number of rentals each month of a specified year*/


/*Number of lessons given per month of a specified year*/