USE Lesson3;

INSERT SALESPEOPLE (snum, sname, city, comm)  
VALUES (1001, "Peel", "London", .12), (1002, "Serres", "San Jose", .13), (1004, "Motika", "London", .11),
(1007, "Rifkin", "Barcelona", .15), (1003, "Axelrod", "New York", .10);

INSERT CUSTOMERS (cnum, cname, city, rating, snum)  
VALUES (2001, "Hoffman", "London", 100, 1001), (2002, "Giovanni", "Rome", 200, 1003),
(2003, "Liu", "SanJose", 200, 1002), (2004, "Grass", "Berlin", 300, 1002), (2006, "Clemens", "London", 100, 1001),
(2008, "Cisneros", "SanJose", 300, 1007), (2007, "Pereira", "Rome", 100, 1004);

INSERT ORDERS (onum, amt, odate, cnum, snum)  
VALUES (3001, 18.69, "10/03/1990", 2008, 1007), (3003, 767.19, "10/03/1990", 2001, 1001),
(3002, 1900.10, "10/03/1990", 2007, 1004), (3005, 5160.45, "10/03/1990", 2003, 1002), (3006, 1098.16, "10/03/1990", 2008, 1007),
(3009, 1713.23, "10/04/1990", 2002, 1003), (3007, 75.75, "10/04/1990", 2004, 1002), (3008, 4723.00, "10/05/1990", 2006, 1001),
(3010, 1309.95, "10/06/1990", 2004, 1002), (3011, 9891.88, "10/06/1990", 2006, 1001);

#Task1
SELECT city, sname, snum, comm FROM SALESPEOPLE;

#Task2
SELECT rating, cname 
FROM customers 
WHERE city = "SanJose";

#Task3
SELECT DISTINCT snum 
FROM orders;

#Task4
SELECT * 
FROM customers 
WHERE cname LIKE 'G%';

#Task5
SELECT * 
FROM orders 
WHERE amt > 1000;

#Task6
SELECT MIN(amt) as min
FROM orders;


#Task7
SELECT * 
FROM customers 
WHERE rating > 100 AND NOT city = 'Rome';

#Task1
SELECT SUM(amt)
FROM Orders
WHERE odate = '01/01/2016';

#Task2
SELECT COUNT(DISTINCT city)
FROM customers;

#Task3
SELECT cnum, MIN(amt)
FROM orders
GROUP BY cnum;

#Task4
SELECT cname
FROM customers
WHERE cname LIKE 'G%';

#Task5
SELECT city, MAX(rating)
FROM customers
GROUP BY city;

INSERT TABLE4 (name, surname, speciality, seniority, salary, age)  
VALUES ("Вася", "Васькин", "начальник", 40, 100000, 60), ("Петя", "Петькин", "начальник", 8, 70000, 30), 
("Катя", "Катьина", "инженер", 2, 70000, 25), ("Саша", "Сашкин", "инженер", 12, 50000, 35), 
("Иван", "Иванов", "рабочий", 40, 30000, 59), ("Петр", "Петров", "рабочий", 20, 25000, 40), 
("Сидор", "Сидоров", "рабочий", 10, 20000, 35), ("Антон", "Антонов", "рабочий", 8, 19000, 28), 
("Юра", "Юркин", "рабочий", 5, 15000, 25), ("Максим", "Воронин", "рабочий", 2, 11000, 22),
("Юра", "Галкин", "рабочий", 3, 12000, 24), ("Люся", "Люськина", "уборщик", 10, 10000, 49);

#TABLE4 Task1
SELECT * 
FROM TABLE4 
ORDER BY salary DESC;

SELECT * 
FROM TABLE4 
ORDER BY salary ASC;

#TABLE4 Task2
SELECT * 
FROM TABLE4 
ORDER BY salary ASC
LIMIT 7, 5;

#TABLE4 Task3
SELECT speciality
FROM TABLE4
WHERE salary > 20000
GROUP BY speciality;