--DROP TABLE Customer;
--DROP TABLE Holiday_Package;
--DROP TABLE Relation_one;
--DROP TABLE Relation_two;
--DROP TABLE Flight;
--DROP TABLE Hotel;
--DROP TABLE Purchased;
--DROP TABLE Subscription;

Create Table Customer(
  first_name varchar(20),
  last_name varchar(20),
  cust_id integer PRIMARY KEY,
  cust_addr varchar(30)
);

Create Table Holiday_Package(
  package_id integer PRIMARY KEY,
  total number(6) check (total > 0 and total < 100000),
  s_date date,
  e_date date,
  hotel_id integer,
  flight_id integer,
  cust_id integer,
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

Create Table Flight(
  city_a varchar(30),
  city_b varchar(30),
  f_code integer PRIMARY KEY,
  airline varchar(20),
  dep_time TIMESTAMP,
  arr_time TIMESTAMP
);

Create Table Hotel(
  hotel_id integer PRIMARY KEY,
  city varchar(30),
  cat integer not null check(cat >= 1 and cat <= 5),
  h_name varchar(50)
);

CREATE TABLE Purchased(
  pur_id integer PRIMARY KEY,
  package_book varchar(30),
  payment_done varchar(10),
  cust_id integer,
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

Create Table Relation_one(
  num_of_seats integer,
  price_per_flight number(5),
  f_code integer,
  package_id integer,
  cust_id integer,
  FOREIGN KEY (f_code) REFERENCES Flight(f_code),
  FOREIGN KEY (package_id) REFERENCES Holiday_Package(package_id),
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

Create Table Relation_two(
  hotel_id integer,
  price_per_night number(5),
  night_num integer,
  cust_id integer,
  package_id integer,
  FOREIGN KEY (hotel_id) REFERENCES Hotel(hotel_id),
  FOREIGN KEY (package_id) REFERENCES Holiday_Package(package_id),
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

create table Subscription(
  sub_type char(1) not null check(sub_type = 'p' or sub_type = 's'),
  cust_id integer,
  FOREIGN KEY (cust_id) REFERENCES Customer(cust_id)
);

--insert data into the tables.
INSERT INTO CUSTOMER VALUES('John','Doe',01,'123 Fake Street');
INSERT INTO CUSTOMER VALUES('Pat','Rabbit',02,'123 dublin');
INSERT INTO CUSTOMER VALUES('Sarah','murdach',03,'123 south wood');
INSERT INTO CUSTOMER VALUES('Jack','Black',04,'123 kevin st');
INSERT INTO CUSTOMER VALUES('Paddy','keogh',05,'123 middle of no where');
INSERT INTO CUSTOMER VALUES('Jane','Egan',06,'1234 kevin st lower');

INSERT INTO Hotel VALUES(21,'New York',4,'Crown Plaza');
INSERT INTO Hotel VALUES(12,'Los Angeles',3,'Best LA Hotel');
INSERT INTO Hotel VALUES(42,'Toronto',3,'Hilton');
INSERT INTO Hotel VALUES(4,'Berlin',3,'Court Hotel');
INSERT INTO Hotel VALUES(6,'Dublin',2,'West Inn');
INSERT INTO Hotel VALUES(24,'London',5,'The bullet');

INSERT INTO Subscription VALUES('p',01);
INSERT INTO Subscription VALUES('s',02);
INSERT INTO Subscription VALUES('p',03);
INSERT INTO Subscription VALUES('s',04);
INSERT INTO Subscription VALUES('s',05);
INSERT INTO Subscription VALUES('p',06);

INSERT INTO Holiday_Package VALUES(06,3200,'16-oct-2014','19-oct-2014', 21, 1, 01);
INSERT INTO Holiday_Package VALUES(01,2100,'10-sep-2014','19-sep-2014', 12, 2, 02);
INSERT INTO Holiday_Package VALUES(02,3700,'11-oct-2014','16-oct-2014', 42, 3, 03);
INSERT INTO Holiday_Package VALUES(05,240,'14-aug-2014','19-aug-2014', 4, 4, 04);
INSERT INTO Holiday_Package VALUES(04,3210,'10-oct-2014','19-oct-2014', 6, 5, 05);
INSERT INTO Holiday_Package VALUES(03,3200,'11-jun-2014','19-jun-2014', 24, 6, 06);

INSERT INTO Flight VALUES('Dublin','New York', 01, 'Airlingus', '12:30:00', '20:00:00');
INSERT INTO Flight VALUES('Dublin','Los Angeles', 02, 'Vergin Atlantic', '10:35:00', '23:50:00');
INSERT INTO Flight VALUES('Dublin','Toronto', 03, 'SwisAir', '13:00:00', '20:00:00');
INSERT INTO Flight VALUES('Dublin','Berlin', 04, 'British Airways', '12:30:00', '16:00:00');
INSERT INTO Flight VALUES('Belfast','Dublin', 05, 'Ryan Air', '20:00:00', '20:30:00');
INSERT INTO Flight VALUES('Dublin','London', 06, 'Ryan Air', '12:30:00', '13:30:00');

                   --pur_id,package_book, payment_done,cust_id 
INSERT INTO Purchased VALUES(01,'Trip to New York','Done', 01);
INSERT INTO Purchased VALUES(02,'Trip to LA','Done', 02);
INSERT INTO Purchased VALUES(03,'Trip to Toronto','Done', 03);
INSERT INTO Purchased VALUES(04,'Trip to Berlin','Not Done', 04);
INSERT INTO Purchased VALUES(05,'Trip to Dublin','Done', 05);
INSERT INTO Purchased VALUES(06,'Trip to London','Not Done', 06);

INSERT INTO Relation_one VALUES(200,610,01,06,01);
INSERT INTO Relation_one VALUES(150,810,02,01,02);
INSERT INTO Relation_one VALUES(159,310,03,02,03);
INSERT INTO Relation_one VALUES(401,600,04,05,04);
INSERT INTO Relation_one VALUES(102,110,05,04,05);
INSERT INTO Relation_one VALUES(190,191,06,03,06);

INSERT INTO Relation_two VALUES(21,300,7,01,06);
INSERT INTO Relation_two VALUES(12,350,9,02,01);
INSERT INTO Relation_two VALUES(42,299,3,03,02);
INSERT INTO Relation_two VALUES(4,109,10,04,05);
INSERT INTO Relation_two VALUES(6,159,14,05,04);
INSERT INTO Relation_two VALUES(24,210,2,06,03);

--write the query for part 4.
select * from hotel join 
Relation_two on hotel.CAT = 3 and hotel.HOTEL_ID = Relation_two.HOTEL_ID WHERE Relation_two.CUST_ID = 03;
 --join relation_two on cat = 3 and hotel_id = hotel.id where relation_two.cust_id = 03;
 