INSERT INTO address(id, street, zip_code, city)
VALUES 
(1, 'skovägen 1', 10000, 'stockholm'),
(2, 'banangatan 5', 14562, 'stockholm'),
(3, 'göraklartvägen 1', 31151, 'stockholm'),
(4, 'postgatan 4', 12345, 'stockholm'),
(5, 'muppgatan 2', 12345, 'stockholm'),
(6, 'frostgatan 4', 12345, 'stockholm'),
(7, 'spruttgatan 6', 12345, 'stockholm'),
(8, 'galjonsgatan 4', 12345, 'stockholm'),
(9, 'godahoppsgatan 8', 12345, 'stockholm'),
(10, 'balkonggatan 4', 12345, 'stockholm');

INSERT INTO person (id, person_number, first_name, last_name, address_id)
VALUES
(1, 199912125557, 'Kalle', 'Karlsson',3),
(2, 194411121322, 'Solvei', 'Andersson',2),
(3, 199501040514, 'Adam','Andersson',3),
(4, 199601050561, 'Berit', 'Bengtsson',4),
(5, 199701060567, 'Cilla', 'Cillen',5),
(6, 197001070551, 'Dogge', 'Dasholme',6),
(7, 196501080557, 'Eskil', 'Erlandsson',7),
(8, 197001090567, 'Fina', 'Fasaner',8),
(9, 199001100560, 'Gullan', 'Gast',9),
(10, 197301110503, 'Helmer', 'Handfaste',10);


INSERT INTO sibling (person_id_older, person_id_younger)
VALUES (1, 3);

INSERT INTO student (person_id, student_tag)
VALUES (1, 'KAKA'), (3, 'ADAN'), (5,'CICI'), (6,'DODA'), (8,'FIFA'), (9, 'GUGA'), (10,'HEHA');


INSERT INTO salary_scheme(id, salary_id, basic_lesson_wage, beginner_addition, intermediet_addition, advanced_addition, speical_day_addition)
VALUES 
(1, 'OLDTIMER', 500, 0, 0, 250, 200),
(2, 'SENIOR', 600, 200, 300, 400, 200),
(3, 'JUNIOR', 400, 0, 150, 150, 200);


INSERT INTO instructor (person_id, employment_id, salary_scheme_id)
VALUES
(2, 'SolveiA', 1),
(4, 'BeritB', 2),
(7, 'EskilE', 2),
(9, 'GullanG', 3);


INSERT INTO appointment (id, appointment_id, date, start_time, end_time)
VALUES (1, 'some appointment', '2020-12-11', '08:00', '09:00');

INSERT INTO instrument (id, type_of_instrument)
VALUES 
(1, 'guitar'), 
(2, 'piano'), 
(3, 'violin'), 
(4, 'trumpet'), 
(5, 'cello');


/* Gör student_id till NOT NULL i rental */

INSERT INTO rental (id , start_date, end_date, student_id)
VALUES 
(1,'2020-08-15', '2020-12-15',1),
(2,'2020-10-15', '2020-11-15',3),
(3,'2020-08-15', '2020-12-15',6),
(4,'2020-08-15', '2020-12-15',3);

INSERT INTO instrument_to_rent (id, instrument_id, type_of_instrument, brand, fee, rental_id)
VALUES 
(1,'trumpet22', 'trumpet', 'conn', 250, 1),
(2,'trumpet21', 'trumpet', 'conn', 250, 2),
(3,'violin_master', 'violin', 'stradivarius', 10500, NULL),
(4,'violin_beginner1', 'violin', 'grasshopper', 100, 3),
(5,'violin_beginner2', 'violin', 'grasshopper', 100, NULL),
(6,'guitar1', 'guitar', 'plingplong', 300, 4),
(7,'guitar3', 'guitar', 'plong', 250, NULL),
(8,'guitar2', 'guitar', 'pling', 250, NULL);


