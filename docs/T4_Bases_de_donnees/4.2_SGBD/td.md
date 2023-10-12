
# TD

{{initexo(0)}}


!!! example "{{ exercice() }}: Annuaire"
    === "énoncé"
        La modélisation relationnelle d'un annuaire est la suivante:

        annuaire(nom: chaine, prenom: chaine, <u>tel</u>: chaine)

        1. Ecrire la requête SQL permettant de créer la table correspondant à cette relation.
        2. Ecrire la requête SQL permettant de vous rajouter dans cet annuaire.

    === "corrigé"
        1. 
        ```SQL
        CREATE TABLE annuaire (
            nom VARCHAR(30) NOT NULL;
            prenom VARCHAR(30) NOT NULL;
            tel VARCHAR(12) PRIMARY KEY
        );```
        2. 
        

!!! example "{{ exercice() }}: Bulletin"
    === "énoncé"
        La modélisation relationnelle d'un bulletin scolaire est la suivante:

        eleve(<u>idEleve</u> : chaine, nom : chaine, prenom : chaine)

        matiere(<u>idMatiere</u> : entier, nom : chaine)

        note(<u>#idMatiere : entier ==> matiere(idMatiere)</u>, <u>#idEleve : chaine ==> eleve(idEleve)</u></span>, note : flottant)

        1. Ecrire les requête SQL permettant de créer les table correspondant à ces relations.
        2. Ecrire les requêtes SQL permettant de créer un élève (vous-même), une matière (la NSI) et de vous mettre un note.
        3. Ecrire les requêtes permettant de supprimer ces tables.

!!! example "{{ exercice() }}: Des erreurs"
    === "énoncé"
        Pour chacune des séquences de requêtes SQL suivantes, dire quelles instructions provoquent une erreur. On suppose que la base de données ne contient aucune table au début de chaque séquence.

        1. 
        ```SQL
        DROP TABLE client;
        CREATE TABLE client (   cid INT PRIMARY KEY,
                                nom VARCHAR (100),
                                prenom VARCHAR (100),
                                points_fidelite INT NOT NULL, 
                                CHECK (points_fidelite >= 0));
        ```
        2. 
        ```SQL
        CREATE TABLE client (   cid INT PRIMARY KEY,
                                nom VARCHAR (100),
                                prenom VARCHAR (100),
                                points_fidelite INT NOT NULL,
                                CHECK (points_fidelite >= 0));

        CREATE TABLE commande ( cid INT REFERENCES client(cid),
                                pid INT REFERENCES produit(pid),
                                date DATE NOT NULL);

        CREATE TABLE produit (  pid INT PRIMARY KEY,
                                nom VARCHAR(100),
                                prix DECIMAL(10,2));
        ```
        3. 
        ```SQL
        CREATE TABLE client (   cid INT PRIMARY KEY, 
                                nom VARCHAR(100), 
                                prenom VARCHAR(100),
                                points_fidelite INT NOT NULL, 
                                CHECK (points_fidelite >= 0));
                                
        CREATE TABLE produit (  pid INT PRIMARY KEY, 
                                nom VARCHAR(100),
                                prix DECIMAL(10,2));

        CREATE TABLE commande ( cid INT REFERENCES client(cid),
                                nomp VARCHAR(100) REFERENCES produit(nom),
                                date DATE NOT NULL);
        ```
        4. 
        ```SQL
        CREATE TABLE client (   cid INT PRIMARY KEY,
                                nom VARCHAR(100),
                                prenom VARCHAR(100),
                                points_fidelite INT NOT NULL,
                                CHECK (points_fidelite > 0)); 
                                
        CREATE TABLE produit (  pid INT PRIMARY KEY,
                                nom VARCHAR(100),
                                prix DECIMAL(10,2));

        CREATE TABLE commande ( cid INT REFERENCES client(cid),
                                pid INT REFERENCES produit(pid),
                                date DATE NOT NULL
                                PRIMARY KEY (cid, pid));

        INSERT INTO commande VALUES (0, 0, '2020-03-02');
        ```




