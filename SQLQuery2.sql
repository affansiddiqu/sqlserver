CREATE DATABASE CompanyDB;
USE CompanyDB;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    DepartmentID INT,
    Salary DECIMAL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
--1
ALTER TABLE Employees ADD HireDate DATETIME;

SELECT * FROM Employees;
--2
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');
SELECT * FROM Departments;

--3
INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary, HireDate)
VALUES
    (1, 'Alice', 'Johnson', 1, 55000, '2022-02-10'),
    (2, 'Bob', 'Williams', 2, 60000, '2022-03-15'),
    (3, 'Charlie', 'Davis', 5, 50000, '2022-04-20'),
    (4, 'David', 'Smith', 3, 70000, '2022-05-25'),
    (5, 'Eva', 'Brown', 2, 48000, '2022-06-30'),
    (6, 'Frank', 'Miller', 1, 60000, '2022-07-05'),
    (7, 'Grace', 'Wilson', 3, 75000, '2022-08-10'),
    (8, 'Henry', 'Jones', 4, 80000, '2022-09-15'),
    (9, 'Ivy', 'Clark', 4, 55000, '2022-10-20'),
    (10, 'Jack', 'Moore', 5, 65000, '2022-11-25');
	
	--4
	UPDATE Employees SET Salary = Salary * 1.10 WHERE DepartmentID = 1;
	--5
	DELETE FROM Employees WHERE Salary < 30000;
	--6
	SELECT * FROM Employees INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
	--7
	SELECT FirstName,LastName,DepartmentName,Salary FROM Employees 
	INNER JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID;
	--8
	SELECT * FROM Departments LEFT JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID;
	--9
	SELECT DepartmentName, COUNT(EmployeeID) AS NumberOfEmployees FROM Departments
INNER JOIN Employees ON Departments.DepartmentID = Employees.DepartmentID 
GROUP BY Departments.DepartmentName, Departments.DepartmentID;
--10
SELECT * FROM Employees inner JOIN Departments ON Employees.DepartmentID = Departments.DepartmentID
WHERE Salary > '60000';
--11
SELECT FirstName, LastName, HireDate FROM Employees WHERE HireDate > '2022-09-01';
