/*===================================================
WHERE
====================================================*/

/*How can you write a query about songs of Composer Jimi Hendrix in SQL*/
SELECT name
FROM tracks
WHERE Composer = 'Jimi Hendrix';

/* Invoices with a Total value greater than 10$ in the invoices table
Can you write a inquire about all information?*/

SELECT *
FROM invoices
WHERE total > 10;

/*===================================================
LIMIT
====================================================*/
/*In the invoices table, can you query the InvoiceId, 
InvoiceDate and total information of the first 4 records whose Total value is greater than 10$*/
SELECT InvoiceId,invoicedate,total 
FROM invoices
WHERE total > 10
LIMIT 4;


/*===================================================
ORDER BY
====================================================*/
	
/*In the invoices table, list 
all the information of the 10 records with the most recent InvoiceDate among the records whose Total value is greater than $10. */

SELECT * 
FROM invoices
WHERE total > 10
ORDER BY InvoiceDate DESC
LIMIT 10; 
 
 /* Query the CustomerId, InvoiceDate, BillingCity, total values from the invoices table. 
 BillingCity values in ascending order and total
  Sort them in descending order.*/
 SELECT CustomerId, InvoiceDate,BillingCity,total
 FROM invoices
 ORDER BY BillingCity ASC,total DESC;
 
  	
/*===================================================
LOGICAL OPERATORS (AND,OR,NOT)
====================================================*/

/* In the invoices table, list the records whose country (BillingCountry) 
is not USA in DECLINESS order according to their total value. */ 
 
 SELECT *
 FROM invoices
 WHERE NOT BillingCountry = "USA" 
 --WHERE BillingCountry != "USA" 
 -- WHERE BillingCountry <> "USA"
 ORDER BY total DESC;
  	
/* In the invoices table, list the records whose country (BillingCountry) 
is USA or Germany in ascending order in InvoiceId order. */ 
	
 SELECT *
 FROM invoices
 WHERE BillingCountry = 'USA' OR BillingCountry = 'Germany'
 ORDER BY InvoiceId ASC;
 
 /* In the invoices table, list all the information of the invoices between the invoice date (InvoiceDate) 
 01-01-2012 and 02-01-2013 */

SELECT *
FROM invoices
WHERE InvoiceDate>= '2012-01-01' AND InvoiceDate <= '2013-01-02 00:00:00';

SELECT *
FROM invoices
WHERE InvoiceDate BETWEEN '2012-01-01' AND '2013-01-02 00:00:00';

/* In the invoices table, type the query that lists the most recent invoice from the date of invoice (InvoiceDate) 2009 to 2011 */ 

 SELECT *
 FROM invoices
 WHERE InvoiceDate BETWEEN '2009-01-01' AND '2011-12-31'
 ORDER BY InvoiceDate DESC
 LIMIT 1;
 
 	
/*===================================================
 IN
====================================================*/
/* In the customers table, list the FirstName, LastName, 
country information of the customers ordering from Belgium, Norway, Canada or USA.	*/

SELECT FirstName,LastName,country
FROM customers
WHERE country IN('Belgium', 'Norway','Canada','USA');

 
 
 
	
 