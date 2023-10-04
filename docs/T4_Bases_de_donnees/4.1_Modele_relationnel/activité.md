# Activité

## Soulever les problèmes

On considère la table suivante:

| titre | nom\_aut | prenom\_aut | nai\_aut | langue | ann\_pub | thèmes |
| --- | --- | --- | --- | --- | --- | --- |
| 1984 | Orwell | George | 1903 | anglais | 1949 | Totalitarisme, science-fiction, anticipation, Dystopie |
| Dune | Herbert | Frank | 1920 | anglais | 1965 | science-fiction, anticipation |
| Fondation | Asimov | Isaac | 1920 | anglais | 1951 | science-fiction, Economie |
| Le meilleur des mondes | Huxley | Aldous | 1894 | anglais | 1931 | Totalitarisme, science fiction, dystopie |
| Fahrenheit 451 | Bradbury | Ray | 1920 | anglais | 1953 | science-fiction, Dystopie |
| Ubik | K. Dick | Philip | 1928 | anglais | 1969 | science-fiction, anticipation |
| Chroniques martiennes | Bradbury | Rey | 1920 | anglais | 1950 | science-fiction, anticipation |
| La nuit des temps | Barjavel | René | 1911 | français | 1968 | science-fiction, tragédie |
| Blade runner | K Dick | Philip | 1928 | anglais | 1968 | Intelligence artificielle, science fiction |
| Les robots | Asimov | Isaac | 1920 | anglais | 1950 | science fiction, Intelligence artificielle |
| La planète des singes | Boulle | Pierre | 1912 | francais | 1963 | science fiction, Dystopie |
| Ravage | Barjavel | René | 1911 | français | 1943 | Science-Fiction, anticipation |
| Le maître du haut chateau | K.Dick | Philip | 1928 | anglais | 1962 | Dystopie, Uchronie |
| Le monde des A | Van Vogt | Alfred Elton | 1912 | anglais | 1945 | science fiction, IA |
| La fin de l'éternité | Asimov | Isaac | 1920 | anglais | 1955 | science-fiction, voyage dans le temps |
| De la Terre à la Lune | Verne | Jules | 1828 | français | 1865 | Science-Fiction, aventure |

1. Imaginez quels problèmes peuvent se poser cette table si on cherche à:
 - modifier la date de naissance d'un auteur
 - chercher tous les livres de science-fiction

2. Quelles solutions peut-on imaginer pour y remédier ?

*Intermède cours*

3. 
   1. Combien notre table possède t-elle d'enregistrements ?
   2. Quels sont tous les attributs de la table ?
   3. Citez un attribut atomique (ayant une seule valeur) et un attribut non atomique (ayant plusieurs valeurs)
   4. Pour chaque attribut, précisez le domaine.

## Construire un modèle robuste

1. Identifiez les éléments de la table qui sont en contradiciton avec les principes du modèle relationnel.

    Vous avez identifié plusieurs problèmes liés à cette table qui transgressent les règles du modèle relationnel que nous avons d'énoncé. Vous allez à présent redistribuer ces données dans 4 tables :

        - une table Livres
        - une table Auteurs
        - une table Themes
        - une table Langues

2. Quels attributs proposez-vous pour chacune des tables
3. Comment peut-on connaître l'auteur de 1984
5. Dans la table Livres, quelle est la clé primaire ? quelles sont les clés étrangères ?
6. Dans la table Auteurs, l'attribut date de naissance est-il une clé primaire ?
7. Quel peut être l'intérêt de mettre la langue dans une table langues ? Quel problème dans la table de départ cela résout-il ?
4. Comment peut-on connaître les thèmes abordés de 1984 ?
