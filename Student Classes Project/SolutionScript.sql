/*Student Classes Project
	Description: 
School offers 3 subjects:
-Mathematics,French,Physics
There are 5 students in a school:
-Jim Brown (French, Physics)
-Alex Xaviera (Mathematics, French and Physics)
-James Jackson (Physics,French)
-John Kennedy (Mathematics)
-Jacob Kennedy (Mathematics and French)
Note: Each student can be enrolled in more than one class
Questions: 
1.	Design and build a database setup for this scenario
2.	Build a query that reports on first name and last name for each student in the school along with the classes they are enrolled in 
3.	Build a query that reports on the classes the Kennedy kids are taking 
4.	Build a query that reports on the most popular class
*/
DO $$DECLARE 
iStudentID INT;
iMathSubjectID INT;
iPhysicsSubjectID INT;
iFrenchSubjectID INT;
BEGIN 
--Students Table
CREATE TABLE Students 
(
	StudentID SERIAL PRIMARY KEY,
 	FirstName VARCHAR(12) NOT NULL,
	LastName VARCHAR(12) NOT NULL
);

INSERT INTO Students(FirstName,
	LastName)
VALUES('Jim', 'Brown'),
	('Alex', 'Xaviera'),
	('James', 'Jackson'),
	('John', 'Kennedy'),
	('Jacob', 'Kennedy');	

--SELECT * FROM Students

--Classes Table
CREATE TABLE Subjects 
(
	SubjectID SERIAL PRIMARY KEY,
	SubjectName VARCHAR(12) NOT NULL
);

INSERT INTO Subjects (SubjectName)
VALUES('French'),
	('Mathematics'),
	('Physics');

--Setting SubjectID Variables
SELECT S.SubjectID  
INTO iMathSubjectID 
FROM Subjects AS S
WHERE S.Subjectname = 'Mathematics';

SELECT S.SubjectID
INTO iPhysicsSubjectID 
FROM Subjects AS S
WHERE S.Subjectname = 'Physics';

SELECT S.SubjectID
INTO iFrenchSubjectID 
FROM Subjects AS S
WHERE S.Subjectname = 'French';

/*
	raise notice 'Math: %', iMathSubjectID; 
	raise notice 'French: %', iFrenchSubjectID;
	raise notice 'Physics: %', iPhysicsSubjectID;
*/

--SELECT * FROM Subjects

--Student Subjects
CREATE TABLE StudentSubjects
(
	StudentID INT REFERENCES Students (StudentID)NOT NULL,
	SubjectID INT REFERENCES Subjects (SubjectID) NOT NULL
);
--Populating StudentSubjects table for each student
--Jim Brown (French, Physics)
SELECT S.StudentID 
INTO iStudentID
FROM Students AS S
WHERE S.FirstName= 'Jim' AND
	S.LastName = 'Brown';

INSERT INTO StudentSubjects (StudentID,
	SubjectID)
VALUES (iStudentID,iFrenchSubjectID),
	(iStudentID,iPhysicsSubjectID);



END$$;
SELECT * FROM StudentSubjects;
--TODO: Lorna do not forget to populate the student class table for the rest of the data
--CleanUp
/*
	DROP TABLE StudentSubjects;
	DROP TABLE students;
	DROP TABLE Subjects;
*/

