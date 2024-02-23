--Operatii de vizualizare
--vizualizarea informatiilor referitoare la parcursul elevului
--(numele si prenumele cursantului, numarul de ore efectuate si tipul de examen promovat)
SELECT Nume, Prenume, Nr_ore_efectuate, Tip_examen_promovat
FROM Cursanti c, Detalii_cursanti d
WHERE c.id_cursant = d.id_cursant;

--vizualizarea informatiilor referitoare la contractul cursantului
--(numele si prenumele cursantului, data semnarii si data incheierii contractului)
SELECT Nume, Prenume, Data_semnarii, Data_incheierii
FROM Cursanti c, Contracte ct
WHERE c.id_cursant = ct.id_cursant;

--vizualizarea informatiilor referitoare la programarile la examen
--(numele si prenumele cursantului, tipul de examen, numele si prenumele instructorului si marca autoturismului)
SELECT c.Nume, c.Prenume, Tip_examen, i.Nume, i.Prenume, Marca
FROM Cursanti c, Instructori i, Programari_examene p, Autoturisme a
WHERE c.id_cursant = p.id_cursant
AND p.id_instructor = i.id_instructor
AND i.id_instructor = a.id_instructor;


--Operatii de validare
--Testare constrangere prefix numar telefon 02 sau 07
UPDATE Cursanti SET Nr_telefon = '0478521463' WHERE Nume = 'Popescu';
UPDATE Instructori SET Nr_telefon = '0378521463' WHERE Nume = 'Rusu';

--Testare constrangere numar telefon contine numai cifre
UPDATE Cursanti SET Nr_telefon = '07of514m63' WHERE Nume = 'Popescu';
UPDATE Instructori SET Nr_telefon = '07kgtd7423' WHERE Nume = 'Rusu';

--Testare constrangere numar telefon unic
UPDATE Cursanti SET Nr_telefon = '0743125698' WHERE Nume = 'Zamfir';
UPDATE Instructori SET Nr_telefon = '0752364897' WHERE Nume = 'Tomescu';

--Testare valabilitate contract poate lua valori intre 0-12
UPDATE detalii_cursanti SET valabilitate_contract = 13 WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu');

--Testare tip transmisie poate fi numai de tip manuala sau automata
UPDATE autoturisme SET tip_transmisie = 'auto' WHERE marca = 'Ford';

--Testare tip_examen_promovat(tabela Detalii_cursanti) si tip_examen(tabela Programari_examene) pot fi numai de tip practic sau teoretic
UPDATE programari_examene SET tip_examen = 'grila' WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu');
UPDATE detalii_cursanti SET tip_examen_promovat = 'scris' WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir');

--Testare atribute de tip VARCHAR2 contin numai litere
UPDATE Cursanti SET Prenume = 'An23ei' WHERE Nume = 'Popescu';
UPDATE Cursanti SET Nume = 'Irimia2' WHERE Prenume = 'Claudia';
UPDATE Instructori SET Nume = '5Rusu' WHERE Prenume = 'Eugen';
UPDATE Instructori SET Prenume = 'Dimitrie55' WHERE Nume = 'Stanciu';


--Operatii de stergere
--Stergerea cursantului cu valabilitate contract egal cu 11
DELETE FROM detalii_cursanti WHERE valabilitate_contract = 11;

--Stergerea contractului cu pretul 2100
DELETE FROM Contracte WHERE Pret = 2100;

--Stergerea programarii din data de 27.01.2024
DELETE FROM programari_examene WHERE data = '27.01.2024';

--Stergerea cursantului cu Prenumele Alexia
DELETE FROM cursanti WHERE Prenume = 'Alexia';

--Stergerea autoturismului cu marca Nissan
DELETE FROM autoturisme WHERE Marca = 'Nissan';

--Stergerea instructorului cu prenumele Teodor
DELETE FROM instructori WHERE Prenume = 'Teodor';


--Operatii de adaugare
--Adaugarea unui nou cursant
INSERT INTO cursanti VALUES(NULL, 'Andoni', 'Razvan', TO_DATE('23.08.2000', 'DD.MM.YYYY'), '0742236487');

--Adaugarea unei noi inregistrari in tabela detalii_cursanti
INSERT INTO detalii_cursanti VALUES(34, 'practic', 5, (SELECT id_cursant FROM cursanti WHERE Nume = 'Andoni'));

--Adaugarea unui nou instructor 
INSERT INTO instructori VALUES(NULL, 'Baciu', 'Nicolae', TO_DATE('07.03.2014', 'DD.MM.YYYY'), '0235471287');

--Adaugarea unui nou autoturism
INSERT INTO autoturisme VALUES(NULL, 'Audi', 'automata', 2019, (SELECT id_instructor FROM instructori WHERE Nume = 'Baciu'));

--Adaugarea unui nou contract
INSERT INTO contracte VALUES(NULL, TO_DATE('12.11.2023', 'DD.MM.YYYY'), TO_DATE('12.11.2024', 'DD.MM.YYYY'), 2250, (SELECT id_cursant FROM cursanti WHERE Nume = 'Andoni'));

--Adaugarea unei noi programari
INSERT INTO programari_examene VALUES(NULL, 'teoretic', TO_DATE('30.05.2024', 'DD.MM.YYYY'), 'Strada Mihail Kogalniceanu, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Andoni'), (SELECT id_instructor FROM instructori WHERE Nume = 'Baciu'));


--Operatii de modificare
--Modificare Nr telefon din tabela Cursanti
UPDATE Cursanti SET nr_telefon = '0743652179' WHERE Nume = 'Popescu';

--Modificare Nr_ore_efectuate din tabela Detalii_cursanti
UPDATE Detalii_cursanti SET nr_ore_efectuate = 35 WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu');

--Modificare Data_eliberarii_atestat din tabela Instructori
UPDATE Instructori SET Data_eliberarii_atestat = TO_DATE('17.09.2005', 'DD.MM.YYYY') WHERE Nume = 'Tomescu';

--Modificare An_fabricatie din tabela Autoturisme
UPDATE Autoturisme SET an_fabricatie = 2010 WHERE Marca = 'Renault';

--Modificare Pret din tabela Contracte
UPDATE Contracte SET pret = 1800 WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Irimia');

--Modificare Tip_examen din tabela Programari_examene
UPDATE Programari_examene SET tip_examen = 'teoretic' WHERE id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Irimia');

