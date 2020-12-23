INSERT INTO address(id, street, zip_code, city)
VALUES 
(1, 'musikskolevägen 1', 10000, 'stockholm'),
(2, 'banangatan 5', 14562, 'stockholm'),
(3, 'göraklartvägen 1', 31151, 'stockholm'),
(4, 'postgatan 4', 12345, 'stockholm'),
(5, 'muppgatan 2', 12345, 'stockholm'),
(6, 'frostgatan 4', 12345, 'stockholm'),
(7, 'spruttgatan 6', 12345, 'stockholm'),
(8, 'galjonsgatan 4', 12345, 'stockholm'),
(9, 'godahoppsgatan 8', 12345, 'stockholm'),
(10, 'balkonggatan 4', 12345, 'stockholm');

INSERT INTO room(room_number,address_id)
VALUES
('M114',1),
('M111',1),
('M112',1),
('M113',1),
('M211',1),
('M212',1),
('M213',1),
('M214',1),
('B100',2),
('B200',2);

INSERT INTO person (id, person_number, first_name, last_name, address_id)
VALUES
(1, 199912125557, 'Kalle', 'Karlsson',3),
(2, 194411121322, 'Solvei', 'Andersson',2),
(3, 199501040514, 'Adam','Andersson',3),
(4, 199601050561, 'Berit', 'Bravur',4),
(5, 199701060567, 'Cilla', 'Cillen',5),
(6, 197001070551, 'Dogge', 'Dasholme',6),
(7, 196501080557, 'Eskil', 'Erlandsson',7),
(8, 197001090567, 'Fina', 'Fasaner',8),
(9, 201001100560, 'Gullan', 'Gast',9),
(10, 197301110503, 'Helmer', 'Handfaste',10);

INSERT INTO phone_number (phone_number, person_id)
VALUES ('070-11100415',1),
('070-11200425',2),
('070-11300435',3),
('070-11400445',3),
('070-11500455',4),
('070-11600465',5),
('070-11700475',6),
('070-11800485',7),
('070-11900495',8),
('070-12000405',9),
('070-12100300',10);

INSERT INTO email_address (email_address, person_id)
VALUES ('charles@hotmail.com',1),
('strumpan123@telia.com',2),
('thefirstman@earth.com',3),
('bravobravur@stage.uk',4),
('cillen_inte_sillen@falstevat.se',5),
('muskelminne@mac.com',6),
('ministern@landet.se',7),
('fina_fasaner@hotmail.com',8),
('gullbritt_gast@telia.com',9),
('lejonet@lianesto.com',10);



INSERT INTO sibling (person_id_older, person_id_younger)
VALUES (1, 3);

INSERT INTO parent_child (person_id_child, person_id_parent)
VALUES(8, 4);

INSERT INTO student (person_id, student_tag)
VALUES (1, 'KAKA'), (3, 'ADAN'), (5,'CICI'), (6,'DODA'), (8,'FIFA'), (9, 'GUGA'), (10,'HEHA');

INSERT INTO pricing_scheme (id, pricing_id, basic_lesson_price, beginner_addition, intermediet_addition, advanced_addition, group_addition, sibling_discount_percentage)
VALUES 
(0, 'gratis', 0,0,0,0,0,0),
(1,'string_instruments', 700, 0, 150, 300, -500,-0.20 ),
(2,'other', 700, 0, 150, 250, -500,-0.1 ),
(3,'large_ensemble',125, 0, 0, 0, 0, 0 );

INSERT INTO extra_charge_day (date, pricing_scheme_id, charge)
VALUES ('2020-12-24', 1, 1000),
('2021-12-24', 1, 2000),
('2022-12-24', 1, 3000),
('2020-12-24', 2, 750),
('2021-12-24', 2, 760),
('2022-12-24', 2, 770),
('2020-12-24', 3, 100),
('2021-12-24', 3, 100),
('2022-12-24', 3, 100);


INSERT INTO salary_scheme(id, salary_id, basic_lesson_wage, beginner_addition, intermediet_addition, advanced_addition, speical_day_addition)
VALUES 
(1, 'OLDTIMER', 515, 0, 0, 250, 200),
(2, 'SENIOR', 615, 0, 150, 250, 200),
(3, 'JUNIOR', 430, 0, 150, 150, 200);


INSERT INTO instructor (person_id, employment_id, salary_scheme_id)
VALUES
(2, 'SolveiA', 1),
(4, 'BeritB', 2),
(7, 'EskilE', 2),
(9, 'GullanG', 3);




INSERT INTO instrument (id, type_of_instrument)
VALUES 
(1, 'guitar'), 
(2, 'piano'), 
(3, 'violin'), 
(4, 'trumpet'), 
(5, 'cello'),
(6, 'string_quartet'),
(7, 'big_band'),
(8, 'trombone'),
(9, 'alto_saxophone'),
(10, 'tenor_saxophone'),
(11, 'drums'),
(12, 'viola')
;

INSERT INTO instructor_instrument (instrument_id, instructor_id)
VALUES
(3,2),
(6,2),
(4,4),
(7,4),
(2,7),
(1,7),
(5,9),
(6,9);

/* felstavningar i attributen nedan*/
/* genre med flera attribut borde definieras som enum precis som beginner, intermediate etc*/

/* Borde inte ensemble_id i  tabellen ensemble döpas om till type_of_ensemble? */

INSERT INTO ensemble (id, ensable_id, genre, skill_level, min_students, max_students, last_day_to_apply, is_canceled, instructor_id)
VALUES
(1, 'big_band_spring_2021', 'jazz', 'intermediate', 8, 16, '2020-12-15', false, 4),
(2, 'string_quartet_2021', 'classic', 'beginner', 4, 8, '2020-12-15', false, NULL);

/* fortsätt med ensemble_instrument */

INSERT INTO ensemble_instrument (ensemble_id, instrument_id, places_available, places_filled)
/*storband*/
VALUES
(1,4,4,0), /*trumpet */
(1,8,4,0), /*trombon */
(1,9,3,0), /*altsax */
(1,10,3,0), /*tenorsax */
(1,11,2,0), /*trummor */
/*stråkkvartett*/
(1,3,4,0), /*fiol */
(1,12,2,0), /*altfiol */
(1,5,2,0); /*cello */

/*auditions*/

/*pricing scheme borde vara NOT NULL*/ 

INSERT INTO appointment (id, appointment_tag, date, start_time, end_time, pricing_scheme_id, ensemble_id, group_lesson_id, address_id, room_number)
VALUES (1, 'defaultaudition', '2020-01-11', '08:00', '09:00', 0, null, null, null, 'M111'),
(2, 'defaultaudition', '2020-01-12', '08:00', '09:000', 0, null, null, null, 'M111'),
(3, 'defaultaudition', '2020-02-11', '08:00', '09:00', 0, null, null, null, 'M111'),
(4, 'big_band', '2020-01-15', '16:00','17:00',3,1, null,null,  'M114'),
(5, 'big_band', '2020-02-15', '16:00','17:00',3,1, null,null,  'M114'),
(6, 'big_band', '2020-03-15', '16:00','17:00',3,1, null,null,  'M114'),
(7, 'big_band', '2020-04-15', '16:00','17:00',3,1, null,null,  'M114'),
(8, 'big_band', '2020-05-15', '16:00','17:00',3,1, null,null,  'M114');

INSERT INTO student_appointment (appointment_id, student_id)
VALUES
(1, 1),
(2, 3),
(3, 5);

INSERT INTO instructor_appointment (appointment_id, instructor_id)
VALUES
(1,2),
(2,4),
(3,2);

INSERT INTO audition (appointment_id, is_passed, instrument_id)
VALUES
(1,true,3),
(2,false,4),
(3,true,3);

INSERT INTO instrument_to_rent (id, instrument_id, type_of_instrument, brand, fee, is_available)
VALUES 
(1,'trumpet22', 'trumpet', 'conn', 250, True),
(2,'trumpet21', 'trumpet', 'conn', 250, True),
(3,'violin_master', 'violin', 'stradivarius', 10500, False),
(4,'violin_beginner1', 'violin', 'grasshopper', 100, True),
(5,'violin_beginner2', 'violin', 'grasshopper', 100, True),
(6,'guitar1', 'guitar', 'plingplong', 300, True),
(7,'guitar3', 'guitar', 'plong', 250, True),
(8,'guitar2', 'guitar', 'pling', 250, True);

INSERT INTO rental (id , start_date, end_date, student_id, instrument_id)
VALUES 
(1,'2020-08-15', '2020-12-15',1, 1),
(2,'2020-10-15', '2020-11-15',3, 2),
(3,'2020-08-15', '2020-12-15',6, 4),
(4,'2020-08-15', '2020-12-15',3, 6),
(5,'2020-08-15', '2020-12-15',1, 5),
(6,'2020-12-15', '2021-01-15',6, 3),
(7,'2022-01-15', '2021-06-15',6, 5);
