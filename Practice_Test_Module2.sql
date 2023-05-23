/*
Für alle Fragen in diesem Übungssatz verwenden Sie die Tabelle „Salary by Job Range“. Dies ist eine einzige 
Tabelle mit dem Titel: salary_range_by_job_classification. Diese Tabelle enthält die folgenden Spalten:

SetID

Job_Code 

Eff_Date 

Sal_End_Date 

Salary_setID 

Sal_Plan 

Grade 

Step 

Biweekly_High_Rate 

Biweekly_Low_Rate 

Union_Code 

Extended_Step 

Pay_Type

Bitte beziehen Sie sich auf diese Informationen, um Abfragen zur Beantwortung der Fragen zu schreiben. Sind Sie 
bereit, loszulegen?
*/

/*-----------------------------------------------------------------------------------------------------------*/

/*Q2.
Ermitteln Sie die eindeutigen Werte für den erweiterten Schritt. Der Code wurde begonnen, Sie müssen jedoch 
die dritte Zeile selbst programmieren, bevor Sie die Abfrage ausführen.*/

/*Welcher der folgenden Werte ist kein eindeutiger Wert?*/

/*Ans: 5 */

SELECT 
DISTINCT Extended_step
FROM salary_range_by_job_classification;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q3.
Wie hoch ist der minimale zweiwöchentliche Vergütungssatz (ohne 0,00 $) (bitte geben Sie bei Ihrer Antwort das 
Dollarzeichen und das Dezimalkomma an)? Der Code wurde begonnen, Sie müssen jedoch die letzte Codezeile 
erweitern, um die korrekte Antwort zu erhalten.*/

/*Ans: $15.00 */

SELECT 
Biweekly_high_Rate
FROM salary_range_by_job_classification
WHERE Biweekly_high_Rate like '$__.%'
AND Biweekly_high_Rate not like '$0.00';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q4.
Wie hoch ist der maximale zweiwöchentliche Vergütungssatz (bitte geben Sie bei Ihrer Antwort das Dollarzeichen 
und das Dezimalkomma an)? Der Code wurde begonnen, Sie müssen jedoch die letzte Codezeile erweitern, um die 
korrekte Antwort zu erhalten.*/

/*Ans: $12120.77 */

SELECT 
Biweekly_high_Rate
FROM salary_range_by_job_classification
WHERE Biweekly_high_Rate like '$_____.%';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q5.
Wie lautet die Lohnart für alle Stellencodes, die mit „03“ beginnen? Der Code wurde begonnen, Sie müssen jedoch 
die vierte und fünfte Zeile selbst programmieren, bevor Sie die Abfrage ausführen.*/

/*Ans: B */

SELECT
Job_Code,
Pay_Type
FROM salary_range_by_job_classification
WHERE Job_Code like '03%';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q6.
Führen Sie eine Abfrage aus, um das Gültigkeitsdatum (eff_date) oder das Gehaltsenddatum (sal_end_date) für die 
Besoldungsgruppe Q90H0 zu finden. Der Code wurde begonnen, Sie müssen jedoch die dritte bis sechste Zeile selbst 
programmieren, bevor Sie die Abfrage ausführen. */

/*Welches ist das Gehaltsenddatum (sal_end_date) für die Besoldungsgruppe Q90H0? (Datumsformat wie folgt eingeben: 
tt.mm.jjjj)*/

/*Ans: 30.06.2010 */

SELECT
Grade,
Eff_Date,
Sal_End_date
FROM salary_range_by_job_classification
WHERE Grade = 'Q90H0';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q7.
Sortieren Sie den zweiwöchentlichen Mindestsatz in aufsteigender Reihenfolge. Es gibt keinen Einstiegscode, da 
Sie die Abfrage selbst schreiben und ausführen müssen. Hinweis: Es gibt 4 Zeilen für die Ausführung dieser 
Abfrage.*/

/*Sind diese Werte richtig sortiert?*/

/*Ans: Nein */

SELECT
Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q8.
Schreiben Sie eine Abfrage und führen Sie sie ohne Startcode aus, um diese Frage zu beantworten: Welchem Schritt 
entsprechen die Stellencodes 0110-0400?Hinweis: Es gibt 6 Zeilen, um diese Abfrage auszuführen.*/

/*Ans: 1 */

SELECT 
Step
,Job_Code
FROM salary_range_by_job_classification
WHERE Job_Code between 0110 
AND 0400;

/*-----------------------------------------------------------------------------------------------------------*/

/*Q9.
Schreiben Sie eine Abfrage und führen Sie sie ohne Startcode oder Hinweise aus, um diese Frage zu beantworten: 
Wie hoch ist der zweiwöchentliche Höchstsatz abzüglich des zweiwöchentlichen Mindestsatzes für Stellencode 0170?*/

/*Ans: 0 */

SELECT
Job_Code
,(Biweekly_High_Rate-Biweekly_Low_Rate) AS DIFF
FROM salary_range_by_job_classification
WHERE Job_Code = '0170';

/*-----------------------------------------------------------------------------------------------------------*/

/*Q10.
Schreiben Sie eine Abfrage und führen Sie sie ohne Startcode oder Hinweise aus, um diese Frage zu beantworten: 
Was ist der erweiterte Schritt für die Lohnarten M, H und D? */

/*Ans: 0 */

SELECT
Pay_Type
,Extended_Step
FROM salary_range_by_job_classification
WHERE Pay_Type IN ('M', 'H', 'D');

/*-----------------------------------------------------------------------------------------------------------*/

/*Q11.
Schreiben Sie eine Abfrage und führen Sie sie ohne Startcode oder Hinweise aus, um diese Frage zu beantworten: 
Was ist der Schritt für den Gewerkschaftscode 990 und den Setnamen SFMTA oder COMMN? */

/*Ans: 1 */

SELECT
Step
,Union_Code
,SetID
FROM salary_range_by_job_classification
WHERE Union_Code = 990
AND SetID IN ('SFMTA', 'COMMN');