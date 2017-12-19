CREATE DATABASE quickstartdb;

CREATE TABLE `banks` (
  `bank_id` int(11) NOT NULL AUTO_INCREMENT,
  `bank_name` varchar(64) DEFAULT NULL,
  `total_customers` int(11) DEFAULT NULL,
  `headquarters` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`bank_name`)
)AUTO_INCREMENT=1;

INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (1,'JP Morgan Chase',0, 'New York, NY');
INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (2,'Bank Of America',0, 'Charlotte, NC');
INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (3,'Wells Fargo',0, 'San Francisco, CA');
INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (4,'Citigroup',0, 'New York, NY');
INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (5,'Goldman Sachs',0, 'New York, NY');
INSERT INTO `banks` (`id`,`bank_name`,`total_customers`) VALUES (6,'Morgan Stanley',0, 'New York, NY');

CREATE TABLE `customers` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(64) DEFAULT NULL,
  `l_name` varchar(64) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `age` int(11) default NULL,
  `debit_card` int(16) default NULL,
  `credit_card` int(16) default NULL,
  `fam_id` int(11) DEFAULT 0,
  PRIMARY KEY (`cust_id`)
)AUTO_INCREMENT=1;

INSERT INTO `customers` (`cust_id`,`f_name`,`l_name`,`bank_id`,`age`,`debit_card`,`credit_card`,`fam_id`)
VALUES (1,'Drew','Thomas',3,21,1234567891234567,0987654321123456,3);

INSERT INTO `customers` (`cust_id`,`f_name`,`l_name`,`bank_id`,`age`,`debit_card`,`credit_card`,`fam_id`)
VALUES (2,'Edgar','Delgado',5,21,1235567891234567,0987614321126456,1);

INSERT INTO `customers` (`cust_id`,`f_name`,`l_name`,`bank_id`,`age`,`debit_card`,`credit_card`,`fam_id`)
VALUES (3,'Mama','Thomas',3,51,1924567891234567,0987655221129456,3);

INSERT INTO `customers` (`cust_id`,`f_name`,`l_name`,`bank_id`,`age`,`debit_card`,`credit_card`,`fam_id`)
VALUES (4,'Papa','Delgado',5,21,1235707891234567,0987614220126456,1);


CREATE TABLE `debit_system`(
	`cust_id` int(11) DEFAULT NULL,
	`bank_id` int(11) DEFAULT NULL,
    `debit_card` int(16) DEFAULT NULL,
    `valid_date` date DEFAULT NULL, -- YYYY-MM-DD
    `sec_num` int(4) DEFAULT NULL,
    `pin_num` int(4) DEFAULT NULL,
    `amount` REAL DEFAULT 0,
    PRIMARY KEY (`debit_card`,`sec_num`)
);
INSERT INTO `debit_system` (`cust_id`,`bank_id`,`debit_card`,`valid_date`,`sec_num`,`pin_num`,`amount`) 
VALUES (1,3,1234567891234567, 2022-11-11,0123,4567,0);

INSERT INTO `debit_system` (`cust_id`,`bank_id`,`debit_card`,`valid_date`,`sec_num`,`pin_num`,`amount`) 
VALUES (2,1,1235567891234567, 2022-11-11,1234,1234,0);

INSERT INTO `debit_system` (`cust_id`,`bank_id`,`debit_card`,`valid_date`,`sec_num`,`pin_num`,`amount`) 
VALUES (3,3,1924567891234567, 2022-11-11,2345,4321,0);

INSERT INTO `debit_system` (`cust_id`,`bank_id`,`debit_card`,`valid_date`,`sec_num`,`pin_num`,`amount`) 
VALUES (3,3,1924567891234567, 2022-11-11,3456,1214,0);

INSERT INTO `debit_system` (`cust_id`,`bank_id`,`debit_card`,`valid_date`,`sec_num`,`pin_num`,`amount`) 
VALUES (4,1,1235707891234567, 2022-11-11,4567,1092,0);

CREATE TABLE `credit_system`(
	`cust_id` int(11) DEFAULT NULL,
	`bank_id` int(11) DEFAULT NULL,
    `credit_card` int(16) DEFAULT NULL,
    `valid_date` date DEFAULT NULL, -- YYYY-MM-DD
    `sec_num` int(4) DEFAULT NULL,
    `pin_num` int(4) DEFAULT NULL,
    `cap` REAL DEFAULT 10000.00,
    `owed` REAL DEFAULT 0,
    PRIMARY KEY (`credit_card`,`sec_num`)
);

INSERT INTO `credit_card` (`cust_id`,`bank_id`,`credit_card`,`valid_date`,`sec_num`,`pin_num`,`cap`,`owed`) 
VALUES (1,3,0987654321123456, 2022-11-11,1234,4567,10000.00,0);

INSERT INTO `credit_card` (`cust_id`,`bank_id`,`credit_card`,`valid_date`,`sec_num`,`pin_num`,`cap`,`owed`) 
VALUES (2,1,0987614321126456, 2022-11-11,0123,1234,10000.00,0);

INSERT INTO `credit_card` (`cust_id`,`bank_id`,`credit_card`,`valid_date`,`sec_num`,`pin_num`,`cap`,`owed`) 
VALUES (3,3,1924567891234567, 2022-11-11,9012,4321,10000.00,0);

INSERT INTO `credit_card` (`cust_id`,`bank_id`,`credit_card`,`valid_date`,`sec_num`,`pin_num`,`cap`,`owed`) 
VALUES (4,3,0987655221129456, 2022-11-11,8901,1214,10000.00,0);


CREATE TABLE `ATM`(
	`event_id` int(11) NOT NULL AUTO_INCREMENT,
	`location` varchar(64) DEFAULT NULL,
    `action` varchar(64) DEFAULT NULL,
	`amount` REAL DEFAULT NULL,
	`debit_card` int(16) DEFAULT NULL,
    `pin_num` int(4) DEFAULT NULL,
    primary key (`event_id`)
)AUTO_INCREMENT=1;

CREATE TABLE `family`(
	`l_name`varchar(64) DEFAULT NULL,
    `fam_id` int(11) NOT NULL AUTO_INCREMENT,
    `cust_id` int(11) DEFAULT NULL,
    `bank_id` int(11) DEFAULT NULL,
    `fam_count` int(3) DEFAULT 1
);

CREATE TABLE `transactions`(
	`sender_card` int(16) DEFAULT NULL,
    `receiver_card` int(16) DEFAULT NULL,
    `amount_sent` REAL DEFAULT 0,
    `time` TIMESTAMP DEFAULT NULL -- '1970-01-01 00:00:00' UTC
);


