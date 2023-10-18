# TD

{{initexo(0)}}


!!! example "{{ exercice() }}: Requêtes de sélection"
    === "énoncé"
        Soit le base de données crées par le requête ci-dessous:

        ```SQL
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
        ```

        Donner le code SQL de chacune des requêtes ci-dessous. Les mots en police fixe donnent une indication sur les attributs et les tables à utiliser dans la requête.

        1. Tous les titres de livre.
        2. Tous les noms d'usager.
        3. Tous les noms d'usager en retirant les doublons. 
        4. Les titres des livres publiés avant 1980.
        5. Les titres des livres dont le titre contient la lettre "A".
        6. Les isbn des livres à rendre pour le 01/01/2020. 
        7. Les noms d'auteurs triés par ordre alphabétique.
        8. Les noms d'usagers vivant dans le 12e ou 13e arrondissement de Paris(codes postaux 75012 et 75013). 
        9. Les noms et adresses des usagers n'habitant pas dans une rue. (la chaine "Rue" ne doit pas apparaître dans l'adresse).
        10. Les annees et titres des livres publiés lors d'une année bissextile. On rappelle que ce sont les années divisibles par 4, mais pas celles divisibles par 100 sauf si elles sont divisibles par 400.

    === "correction"
        ```SQL
        SELECT titre FROM livre;
        SELECT nom FROM usager;
        SELECT DISTINCT nom FROM usager;
        SELECT titre FROM livre WHERE annee < 1980;
        SELECT titre FROM livre WHERE titre LIKE "%A%";
        SELECT isbn FROM emprunt WHERE retour = '2020-01-01';
        SELECT nom FROM auteur ORDER BY nom;
        SELECT nom, prenom FROM usager WHERE cp IN ('75012', '75013');
        SELECT nom, prenom FROM usager WHERE cp = '75012' OR cp='75013';
        SELECT nom, adresse FROM usager WHERE adresse NOT LIKE '%Rue%';
        SELECT annee, titre FROM livre WHERE annee % 4 = 0 AND annee % 100 <> 0;
        ```

!!! example "{{ exercice() }}: Requêtes avec jointure"
    === "énoncé"
        Toujours sur la même base. Donner le code SQL de chacune des requêtes ci-dessous. Les mots en police fixe donnent une indication sur les attributs et les tables à utiliser dans la requête.

        1. Le titre des livres empruntés.
        2. Le titre des livres empruntés à rendre avant le 31/03/2020.
        3. Le nom et prenom de l'auteur du livre 1984
        4. Le nom et le prenom des usagers ayant emprunté des livres, sans doublons (c'est à dire que si un usager a emprunté plusieurs livres, il ne doit apparaître qu'une fois dans le résultat). 
        5. Même requête que précédemment, avec les noms triés par ordre alphabétique.
        6. Les titre des livres publiés strictement avant 'Dune'. 
        7. Les noms et prenoms des auteurs des livres trouvés à la question précédente.
        8. Comme la question précédente, en retirant les doublons.
        9. Le nombre de résultats trouvés à la question précédente.

    === "corrigé"
        ```SQL
        SELECT titre FROM livre JOIN emprunt ON livre.isbn = emprunt.isbn;
        SELECT titre FROM livre JOIN emprunt ON livre.isbn = emprunt.isbn WHERE retour < '2020-03-31';
        SELECT nom, prenom FROM auteur 
            JOIN auteur_de ON auteur_de.a_id =  auteur.a_id
            JOIN livre ON livre.isbn = auteur_de.isbn
            WHERE livre.titre = "1984";
        SELECT DISTINCT nom, prenom FROM usager JOIN emprunt ON usager.code_barre = emprunt.code_barre;
        SELECT DISTINCT nom, prenom FROM usager JOIN emprunt ON usager.code_barre = emprunt.code_barre ORDER BY nom;
        SELECT titre, annee FROM livre WHERE annee < (SELECT annee FROM livre WHERE titre = 'Dune');
        SELECT nom, prenom FROM auteur
            JOIN auteur_de ON auteur_de.a_id =  auteur.a_id
            JOIN livre ON livre.isbn = auteur_de.isbn
            WHERE annee < (SELECT annee FROM livre WHERE titre = 'Dune');
        SELECT DISTINCT nom, prenom FROM auteur
            JOIN auteur_de ON auteur_de.a_id =  auteur.a_id
            JOIN livre ON livre.isbn = auteur_de.isbn
            WHERE annee < (SELECT annee FROM livre WHERE titre = 'Dune');
        SELECT COUNT(nom) AS nombre FROM 
            (SELECT DISTINCT nom, prenom FROM auteur
            JOIN auteur_de ON auteur_de.a_id =  auteur.a_id
            JOIN livre ON livre.isbn = auteur_de.isbn
            WHERE annee < (SELECT annee FROM livre WHERE titre = 'Dune'));

        ```


!!! example "{{ exercice() }}: Lecture de requêtes"

    Toujours sur la même base. Formuler simplement en francais les requêtes SQL suivantes. 

    1. 
    ```SQL
    SELECT FROM livre WHERE titre LIKE '%Robot%':
    ```
    2. 
    ```SQL
    SELECT nom, prenom FROM usager WHERE ville = 'Guingamp';
    ```
    3. 
    ```SQL
    SELECT u.nom, u.prenom FROM usager AS u JOIN emprunt AS e ON u.code_barre = e.code_barre WHERE retour < "2020-04-02":
    ```
    4. 
    ```SQL
    SELECT l.titre 
    FROM livre AS l 
    WHERE l.isbn IN (SELECT isbn FROM livres WHERE annee > 1990);
    ```

!!! example "{{ exercice() }}: Mise à jour de valeurs"

    Toujours sur la base même base. On a ajouté deux livres, deux usagers et un emprunt à la bibliothèque avec les requêtes suivantes:
    ```SQL
    INSERT INTO livre VALUES ('Les Aventures de Huckleberry Finn', 'Flammarion', '2020', '978-2081509511');
    INSERT INTO auteur VALUES (0, 'Twain', 'Mark');
    INSERT INTO auteur_de VALUES (0, '978-2081509511');
    INSERT INTO livre VALUES ('Fondation et Empire', 'Editions Denoël', '1999', '978-2207249123');
    INSERT INTO auteur VALUES (1, 'Asimov', 'Isaac');
    INSERT INTO auteur_de VALUES (1, '978-2207249123');
    INSERT INTO usager VALUES('MICHEL', 'VALÉRIE', '104, Rue du Stade', '75013', 'Paris', 'vmichel5@monmail.com', '199614051174633');
    INSERT INTO usager VALUES('DURAND', 'JULIEN', '183, Rue de la Gare', '75019', 'Paris', 'jdurand9@email.fr', '782124241492509');
    INSERT INTO emprunt VALUES ('199614051174633', '978-2081509511', '2022-12-09');
    ```

    1. Valérie MICHEL est passé à la bibliothèque pour prolonger son prêt jusqu'au 16 décembre 2022. Quelle requête sera réalisée sur le SGBD de la bibliothèque ?

    2. Une semaine plus tard, elle rend le livre. Quelle requête sera réalisée sur le SGBD de la bibliothèque ?

!!! example "{{ exercice() }}: Type bac"

    *Cet exercice porte sur les bases de données.*

    On pourra utiliser les mots clés SQL suivants : `SELECT`, `FROM`, `WHERE`, `JOIN`,
    `ON`, `INSERT`, `INTO`, `VALUES`, `UPDATE`, `SET`, `AND`.

    Nous allons étudier une base de données traitant du cinéma dont voici le schéma
    relationnel qui comporte 3 relations :

    - la relation individu (<u>id_ind</u>, nom, prenom, naissance)
    - la relation realisation (<u>id_rea</u>, titre, annee, type)
    - la relation emploi (<u>id_emp</u>, description, #id_ind, #id_rea)

    Les clés primaires sont soulignées et les clés étrangères sont précédées d'un #.

    Ainsi emploi.id_ind est une clé étrangère faisant référence à individu.id_ind.

    Voici un extrait des tables individu et realisation :
    <figure markdown>
    <caption>extrait de individu</caption>

    | id_ind | nom | prenom | naissance |
    |---|---|---|---|
    |105|'Hulka'|'Daniel'|'01-06-1968'|
    |403|'Travis'|'Daniel'|'10-03-1968'|
    |688|'Crog'|'Daniel'|'07-07-1968'|
    |695|'Pollock'|'Daniel'|'24-08-1968'|

    
    </figure>

    <figure markdown>
    <caption>extrait de realisation</caption>

    |id_rea |titre|annee|type|
    |---|---|---|---|
    |105|'Casino Imperial'|2006 |'action'|
    |325|'Ciel tombant'|2012 |'action'|
    |655|'Fantôme'|2015 |'action'|
    |950|'Mourir pour attendre'|2021 |'action'|

    </figure>

    1. On s'intéresse ici à la récupération de données dans une relation.
        1. Écrire ce que renvoie la requête ci-dessous :
        ```SQL
        SELECT nom, prenom, naissance
        FROM individu
        WHERE nom = 'Crog';
        ```
        2. Fournir une requête SQL permettant de récupérer le titre et la clé primaire de chaque film dont la date de sortie est strictement supérieure à 2020.
    2. Cette question traite de la modification de relations.
        1. Dire s'il faut utiliser la requête 1 ou la requête 2 proposées ci-dessous pour modifier la date de naissance de Daniel Crog. Justifier votre réponse en expliquant pourquoi la requête refusée ne pourra pas fonctionner.

        Requête 1
        ```SQL
        UPDATE individu
        SET naissance = '02-03-1968'
        WHERE id_ind = 688 AND nom = 'Crog' AND prenom = 'Daniel';
        ```

        Requête 2
        ```SQL
        INSERT INTO individu
        VALUES (688, 'Crog', 'Daniel', '02-03-1968');
        ```

        2. Expliquer si la relation individu peut accepter (ou pas) deux individus portant le même nom, le même prénom et la même date de naissance.

    3. Cette question porte sur la notion de clés étrangères.
        1. Recopier sur votre copie les demandes ci-dessous, dans leur intégralité, et les compléter correctement pour qu'elles ajoutent dans la relation emploi les rôles de Daniel Crog en tant que James Bond dans le film nommé "Casino Impérial" puis dans le film "Ciel tombant".
        ```SQL
        INSERT INTO emploi
        VALUES (5400, 'Acteur(James Bond)', ... );
        INSERT INTO emploi
        VALUES (5401, 'Acteur(James Bond)', ... );
        ```
        2. On désire rajouter un nouvel emploi de Daniel Crog en tant que James Bond dans le film 'Docteur Yes'.
        Expliquer si l'on doit d'abord créer l'enregistrement du film dans la relation realisation ou si l'on doit d'abord créer le rôle dans la relation emploi.
    4. Cette question traite des jointures.
        1. Recopier sur votre copie la requête SQL ci-dessous, dans son intégralité, et la compléter de façon à ce qu'elle renvoie le nom de l'acteur, le titre du film et l'année de sortie du film, à partir de tous les enregistrements de la relation emploi pour lesquels la description de l'emploi est 'Acteur(James Bond)'.
        ```SQL
        SELECT ...
        FROM emploi
        JOIN individu ON ...
        JOIN realisation ON ...
        WHERE emploi.description = 'Acteur(James Bond)';
        ```
        2. Fournir une requête SQL permettant de trouver toutes les descriptions des emplois de Denis Johnson (Denis est son prénom et Johnson est son nom).
        On veillera à n'afficher que la description des emplois et non les films associés à ces emplois.