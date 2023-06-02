/*
Alle Fragen in diesem Quiz beziehen sich auf die Open-Source-Datenbank Chinook. Machen Sie sich mit dem 
ER-Diagramm sowie den Tabellen- und Spaltennamen vertraut, um genaue Abfragen schreiben zu können und 
die richtigen Antworten zu erhalten.
*/

/*-----------------------------------------------------------------------------------------------------------*/

/*Q1.
Rufen Sie eine Liste von Kundennummern mit dem vollständigen Namen und der Adresse des Kunden sowie einer 
Kombination aus Stadt und Land ab. Achten Sie darauf, ein Leerzeichen zwischen den beiden zu setzen und in 
GROSSBUCHSTABEN zu schreiben. (z. B. LOS ANGELES USA)*/

/*Wie lauten die Ergebnisse für Stadt und Land für CustomerID 16?*/

/*Ans: MOUNTAIN VIEW USA */

SELECT 
CustomerId
,FirstName || " " || LastName AS FullName
,Address
,UPPER( City || " " || Country) AS UrbanState
FROM Customers
WHERE CustomerId = 16;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q2.
Erstellen Sie eine neue Mitarbeiter-Benutzerkennung, indem Sie die ersten 4 Buchstaben des Vornamens des 
Mitarbeiters mit den ersten 2 Buchstaben des Nachnamens des Mitarbeiters kombinieren. Schreiben Sie das neue 
Feld in Kleinbuchstaben und rufen Sie jeden einzelnen Schritt ab, um Ihre Arbeit zu zeigen.*/

/*Wie lautet das Endergebnis für Robert King?*/

/*Ans: robeki */

SELECT
FirstName
,LOWER ( SUBSTR(FirstName, 1, 4) ) AS FirstFourLetters
,LOWER ( SUBSTR(LastName, 1, 2) ) AS FirstTwoLetters
,LOWER (SUBSTR(FirstName, 1, 4) ) || LOWER (SUBSTR(LastName, 1, 2) ) AS NewID
FROM Employees;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q3.
Zeigen Sie eine Liste der Mitarbeiter an, die seit 15 oder mehr Jahren für das Unternehmen tätig sind, indem 
Sie die Funktion für das aktuelle Datum verwenden. Sortieren Sie aufsteigend nach Nachname.*/

/*Wie lautet der Nachname der letzten Person in der zurückgegebenen Liste?*/

/*Ans: Peacock */

SELECT 
FirstName
,LastName
,HireDate
,(STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate)) - (STRFTIME('%m-%d', 'now') - STRFTIME('%m-%d', HireDate)) AS seniority
FROM Employees
WHERE seniority >= 15
ORDER BY LastName ASC;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q4.
Beantworten Sie die folgende Frage, indem Sie ein Profil der Tabelle „Customers“ erstellen.*/

/*Gibt es irgendwelche Spalten mit Nullwerten? Geben Sie unten an, welche. Wählen Sie alle zutreffenden 
Antworten aus.*/

/*Ans: Phone, PostalCode, Company, Fax */

/*SELECT *
FROM Customers
WHERE Phone IS NULL;
SELECT *
FROM Customers
WHERE FirstName IS NULL;*/
SELECT *
FROM Customers
WHERE PostalCode IS NULL;
/*SELECT *
FROM Customers
WHERE Company IS NULL;
SELECT *
FROM Customers
WHERE Address IS NULL;
SELECT *
FROM Customers
WHERE Fax IS NULL;*/

/*-----------------------------------------------------------------------------------------------------------*/

/*Q5.
Finden Sie die Städte mit den meisten Kunden und ordnen Sie sie in absteigender Reihenfolge.*/

/*In welcher der folgenden Städte gibt es 2 Kunden?*/

/*Ans: London, São Paulo, Mountain View */

SELECT 
City
,COUNT(City) AS Num
FROM Customers
GROUP BY City
/*HAVING Num=2*/
ORDER BY Num DESC;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q6.
Erstellen Sie eine neue Kundenrechnungsnummer, indem Sie die Rechnungsnummer eines Kunden mit seinem Vor- und 
Nachnamen kombinieren und Ihre Abfrage in der folgenden Reihenfolge durchführen: firstname, lastname und invoiceID.*/

/*Wählen Sie alle korrekten „AstridGruber“-Einträge aus, die in Ihren Ergebnissen unten angezeigt werden. Wählen
Sie alle zutreffenden Antworten aus.*/

/*Ans: 273, 296, 370 */

SELECT
FirstName
,LastName
,Invoices.InvoiceId
,FirstName || LastName || Invoices.InvoiceId AS NewId
FROM Customers
INNER JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
WHERE NewId Like 'AstridGruber%';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q7.
Erstellen Sie eine neue Kundenrechnungsnummer, indem Sie die Rechnungsnummer eines Kunden mit seinem Vor- und 
Nachnamen kombinieren und Ihre Abfrage in der folgenden Reihenfolge durchführen: firstname, lastname und invoiceID.*/

/*Wählen Sie alle korrekten „AstridGruber“-Einträge aus, die in Ihren Ergebnissen unten angezeigt werden. Wählen
Sie alle zutreffenden Antworten aus.*/

/*Ans: 273, 296, 370 */

SELECT
FirstName
,LastName
,Invoices.InvoiceId
,FirstName || LastName || Invoices.InvoiceId AS NewId
FROM Customers
INNER JOIN Invoices
ON Customers.CustomerId = Invoices.CustomerId
WHERE NewId Like 'AstridGruber%';