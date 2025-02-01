CREATE TABLE Wine(
	Num_W INT PRIMARY KEY,
	Category VARCHAR (50),
	Year INT,
	Degree INT NOT NULL,
	Num_P INT,
	FOREIGN KEY(Num_P) REFERENCES Producer(Num_P)
);
SELECT * FROM Wine

CREATE TABLE Producer(
	Num_P INT PRIMARY KEY,
	FirstName VARCHAR (50),
	LastName VARCHAR (50),
	Region VARCHAR
);
SELECT * FROM Producer

CREATE TABLE Harvest (
	Quantity INT NOT NULL, 
	Num_W INT,
	Num_P INT,
PRIMARY KEY (Num_W, Num_P)
);
SELECT * FROM Harvest

INSERT INTO Wine(Num_W, Category, Year, Degree,Num_P) 
VALUES(1, 'Red', 2018, 13, 1),
(2, 'White', 2019, 11, 2),
(3, 'Rose', 2020, 12, 3),
(4, 'Sparkling', 2021, 10, 4),
(5, 'Red', 2022, 14, 5),
(6, 'White', 2017, 11, 6),
(7, 'Rose', 2015, 13, 7),
(8, 'Sparkling', 2016, 12, 8),
(9, 'Red', 2019, 10, 9),
(10, 'White', 2021, 13, 10),
(11, 'Rose', 2018, 11, 11),
(12, 'Sparkling', 2022, 14, 12);

SELECT * FROM Wine 

INSERT INTO Producer(Num_P, FirstName, LastName, Region) 
VALUES(1,'Alice', 'Martin', 'Sousse'),
(2, 'Bob', 'Johnson', 'Tunis'),
(3, 'Charlie', 'Brown', 'Sfax'),
(4, 'David', 'Lee', 'Monastir'),
(5, 'Eve', 'Davis', 'Sousse'),
(6, 'Frank', 'Miller', 'Tunis'),
(7, 'Grace', 'Willson', 'Sfax'),
(8, 'Hank', 'Moore', 'Monastir'),
(9, 'Ivy', 'Taylor', 'Sousse'),
(10, 'Jack', 'Anderson', 'Tunis'),
(11, 'Kate', 'Thomas', 'Sfax'),
(12, 'Leo', 'White', 'Monastir');

SELECT * FROM Producer

INSERT INTO Harvest(Quantity, Num_W, Num_P) 
VALUES(250, 1, 1),
(300, 2, 2),
(150, 3, 3),
(400, 4, 4),
(320, 5, 5),
(280, 6, 6),
(350, 7, 7),
(260, 8, 8),
(330, 9, 9),
(210, 10, 10),
(290, 11, 11),
(500, 12, 12);

SELECT * FROM Harvest

--Retrieve all producers.
SELECT FirstName, LastName 
FROM Producer

--Retrieve a sorted list of producers by name.
SELECT FirstName 
FROM Producer
ORDER BY FirstName ASC

--Retrieve producers from Sousse.
SELECT Region, FirstName
FROM Producer
WHERE Region = 'Sousse'

--Calculate the total quantity of wine produced for Wine Number 12
SELECT SUM(Quantity) AS TotalQuantity
FROM Harvest
WHERE Num_W = 12

--Calculate the total quantity of wine produced for each category
SELECT Category, SUM(Quantity) AS TotalQuantity
FROM Harvest
JOIN Wine ON Harvest.Num_P = Wine.Num_P
GROUP BY Category
ORDER BY TotalQuantity

--Find producers from Sousse who harvested at least one wine in quantities greater than 300 liters.
SELECT Region, FirstName, LastName, Quantity
FROM Producer
JOIN Harvest on Producer.Num_P = Harvest.Num_P
WHERE Region = 'Sousse'
And Quantity > 300

--List wine numbers with a degree greater than 12, produced by a specific producer
SELECT Degree, Producer.Firstname, Producer.Num_P
FROM Wine
JOIN Producer ON Wine.Num_P = Producer.Num_p
AND Degree > 12

--Find the producer who has produced the highest quantity of wine.
SELECT MAX(Quantity) AS HighestQuantity
FROM Producer
JOIN Harvest ON Producer.Num_P = Harvest.Num_p

--Calculate the average degree of wine produced
SELECT Category, AVG(Degree) AS AverageDegree
FROM Wine
JOIN Producer on Wine.Num_P = Producer.Num_P
Group BY Category

-- OR 
SELECT AVG(Degree) AS AverageDegree
FROM Wine
JOIN Producer on Wine.Num_P = Producer.Num_P

--Find the oldest wine in the database
SELECT Category, MAX(Year) AS OldestWine
FROM Wine
GROUP BY Category
ORDER BY Category

--OR
SELECT MAX(Year) AS OldestWine
FROM Wine

--Retrieve a list of producers along with the total quantity of wine they have produced
SELECT Producer.FirstName, SUM(Quantity) AS TotalQuantity
FROM Producer
JOIN Harvest on Producer.Num_P = Harvest.num_P
GROUP BY Producer.FirstName

--Retrieve a list of wines along with their producer details.
SELECT Category, FirstName, LastName, Region
FROM Wine
JOIN Producer ON Wine.Num_P = Producer.Num_P