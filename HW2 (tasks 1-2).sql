USE Lesson2;
INSERT sales (id, order_date, bucket)
VALUES (1, '2021-01-01', "101 to 300"), (1, '2021-01-02', "101 to 300"),
(1, '2021-01-03', "less than equal to 100"), (1, '2021-01-04', "101 to 300"), 
(1, '2021-01-05', "greater than 300");

ALTER TABLE sales
ADD COLUMN amount INT;

UPDATE sales 
SET amount = 150
WHERE bucket = "101 to 300";

UPDATE sales 
SET amount = 100
WHERE bucket = "less than equal to 100";

UPDATE sales
SET amount = 350
WHERE bucket = "greater than 300";

ALTER TABLE sales
ADD COLUMN size VARCHAR(10);

UPDATE sales 
SET size = "big"
WHERE amount > 300;

UPDATE sales 
SET size = "middle"
WHERE 100 < amount <= 300;

UPDATE sales 
SET size = "small"
WHERE amount <= 100;







