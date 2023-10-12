# TP

{{initexo(0)}}


!!! example "{{ exercice() }}: Découverte de DB Browser"

    1. Ouvrir `DB Browser for SQLite`
    2. Changer la langue avec le menu `Edition`/`Preferences`.
    3. Cliquer sur `Nouvelle base de données`, aller dans le répertoire dans lequel vous travaillez sur ce TP et taper `ma_premiere_base` puis cliquer sur `save`.
    4. Pour pouvoir sauvegarder la base de donnée **et** les requêtes réalisées, cliquer `Fichier` et `Enregistrer le projet sous...`. Choisir le même répertoire et le nom `mon_premier_projet_de_base`.
    5. Aller dans l'onglet `Exécuter le SQL` et cliquer sur l'icône `New Tab`. Vous pouvez maintenant taper des requêtes et les éxécuter avec l'icône `Exécuter`:
        1. Taper la requête permettant de créer la table du premier exercice du TD sur les annuaires:
        ```SQL
        CREATE TABLE annuaire(
            nom VARCHAR(30) NOT NULL,
            prenom VARCHAR(30) NOT NULL,
            tel VARCHAR(30) PRIMARY KEY
        );
        ```
        2. Si la requête a fonctionné, aller dans l'onglet `Structure de la base de données` pour observer l'effet de la requête.
        3. Exécuter une nouvelle fois la requête, que se passe-t-il ? Pourquoi ?
    6. Ajouter votre numéro de téléphone dans cet annuaire.
    7. Sauvegarder le tout et poster sur moodle.

{{initexo(0)}}


!!! example "{{ exercice() }}: Une base de données"

    Le schéma relationnel d'une base de données de films est donnée ci-dessous sous forme de shéma entité/relation. Cette représentation est hors programme NSI mais le schéma devrait être assez compréhensible.

    PK signifie clé primaire (primary key)

    FK signifie clé étrangère (foreign key)

    ```mermaid
    erDiagram
        film ||--o{ paysfilm : produit_en
        film ||--o{ realisateur : realise_par
        film {
            int id_film PK
            int id_realisateur FK
            text titre
            int annee_sortie
            int entrees_salle
        }
        realisateur ||--o{ pays : vient_de
        realisateur {
            int id_realisateur PK
            text prenom
            text nom
            date date_de_naissance
            int id_pays FK
        }
        pays ||--o{ paysfilm : est
        pays {
            int id_pays PK
            text nom
            text capitale
            int nombre_habitants
        }
        paysfilm{
            int id_pays FK
            int id_film FK
        }
    ```
    1. Créer un nouveau projet et une nouvelle base de données que vous rendrez à la fin du TP.
    1. Créer les requêtes SQL permettant de créer ces différentes tables
    2. Créer les requêtes permettant de remplir les données suivantes: le film américains "les septs mercenaires" sortie en 1961 a fait 7047964 entrées en salle. Il a été réalisé par John Sturges, réalisateur américain né le 3 janvier 1910.