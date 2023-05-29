/*
Alle Fragen in diesem Quiz werden aus der Open-Source-Datenbank Chinook abgerufen. Sehen Sie sich das ER-Diagramm
unten an und machen Sie sich mit den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können
und die richtigen Antworten zu erhalten.
*/

/*-----------------------------------------------------------------------------------------------------------*/

/*Q1.
Wie viele Alben hat der Künstler Led Zeppelin?*/

/*Ans: 14 */

SELECT Name, COUNT(Title)
FROM artists
LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
WHERE artists.Name='Led Zeppelin';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q2.
Erstellen Sie eine Liste der Albumtitel und der Stückpreise für den Künstler „Audioslave“.*/

/*Wie viele Datensätze werden zurückgegeben?*/

/*In der Ausgabe werden nur 25 Datensätze angezeigt. Schauen Sie daher am Ende der Ausgabe, wie viele Datensätze
abgerufen wurden.*/

/*Ans: 40 */

SELECT artists.Name, Title AS [Album Titles], UnitPrice
FROM artists
LEFT JOIN albums
ON artists.ArtistId = albums.ArtistId
LEFT JOIN tracks
ON albums.AlbumId = tracks.AlbumId
WHERE artists.Name = 'Audioslave';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q3.
 Suchen Sie den Vor- und Nachnamen aller Kunden, für die keine Rechnung vorliegt. Werden irgendwelche Kunden von 
 der Abfrage zurückgegeben? */

/*Ans: Nein */

SELECT customers.CustomerId AS CID, FirstName, LastName, COUNT(invoices.InvoiceId) AS IvCount
FROM customers
LEFT JOIN invoices
ON customers.CustomerId = invoices.CustomerId
GROUP BY CID
ORDER BY IvCount;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q4.
 Ermitteln Sie den Gesamtpreis für jedes Album.*/

 /*Wie hoch ist der Gesamtpreis für das Album „Big Ones“?*/

/*Ans: 14.85 */

SELECT Title, SUM(tracks.UnitPrice) AS Total_Price
FROM albums
LEFT JOIN tracks
ON albums.AlbumId = tracks.AlbumId
WHERE Title = 'Big Ones';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q5.
 Wie viele Datensätze werden erstellt, wenn Sie eine kartesische Verknüpfung auf die Tabelle der Rechnungen und
 Rechnungsposten anwenden?*/

 /*In der Ausgabe werden nur 25 Datensätze angezeigt. Schauen Sie daher am Ende der Ausgabe, wie viele Datensätze 
 abgerufen wurden.*/

/*Ans: 922880 */

SELECT invoices.InvoiceId, invoice_items.TrackId
FROM invoices CROSS JOIN invoice_items;