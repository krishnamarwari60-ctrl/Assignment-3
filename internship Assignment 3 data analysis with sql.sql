 DROP DATABASE studentmanagement;
 Create database STUDENTMANAGEMENT;
  USE  STUDENTMANAGEMENT;
-- Database Setup
-- Create Table
CREATE TAble Students
 (
Student_id INT primary key,
Name Varchar(50),
Math_Score INT,
Science_Score INT,
English_Score INT
 );
 


INSERT INTO STUDENTS (Student_id,Name,Math_Score,Science_Score,English_Score)
Values
(1,'Kris',85,90,88),
(2,'Radha',78,75,80),
(3, 'Krishna', 92, 88, 91),
(4, 'Somya',65, 70, 68 ),
(5, 'Kinjal',88, 82, 85 ),
(6, 'Radhika',95, 94, 93 );

 Select * From STUDENTS;
 


--  identify top students by Total_Score.

SELECT student_id, name, total_score
FROM (
    SELECT 
        student_id, name,
        (math_score + science_score + english_score) AS total_score FROM students
) AS score_totals
ORDER BY total_score DESC
LIMIT 5;


---- Calculate Average Based on Specific Conditions.


SELECT AVG(math_score) AS avg_math_score FROM (
    SELECT Math_score
    FROM students
    WHERE Math_score > 70
) AS high_Math_scores;


SELECT AVG(total_score) AS avg_total_score from (
    SELECT    
        (math_score + science_score + english_score) AS total_score
    FROM students
) AS score_totals
WHERE total_score BETWEEN 200 AND 250;


---- Find Second-highest Math_Scores.


SELECT MAX(math_score) AS second_highest_math_score
FROM students
WHERE math_score < (
    SELECT MAX(math_score) FROM students
);

 
 
 

