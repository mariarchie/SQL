USE Lesson5;

INSERT CARS (Name, Cost)  
VALUES ("Audi", 52642), ("Mercedes", 57127), ("Skoda", 9000), ("Volvo", 29000),
("Bentley", 350000), ("Citroen", 21000), ("Hummer", 41400), ("Volkswagen", 21600);

#Task1
#Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW Cost_Less_25000
AS SELECT Id, Name, Cost
FROM CARS
WHERE CARS.Cost < 25000;

#Task2
#Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 
ALTER VIEW Cost_Less_25000 
AS SELECT Id, Name, Cost
FROM CARS
WHERE CARS.Cost < 30000;

#Task3
#Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW Skoda_and_Audi
AS SELECT Id, Name, Cost
FROM CARS
WHERE CARS.Name = "Skoda" or CARS.Name = "Audi";

#Task4
#Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.
INSERT Analysis (an_id, an_name, an_cost, an_price, an_group)  
VALUES (10001, "skjhvkjah", 1068, 2000, "A"), (10002, "sdkjhvlka", 790, 1400, "A"), (10003, "sdkjascsc", 3400, 7000, "B"),
(10004, "kdvaa", 1790, 5000, "C"), (10005, "agfekdvaa", 290, 500, "B");

INSERT MyGroups (gr_id, gr_name, gr_temp)  
VALUES (501, "A", -15), (502, "B", 10), (503, "C", 5);

INSERT Orders (ord_id, ord_datetime, ord_an)  
VALUES (118736, '2020-02-05 9:55:12', 10002), (118737, '2020-02-05 12:55:12', 10003), (118738, '2020-02-06 7:30:00', 10001), 
(118739, '2020-02-08 9:00:20', 10004), (118740, '2020-02-10 19:30:59', 10003), (118741, '2020-02-12 14:40:05', 10004),
(118742, '2020-02-15 17:39:00', 10001), (118743, '2020-02-16 17:28:00', 10005), (118744, '2020-02-16 17:28:20', 10005);

SELECT Analysis.an_name, Analysis.an_price, Orders.ord_datetime
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an
WHERE Orders.ord_datetime <= '2020-02-12 23:59:59' and Orders.ord_datetime >= '2020-02-05 00:00:00'
ORDER BY Orders.ord_datetime;

#Task5
#Добавьте новый столбец под названием «время до следующей станции». 
#Чтобы получить это значение, мы вычитаем время станций для пар смежных станций.
INSERT TIMETABLE (train_id, station_character, station_time)
VALUES (110, "San Francisco", 100000), (110, "Redwood City", 105400),
(110, "Palo Alto", 110200), (110, "San Jose", 123500), (120, "San Francisco", 110000),
(120, "Palo Alto", 124900), (120, "San Jose", 133000);


SELECT train_id, station_character, station_time,
TIMEDIFF(LEAD(station_time, 1) OVER (PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station
FROM TIMETABLE;





