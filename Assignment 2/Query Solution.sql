-- Query Solutions Assignment 2

-- Assumption : SalesmanID is present in both Order and Customer, so SalesmanID of Orders with take priority whenever conflict occurs between the two.

-- Question 1
SELECT Customer.cust_name AS Customer, Salesman.name AS Salesman, Customer.city AS City from Customer
INNER JOIN Salesman ON Salesman.city = Customer.city;

-- Question 2
SELECT Orders.ord_no AS 'Order No', Orders.purch_amt AS Amount, Customer.cust_name AS 'Customer Name', Customer.city AS City from Orders 
INNER JOIN Customer ON Customer.customer_id = Orders.customer_id
WHERE Orders.purch_amt BETWEEN 500 AND 2000;

-- Question 3
SELECT Customer.cust_name AS 'Customer Name', Salesman.city AS City, Salesman.name AS 'Salesman', Salesman.commision AS Commision from Salesman 
LEFT JOIN Customer ON Customer.salesman_id = Salesman.salesman_id;

-- Question 4
SELECT Customer.cust_name AS 'Customer Name', Customer.city, Salesman.name, Salesman.commision from Salesman
INNER JOIN Customer ON Customer.salesman_id = Salesman.salesman_id
WHERE Salesman.commision > 12;

-- Question 5
SELECT Customer.cust_name AS 'Customer Name', Customer.city AS City, Salesman.name, Salesman.city, Salesman.commision from Salesman
INNER JOIN Customer ON Customer.salesman_id = Salesman.salesman_id
WHERE Salesman.commision > 12 AND Customer.city != Salesman.city;

-- Question 6
SELECT Orders.ord_no AS 'Order No', Orders.ord_date, Orders.purch_amt, Customer.cust_name, Customer.grade, Salesman.name, Salesman.commision from Customer
INNER JOIN Orders ON Orders.customer_id = Customer.customer_id
INNER JOIN Salesman ON Salesman.salesman_id = Customer.salesman_id

-- Question 7 (doubtful: Which salesman_id to be used)
SELECT Orders.ord_no, Orders.purch_amt, Orders.ord_date, Customer.customer_id, Customer.cust_name, Customer.city, Customer.grade, Salesman.salesman_id, Salesman.name, Salesman.city, Salesman.commision from Orders
INNER JOIN Customer ON Customer.customer_id = Orders.customer_id
INNER JOIN Salesman ON Salesman.salesman_id = Orders.salesman_id;


SELECT Orders.ord_no, Orders.purch_amt, Orders.ord_date, Customer.customer_id, Customer.cust_name, Customer.city, Customer.grade, Salesman.salesman_id, Salesman.name, Salesman.city, Salesman.commision from Orders
FULL OUTER JOIN Customer ON Customer.customer_id = Orders.customer_id
FULL OUTER JOIN Salesman ON Salesman.salesman_id = Orders.salesman_id;

-- Question 8
SELECT Customer.cust_name, Customer.city, Customer.grade, Salesman.name, Salesman.city from Customer
INNER JOIN Salesman ON Customer.salesman_id = Salesman.salesman_id
ORDER BY Customer.customer_id ASC;

-- Question 9
SELECT Customer.cust_name, Customer.city, Customer.grade, Salesman.name, Salesman.city from Customer
INNER JOIN Salesman ON Customer.salesman_id = Salesman.salesman_id
WHERE Customer.grade < 300
ORDER BY Customer.customer_id ASC;

-- Question 10
SELECT Customer.cust_name, Customer.city, Orders.ord_no, Orders.ord_date, Orders.purch_amt from Customer
LEFT JOIN Orders ON Customer.customer_id = Orders.customer_id
ORDER BY Orders.ord_date ASC, Orders.purch_amt ASC;

-- Question 11 (Doubtful: salesman_id in both)
SELECT Customer.cust_name, Customer.city, Orders.ord_no, Orders.ord_date, Orders.purch_amt, Salesman.name, Salesman.commision from Customer
LEFT JOIN Orders ON Customer.customer_id = Orders.customer_id
LEFT JOIN Salesman ON Orders.salesman_id = Salesman.salesman_id

-- Question 12 (Doubtful: what ascending order)
SELECT * FROM Salesman 
LEFT JOIN Customer ON Salesman.salesman_id = Customer.salesman_id;

-- Question 13 (Doubtful: which customer detail)
SELECT Salesman.salesman_id, Salesman.name, Customer.cust_name, Customer.city, Customer.grade, Orders.ord_no, Orders.ord_date, Orders.purch_amt FROM Orders
RIGHT JOIN Salesman ON Orders.salesman_id = Salesman.salesman_id
LEFT JOIN Customer ON Orders.customer_id = Customer.customer_id

-- Question 14
SELECT Salesman.salesman_id, Salesman.name, Customer.cust_name, Customer.city, Customer.grade, Orders.ord_no, Orders.ord_date, Orders.purch_amt FROM Orders
RIGHT JOIN Salesman ON Orders.salesman_id = Salesman.salesman_id
LEFT JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Orders.purch_amt > 2000 AND Customer.grade is not null

-- Question 15
SELECT Salesman.salesman_id, Salesman.name, Customer.cust_name, Customer.city, Customer.grade, Orders.ord_no, Orders.ord_date, Orders.purch_amt FROM Orders
RIGHT JOIN Salesman ON Orders.salesman_id = Salesman.salesman_id
LEFT JOIN Customer ON Orders.customer_id = Customer.customer_id

-- Question 16
SELECT Customer.cust_name, Customer.city, Orders.ord_no, Orders.ord_date, Orders.purch_amt from Customer
FULL OUTER JOIN Orders ON Customer.customer_id = Orders.customer_id AND Customer.grade IS NOT NULL

-- Question 17
SELECT * FROM Salesman
CROSS JOIN Customer;

-- Question 18 (Doubtful: what is cartesian product)
SELECT * FROM Salesman
FULL OUTER JOIN Customer ON Customer.city = Salesman.city;

SELECT * FROM Salesman
CROSS JOIN Customer
WHERE Customer.city = Salesman.city;

-- Question 19

-- Question 20
SELECT * FROM Salesman
FULL OUTER JOIN Customer ON Customer.city != Salesman.city

