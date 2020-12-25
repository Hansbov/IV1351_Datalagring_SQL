

CREATE TABLE address(
 id INT NOT NULL,
 street VARCHAR(500),
 zip_code VARCHAR(500),
 city VARCHAR(500)
);

ALTER TABLE address ADD CONSTRAINT PK_address PRIMARY KEY (id);


CREATE TABLE instrument (
 id INT NOT NULL,
 type_of_instrument VARCHAR(500) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (id);


CREATE TABLE person (
 id INT NOT NULL,
 person_number VARCHAR(12) NOT NULL,
 first_name VARCHAR(500) NOT NULL,
 last_name VARCHAR(500) NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE phone_number (
 phone_number VARCHAR(500) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE phone_number ADD CONSTRAINT PK_phone_number PRIMARY KEY (phone_number,person_id);


CREATE TABLE room (
 room_number VARCHAR(500) NOT NULL,
 address_id INT NOT NULL
);

ALTER TABLE room ADD CONSTRAINT PK_room PRIMARY KEY (room_number);



CREATE TABLE pricing_scheme (
 id INT NOT NULL,
 pricing_tag VARCHAR(500) NOT NULL,
 basic_lesson_price NUMERIC(10) NOT NULL,
 beginner_addition NUMERIC(10) NOT NULL,
 intermediet_addition NUMERIC(10) NOT NULL,
 advanced_addition NUMERIC(10) NOT NULL,
 group_addition NUMERIC(10) NOT NULL,
 sibling_discount_percentage INT NOT NULL
);

ALTER TABLE pricing_scheme ADD CONSTRAINT PK_pricing_scheme PRIMARY KEY (id);


CREATE TABLE salary_scheme (
 id INT NOT NULL,
 salary_tag VARCHAR(500) NOT NULL,
 basic_lesson_wage NUMERIC(10) NOT NULL,
 beginner_addition NUMERIC(10) NOT NULL,
 intermediet_addition NUMERIC(10) NOT NULL,
 advanced_addition NUMERIC(10) NOT NULL,
 speical_day_addition NUMERIC(10) NOT NULL
);

ALTER TABLE salary_scheme ADD CONSTRAINT PK_salary_scheme PRIMARY KEY (id);


CREATE TABLE sibling (
 person_id_older INT NOT NULL,
 person_id_younger INT NOT NULL
);

ALTER TABLE sibling ADD CONSTRAINT PK_sibling PRIMARY KEY (person_id_older,person_id_younger);


CREATE TABLE student (
 person_id INT NOT NULL,
 student_tag VARCHAR(500)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (person_id);


CREATE TABLE email_address (
 email_address VARCHAR(500) NOT NULL,
 person_id INT NOT NULL
);

ALTER TABLE email_address ADD CONSTRAINT PK_email_address PRIMARY KEY (email_address,person_id);


CREATE TABLE extra_charge_day (
 date DATE NOT NULL,
 pricing_scheme_id INT NOT NULL,
 charge NUMERIC(10) NOT NULL
);

ALTER TABLE extra_charge_day ADD CONSTRAINT PK_extra_charge_day PRIMARY KEY (date,pricing_scheme_id);


CREATE TABLE instructor (
 person_id INT NOT NULL,
 employment_id VARCHAR(500),
 salary_scheme_id INT NOT NULL
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (person_id);


CREATE TABLE instructor_instrument (
 instrument_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument_id,instructor_id);


CREATE TABLE parent_child (
 person_id_child INT NOT NULL,
 person_id_parent INT NOT NULL
);

ALTER TABLE parent_child ADD CONSTRAINT PK_parent_child PRIMARY KEY (person_id_child,person_id_parent);


CREATE TABLE rental (
 id INT NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 student_id INT NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (id);

CREATE TYPE SKILL AS ENUM ('beginner','intermediate','advanced');

CREATE TABLE ensemble (
 id INT NOT NULL,
 ensable_name VARCHAR(500),
 genre VARCHAR(500),
 skill_level SKILL,
 min_students INT NOT NULL,
 max_students INT NOT NULL,
 last_day_to_apply DATE NOT NULL,
 is_canceled BOOLEAN DEFAULT False,
 Instructor_id INT
);

ALTER TABLE ensemble ADD CONSTRAINT PK_ensemble PRIMARY KEY (id);


CREATE TABLE ensemble_instrument (
 ensemble_id INT NOT NULL,
 instrument_id INT NOT NULL,
 places_available INT NOT NULL,
 places_filled INT DEFAULT 0 NOT NULL
);

ALTER TABLE ensemble_instrument ADD CONSTRAINT PK_ensemble_instrument PRIMARY KEY (ensemble_id,instrument_id);


CREATE TABLE group_lesson (
 id INT NOT NULL,
 group_name VARCHAR(500),
 skill_level SKILL NOT NULL,
 min_students INT NOT NULL,
 max_students INT,
 last_day_to_apply DATE,
 is_canceled BOOLEAN DEFAULT False,
 instrument_id INT NOT NULL,
 instructor_id INT
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (id);


CREATE TABLE instrument_to_rent (
 id INT NOT NULL,
 instrument_tag VARCHAR(500),
 type_of_instrument VARCHAR(500),
 brand VARCHAR(500),
 fee NUMERIC(10) NOT NULL,
 is_available BOOLEAN DEFAULT True NOT NULL
);

ALTER TABLE instrument_to_rent ADD CONSTRAINT PK_instrument_to_rent PRIMARY KEY (id);


CREATE TABLE appointment (
 id INT NOT NULL,
 appointment_tag VARCHAR(500),
 date DATE NOT NULL,
 start_time TIME(10) NOT NULL,
 end_time TIME(10) NOT NULL,
 pricing_scheme_id INT NOT NULL,
 ensemble_id INT,
 group_lesson_id INT,
 address_id INT,
 room_number VARCHAR(500)
);

ALTER TABLE appointment ADD CONSTRAINT PK_appointment PRIMARY KEY (id);


CREATE TABLE audition (
 appointment_id INT NOT NULL,
 is_passed BOOLEAN,
 instrument_id INT
);

ALTER TABLE audition ADD CONSTRAINT PK_audition PRIMARY KEY (appointment_id);


CREATE TABLE enrollment_request (
 id INT NOT NULL,
 skill_level SKILL NOT NULL,
 do_keep BOOLEAN NOT NULL,
 place_offered BOOLEAN,
 place_accepted BOOLEAN,
 person_id INT NOT NULL,
 ensemble_id INT,
 group_lesson_id INT,
 instrument_id INT
);

ALTER TABLE enrollment_request ADD CONSTRAINT PK_enrollment_request PRIMARY KEY (id);


CREATE TABLE individual_lesson (
 appointment_id INT NOT NULL,
 skill_level SKILL NOT NULL,
 instrument_id INT NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (appointment_id);


CREATE TABLE instructor_appointment (
 appointment_id INT NOT NULL,
 instructor_id INT NOT NULL
);

ALTER TABLE instructor_appointment ADD CONSTRAINT PK_instructor_appointment PRIMARY KEY (appointment_id,instructor_id);


CREATE TABLE student_appointment (
 appointment_id INT NOT NULL,
 student_id INT NOT NULL
);

ALTER TABLE student_appointment ADD CONSTRAINT PK_student_appointment PRIMARY KEY (appointment_id,student_id);


-- foreign keys

ALTER TABLE person ADD CONSTRAINT FK_address FOREIGN KEY (address_id) REFERENCES address (id);


ALTER TABLE phone_number ADD CONSTRAINT FK_person FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE room ADD CONSTRAINT FK_addr FOREIGN KEY (address_id) REFERENCES address(id);


ALTER TABLE sibling ADD CONSTRAINT FK_sibling_older FOREIGN KEY (person_id_older) REFERENCES person (id);
ALTER TABLE sibling ADD CONSTRAINT FK_sibling_younger FOREIGN KEY (person_id_younger) REFERENCES person (id);


ALTER TABLE student ADD CONSTRAINT FK_person FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE email_address ADD CONSTRAINT FK_person FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE extra_charge_day ADD CONSTRAINT FK_pricing_scheme FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id);


ALTER TABLE instructor ADD CONSTRAINT FK_person FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE instructor ADD CONSTRAINT FK_salary_scheme FOREIGN KEY (salary_scheme_id) REFERENCES salary_scheme (id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);


ALTER TABLE parent_child ADD CONSTRAINT FK_child FOREIGN KEY (person_id_child) REFERENCES person (id);
ALTER TABLE parent_child ADD CONSTRAINT FK_parent FOREIGN KEY (person_id_parent) REFERENCES person (id);


ALTER TABLE rental ADD CONSTRAINT FK_student FOREIGN KEY (student_id) REFERENCES student (person_id);


ALTER TABLE ensemble ADD CONSTRAINT FK_instructor FOREIGN KEY (Instructor_id) REFERENCES instructor (person_id);


ALTER TABLE ensemble_instrument ADD CONSTRAINT FK_ensemble FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);
ALTER TABLE ensemble_instrument ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);
ALTER TABLE group_lesson ADD CONSTRAINT FK_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);


ALTER TABLE rental ADD CONSTRAINT FK_instrument_to_rent FOREIGN KEY (instrument_id) REFERENCES instrument_to_rent (id);


ALTER TABLE appointment ADD CONSTRAINT FK_pricing_scheme FOREIGN KEY (pricing_scheme_id) REFERENCES pricing_scheme (id);
ALTER TABLE appointment ADD CONSTRAINT FK_room FOREIGN KEY (room_number) REFERENCES room (room_number);
ALTER TABLE appointment ADD CONSTRAINT FK_ensemble FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);
ALTER TABLE appointment ADD CONSTRAINT FK_group_lesson FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id);


ALTER TABLE audition ADD CONSTRAINT FK_appointment FOREIGN KEY (appointment_id) REFERENCES appointment (id);
ALTER TABLE audition ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE enrollment_request ADD CONSTRAINT FK_person FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE enrollment_request ADD CONSTRAINT FK_ensemble FOREIGN KEY (ensemble_id) REFERENCES ensemble (id);
ALTER TABLE enrollment_request ADD CONSTRAINT FK_group_lesson FOREIGN KEY (group_lesson_id) REFERENCES group_lesson (id);
ALTER TABLE enrollment_request ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_appointment FOREIGN KEY (appointment_id) REFERENCES appointment (id);
ALTER TABLE individual_lesson ADD CONSTRAINT FK_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (id);


ALTER TABLE instructor_appointment ADD CONSTRAINT FK_appointment FOREIGN KEY (appointment_id) REFERENCES appointment (id);
ALTER TABLE instructor_appointment ADD CONSTRAINT FK_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (person_id);


ALTER TABLE student_appointment ADD CONSTRAINT FK_appointment FOREIGN KEY (appointment_id) REFERENCES appointment (id);
ALTER TABLE student_appointment ADD CONSTRAINT FK_student FOREIGN KEY (student_id) REFERENCES student (person_id);


