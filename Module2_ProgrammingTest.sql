/* Q1.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Titel, die eine Länge von 5.000.000 Millisekunden oder mehr haben.*/

/*Wie viele Titel werden zurückgegeben?*/  

/* Ans : 2 */

SELECT Milliseconds
FROM Tracks
WHERE Milliseconds >= 5000000;

/*----------------------------------------------------------------------------------------------------*/

/* Q2.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Rechnungen, deren Gesamtbetrag zwischen 5 und 15 Dollar liegt.*/

/*Während die Abfrage in diesem Beispiel auf 10 Datensätze beschränkt ist, wird bei korrekter Ausführung 
der Abfrage angezeigt, wie viele Datensätze es insgesamt gibt. Geben Sie diese Zahl unten ein.*/  

/* Ans : 168 */

SELECT total
FROM INVOICES
WHERE total between 5 AND 15;

/*----------------------------------------------------------------------------------------------------*/

/* Q3.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten*/

/*Abfrage ausführen: Suchen Sie alle Kunden aus den folgenden Bundesstaaten: RJ, DF, AB, BC, CA, WA, NY.*/

/*Für welches Unternehmen arbeitet Jack Smith?*/  

/* Ans : Microsoft Corp */

SELECT *
FROM Customers
WHERE State IN ('RJ', 'DF', 'AB', 'BC', 'CA', 'WA', 'NY')
AND FirstName = 'Jack'
AND LastName = 'Smith';

/*----------------------------------------------------------------------------------------------------*/

/* Q4.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Rechnungen für die Kunden 56 und 58, bei denen der Gesamtbetrag zwischen 1,00 $ und 5,00 $ liegt.*/

/*Welches war das Rechnungsdatum für die Rechnungsnummer 315?*/  

/* Ans : 10-27-2012 */

SELECT *
FROM Invoices
WHERE (Total between 1 AND 5)
AND InvoiceId = '315';

/*----------------------------------------------------------------------------------------------------*/

/* Q5.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Titel, deren Name mit „All“ beginnt.*/

/* Es werden zwar nur 10 Datensätze angezeigt, jedoch wird in der Abfrage angezeigt, wie viele Datensätze 
es insgesamt für diese Abfrage gibt. Geben Sie diese Zahl unten ein.*/  

/* Ans : 15 */

SELECT *
FROM  Tracks
WHERE Name Like 'All%';

/*----------------------------------------------------------------------------------------------------*/

/* Q6.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Kunden-E-Mails, die mit „J“ beginnen und von gmail.com stammen.*/

/*Geben Sie die zurückgegebene E-Mail-Adresse unten ein (Sie müssen wahrscheinlich nach rechts scrollen).*/  

/* Ans : jubarnett@gmail.com */

SELECT *
FROM Customers
WHERE Email like "J%@gmail.com";

/*----------------------------------------------------------------------------------------------------*/

/* Q7.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Suchen Sie alle Rechnungen aus den Rechnungsorten Brasília, Edmonton und Vancouver 
und sortieren Sie sie in absteigender Reihenfolge nach Rechnungsnummer.*/

/*Wie hoch ist der Rechnungsbetrag des ersten zurückgegebenen Datensatzes? Geben Sie die unten stehende Zahl 
ohne $-Zeichen ein. Denken Sie daran, in absteigender Reihenfolge zu sortieren, um die richtige Antwort zu 
erhalten.*/  

/* Ans : 13.86 */

SELECT *
FROM Invoices
WHERE BillingCity IN ('Brasília', 'Edmonton', 'Vancouver')
ORDER BY InvoiceId DESC
LIMIT 1;

/*----------------------------------------------------------------------------------------------------*/

/* Q8.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Zeigen Sie die Anzahl der von jedem Kunden aufgegebenen Bestellungen an (Hinweis: diese 
befindet sich in der Tabelle „Rechnungen“) und sortieren Sie das Ergebnis nach der Anzahl der Bestellungen in 
absteigender Reihenfolge.*/

/*Wie viele Posten wurden für die 8. Person auf dieser Liste bestellt? Geben Sie diese Nummer unten ein.*/  

/* Ans : 7 */

SELECT CustomerId,
COUNT(InvoiceId) AS COUNT
FROM Invoices
GROUP BY CustomerId
ORDER BY COUNT DESC;

/*----------------------------------------------------------------------------------------------------*/

/* Q9.
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem ER-
Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und die 
richtigen Antworten zu erhalten.*/

/*Abfrage ausführen: Finden Sie die Alben mit 12 oder mehr Titeln.*/

/*Während die Anzahl der zurückgegebenen Datensätze auf 10 begrenzt ist, wird bei korrekter Ausführung der 
Abfrage angezeigt, wie viele Datensätze es insgesamt gibt. Geben Sie diese Nummer unten ein.*/  

/* Ans : 158 */

SELECT AlbumId,COUNT(TrackId)
FROM Tracks
GROUP BY AlbumId
HAVING COUNT(*)>=12;



















