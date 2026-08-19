
SELECT *
FROM Zacrac_Student
LIMIt 1

-- creating Tables--
--drop table Student--  

CREATE TABLE student(
	student_id SERIAL primary key,
	Student_name varchar,
	age int,
	gender varchar,
	address varchar,
	course varchar,
	course_fee money,
	enrollment_date date
)



--ALTER--
-- you can alter 1. Table name 2. Change a field or data name 3. alter has to do with the modification of a table--
--adding column--
ALTER table student
ADD COLUMN course_duration varchar

--Drop Colum--
ALTER table student
DROP COLUMN course_duration

--Remaning Colum--
ALTER table student
RENAME COLUMN name TO student_name

--Remaning a Table--
ALTER table student
RENAME TO Zacrac_Student


--set a NOT NULL CONSTAINT--


ALTER TABLE Zacrac_Student
ALTER COLUMN age
SET NOT NULL
=====

--SET A DEFAULT CONSTRAINT
ALTER TABLE Zacrac_Student
ALTER COLUMN COURSE_fee
SET DEFAULT 400000

ALTER TABLE Zacrac_Student
ALTER COLUMN enrollment_date
SET DEFAULT current_date



--DROPING CONSTRAINT--
ALTER TABLE Zacrac_Student
ALTER COLUMN age
DROP NOT NULL


--CHECK CONSTRAINT--
ALTER TABLE Zacrac_Student
ADD CONSTRAINT gender_checks CHECK(gender IN ('Male','Female'))

--DML--
--INSERT INTO--
INSERT INTO Zacrac_Student(student_name,age,gender,address,course,course_fee,enrollment_date)
			VALUES('Kunle',32,'Male','Lokoja','Data Science','450000','2025-11-26'),
					('Eniola',19,'Female','Ife','Data Analysis','400000','2025-06-01'),
					('Bukola',19,'Female','Ogun','Data Analysis','400000','2025-05-11'),
					('Jayden',21,'Male','Abuja','Data Science','450000','2025-05-12'),
					('Hellen',26,'Female','Osun','Data Science','450000','2025-05-20'),
					('Femi',22,'Male','Abeokuta','Data Science','450000','2025-07-11'),
					('Jadesola',19,'Female','Akure','Data Analysis','400000','2025-07-16'),
					('Jayeola',19,'Female','Oyo','Data Analysis','400000','2025-07-21'),
					('Kemi',20,'Female','Kogi','Data Science','450000','2025-07-26'),
					('Olaoluwa',26,'Female','Osun','Data Science','450000','2025-08-16'),
					('Segun',39,'Male','Akure','Data Analysis','400000','2025-08-16'),
					('Matthew',19,'Male','Kwara','Data Analysis','400000','2025-08-22'),
					('Qudus',24,'Male','Ibadan','Data Analytsis','400000','2025-11-16'),
					('Ezekiel',26,'Male','Osun','Data Science','450000','2025-11-26')
					
			
--CLAUSE--
--WHERE CLAUSE helps to filter table to select a specific data--
--we have <, >,<=, >=, <>--

--Where Clauses--
--Where--
SELECT *
FROM Zacrac_Student
WHERE course = 'Data Science'


SELECT *
FROM Zacrac_Student
WHERE gender = 'Male'


SELECT *
FROM Zacrac_Student
WHERE enrollment_date <= '2025-06-01'


SELECT *
FROM Zacrac_Student
WHERE age > 23


SELECT *
FROM Zacrac_Student
WHERE age > 23
LIMIT 3

--- Distinct Name Search ---
SELECT *
FROM Zacrac_Student
WHERE age > 23 AND student_name = 'Hellen'
LIMIT 3



SELECT *
FROM Student
WHERE address = 'Lagos'


--%--
SELECT *
FROM Zacrac_Student
WHERE address LIKE 'Lagos%'

--%--
--can % be added in the middle of whatever you're looking for a well?--
SELECT *
FROM Zacrac_Student
WHERE address LIKE '%Lagos%'


----------------- (update practice)
UPDATE Zacrac_Student
SET course = 'Data Science'
WHERE student_id = 12

------------------ (update practice result)
SELECT *
FROM Zacrac_Student
WHERE student_id = 12




--UPDATE--
UPDATE Zacrac_Student --not runned--
SET course = 'Data Analysis', age = 23, studen_id = 1 --not runned--
WHERE student_name = 'Fred' --not runned--
WHERE student_id = 12 --not runned--



--AND & OR OPERATOR--
--AND means logical clause--
SELECT *
FROM Zacrac_Student
WHERE gender = 'Male' AND address LIKE 'Lagos%'


SELECT *
FROM Zacrac_Student
WHERE gender = 'Male' OR address LIKE 'Lagos%'

--BETWEEN OPERATOR--
--helps to easily get between something. like getting a record of student between age 20 to 30. 
SELECT *
FROM Zacrac_Student
WHERE age BETWEEN 20 AND 30


--IN OPERATOR--
SELECT *
FROM Zacrac_Student
WHERE address IN ('Akure','Abuja','Lagos') -- can % be used in this situation like this to include all the filtes like the lagosis or any state that have a missing character?


--LIMIT/TOP CLAUSE--
SELECT*
FROM Zacrac_Student
LIMIT 3 

--ORDER BY CLAUSE--
--It helps to randomly get stuffs from data/generate data
SELECT*
FROM Zacrac_Student
ORDER BY address


SELECT*
FROM Student
ORDER BY course_fee

SELECT *
FROM Zacrac_Student
SET address = 'lagos'
WHERE Student = 'lagosis' -- no lagos nor lagosis in address--


--TO GET DATA IN A DESCENDING ORDER: 'DESC'--
SELECT *
FROM Zacrac_Student
ORDER BY address DESC

SELECT *
FROM Zacrac_Student
ORDER BY age DESC

SELECT *
FROM Zacrac_Student
ORDER BY student_name           
LIMIT 5

SELECT *
FROM Zacrac_Student
ORDER BY course_fee
LIMIT 5

--WHERE CLAUSE IS NEEDED TO FILTER A TOP LIST DIRECTE TO SOMETHING--
SELECT*
FROM Zacrac_Student
WHERE course = 'Data Science'  
ORDER BY course_fee DESC
LIMIT 3

--AGGREGATION--
--AGGREGATION INCLUDE: SUM, AVERAGE, COUNT, MIN, MAX, STANDARD DEVIATION, VARINCE
SELECT student_name, age,gender,course,course_fee
FROM Zacrac_Student
WHERE course = 'Data Science'  
ORDER BY 2 DESC
LIMIT 5

--AGGREGATION--
SELECT SUM (age) AS total_age,
		COUNT (student_name), 
		MIN(course_fee),
		MAX(course_fee),
		SUM(course_fee),
		AVG(course_fee :: NUMERIC),
		VAR_SAMP(age),
		VAR_POP(age)
FROM Zacrac_Student

SELECT SUM (course_fee)
FROM Zacrac_Student

SELECT COUNT(student_name)
FROM Zacrac_Student

SELECT COUNT(*)
FROM Zacrac_Student


--GROUP BY--
--GROUP BY IS FOR DATA SUMMARIZATION--
Gender	Score
Male	40
Female	45
Male	60
Female	80
Male	25
Female	50

--HOW much did we receive from the male and female student that enrolled on the 2025-11-26?--
SELECT gender, SUM (course_fee)
FROM Zacrac_Student
WHERE enrollment_date = '2025-11-26'
GROUP BY gender

--THE HAVING CLAUSE--
--HOW much did we receive from the male and female student that enrolled on the 2025-11-26?--
--Then, provide the data for only male students--
SELECT gender, SUM (course_fee)
FROM Zacrac_Student
WHERE enrollment_date = '2025-11-26'
GROUP BY gender
HAVING gender = 'male'

--HOW MANY STUDENTS ENROLLED FOR DATA ANALYSIS COURSE?--
SELECT course, COUNT (student_id) AS total_number_of_student
FROM Zacrac_Student
WHERE course = 'Data Analysis'
GROUP BY COURSE


SELECT course, COUNT (*) AS total_number_of_student
FROM Zacrac_Student
WHERE course IN ('Data Analysis', 'Data Science') AND enrollment_date between '2025-11-1' AND '2025-12-31'
GROUP BY COURSE


--ASSIGNMENT--
--THE STUDENT WITH THE HIGHEST COURSE FEE CAME FROM WHERE
SELECT student_name, MAX (course_fee)
FROM Zacrac_Student
WHERE course_fee > '400,000'
GROUP BY student_name

--THE EARLIEST STUDENT TO ENROLL PAID FOR WHICH COURSE AND FROM WHAT STATE
SELECT student_id,course,address
FROM Zacrac_Student
WHERE student_id = '1'  


--HOW MUCH DID THE STUDENT IN (2) PAID?
SELECT student_name,course_fee
FROM Zacrac_Student
WHERE student_id = '2'
-----------------------------------------------------------------------

--CASE STATEMENT--
SELECT course_fee,
		CASE WHEN course_fee >= '450000' 
		THEN 'High Fee'
		ELSE 'Low Fee' END AS fee_category
		FROM Zacrac_Student


/* JOINS */
--IS A WAY TO JOIN MULTIPLE TABLES TOGETHER BASE ON THE CONNECTING KEY--
--FOREIGN KEY: LEADS ONE TABLE TO ANOTHER KEY--

CREATE TABLE instructor(
	instructor_id SERIAL primary key,
	instructor_name varchar,
	age int,
	gender varchar,
	experience_level int,
	salary money,		
)
----------------------------------------------------------------------------------------------------
select *
from instructor
limit 1

--ASSIGNMENT-----------------------------------------------------------------------------------------
 
ALTER TABLE Zacrac_Student
ADD COLUMN discipline varchar



--DQL--
SELECT *
FROM employees
LIMIT 1


CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR,
    age INT,
	gender VARCHAR,
    address VARCHAR,
    role VARCHAR,
    department VARCHAR,
    salary MONEY,
    date_joined DATE,
    status VARCHAR
);

INSERT INTO employees(employee_id,employee_name,age,gender,address,role,department,salary,date_joined,status)
			VALUES (1,'Adebayo Daniel',25,'Male','Lagos','Data Analyst','Data',800,'2023-01-15','Active'),
					(2,'Oluwatosin Grace',27,'Female','Akure','HR Assistant','H.R',500,'2024-02-10','Active'),
					(3,'Chinedu Michael',30,'Male','Abuja','Software Engineer','Engineering',1800,'2022-06-18','Active'),
					(4,'Fatima Ibrahim',24,'Female','Lagos','Content Creator','Marketing',600,'2025-01-20','Active'),
					(5,'Emmanuel Joseph',29,'Male','Akure','Data Engineer','Data',2000,'2023-04-12','Active'),
					(6,'Blessing Esther',26,'Female','Ibadan','Product Designer','Engineering',1000,'2024-03-08','Non Active'),
					(7,'Olamide Peter',31,'Male','Lagos','Marketing Manager','Marketing',1300,'2022-08-25','Active'),
					(8,'Chiamaka Ruth',23,'Female','Akure','Video Editor','Marketing',550,'2025-02-14','Active'),
					(9,'Samuel Adewale',28,'Male','Abuja','Business Analyst','Data',1100,'2023-09-17','Active'),
					(10,'Mercy Johnson',25,'Female','Lagos','Sales Executive','Sales',700,'2024-01-11','Active'),
					(11,'Victor Olusegun',33,'Male','Akure','Software Engineer','Engineering',2200,'2021-07-19','Active'),
					(12,'Esther Akinyi',27,'Female','Ibadan','Data Analyst','Data',900,'2023-11-05','Non Active'),
					(13,'David Ojo',32,'Male','Lagos','Product Manager','Product',1900,'2022-05-16','Active'),
					(14,'Peace Okafor',24,'Female','Abuja','Content Writer','Marketing',650,'2025-03-09','Active'),
					(15,'Tunde Afolabi',29,'Male','Akure','Data Analyst','Data',850,'2024-06-21','Active'),
					(16,'Adejumo Ayomide',26,'Female','Akure','Personal','E',400,'2025-05-06','Active'),
					(17,'Fredic Gideio Odion',26,'Male','Akure','Product Designer','Engineering',1000,'2022-05-11','Active'),
					(18,'Steven Oluwafikayo',24,'Male','Lagos','Video Editor','Marketing',300,'2025-06-11','Active'),
					(19,'Dada Dayo Ajayi',24,'Female','Akure','Head of Marketing','Marketing',1200,'2023-02-19','Active'),
					(20,'Justina Ogunmola',26,'Female','Akure','H.R','H.R',500,'2022-02-03','Non Active'),
					(21,'Fashognon Victor',28,'Male','Akure','Software Engineer','Engineering',1500,'2022-06-19','Active'),
					(22,'Ezekiel Hawal',22,'Female','Akure','Content Creator','Markweting',500,'2024-02-06','Active'),
					(23,'Johnson Oluwamany',30,'Male','Akure','Software Engineer','Engineering',400,'2025-06-01','Non Active'),
					(24,'Friday Edidiong',30,'Male','Akure','Software Engineer','Engineering',500,'2023-02-25','Non Active'),
					(25,'Bolu Olawale',32,'Male','Akure','Data Analyst','Data',800,'2022-02-10','Active'),
					(26,'Segun Johnson',35,'Male','Akwa Ibom','Software Engneer','Engineering',3000,'2022-06-11','Active'),
					(27,'Emmanuel Adewale',27,'Male','Lagos','Data Analyst','Data',900,'2023-04-15','Active'),
					(28,'Blessing Okafor',25,'Female','Akure','Software Engineer','Engineering',1400,'2024-01-22','Active'),
					(29,'Daniel Akinyemi',29,'Male','Ibadan','Product Manager','Product',1800,'2022-08-17','Active'),
					(30,'Chiamaka Nwosu',24,'Female','Lagos','Content Writer','Marketing',600,'2025-02-11','Active'),
					(31,'Samuel Adekunle',31,'Male','Akure','Data Engineer','Data',1700,'2023-06-09','Active'),
					(32,'Esther Olamide',26,'Female','Ibadan','HR Manager','H.R',1100,'2022-03-14','Non Active'),
					(33,'Michael Ojo',28,'Male','Lagos','UI Designer','Design',1000,'2024-05-20','Active'),
					(34,'Grace Eze',23,'Female','Akure','Marketing Specialist','Marketing',750,'2025-01-18','Active'),
					(35,'David Ibrahim',34,'Male','Abuja','Software Engineer','Engineering',2200,'2021-11-06','Active'),
					(36,'Mercy Johnson',27,'Female','Lagos','Business Analyst','Data',1000,'2023-09-12','Active'),
					(37,'Joshua Adeyemi',29,'Male','Ibadan','Sales Executive','Sales',850,'2024-02-26','Non Active'),
					(38,'Ruth Emmanuel',25,'Female','Akure','HR Assistant','H.R',550,'2025-03-10','Active'),
					(39,'Peter Williams',32,'Male','Lagos','Data Analyst','Data',1300,'2022-07-21','Active'),
					(40,'Sarah Abdullahi',28,'Female','Abuja','Product Designer','Engineering',1250,'2023-10-04','Active'),
					(41,'Tunde Afolabi',30,'Male','Akure','Software Engineer','Engineering',1900,'2022-09-15','Active'),
					(42,'Joy Okoro',24,'Female','Lagos','Video Editor','Marketing',700,'2024-06-13','Active'),
					(43,'Kelvin Obi',33,'Male','Ibadan','Data Engineer','Data',2100,'2021-12-08','Active'),
					(44,'Faith Adeola',26,'Female','Akure','Content Creator','Marketing',650,'2025-04-19','Non Active'),
					(45,'Ibrahim Musa',29,'Male','Abuja','Product Manager','Product',2000,'2022-05-27','Active'),
					(46,'Deborah James',27,'Female','Lagos','Data Analyst','Data',950,'2023-03-16','Active'),
					(47,'Anthony Chukwu',31,'Male','Akure','Software Engineer','Engineering',1600,'2024-01-09','Active'),
					(48,'Peace Eze',25,'Female','Ibadan','Marketing Manager','Marketing',1150,'2022-10-22','Active'),
					(49,'Yusuf Bello',35,'Male','Abuja','Data Engineer','Data',2800,'2021-06-14','Active'),
					(50,'Victoria Adeyemi',28,'Female','Lagos','HR Manager','H.R',1200,'2023-07-05','Active'),
					(51,'Moses Sunday',30,'Male','Akure','Business Analyst','Data',1050,'2024-03-18','Non Active'),
					(52,'Janet Ojo',24,'Female','Ibadan','UI Designer','Design',900,'2025-02-24','Active'),
					(53,'Gabriel Umeh',27,'Male','Lagos','Software Engineer','Engineering',1750,'2023-11-11','Active'),
					(54,'Patience Obi',29,'Female','Akure','Sales Executive','Sales',800,'2024-04-07','Active'),
					(55,'Henry Adekunle',33,'Male','Abuja','Data Analyst','Data',1450,'2022-01-19','Active'),
					(56,'Blessing Adebayo',26,'Female','Lagos','Content Writer','Marketing',600,'2025-05-14','Active'),
					(57,'Lawrence Okeke',31,'Male','Akure','Product Manager','Product',1950,'2023-05-29','Active'),
					(58,'Rebecca James',25,'Female','Ibadan','HR Assistant','H.R',500,'2024-08-12','Non Active'),
					(59,'Francis Ojo',34,'Male','Lagos','Data Engineer','Data',2300,'2021-10-17','Active'),
					(60,'Adaobi Nnamdi',27,'Female','Akure','Product Designer','Engineering',1100,'2023-12-03','Active'),
					(61,'Chinedu Okafor',29,'Male','Abuja','Software Engineer','Engineering',1850,'2022-04-21','Active'),
					(62,'Mary Adeola',24,'Female','Lagos','Marketing Specialist','Marketing',700,'2025-01-30','Active'),
					(63,'Oluwaseun Ajayi',32,'Male','Ibadan','Data Analyst','Data',1250,'2023-06-25','Active'),
					(64,'Caroline Musa',28,'Female','Akure','HR Manager','H.R',1050,'2022-11-13','Active'),
					(65,'Victor Emmanuel',30,'Male','Lagos','Software Engineer','Engineering',2000,'2021-09-08','Active'),
					(66,'Deborah Okafor',26,'Female','Abuja','Video Editor','Marketing',750,'2024-05-16','Non Active'),
					(67,'Stephen Akinola',35,'Male','Akure','Data Engineer','Data',2600,'2022-02-28','Active'),
					(68,'Comfort Eze',25,'Female','Ibadan','Content Creator','Marketing',550,'2025-03-22','Active'),
					(69,'Abraham Bello',31,'Male','Lagos','Product Manager','Product',2200,'2023-08-14','Active'),
					(70,'Florence Johnson',27,'Female','Akure','Data Analyst','Data',1000,'2024-07-19','Active'),
					(71,'Taiwo Adeyemi',29,'Male','Abuja','Software Engineer','Engineering',1750,'2022-06-30','Active'),
					(72,'Elizabeth Ojo',24,'Female','Lagos','HR Assistant','H.R',500,'2025-02-06','Non Active'),
					(73,'Joseph Nwosu',33,'Male','Ibadan','Data Engineer','Data',2400,'2021-08-12','Active'),
					(74,'Linda Okoro',28,'Female','Akure','UI Designer','Design',950,'2023-10-26','Active'),
					(75,'Kenneth Musa',30,'Male','Lagos','Sales Executive','Sales',900,'2024-03-11','Active'),
					(76,'Esther Adekunle',26,'Female','Abuja','Marketing Manager','Marketing',1250,'2022-12-09','Active'),
					(77,'Richard Adebayo',34,'Male','Akure','Software Engineer','Engineering',2300,'2021-05-18','Active'),
					(78,'Naomi Eze',25,'Female','Ibadan','Business Analyst','Data',950,'2024-06-27','Active'),
					(79,'Samuel Okoro',29,'Male','Lagos','Data Analyst','Data',1200,'2023-01-15','Active'),
					(80,'Jennifer Williams',27,'Female','Akure','Content Writer','Marketing',650,'2025-04-02','Non Active'),
					(81,'Patrick Adeola',32,'Male','Abuja','Product Manager','Product',2100,'2022-07-08','Active'),
					(82,'Helen Chukwu',24,'Female','Lagos','HR Assistant','H.R',500,'2025-01-11','Active'),
					(83,'Daniel Okafor',31,'Male','Ibadan','Data Engineer','Data',2500,'2021-11-24','Active'),
					(84,'Amaka Nwosu',28,'Female','Akure','Product Designer','Engineering',1150,'2023-09-05','Active'),
					(85,'Emeka Obi',30,'Male','Lagos','Software Engineer','Engineering',1900,'2022-05-13','Active'),
					(86,'Janet Bello',26,'Female','Abuja','Marketing Specialist','Marketing',700,'2024-02-18','Non Active'),
					(87,'Opeyemi Johnson',33,'Male','Akure','Data Analyst','Data',1400,'2023-04-09','Active'),
					(88,'Rachel Adeyemi',25,'Female','Ibadan','HR Manager','H.R',1150,'2022-08-21','Active'),
					(89,'George Akinyemi',35,'Male','Lagos','Data Engineer','Data',2900,'2021-07-16','Active'),
					(90,'Blessing Okoro',27,'Female','Akure','Video Editor','Marketing',700,'2024-09-12','Active'),
					(91,'Franklin Musa',29,'Male','Abuja','Software Engineer','Engineering',1800,'2023-02-07','Active'),
					(92,'Maryann Eze',24,'Female','Lagos','Content Creator','Marketing',600,'2025-05-21','Non Active'),
					(93,'Samuel Ojo',32,'Male','Ibadan','Product Manager','Product',2050,'2022-10-15','Active'),
					(94,'Grace Adekunle',28,'Female','Akure','Data Analyst','Data',1100,'2023-12-18','Active'),
					(95,'Christopher Obi',31,'Male','Lagos','Software Engineer','Engineering',2100,'2021-09-29','Active'),
					(96,'Favour Nnamdi',26,'Female','Abuja','HR Assistant','H.R',550,'2024-04-16','Active'),
					(97,'David Adeyemi',34,'Male','Akure','Data Engineer','Data',2700,'2022-03-07','Active'),
					(98,'Sophia Okafor',25,'Female','Ibadan','UI Designer','Design',1000,'2025-02-13','Active'),
					(99,'Andrew Williams',30,'Male','Lagos','Sales Executive','Sales',850,'2023-07-24','Non Active'),
					(100,'Esther Chukwu',27,'Female','Akure','Marketing Manager','Marketing',1300,'2022-11-30','Active')




-- checking active and non-active employees
SELECT status, COUNT(*) AS employee_count
FROM employees
GROUP BY status


-- checking active and non-active employees by their department
SELECT department, COUNT(*) AS active_employees
FROM employees
WHERE status = 'Active'
GROUP BY department
ORDER BY active_employees DESC

--or--



UPDATE employees
SET role = 'Data Analyst'
WHERE employee_id = 3



ALTER TABLE employees
ADD CONSTRAINT employee_name 
UNIQUE (employee_name)




