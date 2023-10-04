
# Cours

## 1. Le modèle relationnel

### 1.1 Les grands principes

Le **modèle relationnel** a été introduit par **Codd**, en 1970 au laboratoire de recherche d'IBM de San José. Il s'agit d'un modèle simple et puissant à la base de la majorité des bases de données, encore aujourd'hui.

Les objectifs du modèle relationnel, formulés par Codd, sont les suivants :

- Assurer l'indépendance des applications et de la **représentation interne des données** (chaque table contient des données relatives à un même sujet, et on met en ralation les tables à l'aide de clés)
- Gérer les problèmes de **cohérence** et de **redondance** des données (ne pas stocker des données qui peuvent être calculées (exemple : une ligne Total), chaque champ ne contient qu'une seule information)
- Utiliser des langages de données basés sur des théories solides.

### 1.2 Vocabulaire

Le modèle relationnel permet de représenter les données que l'on va gérer à l'aide d'un très petit nombre de concepts très simples :

- Les **relations** (ou tables) : des lignes et des colonnes:
    - Les lignes sont appelés des **enregistrements**
    - les titres de colonnes sont des **attributs**
- Les **domaines** de valeurs : chaque case d'une table prend une unique valeur dans un domaine pré-défini (*contrainte de domaine*)
- Les **clés** : il existe des cases (ou des n-uplets de cases) dont les valeurs doivent être uniques et non nulles (*contrainte de relation*)
- Les **clés étrangères** : il existe des cases qui doivent prendre une valeur existante dans les cases d'une autre table (*contrainte de référence*)



## 2. Schéma relationnel
Pour décrire sans ambiguité une relation, on utilise un **schéma relationnel** composé:

- du nom de la relation
- de la liste des attributs
- de la clé primaire (clé choisie pour être l'"entrée" de l'enregistrement)
- des clés étrangères

*Exemple:*

- Un schéma relationnel:

Personne (<u>Numero</u>:Entier, Nom:Chaîne, Prénom:Chaîne, #LieuNaissance=>Ville)

- Et son instance:

| Numero | Nom | Prénom | LieuNaissance |
|--------|-----|--------|---------------|
| 1      | Durand| Pierre | 93200 |
| 2      | Dupont | Marie | 75018 |


## Base de donnée relationnelle
La structure d'une base de données relationnelle est un ensemble de schémas relationnels qui respecte les contraintes du modèle relationnel.

*Exemple:*

- Ensemble de schémas relationnels:

Personne (<u>Numero</u>:Entier, Nom:Chaîne, Prénom:Chaîne, #LieuNaissance=>Ville)

Pays (<u>Nom</u>:Chaîne, Population:Entier, Superficie:Réel, #Dirigeant=>Personne)

Ville (<u>CodePostal</u>:Chaîne, Nom:Chaîne, #Pays=>Pays)

- Et une instance de cette base de données:
**Personne**

| Numero | Nom | Prénom | LieuNaissance |
|--------|-----|--------|---------------|
| 1      | Durand| Pierre | F93200 |
| 2      | Dupont | Marie | F75018 |

**Pays**

| Nom | Population | Superficie | Dirigeant |
|--|--|--|--|
|France|60|500000,01|2|
|Allemagne|80|340000,98|2|
|Espagne|40|350000,2|1|

**Ville**

|CodePostal|Nom|Pays|
|--|--|--|
|F93200 | Saint-Denis | France |
|F75018 | Paris | France |


