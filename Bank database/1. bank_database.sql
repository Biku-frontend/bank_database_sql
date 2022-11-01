-- DATABASE --

CREATE DATABASE bank_database;

USE bank_database;



-- TABLE-1 --

 CREATE TABLE customer (

cus_id VARCHAR(6) NOT NULL,
first_name VARCHAR(30),
last_name VARCHAR(30),
city VARCHAR(20),
ph_no VARCHAR(10),
occupation VARCHAR(20),
dob DATE,
PRIMARY KEY (cus_id)
);

-- TABLE-2 --

CREATE TABLE branch (

bid VARCHAR(6) NOT NULL,
bname VARCHAR(30),
bcity VARCHAR(20),
PRIMARY KEY (bid)
);

-- TABLE-3 --

CREATE TABLE account (
acc_num VARCHAR(6),
cus_id VARCHAR(6) NOT NULL,
bid VARCHAR(6) NOT NULL,
opening_balance INT NOT NULL,
acc_opening_date DATE NOT NULL,
acc_type VARCHAR(10),
acc_status VARCHAR(10),
PRIMARY KEY (acc_num),
FOREIGN KEY (cus_id) REFERENCES customer(cus_id),
FOREIGN KEY (bid) REFERENCES branch(bid)
);


-- TABLE-4 --

CREATE TABLE transaction_details (

trans_num VARCHAR(6) NOT NULL,
acc_num VARCHAR(6),
date_of_trans DATE,
medium_of_trans VARCHAR(20),
trans_type VARCHAR (20),
trans_amount INT(7),
PRIMARY KEY (trans_num),
FOREIGN KEY (acc_num) REFERENCES account(acc_num)
);

-- TABLE-5 --

CREATE TABLE loan (
cus_id VARCHAR(6) NOT NULL,
bid VARCHAR(6) NOT NULL,
loan_amount INT (10),
PRIMARY KEY (cus_id,bid),
foreign key (cus_id) references customer (cus_id),
foreign key (bid) references branch (bid)
);



-- Inserting database records --

INSERT INTO customer 
(cus_id, 
first_name,
last_name,
city,
ph_no,
occupation,
dob)

VALUES
('C00001','Ramesh','Sharma','Kolkata','9543198345','Service','1976-12-06'),
('C00002','Avinash','Minha','Delhi','9876532109','Service','1974-10-16'),
('C00003','Rahul','Rastogi','Delhi','9765178901','Student','1981-09-26'),
('C00004','Parul','Gandhi','Delhi','9876532109','Housewife','1976-11-03'),
('C00005','Naveen','Aedekar','Mumbai','8976523190','Service','1976-09-19'),
('C00006','Chitresh','Barwe','Mumbai','7651298321','Student','1992-11-06'),
('C00007','Amit','Borkar','Mumbai','9875189761','Student','1981-09-06'),
('C00008','Nisha','Damle','Mumbai','7954198761','Service','1975-12-03'),
('C00009','Abhishek','Dutta','Kolkata','9856198761','Service','1973-05-22'),
('C00010','Shankar','Nair','Chennai','8765489076','Service','1976-07-12');



INSERT INTO branch
(bid,
bname,
bcity)

VALUES 
('B00001','Asaf ali road','Delhi'),
('B00002','New delhi main branch','Delhi'),
('B00003','Delhi cantt','Delhi'),
('B00004','Jasola','Delhi'),
('B00005','Mahim','Mumbai'),
('B00006','Vile parle','Mumbai'),
('B00007','Mandvi','Mumbai'),
('B00008','Jadavpur','Kolkata'),
('B00009','Kodambakkam','Chennai');

INSERT INTO account 
(acc_num,
cus_id,
bid,
opening_balance,
acc_opening_date,
acc_type,
acc_status)

VALUES 
('A00001','C00001','B00001',1000,'2012-12-15','Saving','Active'),
('A00002','C00002','B00001',1000,'2012-06-12','Saving','Active'),
('A00003','C00003','B00002',1000,'2012-05-17','Saving','Active'),
('A00004','C00002','B00005',1000,'2013-01-27','Saving','Active'),
('A00005','C00006','B00006',1000,'2012-12-17','Saving','Active'),
('A00006','C00007','B00007',1000,'2010-08-12','Saving','Suspended'),
('A00007','C00007','B00001',1000,'2012-10-02','Saving','Active'),
('A00008','C00001','B00003',1000,'2009-11-09','Saving','Terminated'),
('A00009','C00003','B00007',1000,'2008-11-30','Saving','Terminated'),
('A00010','C00004','B00002',1000,'2013-03-01','Saving','Active');

INSERT INTO transaction_details 
(trans_num,
acc_num,
date_of_trans,
medium_of_trans,
trans_type,
trans_amount)

VALUES 
('T00001','A00001','2013-01-01','Cheque','Deposit',2000),
('T00002','A00001','2013-02-01','Cash','Withdrawal',1000),
('T00003','A00002','2013-01-01','Cash','Deposit',2000),
('T00004','A00002','2013-02-01','Cash','Deposit',3000),
('T00005','A00007','2013-01-11','Cash','Deposit',7000),
('T00006','A00007','2013-01-13','Cash','Deposit',9000),
('T00007','A00001','2013-03-13','Cash','Deposit',4000),
('T00008','A00001','2013-03-14','Cheque','Deposit',3000),
('T00009','A00001','2013-03-21','Cash','Withdrawal',9000),
('T00010','A00001','2013-03-22','Cash','Withdrawal',2000),
('T00011','A00002','2013-03-25','Cash','Withdrawal',7000),
('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);

INSERT INTO loan
(cus_id,
bid,
loan_amount)

VALUES 
('C00001','B00001',100000),
('C00002','B00002',200000),
('C00009','B00008',400000),
('C00010','B00009',500000),
('C00001','B00003',600000),
('C00002','B00001',600000);