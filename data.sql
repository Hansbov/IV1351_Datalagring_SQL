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
VALUES (1, 'KAKA'), (3, 'ADAN'), (5,'CICI'), (6,'DODA'), (7,'ESEL'),(8,'FIFA'), (9, 'GUGA'), (10,'HEHA');

INSERT INTO pricing_scheme (id, pricing_tag, basic_lesson_price, beginner_addition, intermediet_addition, advanced_addition, group_addition, sibling_discount_percentage)
VALUES 
(0, 'gratis', 0,0,0,0,0,0),
(1,'string_and_bow', 700, 0, 150, 300, -500,-0.20 ),
(2,'other’', 700, 0, 150, 250, -500,-0.1 ),
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

INSERT INTO salary_scheme(id, salary_tag, basic_lesson_wage, beginner_addition, intermediet_addition, advanced_addition, speical_day_addition)
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
(12, 'viola');

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

INSERT INTO ensemble (id, ensable_name, genre, skill_level, min_students, max_students, last_day_to_apply, is_canceled, instructor_id)
VALUES
(1, 'big_band_fall_2020', 'jazz', 'beginner', 8, 16, '2020-08-15', false, 4),
(2, 'big_band_spring_2020', 'jazz', 'intermediate', 8, 16, '2020-12-15', false, 4),
(3, 'string_quartet_2021', 'classic', 'beginner', 4, 8, '2020-12-15', true, NULL);

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

INSERT INTO group_lesson (id, group_name, skill_level, min_students, max_students, last_day_to_apply, is_canceled, instrument_id, instructor_id)
VALUES
(1, 'guitar_intro_dec2020', 'beginner', 4, 6, '2020-01-15', false,1, 7),
(2, 'guitar_spring_2021', 'intermediate', 4, 6, '2020-12-15', false, 1,7),
(3, 'violin_fall_2020', 'beginner', 4, 6, '2020-08-15', true, 3,2),
(4, 'violin_spring_2021', 'beginner', 4, 6, '2020-12-15', false,3, 2),
(5, 'trumpet_fall_2020', 'beginner', 4, 6, '2020-08-15', true,4, 4),
(6, 'trumpet_spring_2021', 'beginner', 4, 6, '2020-12-15', false,4, 4);



/*pricing scheme borde vara NOT NULL*/ 

/*OBS OBS vid beräkning av lön: notera att lärare bokar upp tänkbara enskilda lektioner i förväg, så att enskilda lektioner utan student kopplad är inte genomförda och ska alltså inte ge läraren betalt!.*/

/* OBS 2: det blir betydligt enklare att beräkna priser och löner om skill_level ligger i appointments i stället för i de olika typerna av lektioner */

INSERT INTO appointment (id, appointment_tag, date, start_time, end_time, pricing_scheme_id, ensemble_id, group_lesson_id, address_id, room_number)
VALUES 
/*auditions*/
(1, 'defaultaudition', '2020-12-11', '08:00', '09:00', 0, null, null, null, 'M111'),
(2, 'defaultaudition', '2020-12-12', '08:00', '09:000', 0, null, null, null, 'M111'),
(3, 'defaultaudition', '2020-12-11', '08:00', '09:00', 0, null, null, null, 'M112'),
/*big_band*/
(4, 'big_band', '2020-09-02', '16:00','17:00',3,1, null,null,  'M114'),
(5, 'big_band', '2020-09-09', '16:00','17:00',3,1, null,null,  'M114'),
(6, 'big_band', '2020-09-16', '16:00','17:00',3,1, null,null,  'M114'),
(7, 'big_band', '2020-09-23', '16:00','17:00',3,1, null,null,  'M114'),
(8, 'big_band', '2020-09-30', '16:00','17:00',3,1, null,null,  'M114'),
(9, 'big_band', '2020-10-07', '16:00','17:00',3,1, null,null,  'M114'),
(10, 'big_band', '2020-10-14', '16:00','17:00',3,1, null,null,  'M114'),
(11, 'big_band', '2020-10-21', '16:00','17:00',3,1, null,null,  'M114'),
(12, 'big_band', '2020-10-28', '16:00','17:00',3,1, null,null,  'M114'),
(13, 'big_band', '2020-11-04', '16:00','17:00',3,1, null,null,  'M114'),
(14, 'big_band', '2020-11-11', '16:00','17:00',3,1, null,null,  'M114'),
(15, 'big_band', '2020-11-18', '16:00','17:00',3,1, null,null,  'M114'),
(16, 'big_band', '2020-11-25', '16:00','17:00',3,1, null,null,  'M114'),
(17, 'big_band', '2020-12-02', '16:00','17:00',3,1, null,null,  'M114'),
(18, 'big_band', '2020-12-09', '16:00','17:00',3,1, null,null,  'M114'),
(19, 'big_band', '2020-12-16', '16:00','17:00',3,1, null,null,  'M114'),
/* vid årsskiftet börjar nytt ensemble_id*/
(20, 'big_band', '2021-01-13', '16:00','17:00',3,2, null,null,  'M114'),
(21, 'big_band', '2021-01-20', '16:00','17:00',3,2, null,null,  'M114'),
(22, 'big_band', '2021-01-27', '16:00','17:00',3,2, null,null,  'M114'),
/*fiollektioner*/
(30,'enskild_fiol', '2020-12-01','10:00','10:45',1,null, null, null, 'M211'),
(31,'enskild_fiol', '2020-12-08','10:00','10:45',1,null, null, null, 'M211'),
(32,'enskild_fiol','2020-12-15','10:00','10:45',1,null, null, null, 'M211'),
(33,'enskild_fiol', '2021-01-12','10:00','10:45',1,null, null, null, 'M211'),
(34,'enskild_fiol', '2021-01-19','10:00','10:45',1,null, null, null, 'M211'),
(35,'enskild_fiol', '2021-01-26','10:00','10:45',1,null, null, null, 'M211'),
/*gitarrlektioner*/
(40,'enskild_gitarr','2020-12-01','11:00','11:45',1,null, null, null, 'M213'),
(41,'enskild_gitarr', '2020-12-08','11:00','11:45',1,null, null, null, 'M213'),
(42,'enskild_gitarr', '2020-12-15','11:00','11:45',1,null, null, null, 'M213'),
(43,'enskild_gitarr', '2021-01-12','11:00','11:45',1,null, null, null, 'M213'),
(44,'enskild_gitarr', '2021-01-19','11:00','11:45',1,null, null, null, 'M213'),
(45,'enskild_gitarr', '2021-01-26','11:00','11:45',1,null, null, null, 'M213'),

/*grupplektioner*/
(50,'gitarr_grupp', '2020-12-01','13:00','13:45',2,null, 1, null, 'M112'),
(51,'gitarr_grupp', '2020-12-08','13:00','13:45',2,null, 1, null, 'M112'),
(52,'gitarr_grupp', '2020-12-15','13:00','13:45',2,null, 1, null, 'M112'),
/* vid årsskiftet börjar nytt group_lesson_id*/
(53,'gitarr_grupp', '2021-01-12','13:00','13:45',2,null, 2, null, 'M112'),
(54,'gitarr_grupp', '2021-01-19','13:00','13:45',2,null, 2, null, 'M112'),
(55,'gitarr_grupp', '2021-01-26','13:00','13:45',2,null, 2, null, 'M112'),

/*tänker nedan att skolan testar om det går att få studenter till nya grupper m fiol o trumpet under vårterminen - därför ligger bara ett appointment i systemet ännu*/
(60,'fiol_grupp', '2021-01-19','14:00','14:45',2,null, 4, null,'M112'),
(70,'trumpet_grupp', '2021-01-19','15:00','15:45',2,null, 6, null, 'M112');

INSERT INTO instructor_appointment (appointment_id, instructor_id)
VALUES
/*auditions*/
(1,2), (2,4), (3,2),
/*big_band*/
(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4), (16,4), (17,4),(18,4),(19,4),(20,4),(21,4),(22,4),
/*fiollektioner*/
(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),
/*gitarrlektioner*/ /*obs appointment 41 o 45 är  inte bokad av student*/
(40,7),(41,7),(42,7),(43,7),(44,7),(45,7),
/*grupplektioner*/
/*gitarr*/
(50, 7), (51, 7), (52, 7), (53, 7), (54, 7), (55, 7), 
/*fiol*/
(60, 2), 
/*trumpet*/
(70, 4); 

INSERT INTO student_appointment (appointment_id, student_id)
VALUES
/*auditions*/
(1, 1), (2, 3), (3, 5),

/*big_band*/
(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1), (16,1), (17,1),(18,1),(19,1),(20,1),(21,1),(22,1),
(4,3),(5,3),(6,3),(7,3),(8,3),(9,3),(10,3),(11,3),(12,3),(13,3),(14,3),(15,3), (16,3), (17,3),(18,3),(19,3),(20,3),(21,3),(22,3),
(4,5),(5,5),(6,5),(7,5),(8,5),(9,5),(10,5),(11,5),(12,5),(13,5),(14,5),(15,5), (16,5), (17,5),(18,5),(19,5),(20,5),(21,5),(22,5),
(4,6),(5,6),(6,6),(7,6),(8,6),(9,6),(10,6),(11,6),(12,6),(13,6),(14,6),(15,6), (16,6), (17,6),(18,6),(19,6),(20,6),(21,6),(22,6),
(4,7),(5,7),(6,7),(7,7),(8,7),(9,7),(10,7),(11,7),(12,7),(13,7),(14,7),(15,7), (16,7), (17,7),(18,7),(19,7),(20,7),(21,7),(22,7),
(4,8),(5,8),(6,8),(7,8),(8,8),(9,8),(10,8),(11,8),(12,8),(13,8),(14,8),(15,8), (16,8), (17,8),(18,8),(19,8),(20,8),(21,8),(22,8),
 (4,9),(5,9),(6,9),(7,9),(8,9),(9,9),(10,9),(11,9),(12,9),(13,9),(14,9),(15,9), (16,9), (17,9),(18,9),(19,9),(20,9),(21,9),(22,9),
(4,10),(5,10),(6,10),(7,10),(8,10),(9,10),(10,10),(11,10),(12,10),(13,10),(14,10),(15,10), (16,10), (17,10),(18,10),(19,10),(20,10),(21,10),(22,10),

/*fiollektioner*/
(30,1),(31,5),(32,5),(33,1),(34,5),(35,5),

/*gitarrlektioner*/ 
/*obs appointment 41 o 45 är inte bokade av student*/
(40,3),(41,3),(42,8),(43,3),(44,8),

/*grupplektioner*/
/*gitarrgrupp*/
(50, 3), (51, 3), (52, 3), (53, 3), (54, 3), (55, 3), 
(50, 8), (51, 8), (52, 8), (53, 8), (54, 8), (55, 8), 
(50, 9), (51, 9), (52, 9), (53, 9), (54, 9), (55, 9), 
(50, 10), (51, 10), (52, 10), (53, 10), (54, 10), (55, 10), 
/*fiolgrupp*/
(60, 1), 
(60, 3), 
(60, 5), 
(60, 6), 
/*trumpetgrupp*/ 
(70, 8),
(70, 9),
(70, 10);


INSERT INTO audition (appointment_id, is_passed, instrument_id)
VALUES
(1,true,3),(2,false,4),(3,true,3);

INSERT INTO individual_lesson (appointment_id, skill_level,instrument_id)
VALUES
/*fiollektioner intermediate*/
(30,'intermediate',3),(31,'intermediate',3),(32,'intermediate',3),(33,'intermediate',3),(34,'intermediate',3),(35,'intermediate',3),
/*gitarrlektioner beginner*/
(40,'beginner',3),(41,'beginner',3),(42,'beginner',3),(43,'beginner',3),(44,'beginner',3),(45,'beginner',3);

/*
Observera denna uppgift:

List the three instruments with the lowest monthly rental fee. For each instrument tell whether it is rented or available to rent. Also tell when the next group lesson for each listed instrument is scheduled.
Den innebär att instrument_to_rent borde vara kopplad till instrument. Vanskligt annars att söka på om textsträngar är lika
*/

INSERT INTO instrument_to_rent (id, instrument_tag, type_of_instrument, brand, fee, is_available)
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
/*trumpeter*/
(1,'2020-08-15', '2020-12-15',1, 1),
(2,'2020-10-15', '2020-11-15',3, 2),
/*gitarr*/
(4,'2020-08-15', '2020-12-15',3, 6),
/*fioler*/
(3,'2020-08-15', '2020-12-15',6, 4),
(5,'2020-08-15', '2020-12-15',1, 5),
(6,'2020-12-15', '2021-01-15',6, 3),
(7,'2022-01-15', '2021-06-15',6, 5);

