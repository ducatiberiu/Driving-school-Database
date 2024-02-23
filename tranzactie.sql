--Programare cursant Popescu Andrei
SET TRANSACTION NAME 'insert_programare';
INSERT INTO programari_examene (id_programare, tip_examen, data, locatie, id_cursant, id_instructor)
SELECT NULL, 'practic', TO_DATE('13.02.2024', 'DD.MM.YYYY'), 'Strada Petre Andrei, Iasi', 
       (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu'), 
       (SELECT id_instructor FROM instructori WHERE Nume = 'Rusu')
FROM detalii_cursanti dc
WHERE dc.tip_examen_promovat = 'teoretic' AND dc.id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu');
COMMIT;

--Programare cursant Zamfir Alexia
SET TRANSACTION NAME 'insert_programare2';
INSERT INTO programari_examene (id_programare, tip_examen, data, locatie, id_cursant, id_instructor)
SELECT NULL, 'practic', TO_DATE('27.01.2024', 'DD.MM.YYYY'), 'Bulevardul Carol I, Iasi', 
       (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir'), 
       (SELECT id_instructor FROM instructori WHERE Nume = 'Munteanu')
FROM detalii_cursanti dc
WHERE dc.tip_examen_promovat = 'teoretic' AND dc.id_cursant = (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir');
COMMIT;
