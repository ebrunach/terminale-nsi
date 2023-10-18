


# SQL

Sources: [https://monlyceenumerique.fr/nsi_terminale/bdd/bdd2.php](https://monlyceenumerique.fr/nsi_terminale/bdd/bdd2.php)

Nous l'avons compris au chapitre précédent, l’accès aux données d’une base de données relationnelle s’effectue grâce à des requêtes SQL (le plus souvent). Nous verrons ici celles nous permettant d’interroget et de mettre à jour.


## 1. Les commandes d'interrogation de la base

Il existe plusieurs types de requêtes pour interroger une table.

### 1.1. La projection

La `projection` d'une table permet d'obtenir une partie des champs de la table. Elle utilise la commande `SELECT`.

On sélectionne les colonnes de notre relation.

!!! Example 
    Relation : **Joueur**(IdJoueur,nomJoueur,pnomJoueur)

    Quelques exemples de requêtes SQL : 

    - Obtenir toutes les informations sur tous les joueurs : 

        ```SQL
        SELECT * FROM joueur;
        ```

    - Obtenir le nom et les prénoms des joueurs :

        ```SQL
        SELECT nomJoueur,pNomJoueur FROM joueur;
        ```


### 1.2. La sélection

La `sélection` d'une table permet de choisir une partie des lignes de la table. On utilise le mot clé `WHERE` suivie du (ou des) critère(s).

Voici une liste d'opérateurs :

| Commande | Explications |
| --- | --- |
| LIKE | Comme. Exemple nomJoueur LIKE 'Terez' |
| BETWEEN | Entre |
| IN  | Dans |
| AND | Intersection |
| OR  | Union |
| NOT | Négation |
| &lt;,&gt;, &lt;=,&gt;= | Utilisables sur des données numériques |
| %   | Symbole qui représente une chaîne de caractères. |
| _   | Symbole qui représente un caractère |

!!! Example
    Relation : **personne**(Id,nom,pNom,ville,tel,email)

    Quelques exemples de requêtes SQL :

    - Obtenir les noms et prénoms des personnes qui habitent Aubervilliers : 

        ```SQL
        SELECT nom, pNom FROM personne WHERE ville = 'AUBERVILLIERS';
        ```

    - Obtenir le nom et les numéros de téléphone des personnes qui habitent Aubervilliers ou Saint-Denis : 

        ```SQL
        SELECT nom, tel FROM personne WHERE ville = 'AUBERVILLIERS' or ville = 'SAINT-DENIS';
        ```

    - Obtenir le nom et les adresses mails des personnes ayant une adresse de type 'gmail' : 

        ```SQL
        SELECT nom, email FROM personne WHERE email LIKE '%gmail.com';
        ```

    ??? note
        Le caractère `%` permet de remplacer n'importe quelle chaine de caractères.

    ??? note
        Le caractère `_` permet de remplacer n'importe quel caractère.

    ??? note
        Par défaut, `LIKE` est insensible à la casse 

### 1.3. La jointure


La `jointure` permet de mettre en relation plusieurs tables. La jointure utilise les clés primaires et étrangères des tables qu'elle met en relation. Elle utilise les mots clés `JOIN ON`.

!!! Example
    Schéma relationnel [tournoi.sql](./data/tournoi.sql):

    * **joueur**(<u>idJoueur</u>, nomJoueur, pnomJoueur)
        
    * **partie**(<u>idPartie</u>, #idJoueur1 => joueur, #idJoueur2 => joueur, score1, score2, #idVainqueur => joueur)
        

    *Les clés idJoueur1,idJoueur2 et idVainqueur sont des clés étrangères reliées à idJoueur*

    1. Je cherche à connaître les identifiants des parties gagnées par Bob LEPONGE (idjoueur=3).

        ```SQL
        SELECT idvainqueur, idpartie FROM partie WHERE idvainqueur = 3;
        ```
    2. Mais cette requête ne renvoie que des ids (des entiers) donc je ne vois pas les noms des joueurs. J'aimerais que soit affiché le nom du gagnant et non pas son identifiant. Pour cela il faut que je relie les tables joueur et partie car le nom des joueurs est une information de la table joueur mais l'id du vainqueur est une information de la table partie : 

        ```SQL
        SELECT nomjoueur, idpartie FROM partie JOIN joueur ON idjoueur=idvainqueur WHERE idjoueur = 3;
        ```

        En cas de conflit possible entre les noms des attributs, on peut `préfixer` les noms par le nom des tables : 

        ```SQL
        SELECT joueur.nomjoueur, partie.idpartie FROM partie JOIN joueur ON joueur.idjoueur=partie.idvainqueur WHERE joueur.nomJoueur LIKE "LEPONGE";
        ```
    
    ??? note "Beaucoup plus complexe"
        Si je veux maintenant le nom des deux joueurs, je vais avoir besoin de trois jointures:

        ```SQL
        SELECT
            p.idpartie,
            j1.nomJoueur AS nomJoueur1,
            j1.pnomJoueur AS pnomJoueur1,
            j2.nomJoueur AS nomJoueur2,
            j2.pnomJoueur AS pnomJoueur2,
            j3.nomJoueur AS nomGagnant,
            j3.pnomJoueur AS pnomGagnant
        FROM partie p
        JOIN joueur AS j1 ON p.idJoueur1 = j1.idJoueur
        JOIN joueur AS j2 ON p.idJoueur2 = j2.idJoueur
        JOIN joueur AS j3 ON p.idvainqueur = j3.idJoueur
        WHERE j3.nomJoueur LIKE "LEPONGE";
        ```

### 1.4. Aggrégation 

L'`aggrégation` permet de grouper des lignes pour en calculer la somme, les compter, en trouver le maximum ou le minimum.

| Commande | Explication |
|---|---|
| SUM(attribut) | Fonction d'agrégations : additionner les valeurs d'un champ numérique. |
| AVG(attribut) | Fonction d'agrégations : calculer la moyenne des valeurs d'un champ numérique. |
| MIN(attribut) et MAX(attribut) | Fonction d'agrégations : obtenir la valeur maximale ou minimale d'un champ numérique. |
| COUNT(Attribut) | Fonction d'agrégations : compter des enregistrements |

!!! Example

    ```SQL
    SELECT joueur.nomjoueur, COUNT(partie.idpartie) FROM joueur JOIN partie ON joueur.idjoueur=partie.idvainqueur WHERE joueur.nomJoueur LIKE "LEPONGE";
    ```

### 1.5 Tri

Le `Tri` permet de trier les lignes selon un critère.

| Commande | Description |
|---|---|
| ORDER BY attribut | Trier par ordre croissant. |
| ORDER BY attribut DESC | Trier par ordre décroissant. |

!!! Example

    ```SQL
    SELECT nomjoueur, idpartie FROM partie JOIN joueur ON idjoueur=idvainqueur WHERE nomJoueur = "Leponge" ORDER BY max(score1,score2) DESC;
    ```

## 2. Les commandes de modification de la base


Il est possible d'insérer, de supprimer ou de mettre à jour des données.

Les syntaxes sont les suivantes :

| Commande/mot-clé | Explications/syntaxe |
| --- | --- |
| INSERT INTO nom table (champ1,champ2, ...) VALUES (valeur1,valeur2, ...) ; | Insertion des données. On ajoute un $n$-uplet.<br><br>Exemple : INSERT INTO JOUEUR (idJoueur,nomJoueur,pnomJoueur) VALUES (6,'Smatik','Karim') |
| UPDATE nom_table SET ... WHERE ... | Modifier des données.<br><br>Exemple : UPDATE partie SET idvainqueur = 1 WHERE idpartie=1 |
| DELETE FROM nom_table WHERE .... | Suppression des données. On supprime toute la ligne identifiée par le critère qui suit le mot-clé WHERE.<br><br>Exemple : DELETE FROM partie WHERE idpartie=10 |


!!! Example
    Mofification d'un score

    ```SQL
    UPDATE partie SET score1 = 55 WHERE idpartie = 1;
    ```

## 3. Tableau synthétique des mots clés

Certaines commande du langage SQL ne font pas des attendues du programme de terminale NSI.

Commandes exigibles : SELECT, FROM, WHERE, JOIN, UPDATE, INSERT, DELETE, DISTINCT, ORDER BY, fonctions d'agrégations (COUNT, MAX, MIN, AVG, SUM).

| Commande/mot-clé | Explications/syntaxe |
| --- | --- |
| SELECT attribut1,attribut2, ... FROM nom_table | Sélection en projection.  <br>Exemple : SELECT * FROM joueur |
| SELECT DISTINCT attribut1,attribut2, ... FROM nom_table | Idem commande précédente en évitant de retourner des doublons |
| JOIN ... ON | Jointure pour relier deux ou plusieurs tables.  <br>Exemple : SELECT nomJoueur,idpartie FROM joueur JOIN partie ON idjoueur=idvainqueur WHERE idvainqueur=3; |
| AS  | Renommer une colonne.  <br>SELECT nomJoueur AS Vainqueur FROM Joueur WHERE idVainqueur=3 |
| ORDER BY attribut | Trier par ordre croissant. |
| ORDER BY attribut DESC | Trier par ordre décroissant. |
| SUM(attribut) | Fonction d'agrégations : additionner les valeurs d'un champ numérique. |
| AVG(attribut) | Fonction d'agrégations : calculer la moyenne des valeurs d'un champ numérique. |
| MIN(attribut) et MAX(attribut) | Fonction d'agrégations : obtenir la valeur maximale ou minimale d'un champ numérique. |
| COUNT(Attribut) | Fonction d'agrégations : compter des enregistrements |
| LIKE | Comme. Exemple nomJoueur LIKE 'Terez' |
| BETWEEN | Entre |
| IN  | Dans |
| AND | Intersection |
| OR  | Union |
| NOT | Négation |
| &lt;,&gt;, &lt;=,&gt;= | Utilisables sur des données numériques |
| %   | Symbole qui représente une chaîne de caractères. |
| _   | Symbole qui représente un caractère |
| INSERT INTO nom table (champ1,champ2, ...) VALUES (valeur1,valeur2, ...) ; | Insertion des données. On ajoute un $n$-uplet.  <br>Exemple : INSERT INTO JOUEUR (idJoueur,nomJoueur,pnomJoueur) VALUES (6,Smatik,Karim) |
| UPDATE nom_table SET ... WHERE ... | Modifier des données.  <br>Exemple : UPDATE partie SET idvainqueur = 1 WHERE idpartie=1 |
| DELETE FROM nom_table WHERE .... | Suppression des données. On supprime toute la ligne identifiée par le critère qi suit le mot-clé WHERE.  <br>Exemple : DELETE FROM partie WHERE idpartie=10 |

!!! note
    Le même nom d'attribut pour être utilisé dans deux tables différents : il est nécessaire alors de préciser le nom de la table que l'on considère en préfixant le nom de l'attribut par celui de la table : `table.attribut`.  

!!! note
    De plus, il est possible d'utiliser des `alias` au lieu du nom complet de la table grâce à l'instruction `AS`, ce qui permet par exemple de réduire la longeur de la requête.
        
## 4. Des accès pour vous entraîner


Il existe quelques bases de données accessibles sur le web pour vous entraîner dans vos requêtes.

* [Base de données en français avec des exemples de requêtes sur le CNAM](http://deptfod.cnam.fr/bd/tp/)