/*Q1.
Please write a query to return the earliest start date 
as 'earliest_date"' among the female students.*/
select MIN(start_date) AS earliest_date
FROM student_info
WHERE gender = 'F';
/*Q2.
Please rewrite the previous query to return the earliest start date 
among the female students without using the MIN function. 
Your query should return just a single column. 
(Note: Please don't use AS keyword in the query)*/
select start_date
from student_info
where gender = 'F'
order by start_date ASC
limit 1;
/*Q3.
Please write a query to return the newest start date as 
'newest_date' among the male students.*/
SELECT MAX(start_date) as newest_date
FROM student_info;
/*Q4.
Please rewrite the previous query to return the newest start date 
among the male students. Your query should return just a single column.
Please don't use AS keyword and MAX function in the query*/
SELECT start_date
FROM student_info
WHERE gender = 'M'
ORDER BY start_date DESC
LIMIT 1;