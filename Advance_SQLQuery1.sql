--WITH CTE_Employee as 
--(SELECT First_name, Last_name, Gender, Salary, 
--COUNT(gender) OVER (PARTITION by Gender) as Totalgender,
--AVG(salary) OVER (PARTITION by gender) as AvgSalary
--FROM [SQL Tutorial].[dbo].[Emp_newdetails] emp
--JOIN [SQL Tutorial].[dbo].[Emp_newsalary] sal
-- ON emp.Emp_ID = sal.Emp_ID
--WHERE salary > '45000'
--)
--Select First_name, Avgsalary
--FROM CTE_Employee

--CREATE TABLE #Temp_Employee (
--Emp_ID INT, 
--jobtitle VARCHAR(50),
--Salary INT
--)

--INSERT INTO #Temp_Employee VALUES(
--1001,'sales', 47000
--)

--SELECT * 
--FROM #Temp_Employee

--INSERT INTO #Temp_Employee 
--SELECT *
--FROM [SQL Tutorial].[dbo].[EMP_newsalary]

--DROP TABLE IF EXISTS #Temp_Employee2
--CREATE TABLE #Temp_Employee2 ( 
--jobtitle VARCHAR(50),
--EmployeesPerJob INT,
--AvgAge INT
--,AvgSal INT
--)

--INSERT INTO #Temp_Employee2
--SELECT jobtitle, COUNT(jobtitle), AVG(Age), AVG(salary)
--FROM [SQL Tutorial].[dbo].[Emp_newdetails] emp
--JOIN [SQL Tutorial].[dbo].[EMP_newsalary] sal
-- ON emp.Emp_ID = sal.Emp_ID
-- GROUP BY jobtitle

-- SELECT *
-- FROM #Temp_Employee2
-- ORDER BY AvgAge


--CREATE TABLE EmployeeErrors(
--EmployeeID varchar(50),
--Firstname varchar(50),
--Lastname varchar(50)
--)

--INSERT INTO EmployeeErrors VALUES
--('1001  ', 'jimbo','Halbert')
--,('  1002','Pamela','Beasely')
--, ('1005', 'TOby','Flrnderson - Fired')


--Using Trim, LTrim, Rtrim

--SELECT EmployeeID, TRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, LTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors

--SELECT EmployeeID, RTRIM(EmployeeID) as IDTRIM
--FROM EmployeeErrors



-- USING REPLACE

--SELECT Lastname, REPLACE(Lastname, '- Fired','')
--FROM EmployeeErrors





--Using SUBSTRING

--SELECT Firstname, SUBSTRING(Firstname,3,3)
--FROM EmployeeErrors

--SELECT err.Firstname, emp.First_name
--FROM EmployeeErrors err
--JOIN [SQL Tutorial].[dbo].[Emp_newdetails] as emp
-- ON  err.Firstname = emp.First_name

--SELECT err.Firstname,SUBSTRING(err.Firstname, 1,3),emp.First_name, SUBSTRING(emp.First_name, 1, 3)
--FROM EmployeeErrors err
--JOIN [SQL Tutorial].[dbo].[Emp_newdetails] as emp
-- ON  SUBSTRING(err.Firstname, 1,3) = SUBSTRING(emp.First_name, 1, 3)


 --above can also be used to match up the people across tables


--USING UPPER & LOWER
--SELECT Firstname, LOWER(Firstname)
--FROM EmployeeErrors

--SELECT Firstname, UPPER(Firstname)
--FROM EmployeeErrors


