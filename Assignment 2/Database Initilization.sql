-- Table Initialization Assignment 2

-- Salesman Table
CREATE TABLE Salesman (
	salesman_id INT IDENTITY(1,1) PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	city VARCHAR(255) NOT NULL,
	commision int NOT NULL,
);

INSERT INTO Salesman (name,city,commision)
VALUES ('Raj','Ahmedabad',100);
INSERT INTO Salesman (name,city,commision)
VALUES ('Riya','Gandhinagar',90);
INSERT INTO Salesman (name,city,commision)
VALUES ('Raj Ahir','Surat',80);
INSERT INTO Salesman (name,city,commision)
VALUES ('Rahul','Baroda',70);
INSERT INTO Salesman (name,city,commision)
VALUES ('Sahil','Bhavnagar',60);


-- Customer Table
CREATE TABLE Customer (
	customer_id INT IDENTITY(1,1) PRIMARY KEY,
	cust_name VARCHAR(100) NOT NULL,
	city VARCHAR(255) NOT NULL,
	grade int,
	salesman_id int,
	 FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Prit','Ahmedabad',100,1);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Sahil','Gandhinagar',300,4);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Pulkit','Surat',700,1);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Aditi','Baroda',950,3);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Happy','Bhavnagar',1050,2);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Vanshita','Surat',150,1);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Siddharth','Porbandar',1000,4);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Krinal','Ahmedabad',500,null);
INSERT INTO Customer (cust_name,city,grade,salesman_id)
VALUES ('Krinal','Ahmedabad',null,5);

-- Order Table
CREATE TABLE Orders (
	ord_no INT IDENTITY(1,1) PRIMARY KEY,
	purch_amt int not null,
	ord_date date not null,
	customer_id int not null,
	salesman_id int null
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id),
);

ALTER TABLE Orders 
ALTER COLUMN salesman_id int null


INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (1000, '2023-1-21', 1,1);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (500, '2023-1-21', 1,1);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (500, '2023-2-21', 2,3);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (250, '2023-3-21', 4,2);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (2000, '2023-4-21', 2,3);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (3000,'2023-5-21', 4,1);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (5000, '2023-6-21', 1,3);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (10000, '2023-7-21', 4,4);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (750, '2023-9-21', 5,4);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (1250, '2023-10-21', 3,1);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (1500, '2023-12-21', 5,2);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (200, '2022-4-21', 5,null);
INSERT INTO Orders (purch_amt, ord_date, customer_id, salesman_id)
VALUES (700, '2022-9-21', 3,null);


-- Quick Access Queries
DROP TABLE Salesman;

DROP TABLE Customer;

DROP TABLE Orders;


TRUNCATE TABLE customer;

TRUNCATE TABLE Salesman;

TRUNCATE TABLE Orders;


Select * from Customer;

Select * from Salesman;

Select * from Orders;
