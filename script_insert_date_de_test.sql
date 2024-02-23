--Inserare date in tabela Cursanti
INSERT INTO cursanti VALUES(NULL, 'Popescu', 'Andrei', TO_DATE('08.10.2001', 'DD.MM.YYYY'), '0743125698');
INSERT INTO cursanti VALUES(NULL, 'Irimia', 'Claudia', TO_DATE('14.09.1998', 'DD.MM.YYYY'), '0751248968');
INSERT INTO cursanti VALUES(NULL, 'Dumitrescu', 'Marian', TO_DATE('21.07.2003', 'DD.MM.YYYY'), '0230479652');
INSERT INTO cursanti VALUES(NULL, 'Tudose', 'Florin', TO_DATE('03.11.2000', 'DD.MM.YYYY'), '0230568479');
INSERT INTO cursanti VALUES(NULL, 'Zamfir', 'Alexia', TO_DATE('15.04.1999', 'DD.MM.YYYY'), '0742630247');

SELECT * FROM Cursanti;

--Inserare date in tabela Detalii_cursanti
INSERT INTO detalii_cursanti VALUES(33, 'practic', 3, (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu'));
INSERT INTO detalii_cursanti VALUES(35, 'teoretic', 5, (SELECT id_cursant FROM cursanti WHERE Nume = 'Irimia'));
INSERT INTO detalii_cursanti VALUES(30, 'teoretic', 9, (SELECT id_cursant FROM cursanti WHERE Nume = 'Dumitrescu'));
INSERT INTO detalii_cursanti VALUES(31, 'practic', 6, (SELECT id_cursant FROM cursanti WHERE Nume = 'Tudose'));
INSERT INTO detalii_cursanti VALUES(32, 'teoretic', 11, (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir'));

SELECT * FROM detalii_cursanti;

--Inserare date in tabela Instructori
INSERT INTO instructori VALUES(NULL, 'Rusu', 'Eugen', TO_DATE('14.09.2015', 'DD.MM.YYYY'), '0752364897');
INSERT INTO instructori VALUES(NULL, 'Stanciu', 'Dimitrie', TO_DATE('11.02.2007', 'DD.MM.YYYY'), '0743698421');
INSERT INTO instructori VALUES(NULL, 'Tomescu', 'Adrian', TO_DATE('02.11.1997', 'DD.MM.YYYY'), '0230489635');
INSERT INTO instructori VALUES(NULL, 'Cazacu', 'Octavian', TO_DATE('23.07.2010', 'DD.MM.YYYY'), '0743745639');
INSERT INTO instructori VALUES(NULL, 'Munteanu', 'Teodor', TO_DATE('10.06.2019', 'DD.MM.YYYY'), '0230316958');

SELECT * FROM instructori;

--Inserare date in tabela Autoturisme
INSERT INTO autoturisme VALUES(NULL, 'Ford', 'manuala', 2018, (SELECT id_instructor FROM instructori WHERE Nume = 'Rusu'));
INSERT INTO autoturisme VALUES(NULL, 'Volkswagen', 'automata', 2020, (SELECT id_instructor FROM instructori WHERE Nume = 'Stanciu'));
INSERT INTO autoturisme VALUES(NULL, 'Renault', 'manuala', 2015, (SELECT id_instructor FROM instructori WHERE Nume = 'Tomescu'));
INSERT INTO autoturisme VALUES(NULL, 'Opel', 'manuala', 2019, (SELECT id_instructor FROM instructori WHERE Nume = 'Cazacu'));
INSERT INTO autoturisme VALUES(NULL, 'Nissan', 'automata', 2021, (SELECT id_instructor FROM instructori WHERE Nume = 'Munteanu'));

SELECT * FROM autoturisme;

--Inserare date in tabela Contracte
INSERT INTO contracte VALUES(NULL, TO_DATE('17.06.2023', 'DD.MM.YYYY'), TO_DATE('17.06.2024', 'DD.MM.YYYY'), 2200, (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu'));
INSERT INTO contracte VALUES(NULL, TO_DATE('24.10.2023', 'DD.MM.YYYY'), TO_DATE('24.10.2024', 'DD.MM.YYYY'), 2000, (SELECT id_cursant FROM cursanti WHERE Nume = 'Irimia'));
INSERT INTO contracte VALUES(NULL, TO_DATE('05.02.2023', 'DD.MM.YYYY'), TO_DATE('05.02.2024', 'DD.MM.YYYY'), 2400, (SELECT id_cursant FROM cursanti WHERE Nume = 'Dumitrescu'));
INSERT INTO contracte VALUES(NULL, TO_DATE('11.09.2023', 'DD.MM.YYYY'), TO_DATE('11.09.2024', 'DD.MM.YYYY'), 1900, (SELECT id_cursant FROM cursanti WHERE Nume = 'Tudose'));
INSERT INTO contracte VALUES(NULL, TO_DATE('02.07.2023', 'DD.MM.YYYY'), TO_DATE('02.07.2024', 'DD.MM.YYYY'), 2100, (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir'));

SELECT * FROM contracte;

--Inserare date in tabela Programari_examene
INSERT INTO programari_examene VALUES(NULL, 'teoretic', TO_DATE('13.02.2024', 'DD.MM.YYYY'), 'Strada Petre Andrei, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Popescu'), (SELECT id_instructor FROM instructori WHERE Nume = 'Rusu'));
INSERT INTO programari_examene VALUES(NULL, 'practic', TO_DATE('07.03.2024', 'DD.MM.YYYY'), 'Strada Arcu, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Irimia'), (SELECT id_instructor FROM instructori WHERE Nume = 'Stanciu'));
INSERT INTO programari_examene VALUES(NULL, 'practic', TO_DATE('20.11.2023', 'DD.MM.YYYY'), 'Strada Libertatii, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Dumitrescu'), (SELECT id_instructor FROM instructori WHERE Nume = 'Tomescu'));
INSERT INTO programari_examene VALUES(NULL, 'teoretic', TO_DATE('09.05.2024', 'DD.MM.YYYY'), 'Strada Luminii, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Tudose'), (SELECT id_instructor FROM instructori WHERE Nume = 'Cazacu'));
INSERT INTO programari_examene VALUES(NULL, 'practic', TO_DATE('27.01.2024', 'DD.MM.YYYY'), 'Bulevardul Carol I, Iasi', (SELECT id_cursant FROM cursanti WHERE Nume = 'Zamfir'), (SELECT id_instructor FROM instructori WHERE Nume = 'Munteanu'));

SELECT * FROM programari_examene;
