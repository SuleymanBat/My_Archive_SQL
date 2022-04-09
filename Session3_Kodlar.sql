
/*===================================================
LIKE
====================================================*/
/* Composer column in tracks table ends with Bach
Write the query that lists the Name information of the records*/
SELECT name,Composer
FROM tracks
WHERE Composer like '%Bach';
	
/* Greatest in the Title column in the albulms table
  Write the query that lists all the information of the records containing */
 SELECT *
 FROM albums
 WHERE Title LIKE '%Greatest%';
 
/* In the invoices table, on a date between 2010 and 2019 (InvoiceDate)
  All information of invoices realized only in February write the query that lists */
 
 SELECT *
 FROM invoices
 WHERE InvoiceDate LIKE '201_-02%';
 
/* In the customers table, write the query that lists the FirstName, LastName 
and City information of the customers whose names (FirstName) are three letters*/
 SELECT FirstName,LastName,City
 FROM customers
 WHERE FirstName LIKE '___';

/* in the customers table, with surnames starting with Sch or Go
Write the query that lists the customers FirstName, LastName and City information*/
 SELECT FirstName, LastName, City 
 FROM customers
 WHERE LastName LIKE 'sch%' OR LastName LIKE 'go%';
  
/*===================================================
	AGGREGATE FUNCTION COUNT,SUM,MIN,MAX, AVG)
====================================================*/
	
-- COUNT
------------------------------------------------------------------------------
/* Write a query that returns the number of invoices in the invoices table */
 SELECT count(*) -- tamamını sayar (null dahildir)
 FROM invoices;

 SELECT count(BillingState) -- NULL olanlar sayılmaz.
 FROM invoices;
 
 SELECT count(*) as num_of_null
 FROM invoices
 WHERE BillingState IS NULL;
 
/* Write a query that returns how many different Composers are in the tracks table*/
 SELECT count(DISTINCT Composer) as num_of_composer
 FROM tracks ;
 
 
-- MIN,MAX
-------------------------------------------------------------------------------------------------	
/* Write the query that lists the name and duration of the song with the shortest song duration in the tracks table */
 SELECT name as song_name, MIN(Milliseconds)/1000.0 as min_duration_sc
 FROM tracks;
 
/*Write the query that lists the lowest and highest grades in the students table */
 SELECT MIN(Grade) as min_grade ,MAX(grade) as max_grade
 FROM students;
 
 -- SUM,AVG
-------------------------------------------------------------------------------------------------	
/* List the total value of the invoices in the invoices table */
 SELECT ROUND(SUM(total)) as total_amount
 FROM invoices;

/* List the average value of the invoices in the invoices table */
  SELECT ROUND(AVG(total),3) as avg_amount
  FROM invoices;
	
/* longer than the average duration of the songs in the tracks table
list the names of the songs */

 SELECT AVG(Milliseconds) as avg_duration
 FROM tracks;
 
 SELECT name, Milliseconds
 FROM tracks
 WHERE Milliseconds > 393599.22;
 
/* This method is not a very logical solution because it is hard-coded.
A more correct approach would be with a sub-query. */
 
 SELECT name, Milliseconds
 FROM tracks
 WHERE Milliseconds > (SELECT avg(Milliseconds) FROM tracks) ; 
 
 /*===================================================
 GROUP BY
====================================================*/

/* Write a query that lists the total number of songs of each Composer in the tracks table,
 grouped by Composer name. */
 SELECT Composer, Count(name) 
 FROM tracks
 WHERE Composer IS NOT NULL
 GROUP BY Composer;
 
/* Write the query that calculates the invoice averages of each country (BillingCountry) in the invoices table and lists them with country information.*/
 
 SELECT BillingCountry, ROUND(AVG(total), 2) as avg_amount
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31 00:00:00'
 GROUP BY BillingCountry;