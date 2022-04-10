/*===================================================
 JOINS
====================================================*/
    
-- Join operations create a new table with columns selected from different tables
-- can be used to create
-- JOIN operations are a very important feature for Relational Databases. Because
-- Pulling the desired columns from the tables associated with the Foreign Keys
-- JOIN operations can be used for --.

-- The most common Join operations in standard SQL:
-- 1) FULL JOIN: Shows all results in the table
-- 2) INNER JOIN: Shows the common result set in the tables
-- 3) LEFT JOIN: Shows results in the first table (Left) but not in the other
-- 4) RIGHT JOIN: Shows all results in the Second table only.

-- NOTE: SQLite only supports INNER, LEFT, and CROSS JOINs.
 
/*===================================================*/


/* araclar.db adındaki veritabanını kullanarak Markalar ve 
Siparisler tablolarındaki marka_id'si ayni olan kayıtların
marka_id, marka_adi, siparis_adedi ve siparis_tarihi   
bilgilerini  listeleyen bir sorgu yaziniz.*/

SELECT 		m.marka_id,  m.marka_adi, 
		s.siparis_adedi, s.siparis_tarihi
FROM 		markalar as m
JOIN		siparisler as s
		ON m.marka_id = s.marka_id;


/* Markalar ve Siparisler tablolarındaki tüm araç markalarının siparis bilgilerini
(marka_id,marka_adi,siparis_adedi,siparis_tarihi) listeleyen bir sorgu yaziniz.*/
SELECT 		m.marka_id,  m.marka_adi, 
		s.siparis_adedi, s.siparis_tarihi
FROM 		markalar as m
LEFT JOIN	siparisler as s
		ON m.marka_id = s.marka_id;


/* Chinook veritabanındaki tracks tablosunda bulunan her bir şarkının
türünü (genre) listeleyiniz.*/
SELECT 		t.name, g.name
FROM 		tracks t
JOIN		genres g
		ON t.GenreId = g.GenreId;


/* invoice tablosundaki faturaların her birinin müşteri adını (FirstName),soyadını (lastName),
fatura tarihini (InvoiceDate) ve fatura meblağını (total) listeleyen sorguyu yazınız */
SELECT 		c.FirstName, c.LastName, i.InvoiceDate, i.total   
FROM 		invoices i
JOIN		customers c
		ON i.CustomerId = c.CustomerId;


/* invoice tablosundaki faturaların her birinin müşteri adını 
(FirstName),soyadını(lastName) ve fatura meblağlarının 
toplamının(total) 40 dolardan fazla olanlarını artan sırada
listeleyen sorguyu yazınız */
SELECT 		c.FirstName, c.LastName,
		sum(i.total) as total_amount
FROM 		invoices i
JOIN 		customers c
		ON i.CustomerId = c.CustomerId
GROUP BY 	c.FirstName
HAVING 		total_amount > 40
ORDER BY	total_amount DESC;

-- CUstomerID ye göre gruplandırır isek
SELECT 		c.CustomerId, c.FirstName, c.LastName,
		sum(i.total) as total_amount
FROM 		invoices i
JOIN 		customers c
		ON i.CustomerId = c.CustomerId
GROUP BY 	c.CustomerId
HAVING 		total_amount > 40
ORDER BY	total_amount DESC;

/*===================================================
 SUBQUERIES
====================================================*/

/* albums tablosundaki Title sutunu 'Faceless' olan kaydın albumid'si elde ederek 
tracks tablosunda bu değere eşit olan kayıtların bilgilerini SUBQUERY yazarak listeyiniz.
Listelemede trackid, name ve albumid bilgilerini bulunmalıdır. */
SELECT 		TrackId, name, AlbumId
FROM		tracks
WHERE		AlbumId in (
			SELECT 	AlbumId
			FROM	albums
			WHERE	Title = 'Faceless');

--JOIN
SELECT 		t.TrackId, t.name, t.AlbumId
FROM		tracks t
JOIN		albums a
		ON t.AlbumId = a.AlbumId AND a.Title = 'Faceless';

/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
SUBQUERY kullanarak listeyiniz. Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */


/* albums tablosundaki Title sutunu Faceless veya Let There Be Rock olan kayıtların 
albumid'lerini elde ederek tracks tablosunda bu id'lere eşit olan kayıtların bilgilerini 
JOIN kullanarak listeyiniz.Listelemede trackid, name ve albumid bilgileri bulunmalıdır. */