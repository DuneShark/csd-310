/*
    Title: outdoors.sql
    Author: Group 2
            Ryan Church, Darius Dinkins, Taylor Donlea, Tanner Glaser
    Date: 8 July 2023
    Description: Outdoors Database initialization script.
*/

-- drop database if exists
DROP DATABASE outdoors;

CREATE DATABASE outdoors;

-- drop outdoors user if exists 
DROP USER IF EXISTS 'outdoors_user'@'localhost';


-- create outdoors and grant them all privileges to the outdoors database 
CREATE USER 'outdoors_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'nature';

-- grant all privileges to the outdoors database to user outdoors_user on localhost 
GRANT ALL PRIVILEGES ON outdoors.* TO 'outdoors_user'@'localhost';

use outdoors;

-- drop tables if they are present
DROP TABLE IF EXISTS guides;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS trips;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS equipment;
DROP TABLE IF EXISTS rentals;


-- create the studio table 
CREATE TABLE guides (
    guide_id     INT             NOT NULL        AUTO_INCREMENT,
    firstName   VARCHAR(75)     NOT NULL,
    lastName   VARCHAR(75)     NOT NULL,
    PRIMARY KEY(guide_id)
); 

-- insert guides records
INSERT INTO guides(firstName,lastName) VALUES('John','MacNell');
INSERT INTO guides(firstName,lastName) VALUES('D.B.','Marland');

-- Create the clients table
CREATE TABLE clients (
    client_id     INT             NOT NULL        AUTO_INCREMENT,
    firstName   VARCHAR(75)     NOT NULL,
    lastName   VARCHAR(75)     NOT NULL,
    email  VARCHAR(75) NOT NULL,     
    PRIMARY KEY(client_id)
); 

-- insert client records
INSERT INTO clients(firstName,lastName,email) VALUES ('Fallon','Hutchinson','FHutchinson@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Korbin','Miller','KMiller@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Isabella','Thomas','IThomas@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Logan','Butler','LButler@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Athena','Pacheco','APacheco@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Erik','Freeman','EFreeman@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Norah','Evans','NEvans@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Elias','Pace','EPace@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Giana','Chavez','GChavez@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Ian','Young','IYoung@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Zoey','Nixon','ZNixon@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Cory','Kline','CKline@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Sevyn','Gonzalez','SGonzalez@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Ethan','Dyer','EDyer@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Estrella','Hood','EHood@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Brixton','Bernard','BBernard@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Barbara','Hanson','BHanson@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Khalil','Curry','KCurry@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Alison','Wallace','AWallace@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Chase','Dorsey','CDorsey@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Addyson','Keller','AKeller@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Nico','Ibarra','NIbarra@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Madilynn','Galindo','MGalindo@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Salvatore','Taylor','STaylor@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Sofia','Franklin','SFranklin@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Simon','Portillo','SPortillo@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Nathalie','Soto','NSoto@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Barrett','Barajas','BBarajas@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Keilani','Salgado','KSalgado@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Trace','Turner','TTurner@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Brooklyn','Cox','BCox@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Connor','Hendricks','CHendricks@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Dani','McClain','DMcClain@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Mitchell','Moran','MMoran@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Celeste','Brewer','CBrewer@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Cruz','Sawyer','CSawyer@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Marina','Wilson','MWilson@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Daniel','Boone','DBoone@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Mariam','Huff','MHuff@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Finnley','Davidson','FDavidson@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Jayla','Horne','JHorne@gmail.com');
INSERT INTO clients(firstName,lastName,email) VALUES ('Zev','Marsh','ZMarsh@gmail.com');


-- create the locations table 
CREATE TABLE locations (
     location_id   INT             NOT NULL        AUTO_INCREMENT,
     location_name  VARCHAR(75)     NOT NULL,
     requiresVisa   BOOLEAN, 
 	 requiresImmunization BOOLEAN,
 	 PRIMARY KEY(location_id)
);

INSERT INTO locations(location_name,requiresVisa,requiresImmunization) VALUES ('Africa',true,true);
INSERT INTO locations(location_name,requiresVisa,requiresImmunization) VALUES ('Asia',true,true);
INSERT INTO locations(location_name,requiresVisa,requiresImmunization) VALUES ('Southern Europe',true,false);


-- create the trips table 
CREATE TABLE trips (
     trip_id   INT             NOT NULL        AUTO_INCREMENT,
     location_id  INT     NOT NULL,
     guide_id   INT      NOT NULL, 
     startdate   DATETIME      NOT NULL, 
     enddate   DATETIME      NOT NULL, 
 	 
 	 PRIMARY KEY(trip_id),

     CONSTRAINT fk_location
     FOREIGN KEY(location_id)
     REFERENCES locations(location_id),

    CONSTRAINT fk_guide
     FOREIGN KEY(guide_id)
     REFERENCES guides(guide_id)
);
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (1,1,'2022-10-01','2022-10-14');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (1,1,'2023-05-01','2023-05-14');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (1,1,'2023-10-01','2023-10-14');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (2,2,'2022-10-01','2022-10-08');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (2,2,'2023-01-01','2023-01-08');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (2,2,'2023-09-01','2023-09-08');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (2,2,'2023-10-01','2023-10-08');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (3,1,'2022-10-20','2022-10-27');
INSERT INTO trips(location_id,guide_ID,startdate,enddate) VALUES (3,2,'2023-09-20','2023-10-27');


-- create the bookings table 
CREATE TABLE bookings (
     booking_id   INT             NOT NULL        AUTO_INCREMENT,
     trip_id  INT     NOT NULL,
     client_id   INT      NOT NULL, 
     airfare   INT      NOT NULL,
     
 	 PRIMARY KEY(booking_id),

     CONSTRAINT fk_trip
     FOREIGN KEY(trip_id)
     REFERENCES trips(trip_id),

    CONSTRAINT fk_client
     FOREIGN KEY(client_id)
     REFERENCES clients(client_id)
);

INSERT INTO bookings(trip_id,client_id,airfare) VALUES (1,1,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (1,2,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (1,3,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (1,4,3000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (1,5,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (2,6,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (2,7,1200.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (2,8,1200.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (2,9,1200.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (2,10,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (3,11,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (3,12,3000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (3,13,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (3,14,3000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (4,15,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (4,16,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (4,17,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (4,18,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (5,19,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (5,20,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (5,21,3000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (5,22,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (5,23,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (6,24,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (6,25,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (6,26,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (6,27,4000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (6,28,2000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (7,29,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (7,30,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (7,31,4000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (7,32,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (8,33,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (8,34,1000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (9,35,4000.00);
INSERT INTO bookings(trip_id,client_id,airfare) VALUES (9,36,1000.00);

-- create the equipment table 
CREATE TABLE equipment (
     equipment_id   INT             NOT NULL        AUTO_INCREMENT,
     description  VARCHAR(75)     NOT NULL,
     inventoryDate   DATETIME      NOT NULL, 
     purchaseFlag   BOOLEAN,
     purchaseDate DATETIME,
     
 	 PRIMARY KEY(equipment_id)

);

INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Two person tent #1','2019-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Two person tent #2','2019-01-01',true,'2020-01-13');                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Two person tent #3','2019-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Four person tent #1','2019-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Four person tent #2','2019-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Eight person tent #1','2019-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Light Sleeping Bag #1','2020-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Light Sleeping Bag #2','2020-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Medium Sleeping Bag #1','2020-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Medium Sleeping Bag #2','2020-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Medium Sleeping Bag #3','2020-01-01',true,'2022-06-13');                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Hiking pole #1','2021-01-01',false,NULL);                                       
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Hiking Pole #2','2021-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('10X50 Binoculars #1','2016-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('10X50 Binoculars #2','2016-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Camping Stove #1','2017-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Camping Stove #2','2017-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Propane Lantern #1','2018-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Propane Lantern #2','2018-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('LED Lantern #1','2019-01-01',true,'2023-01-15');                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('LED Lantern #2','2023-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Flashlight #1','2023-01-01',false,NULL);                     
INSERT INTO equipment(description,inventoryDate,purchaseFlag,purchaseDAte) 
VALUES ('Flashlight #2','2023-01-01',false,NULL);                     


-- create the rentals table 
CREATE TABLE rentals (
     rental_id   INT             NOT NULL        AUTO_INCREMENT,
     equipment_id int     NOT NULL,
     rentalStart   DATETIME      NOT NULL, 
     rentalEnd   DATETIME      NOT NULL, 
     client_Id int NOT NULL,
     
 	 PRIMARY KEY(rental_id),

     CONSTRAINT fk_equip
     FOREIGN KEY(equipment_id)
     REFERENCES equipment(equipment_id),

     CONSTRAINT fk_client2
     FOREIGN KEY(client_id)
     REFERENCES clients(client_id)

);

INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(1,'2023-01-01','2023-01-31',1);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(3,'2023-02-01','2023-02-28',5);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(4,'2023-03-01','2023-03-31',9);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(5,'2023-04-01','2023-04-30',12);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(6,'2023-05-01','2023-05-31',13);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(7,'2023-06-01','2023-06-30',16);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(8,'2023-07-01','2023-07-31',16);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(9,'2023-08-01','2023-08-31',19);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(11,'2023-07-01','2023-07-31',20);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(12,'2023-06-01','2023-06-30',23);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(13,'2023-05-01','2023-05-31',25);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(14,'2023-04-01','2023-04-30',28);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(15,'2023-03-01','2023-03-28',30);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(16,'2023-02-01','2023-02-28',32);
INSERT INTO rentals(equipment_id,rentalStart,rentalEnd,client_id) VALUES(17,'2023-01-01','2023-01-17',41);



