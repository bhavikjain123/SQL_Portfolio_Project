--CREATE TABLE Emp_Details
--(Fname varchar(50),Lname varchar(50), age int, Gender varchar(10))
--Insert INTO Emp_Details VALUES ('bhavik', 'jain', 21, 'male' ),
--('teesha', 'jain', 21, 'female' ),
--('chinmay', 'jain', 25, 'female' ),
--('sourabh', 'jain', 23, 'male' ),
--('akash', 'jain', 27, 'female' ),
--('siddhu', 'jain', 22, 'male' )

--CREATE TABLE Emp_salary(ID int, Dep varchar(10),salary int)
--INSERT INTO Emp_salary VALUES (1,'A',31),
--(2,'B',32),
--(3,'C',33),
--(4,'D',34),
--(5,'E',35)

--SELECT * FROM Emp_Details
--WHERE Fname LIKE '%S%'
 --WHERE Fname IN ('Bhavik','Teesha')

 SELECT * FROM Emp_Details
 ORDER BY age, Gender

 --SELECT Gender, Age, count(gender)
 --FROM EMP_Details
 --WHERE age >=24
 --GROUP BY gender, age

  