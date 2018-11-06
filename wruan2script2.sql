﻿-- Inserts values into products
USE wruan2assign2db;
LOAD DATA INFILE 'loaddatafall2018.txt' INTO TABLE product FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n';
INSERT INTO product VALUES ('66', 'Elbow Pads', 14.25, 120);
INSERT INTO product VALUES ('67', 'Skateboard', 40.00, 100);
-- Displays data
SELECT * FROM product;

-- Inserts values into agents
INSERT INTO agent VALUES ('99', 'Hugh', 'Grant', 'Springfield', 16);
INSERT INTO agent VALUES ('22', 'Courtney', 'Cox', 'New York', 25);
INSERT INTO agent VALUES ('66', 'Rosie', 'ODonnell', 'Ottawa', 100);
INSERT INTO agent VALUES ('33', 'David', 'Letterman', 'Bedrock', 100);
INSERT INTO agent VALUES ('11', 'Regis', 'Philbin', 'Boston', 33);
INSERT INTO agent VALUES ('12', 'Rosie', 'Cox', 'Ottawa', 50);
INSERT INTO agent VALUES ('44', 'William', 'Ruan', 'Toronto', 54);
-- Displays data
SELECT * FROM agent;

-- Inserts values into customers
INSERT INTO customer VALUES ('21', 'Homer', 'Simpson', 'Springfield', '686-8956');
INSERT INTO customer VALUES ('31', 'Sideshow', 'Bob', 'Springfield', '686-5555');
INSERT INTO customer VALUES ('12', 'Monty', 'Burns', 'Springfield', '789-0000');
INSERT INTO customer VALUES ('15', 'Fred', 'Flintstone', 'Bedrock', '777-2345');
INSERT INTO customer VALUES ('13', 'Super', 'Man', 'Kypto', '888-1234');
INSERT INTO customer VALUES ('10', 'Barney', 'Rubble', 'Bedrock', '777-1234');
INSERT INTO customer VALUES ('14', 'Peter', 'Griffens', 'Providence', '987-4567');
-- Displays data
SELECT * FROM customer;

-- Inserts values into purchased
INSERT INTO purchased VALUES ('21', '99', 20);
INSERT INTO purchased VALUES ('21', '12', 14);
INSERT INTO purchased VALUES ('21', '66', 10);
INSERT INTO purchased VALUES ('31', '99', 1);
INSERT INTO purchased VALUES ('31', '12', 2);
INSERT INTO purchased VALUES ('31', '78', 4);
INSERT INTO purchased VALUES ('31', '66', 2);
INSERT INTO purchased VALUES ('15', '66', 2);
INSERT INTO purchased VALUES ('15', '78', 2);
INSERT INTO purchased VALUES ('14', '66', 19);
-- Displays data
SELECT * FROM purchased;

-- Inserts values into agent deals
INSERT INTO agentDeals VALUES ('99', '21');
INSERT INTO agentDeals VALUES ('99', '12');
INSERT INTO agentDeals VALUES ('99', '14');
INSERT INTO agentDeals VALUES ('33', '13');
INSERT INTO agentDeals VALUES ('11', '10');
INSERT INTO agentDeals VALUES ('11', '15');
INSERT INTO agentDeals VALUES ('66', '31');
-- Displays data
SELECT * FROM agentDeals;

-- Updates selected statements
UPDATE customer SET firstname = 'Wonder', lastname = 'Woman' WHERE firstname = 'Super' and lastname = 'Man';
UPDATE purchased P
	INNER JOIN customer AS C ON C.customerid = P.customerid 
    SET P.quantity = 5
	WHERE c.firstname = 'Sideshow' and c.lastname = 'Bob';
UPDATE customer C
	INNER JOIN agentDeals AS D ON C.customerid = D.customerid
	INNER JOIN agent AS A ON A.agentid = D.agentid
    SET C.city = 'Boston'
	WHERE A.firstname = 'Regis';

-- Shows all tables
SELECT * FROM product;
SELECT * FROM agent;
SELECT * FROM customer;
SELECT * FROM purchased;
SELECT * FROM agentDeals;
