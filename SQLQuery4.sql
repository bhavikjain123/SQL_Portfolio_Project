--CREATE TABLE Emp_newdetails
--(Emp_ID int,First_name varchar(30), Last_name varchar(30), Age int, Gender varchar(30))

--CREATE TABLE EMP_newsalary
--(Emp_ID int, jobtitle varchar(50), Salary int)

--INSERT INTO Emp_newdetails VALUES
--(1001, 'Jim', 'Halpert', 30, 'Male'),
--(1002, 'Pam', 'Beasley', 30, 'Female'),
--(1003, 'Dwight', 'Schrute', 29, 'Male'),
--(1004, 'Angela', 'Martin', 31, 'Female'),
--(1005, 'Toby', 'Flenderson', 32, 'Male'),
--(1006, 'Michael', 'Scott', 35, 'Male'),
--(1007, 'Meredith', 'Palmer', 32, 'Female'),
--(1008, 'Stanley', 'Hudson', 38, 'Male'),
--(1009, 'Kevin', 'Malone', 31, 'Male')

--Insert Into Emp_newsalary VALUES
--(1001, 'Salesman', 45000),
--(1002, 'Receptionist', 36000),
--(1003, 'Salesman', 63000),
--(1004, 'Accountant', 47000),
--(1005, 'HR', 50000),
--(1006, 'Regional Manager', 65000),
--(1007, 'Supplier Relations', 41000),
--(1008, 'Salesman', 48000),
--(1009, 'Accountant', 42000)

--Insert into Emp_newdetails VALUES
--(1011, 'Ryan', 'Howard', 26, 'Male'),
--(NULL, 'Holly', 'Flax', NULL, NULL),
--(1013, 'Darryl', 'Philbin', NULL, 'Male')

--Insert into Emp_newsalary VALUES
--(1010,NULL,47000),(NULL,'Salesman',43000)


--SELECT *
--FROM Emp_newdetails
--INNER JOIN Emp_newsalary
--ON EMP_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--FULL OUTER JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--LEFT OUTER JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--RIGHT OUTER JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--SELECT Emp_newdetails.Emp_ID, First_name, Last_name, salary
--FROM Emp_newdetails
--INNER JOIN Emp_newsalary
--ON EMP_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--WHERE First_name <> 'Michael'
--ORDER BY salary DESC

--SELECT jobtitle, AVG(salary)
--FROM Emp_newdetails
--INNER JOIN Emp_newsalary
--ON EMP_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--WHERE jobtitle = 'salesman'
--GROUP BY jobtitle

--Create Table WareHouseEmployeeDemographics 
--(EmployeeID int, 
--FirstName varchar(50), 
--LastName varchar(50), 
--Age int, 
--Gender varchar(50))

--Insert into WareHouseEmployeeDemographics VALUES
--(1013, 'Darryl', 'Philbin', NULL, 'Male'),
--(1050, 'Roy', 'Anderson', 31, 'Male'),
--(1051, 'Hidetoshi', 'Hasagawa', 40, 'Male'),
--(1052, 'Val', 'Johnson', 31, 'Female')

--SELECT * FROM Emp_newdetails
--INNER JOIN WareHouseEmployeeDemographics
--ON WareHouseEmployeeDemographics.EmployeeID= Emp_newdetails.Emp_ID

--FULL OUTER JOIN WareHouseEmployeeDemographics
--ON WareHouseEmployeeDemographics.EmployeeID= Emp_newdetails.Emp_ID

--SELECT * FROM Emp_newdetails
--UNION ALL
--SELECT * FROM WareHouseEmployeeDemographics

--SELECT First_name, Last_name,Age,
--CASE
--    WHEN AGE > 30 THEN 'OLD'
--	ELSE 'YOUNG'
--END
--FROM Emp_newdetails
--WHERE AGE is NOT NULL
--ORDER BY AGE

--SELECT First_name, Last_name, jobtitle, salary,
--CASE 
--     When jobtitle = 'Salesman' then salary + (salary *.10)
--	 WHEN jobtitle = 'Accountant' then salary + (salary *.08)
--	 WHEN jobtitle = 'HR' then salary + (salary *.06)
--	 ELSE salary + (salary * .04)
 
--END AS Salary_After_Raise
--From Emp_newdetails
--JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID


--SELECT First_name, Last_name, jobtitle, salary,
--CASE 
--     When jobtitle = 'Salesman' then salary + (salary *.10)
--	 WHEN jobtitle = 'Accountant' then salary + (salary *.08)
--	 WHEN jobtitle = 'HR' then salary + (salary *.06)
--	 ELSE salary + (salary * .04)
 
--END AS Salary_After_Raise
--From Emp_newdetails
--JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID

--SELECT jobtitle, count(jobtitle)
--From Emp_newdetails
--JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID
--GROUP BY jobtitle
--HAVING count(jobtitle) > 1

--SELECT jobtitle, AVG(salary)
--From Emp_newdetails
--JOIN Emp_newsalary
--ON Emp_newdetails.Emp_ID = Emp_newsalary.Emp_ID
--GROUP BY jobtitle
--HAVING AVG(salary) > 45000
--ORDER BY AVG(salary)

--SELECT * 
--FROM Emp_newdetails

--UPDATE Emp_newdetails
--SET Emp_ID = 1012, AGE = 31, Gender= 'Female'
--WHERE First_name = 'Holly' and Last_name= 'Flax'

--ALIASING

--SELECT Demo.Emp_ID, Sal.salary
--FROM Emp_newdetails as Demo
--JOIN Emp_newsalary as Sal
-- ON Demo.Emp_ID = Sal.Emp_ID

--partition by

SELECT First_name, Last_name, Salary, Gender,
count(Gender) OVER (PARTITION BY Gender)
FROM []Emp_newdetails
JOIN EMP_newsalary
ON Emp_newdetails.Emp_ID = EMP_newsalary.Emp_ID


