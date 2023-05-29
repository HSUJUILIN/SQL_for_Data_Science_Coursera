/*
Alle Fragen in diesem Quiz werden aus der Open-Source-Datenbank Chinook abgerufen. Sehen Sie sich das ER-Diagramm
unten an und machen Sie sich mit den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können
und die richtigen Antworten zu erhalten.
*/

/*-----------------------------------------------------------------------------------------------------------*/

/*Q1.
Finden Sie mithilfe einer Unterabfrage die Namen aller Titel des Albums „Californication“.*/

/*Welchen Namen trägt der 8. Titel?*/

/*Ans: Porcelain */

SELECT Name
FROM tracks
WHERE AlbumId IN (SELECT AlbumId
    FROM Albums
    WHERE Title = 'Californication');

/*-----------------------------------------------------------------------------------------------------------*/

/*Q2.
Ermitteln Sie die Gesamtzahl der Rechnungen für jeden Kunden zusammen mit dem vollständigen Namen, der Stadt
und der E-Mail-Adresse des Kunden.*/

/*Führen Sie die oben beschriebene Abfrage aus. Wie lautet die E-Mail-Adresse der 5. Person, František
Wichterlová? Geben Sie die Antwort unten ein (Sie können sie kopieren und einfügen).*/

/*Ans: frantisekw@jetbrains.com */

SELECT FirstName, LastName, City, Email, COUNT(Invoices.CustomerId) AS Total_Number
FROM Customers
LEFT JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
GROUP BY Customers.CustomerId;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q3.
Rufen Sie Titelnamen, Album, artistID und trackID für alle Alben ab.*/

/*Wie lautet der Songtitel von trackID 12 aus dem Album „For Those About to Rock We Salute You“? Geben Sie die 
Antwort unten ein.*/

/*Ans: Breaking The Rules*/

SELECT TrackId, Tracks.AlbumId, Name
FROM Tracks
INNER JOIN Albums
ON Tracks.AlbumId = Albums.AlbumId;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q4.
Rufen Sie eine Liste mit dem Nachnamen des Managers und den Nachnamen der ihm unterstellten Mitarbeiter ab.*/

/*Führen Sie die oben beschriebene Abfrage aus. Wie heißen die dem Manager Mitchell unterstellten Mitarbeiter
(wählen Sie alle zutreffenden Antworten aus)?*/

/*Ans: King, Callahan*/

SELECT M.LastName AS Manager, E.LastName AS Employee
FROM Employees E
INNER JOIN Employees M
ON E.ReportsTo = M.EmployeeId;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q5.
Suchen Sie den Namen und die ID der Künstler, die keine Alben haben.*/

/*Führen Sie die oben beschriebene Abfrage aus. Zwei der zurückgegebenen Datensätze haben denselben Nachnamen. 
Geben Sie diesen Namen unten ein.*/

/*Ans: Gilberto*/

SELECT Name AS Artist, Artists.ArtistId, Albums.Title AS AlTi
FROM Artists
LEFT JOIN Albums
ON Artists.ArtistId = Albums.ArtistId
WHERE AlTi IS NULL;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q6.
Verwenden Sie eine UNION (Vereinigung), um eine Liste aller Vornamen und Nachnamen der Mitarbeiter und Kunden 
zu erstellen, die in absteigender Reihenfolge nach dem Nachnamen geordnet ist.*/

/*Führen Sie die oben beschriebene Abfrage aus. Bestimmen Sie, wie der Nachname des 6. Datensatzes lautet. 
Geben Sie ihn unten ein. Denken Sie daran, in absteigender Reihenfolge zu sortieren, um die richtige Antwort 
zu erhalten.*/

/*Ans: Taylor*/

SELECT FirstName, LastName
FROM Employees
UNION SELECT FirstName, LastName
FROM Customers
ORDER BY LastName DESC;



/*-----------------------------------------------------------------------------------------------------------*/

/*Q7.
VPrüfen Sie, ob es Kunden gibt, bei denen die Stadt der Rechnungsstellung eine andere ist als die Stadt des 
Kunden.*/

/*Geben Sie Ihre Antwort unten an.*/

/*Ans: 0*/

SELECT C.FirstName, C.LastName, C.City AS CustomerCity, I.BillingCity
FROM Customers C
INNER JOIN Invoices I
ON C.CustomerId = I.CustomerId
WHERE CustomerCity != BillingCity