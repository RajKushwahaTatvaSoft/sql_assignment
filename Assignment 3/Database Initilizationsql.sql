CREATE TABLE Department(
	dept_id int primary key identity(1,1),
	dept_name varchar(50)
);

INSERT INTO Department (dept_name) VALUES ('IT');
INSERT INTO Department (dept_name) VALUES ('Technical');
INSERT INTO Department (dept_name) VALUES ('Git');
INSERT INTO Department (dept_name) VALUES ('Sales');
INSERT INTO Department (dept_name) VALUES ('Graphics');
INSERT INTO Department (dept_name) VALUES ('Marketing');
INSERT INTO Department (dept_name) VALUES ('Management')
INSERT INTO Department (dept_name) VALUES ('Administration');



CREATE TABLE Employee (
	emp_id int primary key identity(1,1),
	dept_id int FOREIGN KEY REFERENCES Department(dept_id),
	mngr_id int,
	emp_name varchar(100),
	salary int,
);

INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Raj K',100000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Riya',90000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'Raj C',80000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (2,2,'Rahul',70000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'Shreyansh',60000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (3,2,'Priyank',50000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'Aditi',40000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (4,2,'Sahil',30000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (5,2,'Pulkit',20000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (5,2,'Siddharth',10000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (6,2,'Krupal',15000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (6,2,'Brinda',25000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (7,2,'Happy',35000);
INSERT INTO Employee (dept_id,mngr_id, emp_name, salary) VALUES (1,2,'Happy',45000);

DROP TABLE Department;

DROP TABLE Employee;

SELECT * FROM Department;

SELECT * FROM Employee;