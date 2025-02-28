-- Ali Ashrafzadeh Esfahani
-- Noralhoda Alayoub
-- Group 21


/*

-- SQL1.1
CREATE DATABASE trips;


-- SQL1.2
CREATE TABLE Users(
    username VARCHAR PRIMARY KEY,
    email VARCHAR UNIQUE,
    full_name VARCHAR
    );

-- NOTE:
-- user is a reserved keyword in PSQL so we used users instead. 
-- We also could have user inside double qoutation to make it work but then 
-- it would become case-sencitive so I decided to avoid it for posible issues in the future.


CREATE TYPE Location_type as (Latitude FLOAT, Longitude FLOAT);


CREATE TABLE Point_of_Interest(
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    location location_type UNIQUE NOT NULL,
    type_of_interest VARCHAR CHECK (Type_of_interest IN ('Museum', 'Hotel')),
    the_user VARCHAR,

        FOREIGN KEY (the_user) REFERENCES users(username) ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE Museum(
    id INTEGER PRIMARY KEY,
    Collection VARCHAR,

        FOREIGN KEY (id) REFERENCES point_of_Interest(id)
    );


CREATE TABLE Reservation(
    confirmation INTEGER PRIMARY KEY,
    "from" DATE,
    until DATE,
    id VARCHAR NOT NULL,
        
        FOREIGN KEY (id) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE Hotel(
    id INTEGER PRIMARY KEY,
        
        FOREIGN KEY (id) REFERENCES Point_of_interest(id)
    );


CREATE TABLE Room(
    hotel_id SERIAL NOT NULL,
    number INTEGER NOT NULL,
    size FLOAT NOT NULL,
    
        PRIMARY KEY (hotel_id, number),
        FOREIGN KEY (hotel_id) REFERENCES Hotel(id) ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE User_saves_POI(
    username VARCHAR NOT NULL,
    id SERIAL NOT NULL,

        PRIMARY KEY (username, id),
        FOREIGN KEY (username) REFERENCES Users(username) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (id) REFERENCES Point_of_interest(id) ON DELETE CASCADE ON UPDATE CASCADE
    );


CREATE TABLE Reserv_in_room(
    name_for_room VARCHAR,
    confirmation INTEGER NOT NULL,
    hotel_id SERIAL NOT NULL,
    room_number INTEGER NOT NULL,

        PRIMARY KEY (confirmation, hotel_id, room_number),
        FOREIGN KEY (confirmation) REFERENCES Reservation(confirmation) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY (hotel_id, room_number) REFERENCES Room(hotel_id, number) ON DELETE CASCADE ON UPDATE CASCADE 
    );


-- SQL1.3
ALTER TABLE Reservation
    ADD CONSTRAINT check_date CHECK (until > "from");


-- SQL1.4

-- USERS
INSERT INTO users VALUES (
    'pw-gamer', 'pw.gamer@gmail.com', 'Parham Wolf'
    );

INSERT INTO users VALUES (
    'wolf_047', 'w047streamer@gmail.com', 'Johan Henrikssen'
    );

INSERT INTO users VALUES (
    'AC3000', 'a.creed.3000@gmail.com', 'Alice Persson'
    ); 

INSERT INTO users VALUES (
    'ash1234', 'par_ash@gmail.com', 'Arash Eriksson'
    );

INSERT INTO users VALUES (
    'CR7_Lover', 'ronaldo_seven@gmail.com', 'Mikey Tobiasson'
    );

INSERT INTO users VALUES (
    'Messi10', '10.Messi@gmail.com', 'Tobbe Salehi'
    ); 


-- POINT_OF_INTEREST
INSERT INTO point_of_Interest VALUES (
    1, 'POI_First', ROW(12.4, 99.1), 'Hotel', 'pw-gamer'
    );

INSERT INTO point_of_Interest VALUES (
    2, 'POI_Second', ROW(57.1, 26.7), 'Museum', 'wolf_047'
    );

INSERT INTO point_of_Interest VALUES (
    3, 'POI_Third', ROW(13.2, 63.6), 'Hotel', 'AC3000'
    );

INSERT INTO point_of_Interest VALUES (
    4, 'POI_Fourth', ROW(17.6, 23.4), 'Museum', 'ash1234'
    );

INSERT INTO point_of_Interest VALUES (
    5, 'POI_Fifth', ROW(74.7, 33.4), 'Museum', 'CR7_Lover'
    );

INSERT INTO point_of_Interest VALUES (
    6, 'POI_Sixth', ROW(83.9, 54.1), 'Hotel', 'Messi10'
    );


-- USER_SAVES_POI
INSERT INTO user_saves_poi VALUES (
    'pw-gamer', 1
    );

INSERT INTO user_saves_poi VALUES (
    'wolf_047', 2
    );

INSERT INTO user_saves_poi VALUES (
    'AC3000', 3
    );

INSERT INTO user_saves_poi VALUES (
    'ash1234', 4
    );

INSERT INTO user_saves_poi VALUES (
    'CR7_Lover', 5
    );

INSERT INTO user_saves_poi VALUES (
    'Messi10', 6
    );


-- HOTEL
INSERT INTO hotel VALUES (1);
INSERT INTO hotel VALUES (3);
INSERT INTO hotel VALUES (6);


-- MUSEUM
INSERT INTO museum VALUES (
    2, 'Mona Lisa Painting'
    );

INSERT INTO museum VALUES (
    4, 'Cyrus Cylinder'
    );

INSERT INTO museum VALUES (
    5, 'CR7s Ballon Dor'
    );


-- RESERVATION
INSERT INTO reservation VALUES (
    1, '2025-04-19', '2025-04-23', 'pw-gamer'
    );

INSERT INTO reservation VALUES (
    3, '2022-07-11', '2022-07-19', 'AC3000'
    );

INSERT INTO reservation VALUES (
    6, '2024-11-23', '2024-11-28', 'Messi10'
    );


-- ROOM
INSERT INTO room VALUES (
    1, 1101, 12.5
    );

INSERT INTO room VALUES (
    3, 4012, 23.0
    );

INSERT INTO room VALUES (
    6, 7018, 55.5
    );


-- RESERV_IN_ROOM
INSERT INTO reserv_in_room VALUES (
    'Parham Wolf', 1, 1, 1101
    );

INSERT INTO reserv_in_room VALUES (
    'Alice Persson', 3, 3, 4012
    );

INSERT INTO reserv_in_room VALUES (
    'Tobbe Salehi', 6, 6, 7018
    );

*/