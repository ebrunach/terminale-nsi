CREATE TABLE usager (
    nom VARCHAR(90) NOT NULL, 
    prenom VARCHAR(90) NOT NULL,
    adresse VARCHAR(300) NOT NULL, 
    cp VARCHAR(5) NOT NULL,
    ville VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL,
    code_barre CHAR(15) PRIMARY KEY);

CREATE TABLE livre (titre VARCHAR(300) NOT NULL,
                    editeur VARCHAR(90) NOT NULL,
                    annee INT NOT NULL,
                    isbn CHAR(14) PRIMARY KEY);

CREATE TABLE auteur (a_id INT PRIMARY KEY,
                    nom VARCHAR(90) NOT NULL,
                    prenom VARCHAR(90) NOT NULL);

CREATE TABLE auteur_de (a_id INT REFERENCES Auteur(a_id),
                        isbn CHAR(14)
                        REFERENCES Livre(isbn),
                        PRIMARY KEY (a_id, isbn));

CREATE TABLE emprunt (code_barre CHAR(15)
                    REFERENCES Usager(code_barre),
                    isbn CHAR(14) PRIMARY KEY
                    REFERENCES Livre(isbn),
                    retour DATE NOT NULL);


INSERT INTO livre VALUES ('Les Aventures de Huckleberry Finn', 'Flammarion', '2020', '978-2081509511');
INSERT INTO auteur VALUES (0, 'Twain', 'Mark');
INSERT INTO auteur_de VALUES (0, '978-2081509511');

INSERT INTO livre VALUES ('Fondation et Empire', 'Editions Denoël', '1999', '978-2207249123');
INSERT INTO auteur VALUES (1, 'Asimov', 'Isaac');
INSERT INTO auteur_de VALUES (1, '978-2207249123');

INSERT INTO livre VALUES ('Akira', 'Glénat', '2000', '978-2723428262');
INSERT INTO auteur VALUES (2, 'Ōtomo', 'Katsuhiro');
INSERT INTO auteur_de VALUES (2, '978-2723428262');

INSERT INTO livre VALUES ('Les Robots', 'Editions Milan', '2017', '978-2745989857');
INSERT INTO auteur VALUES (3, 'Martelle', 'Myriam');
INSERT INTO auteur_de VALUES (3, '978-2745989857');

INSERT INTO auteur VALUES (4, 'Touache', 'Sébastien');
INSERT INTO auteur_de VALUES (4, '978-2745989857');

INSERT INTO livre VALUES ('Astérix chez les Pictes', 'Editions Albert René', '2013', '978-2864972662');
INSERT INTO auteur VALUES (5, 'Goscinny', 'René');
INSERT INTO auteur_de VALUES (5, '978-2864972662');

INSERT INTO auteur VALUES (6, 'Ferri', 'Jean-Yves');
INSERT INTO auteur_de VALUES (6, '978-2864972662');

INSERT INTO auteur VALUES (7, 'Uderzo', 'Albert');
INSERT INTO auteur_de VALUES (7, '978-2864972662');

INSERT INTO auteur VALUES (8, 'Conrad', 'Didier');
INSERT INTO auteur_de VALUES (8, '978-2864972662');

INSERT INTO livre VALUES ('Les Monades urbaines', 'Robert Laffont', '2016', '978-2221197691');
INSERT INTO auteur VALUES (9, 'SILVERBERG', 'Robert');
INSERT INTO auteur_de VALUES (9, '978-2221197691');

INSERT INTO livre VALUES ('Les Voyages de Gulliver', 'Primento', '2015', '978-2335008586');
INSERT INTO auteur VALUES (10, 'Swift', 'Jonathan');
INSERT INTO auteur_de VALUES (10, '978-2335008586');

INSERT INTO auteur VALUES (11, 'Ligaran,', '');
INSERT INTO auteur_de VALUES (11, '978-2335008586');
INSERT INTO livre VALUES ('Lolita', 'Penguin UK', '2012', '978-0141391601');

INSERT INTO auteur VALUES (12, 'Nabokov', 'Vladimir');
INSERT INTO auteur_de VALUES (12, '978-0141391601');
INSERT INTO livre VALUES ('La Nuit des temps', 'Presses de la Cité', '2014', '978-2258116429');

INSERT INTO auteur VALUES (13, 'BARJAVEL', 'René');
INSERT INTO auteur_de VALUES (13, '978-2258116429');
INSERT INTO livre VALUES ('Ravage', 'Editions Gallimard', '2014', '978-2072534911');

INSERT INTO auteur VALUES (14, 'Barjavel', 'René');
INSERT INTO auteur_de VALUES (14, '978-2072534911');
INSERT INTO livre VALUES ('Les Lauriers de César', 'Educa Books', '2008', '978-2012101500');

INSERT INTO auteur_de VALUES (5, '978-2012101500');
INSERT INTO auteur_de VALUES (7, '978-2012101500');
INSERT INTO livre VALUES ('Niourk', 'French Pulp éditions', '2018', '979-1025100639');

INSERT INTO auteur VALUES (15, 'Wul', 'Stefan');
INSERT INTO auteur_de VALUES (15, '979-1025100639');
INSERT INTO livre VALUES ('Le Meilleur des mondes', 'Plon', '2013', '978-2259221702');

INSERT INTO auteur VALUES (16, 'HUXLEY', 'Aldous');
INSERT INTO auteur_de VALUES (16, '978-2259221702');
INSERT INTO livre VALUES ('Berlin Alexanderplatz', 'Editions Gallimard', '1933', '978-2070219292');

INSERT INTO auteur VALUES (17, 'Döblin', 'Alfred');
INSERT INTO auteur_de VALUES (17, '978-2070219292');
INSERT INTO livre VALUES ('Fahrenheit 451', 'Simon and Schuster', '2011', '978-1439142677');

INSERT INTO auteur VALUES (18, 'Bradbury', 'Ray');
INSERT INTO auteur_de VALUES (18, '978-1439142677');
INSERT INTO livre VALUES ('La Mort d''Ivan Ilitch', 'Flammarion', '2015', '978-2081364509');

INSERT INTO auteur VALUES (19, 'Tolstoï', 'Léon');
INSERT INTO auteur_de VALUES (19, '978-2081364509');
INSERT INTO livre VALUES ('Croisière sans escale', 'Editions Denoël', '1990', '978-2207500293');

INSERT INTO auteur VALUES (20, 'Aldiss', 'Brian Wilson');
INSERT INTO auteur_de VALUES (20, '978-2207500293');

INSERT INTO livre VALUES ('Le Vieil Homme et la Mer', 'Editions Gallimard', '2018', '978-2072762093');
INSERT INTO auteur VALUES (21, 'Hemingway', 'Ernest');
INSERT INTO auteur_de VALUES (21, '978-2072762093');

INSERT INTO livre VALUES ('Mrs Dalloway', 'Flammarion', '2015', '978-2081358881');
INSERT INTO auteur VALUES (22, 'Woolf', 'Virginia');
INSERT INTO auteur_de VALUES (22, '978-2081358881');
INSERT INTO livre VALUES ('L''Idiot', 'Les Editions de Londres', '2019', '978-1911572909');
INSERT INTO auteur VALUES (23, 'Fiodor', 'Dostoïevski');
INSERT INTO auteur_de VALUES (23, '978-1911572909');
INSERT INTO livre VALUES ('Le Carnet d''or', 'Le Livre de poche', '1980', '978-2253025320');
INSERT INTO auteur VALUES (24, 'Lessing', 'Doris');
INSERT INTO auteur_de VALUES (24, '978-2253025320');
INSERT INTO livre VALUES ('Les Grandes Espérances', 'BoD - Books on Demand', '2019', '978-2322185801');
INSERT INTO auteur VALUES (25, 'Dickens', 'Charles');
INSERT INTO auteur_de VALUES (25, '978-2322185801');
INSERT INTO livre VALUES ('Astérix et Cléopâtre', 'Dargaud', '1999', '978-2012100060');
INSERT INTO auteur_de VALUES (5, '978-2012100060');
INSERT INTO auteur_de VALUES (7, '978-2012100060');
INSERT INTO livre VALUES ('Madame Bovary', 'UPblisher', '2016', '978-2759902293');
INSERT INTO auteur VALUES (26, 'Flaubert', 'Gustave');
INSERT INTO auteur_de VALUES (26, '978-2759902293');
INSERT INTO livre VALUES ('Les Frères Karamazov', 'Les éditions Pulsio', '2016', '978-2371131118');
INSERT INTO auteur VALUES (27, 'Dostoïevski', 'Fiodor');
INSERT INTO auteur_de VALUES (27, '978-2371131118');
INSERT INTO livre VALUES ('Moby Dick', 'Campfire Graphic Novels', '2010', '978-8190732673');
INSERT INTO auteur VALUES (28, 'Melville', 'Herman');
INSERT INTO auteur_de VALUES (28, '978-8190732673');
INSERT INTO livre VALUES ('Demain les chiens', 'J''ai Lu', '2015', '978-2290112168');
INSERT INTO auteur VALUES (29, 'Simak', 'Clifford D.');
INSERT INTO auteur_de VALUES (29, '978-2290112168');
INSERT INTO livre VALUES ('Le Tour de Gaule d''Astérix', 'Educa Books', '2007', '978-2012101685');
INSERT INTO auteur_de VALUES (5, '978-2012101685');
INSERT INTO auteur_de VALUES (7, '978-2012101685');
INSERT INTO livre VALUES ('1984', 'Houghton Mifflin Harcourt', '1983', '978-0547249643');
INSERT INTO auteur VALUES (30, 'Orwell', 'George');
INSERT INTO auteur_de VALUES (30, '978-0547249643');
INSERT INTO livre VALUES ('Don Quichotte', 'Les éditions Pulsio', '2016', '978-2371130418');
INSERT INTO auteur VALUES (31, 'Cervantes', 'Miguel de');
INSERT INTO auteur_de VALUES (31, '978-2371130418');
INSERT INTO livre VALUES ('Le Château de Lord Valentin', 'Robert Laffont', '2017', '978-2221216361');
INSERT INTO auteur_de VALUES (9, '978-2221216361');
INSERT INTO livre VALUES ('Le Père Goriot', 'Primento', '2012', '978-2806231697');
INSERT INTO auteur VALUES (32, 'Balzac', 'Honoré de');
INSERT INTO auteur_de VALUES (32, '978-2806231697');
INSERT INTO livre VALUES ('Le Procès', 'Flammarion', '2014', '978-2081351981');
INSERT INTO auteur VALUES (33, 'Kafka', 'Franz');
INSERT INTO auteur_de VALUES (33, '978-2081351981');
INSERT INTO livre VALUES ('L''Homme qui rétrécit', 'Editions Gallimard', '2017', '978-2072457340');
INSERT INTO auteur VALUES (34, 'Matheson', 'Richard');
INSERT INTO auteur_de VALUES (34, '978-2072457340');
INSERT INTO livre VALUES ('Chroniques martiennes', 'Editions Gallimard', '2016', '978-2072455162');
INSERT INTO auteur_de VALUES (18, '978-2072455162');
INSERT INTO livre VALUES ('Le Roi Lear', 'Éditions Actes Sud', '2015', '978-2330052768');
INSERT INTO auteur VALUES (35, 'Py', 'Olivier');
INSERT INTO auteur_de VALUES (35, '978-2330052768');
INSERT INTO auteur VALUES (36, 'Shakespeare', 'William');
INSERT INTO auteur_de VALUES (36, '978-2330052768');
INSERT INTO livre VALUES ('Le Cadeau de César', 'Educa Books', '2005', '978-2012101531');
INSERT INTO auteur_de VALUES (5, '978-2012101531');
INSERT INTO auteur_de VALUES (7, '978-2012101531');
INSERT INTO livre VALUES ('La Planète des singes', 'Julliard', '2011', '978-2260019183');
INSERT INTO auteur VALUES (37, 'BOULLE', 'Pierre');
INSERT INTO auteur_de VALUES (37, '978-2260019183');
INSERT INTO livre VALUES ('Orgueil et Préjugés', 'Fleurus', '2015', '978-2215130475');
INSERT INTO auteur VALUES (38, 'Austen', 'Jane');
INSERT INTO auteur_de VALUES (38, '978-2215130475');
INSERT INTO livre VALUES ('Une maison de poupée', 'Éditions Actes Sud', '2016', '978-2330068349');
INSERT INTO auteur VALUES (39, 'Ibsen', 'Henrik');
INSERT INTO auteur_de VALUES (39, '978-2330068349');
INSERT INTO livre VALUES ('Vermilion Sands', 'Carroll & Graf Pub', '1988', '978-0881844221');
INSERT INTO auteur VALUES (40, 'Ballard', 'J. G.');
INSERT INTO auteur_de VALUES (40, '978-0881844221');
INSERT INTO livre VALUES ('La Grande Traversée', 'Seuil Jeunesse', '2014', '979-1023500448');
INSERT INTO auteur VALUES (41, 'Demois', 'Agathe');
INSERT INTO auteur_de VALUES (41, '979-1023500448');
INSERT INTO auteur VALUES (42, 'Godeau', 'Vincent');
INSERT INTO auteur_de VALUES (42, '979-1023500448');
INSERT INTO livre VALUES ('L''Étranger', 'Editions Gallimard', '2012', '978-2072376429');
INSERT INTO auteur VALUES (43, 'Camus', 'Albert');
INSERT INTO auteur_de VALUES (43, '978-2072376429');
INSERT INTO livre VALUES ('L''Île des morts', 'POL Editeur', '2010', '978-2846825573');
INSERT INTO auteur VALUES (44, 'Frémon', 'Jean');
INSERT INTO auteur_de VALUES (44, '978-2846825573');
INSERT INTO livre VALUES ('Par-delà le mur du sommeil', 'République des Lettres', '2018', '978-2824904269');
INSERT INTO auteur VALUES (45, 'Lovecraft', 'H. P.');
INSERT INTO auteur_de VALUES (45, '978-2824904269');
INSERT INTO livre VALUES ('Le Papyrus de César', 'Editions Albert René', '2015', '978-2864972716');
INSERT INTO auteur_de VALUES (6, '978-2864972716');
INSERT INTO livre VALUES ('La Main de Zeï', 'Bragelonne Classic', '2016', '978-2820511034');
INSERT INTO auteur VALUES (46, 'Camp', 'Lyon Sprague de');
INSERT INTO auteur_de VALUES (46, '978-2820511034');
INSERT INTO livre VALUES ('Beloved', 'Christian Bourgois', '2015', '978-2267028133');
INSERT INTO auteur VALUES (47, 'Morrison', 'Toni');
INSERT INTO auteur_de VALUES (47, '978-2267028133');
INSERT INTO livre VALUES ('La Conscience de Zeno', 'République des Lettres', '2015', '978-2824902371');
INSERT INTO auteur VALUES (48, 'Svevo', 'Italo');
INSERT INTO auteur_de VALUES (48, '978-2824902371');
INSERT INTO livre VALUES ('Delirium Circus', 'Bragelonne', '2013', '978-2820508935');
INSERT INTO auteur VALUES (49, 'Pelot', 'Pierre');
INSERT INTO auteur_de VALUES (49, '978-2820508935');
INSERT INTO livre VALUES ('Médée', 'Hatier', '2013', '978-2218972324');
INSERT INTO auteur VALUES (50, 'Corneille', '');
INSERT INTO auteur_de VALUES (50, '978-2218972324');
INSERT INTO auteur VALUES (51, 'Faerber', 'Johan');
INSERT INTO auteur_de VALUES (51, '978-2218972324');
INSERT INTO livre VALUES ('Nostromo', 'Oxford University Press', '2009', '978-0199555918');
INSERT INTO auteur VALUES (52, 'Conrad', 'Joseph');
INSERT INTO auteur_de VALUES (52, '978-0199555918');
INSERT INTO livre VALUES ('Au carrefour des étoiles', 'J''ai Lu', '1997', '978-2277118473');
INSERT INTO auteur_de VALUES (29, '978-2277118473');
INSERT INTO auteur VALUES (53, 'Deutsch', 'Michel');
INSERT INTO auteur_de VALUES (53, '978-2277118473');
INSERT INTO livre VALUES ('Le Vagabond', 'BnF collection ebooks', '2016', '978-2346014453');
INSERT INTO auteur VALUES (54, 'Maupassant', 'Guy de');
INSERT INTO auteur_de VALUES (54, '978-2346014453');
INSERT INTO livre VALUES ('Les Buddenbrook', 'LGF/Le Livre de Poche', '1993', '978-2253063193');
INSERT INTO auteur VALUES (55, 'Mann', 'Thomas');
INSERT INTO auteur_de VALUES (55, '978-2253063193');
INSERT INTO livre VALUES ('Les Métamorphoses', 'Le Livre de Poche', '2011', '978-2253158677');
INSERT INTO auteur VALUES (56, 'Ovide', '');
INSERT INTO auteur_de VALUES (56, '978-2253158677');
INSERT INTO livre VALUES ('Jack Barron et l''Éternité', 'J''ai Lu', '2016', '978-2290105504');
INSERT INTO auteur VALUES (57, 'Spinrad', 'Norman');
INSERT INTO auteur_de VALUES (57, '978-2290105504');
INSERT INTO livre VALUES ('Hacker''s Delight', 'Addison-Wesley Professional', '2003', '978-0201914658');
INSERT INTO auteur VALUES (58, 'Warren', 'Henry S.');
INSERT INTO auteur_de VALUES (58, '978-0201914658');
INSERT INTO livre VALUES ('Astérix et les Normands', 'Dargaud', '2005', '978-2012101418');
INSERT INTO auteur_de VALUES (5, '978-2012101418');
INSERT INTO auteur_de VALUES (7, '978-2012101418');
INSERT INTO livre VALUES ('Le Temps incertain', 'Robert Laffont', '2011', '978-2221119709');
INSERT INTO auteur VALUES (59, 'JEURY', 'Michel');
INSERT INTO auteur_de VALUES (59, '978-2221119709');
INSERT INTO livre VALUES ('Astérix en Corse', 'Dargaud', '2005', '978-2012101524');
INSERT INTO auteur VALUES (60, 'Goscinny', '');
INSERT INTO auteur_de VALUES (60, '978-2012101524');
INSERT INTO auteur_de VALUES (7, '978-2012101524');
INSERT INTO livre VALUES ('Les Fils de la Médina', 'Arles [France] : Actes sud', '2003', '978-2742744824');
INSERT INTO auteur VALUES (61, 'Maḥfūẓ', 'Naǧīb');
INSERT INTO auteur_de VALUES (61, '978-2742744824');
INSERT INTO livre VALUES ('Le Grand secret', 'Presses de la Cité', '2014', '978-2258116405');
INSERT INTO auteur_de VALUES (13, '978-2258116405');
INSERT INTO livre VALUES ('Le Devin', 'Educa Books', '2010', '978-2012101517');
INSERT INTO auteur_de VALUES (5, '978-2012101517');
INSERT INTO auteur_de VALUES (7, '978-2012101517');
INSERT INTO livre VALUES ('Le Noir Dessein', 'Livre de poche', '1998', '978-2253062820');
INSERT INTO auteur VALUES (62, 'Farmer', 'Philip José');
INSERT INTO auteur_de VALUES (62, '978-2253062820');
INSERT INTO livre VALUES ('Astérix légionnaire', 'Educa Books', '2011', '978-2012101784');
INSERT INTO auteur_de VALUES (5, '978-2012101784');
INSERT INTO auteur_de VALUES (7, '978-2012101784');
INSERT INTO livre VALUES ('Romancero gitano', 'Greenbooks editore', '2020', '978-8832957402');
INSERT INTO auteur VALUES (63, 'Lorca', 'Federico Garcia');
INSERT INTO auteur_de VALUES (63, '978-8832957402');
INSERT INTO livre VALUES ('The Practice of Programming', 'Addison-Wesley Professional', '1999', '978-0201615869');
INSERT INTO auteur VALUES (64, 'Kernighan', 'Brian W.');
INSERT INTO auteur_de VALUES (64, '978-0201615869');
INSERT INTO auteur VALUES (65, 'Pike', 'Rob');
INSERT INTO auteur_de VALUES (65, '978-0201615869');
INSERT INTO livre VALUES ('Crime et Châtiment', 'Editions Humanis', '2012', '979-1021900486');
INSERT INTO auteur VALUES (66, 'Dostoïevski', 'Fédor Mikhaïlovitch');
INSERT INTO auteur_de VALUES (66, '979-1021900486');
INSERT INTO livre VALUES ('La Promenade au phare', 'LGF/Le Livre de Poche', '1983', '978-2253031536');
INSERT INTO auteur_de VALUES (22, '978-2253031536');
INSERT INTO livre VALUES ('L''Homme sans qualités', 'Contemporary French Fiction', '2011', '978-2757803691');
INSERT INTO auteur VALUES (67, 'Musil', 'Robert');
INSERT INTO auteur_de VALUES (67, '978-2757803691');
INSERT INTO livre VALUES ('Le Bruit et la Fureur', 'Gallimard Education', '1972', '978-2070361625');
INSERT INTO auteur VALUES (68, 'Faulkner', 'William');
INSERT INTO auteur_de VALUES (68, '978-2070361625');
INSERT INTO livre VALUES ('Les Plus qu''humains', 'adsaa', '1999', '000-0000000162');
INSERT INTO auteur VALUES (69, 'Fransa', 'France');
INSERT INTO auteur_de VALUES (69, '000-0000000162');
INSERT INTO livre VALUES ('La Main gauche de la nuit', 'Robert Laffont', '2012', '978-2221128121');
INSERT INTO auteur VALUES (70, 'GUIN', 'Ursula LE');
INSERT INTO auteur_de VALUES (70, '978-2221128121');
INSERT INTO livre VALUES ('Mémoires d''Hadrien', 'Gallimard Education', '1974', '978-2070369218');
INSERT INTO auteur VALUES (71, 'Yourcenar', 'Marguerite');
INSERT INTO auteur_de VALUES (71, '978-2070369218');
INSERT INTO livre VALUES ('Contes de l''absurde', 'Presses Pocket', '1978', '978-2266006095');
INSERT INTO auteur VALUES (72, 'Boulle', 'Pierre');
INSERT INTO auteur_de VALUES (72, '978-2266006095');
INSERT INTO livre VALUES ('Astérix et la Transitalique', 'Editions Albert René', '2017', '978-2864973270');
INSERT INTO auteur_de VALUES (6, '978-2864973270');
INSERT INTO livre VALUES ('L''Odyssée d''Astérix', 'Educa Books', '2008', '978-2864972051');
INSERT INTO auteur VALUES (73, 'Gascony', 'Rene');
INSERT INTO auteur_de VALUES (73, '978-2864972051');
INSERT INTO auteur_de VALUES (7, '978-2864972051');
INSERT INTO livre VALUES ('Les Singes du temps', 'Robert Laffont', '2011', '978-2221119693');
INSERT INTO auteur_de VALUES (59, '978-2221119693');
INSERT INTO livre VALUES ('Les Contes de Canterbury', 'Gallimard Education', '2000', '978-2070406340');
INSERT INTO auteur VALUES (74, 'Chaucer', 'Geoffrey');
INSERT INTO auteur_de VALUES (74, '978-2070406340');
INSERT INTO livre VALUES ('Sécheresse', 'La Cheminante', '2014', '978-2371270060');
INSERT INTO auteur VALUES (75, 'Chenet', 'Gérard');
INSERT INTO auteur_de VALUES (75, '978-2371270060');
INSERT INTO livre VALUES ('The Art of Computer Programming', 'Addison-Wesley Professional', '1997', '978-0321635747');
INSERT INTO auteur VALUES (76, 'Knuth', 'Donald E.');
INSERT INTO auteur_de VALUES (76, '978-0321635747');
INSERT INTO livre VALUES ('L''Aveuglement', 'Contemporary French Fiction', '2000', '978-2020403436');
INSERT INTO auteur VALUES (77, 'Saramago', 'José');
INSERT INTO auteur_de VALUES (77, '978-2020403436');
INSERT INTO livre VALUES ('Le Berceau du chat', 'Contemporary French Fiction', '2010', '978-2757820919');
INSERT INTO auteur VALUES (78, 'Vonnegut', 'Kurt');
INSERT INTO auteur_de VALUES (78, '978-2757820919');
INSERT INTO livre VALUES ('Anna Karénine', 'Bibliothèque russe et slave', '2018', '978-2371240087');
INSERT INTO auteur_de VALUES (19, '978-2371240087');
INSERT INTO livre VALUES ('La Montagne magique', 'Fayard', '2016', '978-2213703848');
INSERT INTO auteur_de VALUES (55, '978-2213703848');
INSERT INTO livre VALUES ('Le Domaine des dieux', 'French & European Publications', '1992', '978-0785909903');
INSERT INTO auteur VALUES (79, 'Goscinny', 'Rene');
INSERT INTO auteur_de VALUES (79, '978-0785909903');
INSERT INTO auteur_de VALUES (7, '978-0785909903');
INSERT INTO livre VALUES ('Cent ans de solitude', 'Contemporary French Fiction', '1995', '978-2020238113');
INSERT INTO auteur VALUES (80, 'Márquez', 'Gabriel García');
INSERT INTO auteur_de VALUES (80, '978-2020238113');
INSERT INTO livre VALUES ('Gargantua et Pantagruel', 'Livre de Poche Jeunesse', '2009', '978-2013230827');
INSERT INTO auteur VALUES (81, 'Rabelais', 'François');
INSERT INTO auteur_de VALUES (81, '978-2013230827');
INSERT INTO auteur VALUES (82, 'Laporte', 'Michel');
INSERT INTO auteur_de VALUES (82, '978-2013230827');
INSERT INTO auteur VALUES (83, 'Nadel', 'Olivier-Marc');
INSERT INTO auteur_de VALUES (83, '978-2013230827');
INSERT INTO livre VALUES ('Contes', 'J''ai Lu', '2015', '978-2290117965');
INSERT INTO auteur VALUES (84, 'Grimm', 'Jacob');
INSERT INTO auteur_de VALUES (84, '978-2290117965');
INSERT INTO auteur VALUES (85, 'Grimm', 'Wilhelm');
INSERT INTO auteur_de VALUES (85, '978-2290117965');
INSERT INTO livre VALUES ('Guerre et Paix', 'Archipoche', '2016', '978-2352879183');
INSERT INTO auteur_de VALUES (19, '978-2352879183');
INSERT INTO livre VALUES ('Énéide', 'Belles Lettres', '1993', '978-2251013039');
INSERT INTO auteur VALUES (86, 'Vergilius', 'Publius Maro');
INSERT INTO auteur_de VALUES (86, '978-2251013039');
INSERT INTO auteur VALUES (87, 'Virgile', '');
INSERT INTO auteur_de VALUES (87, '978-2251013039');
INSERT INTO livre VALUES ('Seconde Fondation', 'adsaa', '1979', '000-0000000097');
INSERT INTO auteur_de VALUES (1, '000-0000000097');
INSERT INTO livre VALUES ('Les Jeux de l''esprit', 'FeniXX', '1971', '978-2402281775');
INSERT INTO auteur_de VALUES (72, '978-2402281775');
INSERT INTO livre VALUES ('Middlemarch', 'Wordsworth Editions', '1994', '978-1853262371');
INSERT INTO auteur VALUES (88, 'Eliot', 'George');
INSERT INTO auteur_de VALUES (88, '978-1853262371');
INSERT INTO livre VALUES ('Œdipe roi', 'J''ai Lu', '2013', '978-2290080207');
INSERT INTO auteur VALUES (89, 'Sophocle', '');
INSERT INTO auteur_de VALUES (89, '978-2290080207');
INSERT INTO livre VALUES ('L''Amour aux temps du choléra', 'Grasset', '2009', '978-2246819554');
INSERT INTO auteur VALUES (90, 'Márquez', 'Gabriel Garcia');
INSERT INTO auteur_de VALUES (90, '978-2246819554');
INSERT INTO livre VALUES ('Fictions', 'Gallimard Education', '1974', '978-2070366149');
INSERT INTO auteur VALUES (91, 'Borges', 'Jorge Luis');
INSERT INTO auteur_de VALUES (91, '978-2070366149');
INSERT INTO livre VALUES ('Astérix chez les Bretons', 'Dargaud', '2002', '978-2012100084');
INSERT INTO auteur_de VALUES (5, '978-2012100084');
INSERT INTO auteur_de VALUES (7, '978-2012100084');
INSERT INTO livre VALUES ('Le Château', 'Points', '2011', '978-2757827413');
INSERT INTO auteur_de VALUES (33, '978-2757827413');
INSERT INTO livre VALUES ('Le Voyageur imprudent', 'Editions Gallimard', '2014', '978-2072535031');
INSERT INTO auteur_de VALUES (14, '978-2072535031');
INSERT INTO livre VALUES ('Je suis une légende', 'Editions Gallimard', '2013', '978-2072457388');
INSERT INTO auteur_de VALUES (34, '978-2072457388');
INSERT INTO livre VALUES ('Le Maître du Haut Château', 'J''ai Lu', '2017', '978-2290157268');
INSERT INTO auteur VALUES (92, 'Dick', 'Philip K.');
INSERT INTO auteur_de VALUES (92, '978-2290157268');
INSERT INTO livre VALUES ('Les Âmes mortes', 'Bibliothèque russe et slave', '2018', '978-2371240001');
INSERT INTO auteur VALUES (93, 'Gogol', 'Nikolaï');
INSERT INTO auteur_de VALUES (93, '978-2371240001');
INSERT INTO livre VALUES ('Le Tambour', 'Contemporary French Fiction', '1997', '978-2020314305');
INSERT INTO auteur VALUES (94, 'Grass', 'Günter');
INSERT INTO auteur_de VALUES (94, '978-2020314305');
INSERT INTO livre VALUES ('Polymath', 'iMinds Pty Ltd', '2014', '978-1921746864');
INSERT INTO auteur VALUES (95, 'iMinds', '');
INSERT INTO auteur_de VALUES (95, '978-1921746864');
INSERT INTO livre VALUES ('Seigneur de lumière', 'Editions Gallimard', '2014', '978-2072487958');
INSERT INTO auteur VALUES (96, 'Zelazny', 'Roger');
INSERT INTO auteur_de VALUES (96, '978-2072487958');
INSERT INTO livre VALUES ('Ulysse', 'Nathan', '2012', '978-2092532195');
INSERT INTO auteur VALUES (97, 'Montardre', 'Hélène');
INSERT INTO auteur_de VALUES (97, '978-2092532195');
INSERT INTO livre VALUES ('Pedro Páramo', 'New York : Grove Press', '1959', '000-0000000069');
INSERT INTO auteur VALUES (98, 'Rulfo', 'Juan');
INSERT INTO auteur_de VALUES (98, '000-0000000069');
INSERT INTO livre VALUES ('Ubik', 'Houghton Mifflin Harcourt', '2012', '978-0547728247');
INSERT INTO auteur_de VALUES (92, '978-0547728247');
INSERT INTO livre VALUES ('Algorithms', 'Addison-Wesley Professional', '2011', '978-0132762564');
INSERT INTO auteur VALUES (99, 'Sedgewick', 'Robert');
INSERT INTO auteur_de VALUES (99, '978-0132762564');
INSERT INTO auteur VALUES (100, 'Wayne', 'Kevin');
INSERT INTO auteur_de VALUES (100, '978-0132762564');
INSERT INTO livre VALUES ('Fifi Brindacier', 'Hachette Romans', '2013', '978-2011179043');
INSERT INTO auteur VALUES (101, 'Lindgren', 'Astrid');
INSERT INTO auteur_de VALUES (101, '978-2011179043');
INSERT INTO livre VALUES ('Le monde s''effondre', 'Editions Présence Africaine', '1972', '978-2708701915');
INSERT INTO auteur VALUES (102, 'Achebe', 'Chinua');
INSERT INTO auteur_de VALUES (102, '978-2708701915');
INSERT INTO livre VALUES ('La Naissance des dieux', 'Glénat BD', '2017', '978-2331035531');
INSERT INTO auteur VALUES (103, 'Bruneau', 'Clotilde');
INSERT INTO auteur_de VALUES (103, '978-2331035531');
INSERT INTO auteur VALUES (104, 'D.', 'Dim');
INSERT INTO auteur_de VALUES (104, '978-2331035531');
INSERT INTO auteur VALUES (105, 'Santagati', 'Federico');
INSERT INTO auteur_de VALUES (105, '978-2331035531');
INSERT INTO auteur VALUES (106, 'Ferry', 'Luc');
INSERT INTO auteur_de VALUES (106, '978-2331035531');
INSERT INTO auteur VALUES (107, 'Poli', 'Didier');
INSERT INTO auteur_de VALUES (107, '978-2331035531');
INSERT INTO livre VALUES ('Hamlet', 'Primento', '2012', '978-2806240187');
INSERT INTO auteur_de VALUES (36, '978-2806240187');
INSERT INTO livre VALUES ('Les Enfants de minuit', 'Gallimard Education', '2010', '978-2070402632');
INSERT INTO auteur VALUES (108, 'Rushdie', 'Salman');
INSERT INTO auteur_de VALUES (108, '978-2070402632');
INSERT INTO livre VALUES ('Dune', 'Penguin', '2003', '978-1101658055');
INSERT INTO auteur VALUES (109, 'Herbert', 'Frank');
INSERT INTO auteur_de VALUES (109, '978-1101658055');
INSERT INTO livre VALUES ('La Couleur tombée du ciel', 'Tiers Livre Éditeur', '2014', '978-2814510012');
INSERT INTO auteur VALUES (110, 'Lovecraft', 'Howard Phillips');
INSERT INTO auteur_de VALUES (110, '978-2814510012');
INSERT INTO livre VALUES ('L''Éducation sentimentale', 'FeniXX', '1990', '978-2402282697');
INSERT INTO auteur VALUES (111, 'Rincé', 'Dominique');
INSERT INTO auteur_de VALUES (111, '978-2402282697');
INSERT INTO livre VALUES ('Obélix et Compagnie', 'Educa Books', '2008', '978-2012101555');
INSERT INTO auteur_de VALUES (5, '978-2012101555');
INSERT INTO auteur_de VALUES (7, '978-2012101555');
INSERT INTO livre VALUES ('Le Journal d''un fou', 'Bibebook', '2013', '978-2824709420');
INSERT INTO auteur VALUES (112, 'Gogol', 'Nikolai');
INSERT INTO auteur_de VALUES (112, '978-2824709420');
INSERT INTO livre VALUES ('Les Hauts de Hurlevent', 'Le Livre de Poche', '2012', '978-2253174561');
INSERT INTO auteur VALUES (113, 'Brontë', 'Emily');
INSERT INTO auteur_de VALUES (113, '978-2253174561');
INSERT INTO livre VALUES ('La Plaie', 'FeniXX', '1967', '978-2402255462');
INSERT INTO auteur VALUES (114, 'Fall', 'Malick');
INSERT INTO auteur_de VALUES (114, '978-2402255462');
INSERT INTO livre VALUES ('Astérix chez les Belges', 'Dargaud', '1979', '978-2012101562');
INSERT INTO auteur_de VALUES (5, '978-2012101562');
INSERT INTO auteur_de VALUES (7, '978-2012101562');
INSERT INTO livre VALUES ('Le Rouge et le Noir', 'Les Éditions de l''Ebook malin', '1971', '978-2367881171');
INSERT INTO auteur VALUES (115, 'Stendhal', '');
INSERT INTO auteur_de VALUES (115, '978-2367881171');
INSERT INTO livre VALUES ('À la recherche du temps perdu', 'Books LLC, Wiki Series', '2010', '978-1153611725');
INSERT INTO auteur VALUES (116, 'Wikipedia', 'Source');
INSERT INTO auteur_de VALUES (116, '978-1153611725');
INSERT INTO livre VALUES ('La storia', 'Editions Gallimard', '2004', '978-2070315017');
INSERT INTO auteur VALUES (117, 'Morante', 'Elsa');
INSERT INTO auteur_de VALUES (117, '978-2070315017');
INSERT INTO livre VALUES ('L''Homme total', 'Presses Universitaires de France - PUF', '2011', '978-2130592150');
INSERT INTO auteur VALUES (118, 'Karsenti', 'Bruno');
INSERT INTO auteur_de VALUES (118, '978-2130592150');
INSERT INTO usager VALUES('MICHEL', 'VALÉRIE', '104, Rue du Stade', '75013', 'Paris', 'vmichel5@monmail.com', '199614051174633');
INSERT INTO usager VALUES('DURAND', 'JULIEN', '183, Rue de la Gare', '75019', 'Paris', 'jdurand9@email.fr', '782124241492509');
INSERT INTO usager VALUES('MOREAU', 'ALAIN', '48, Rue du Château', '75005', 'Paris', 'amoreau1@abc.de', '421921003090881');
INSERT INTO usager VALUES('DUBOIS', 'PHILIPPE', '35, Rue du Moulin', '75014', 'Paris', 'pdubois5@chezmoi.net', '137332830764072');
INSERT INTO usager VALUES('ROBERT', 'PASCAL', '95, Rue de la Gare', '75005', 'Paris', 'probert9@monmail.com', '533299198788609');
INSERT INTO usager VALUES('FOURNIER', 'DAVID', '157, Rue de la Fontaine', '75007', 'Paris', 'dfournier4@abc.de', '612978231522917');
INSERT INTO usager VALUES('LAURENT', 'FRANÇOISE', '90, Rue Principale', '75005', 'Paris', 'flaurent3@monmail.com', '917547585216771');
INSERT INTO usager VALUES('SIMON', 'SANDRINE', '45, Rue du Château', '75020', 'Paris', 'ssimon2@abc.de', '654834075188732');
INSERT INTO usager VALUES('PETIT', 'SÉBASTIEN', '5, Rue du Stade', '75012', 'Paris', 'spetit4@email.fr', '934701281931582');
INSERT INTO usager VALUES('BERNARD', 'STÉPHANE', '131, Place de la Mairie', '75015', 'Paris', 'sbernard2@chezmoi.net', '035184062854281');
INSERT INTO emprunt VALUES ('421921003090881', '978-2081358881', '2020-04-28');
INSERT INTO emprunt VALUES ('421921003090881', '978-2207249123', '2020-04-28');
INSERT INTO emprunt VALUES ('421921003090881', '978-2824709420', '2020-04-28');
INSERT INTO emprunt VALUES ('137332830764072', '978-2352879183', '2020-02-20');
INSERT INTO emprunt VALUES ('137332830764072', '978-2335008586', '2020-02-20');
INSERT INTO emprunt VALUES ('137332830764072', '978-2013230827', '2020-02-20');
INSERT INTO emprunt VALUES ('533299198788609', '978-2253174561', '2020-02-28');
INSERT INTO emprunt VALUES ('533299198788609', '978-2251013039', '2020-02-28');
INSERT INTO emprunt VALUES ('917547585216771', '978-2290105504', '2020-04-07');
INSERT INTO emprunt VALUES ('654834075188732', '978-2864973270', '2020-02-17');
INSERT INTO emprunt VALUES ('654834075188732', '978-2070406340', '2020-02-17');
INSERT INTO emprunt VALUES ('654834075188732', '978-2806231697', '2020-02-17');
INSERT INTO emprunt VALUES ('934701281931582', '978-2260019183', '2020-01-01');
INSERT INTO emprunt VALUES ('934701281931582', '978-2371240087', '2020-01-01');
INSERT INTO emprunt VALUES ('035184062854281', '978-2745989857', '2020-02-18');
INSERT INTO emprunt VALUES ('035184062854281', '978-2072762093', '2020-02-18');
INSERT INTO emprunt VALUES ('035184062854281', '978-2742744824', '2020-02-18');