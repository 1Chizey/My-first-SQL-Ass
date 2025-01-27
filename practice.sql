
CREATE TABLE Department (
	Num_S INT PRIMARY KEY,
	Label VARCHAR (255) UNIQUE,
	Manager_name VARCHAR (255) NOT NULL
);
SELECT * FROM Department

CREATE TABLE Employee (
	Num_E INT PRIMARY KEY,
	Name VARCHAR (255) NOT NULL,
	Position VARCHAR (255),
	Salary DECIMAL (10,2),
	Num_S INT,
	FOREIGN KEY (Num_S) REFERENCES Department(Num_S)
);
SELECT * FROM Employee
	
CREATE TABLE Project (
	Num_P INT PRIMARY KEY,
	Title VARCHAR (255),
	Start_Date DATE,
	End_Date DATE,
	Num_S INT,
	FOREIGN KEY (Num_S) REFERENCES Department(Num_S)
	);
SELECT * FROM Project

CREATE TABLE Employee_Project (
	Num_E INT,
	FOREIGN KEY (Num_E) REFERENCES Employee(Num_E),
	Num_P INT,
	FOREIGN KEY (Num_P) REFERENCES Project(Num_P),
	Role_ VARCHAR (255) NOT NULL
	);
SELECT * FROM Employee_Project