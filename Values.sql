
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

INSERT INTO Department(Num_S, Label, Manager_Name)
VALUES(1, 'IT', 'Alice johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');

INSERT INTO Employee(Num_E, Name, Position, Salary, Num_S)
VALUES(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

INSERT INTO Project(Num_P, Title, Start_Date, End_Date, Num_S)
VALUES(201, 'Website Redesign', '2024-01-15','2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT infrastructure Setup', '2024-04-01', '2024-12-31', 1);
--(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);

INSERT INTO Employee_Project(Num_E, Num_P, Role_)
VALUES(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');

UPDATE Employee_Project
SET Role_ = 'Full Stack developer'
WHERE Num_E = 101;

SELECT * FROM Employee_Project 
ORDER BY Num_E ASC

DELETE FROM Employee
WHERE Num_E = 103