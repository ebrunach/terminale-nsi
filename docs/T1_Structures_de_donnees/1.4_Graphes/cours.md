# Graphes

![image](data/BO1.png){: .center}

![image](data/BO2.png){: .center}

## 1. Définitions

!!! abstract "Graphe, Sommet, Arrête"
    Un **graphe** est une structure composée d'objets dans laquelle certaines paires d'objets sont en relation.
    Les objets sont appelés **sommets** (ou nœuds), et les relations entre sommets sont des **arêtes** (ou liens)1.

!!! abstract "Représentation"
    Un graphe est fréquemment représenté par un **diagramme** sous la forme d'un ensemble de points pour les sommets, joints entre eux par des lignes droites ou courbes pour les arêtes.

On distingue les **graphes non orientés**, où les arêtes relient deux sommets de manière symétrique, et les **graphes orientés**, où les arêtes, alors appelées **arcs**, relient deux sommets de manière asymétrique.

!!! example
    <figure>
    <table>
    <tr>
    <td><figure markdown>
    ``` mermaid
    flowchart LR
    F((6)) --- D((4))
    D --- E((5))
    D --- C((3))
    E --- B((2))
    C --- B
    E --- A((1))
    B --- A
    ```
    <figcaption>graphe A</figcaption>
    </figure>
    </td>
    <td><figure markdown>
    ``` mermaid
    flowchart LR
    F((6)) --> D((4))
    D --> E((5))
    D --> C((3))
    E --> B((2))
    C --> B
    E --> A((1))
    B --> A
    ```
    <figcaption>graphe orienté B</figcaption>
    </figure>
    </td></tr></table></figure>



!!! example "Quelques application"
    On retrouvera les graphes pour modéliser:
    
    - les relations entre les participants à un réseau social
    - la description du web via les liens hypertextes
    - les situations successives dans un jeu

!!! abstract "Vocabulaire"
    - Deux sommets reliés par une arête sont dit **adjacents**.
    - Une graphe est dit **complet** si tous les sommets sont adjacents.
    - L'**ordre** d'un graphe est le nombre de sommets de celui-ci.
    - Le **degré** d’un sommet est le nombre d’arêtes dont ce sommet est une extrémité.

!!! example "graphe A"
    Le graphe A est d'ordre 6.

    Il n'est pas complet car le sommet 4 n'est pas adjacent au sommet 2.

    Le degré du sommet 2 est 3.

!!! abstract "Graphe pondéré"
    Un graphe pondéré est un graphe où chaque arête porte un nombre (son poids).

    <figure markdown>
    ```mermaid
    flowchart RL
    A((A)) ---|2| B((B))
    B ---|6| C((C))
    C ---|3| A
    ```
    </figure>

    *Ces poids peuvent représenter par exemple des coûts, des longueurs ou des capacités...*

!!! abstract "chemin"
    Un **chemin** est une suite de sommets tel qu'il existe une arête reliant chacun de ses sommets.

!!! example "graphe A"
    Sur le graphe A, 1-5-4, 1-2-5-4, 1-2-3-4 sont trois chemins allant de 1 à 4

## 2. Modélisation

Les différentes modélisations ont des impacts sur la compléxité des algorithmes sur les graphes.

## 2.1 Liste d'adjacence

!!! abstract "Liste d'adjacence"
    La liste d'adjacence d'un graphe, est la liste des sommets adjacents (accessibles dans le cas orienté) de chaque sommet

!!! example "Exemples"
    <figure>
    <table>
    <tr>
    <td><figure markdown>
    ``` mermaid
    flowchart LR
    F((6)) --- D((4))
    D --- E((5))
    D --- C((3))
    E --- B((2))
    C --- B
    E --- A((1))
    B --- A
    ```
    <figcaption>graphe A</figcaption>
    </figure>
    </td>
    <td><figure markdown>
    ``` mermaid
    flowchart LR
    F((6)) --> D((4))
    D --> E((5))
    D --> C((3))
    E --> B((2))
    C --> B
    E --> A((1))
    B --> A
    ```
    <figcaption>graphe orienté B</figcaption>
    </figure>
    </td></tr>
    <tr>
    <td>

    |Sommet|Liste de sommets adjacents|
    |---|---|
    |1| 2; 5|
    |2| 1; 3; 5|
    |3| 2; 4|
    |4| 3; 5; 6|
    |5| 1; 2; 4|
    |6| 4|

    </td>
    <td>

    |Sommet|Liste de sommets adjacents|
    |---|---|
    |1| - |
    |2| 1|
    |3| 2|
    |4| 3; 5|
    |5| 1; 2|
    |6| 4|
    
    </td>
    </tr></table></figure>
    

## 2.2 Matrice d'adjacence

!!! abstract "définition"
    Une matrice d'adjacence pour un graphe à n sommets est une matrice de dimension $n$ × $n$ dont l'élément non diagonal $a_{i,j}$ est le nombre d'arêtes liant le sommet $i$ au sommet $j$.

??? note "Mais qu'est ce qu'une matrice"
    *Une matrice (objet mathématique) est un tableau de valeurs. Pour repérer un valeurs d'une matrice, on indique son indice de ligne puis son indice de colonne, les lignes se comptant du haut vers le bas et les colonnes de la gauche vers la droite.*

    <figure markdown>
    ![matrice](https://upload.wikimedia.org/wikipedia/commons/d/d1/Matrice.svg)
    </figure>

!!! Example "Exemples"
    === "Graphe non orienté A"
        ``` mermaid
        flowchart LR
        F((6)) --- D((4))
        D --- E((5))
        D --- C((3))
        E --- B((2))
        C --- B
        E --- A((1))
        B --- A
        ```
        Sa matrice d'adjacence est:

        ${\begin{pmatrix}0&1&0&0&1&0\\1&0&1&0&1&0\\0&1&0&1&0&0\\0&0&1&0&1&1\\1&1&0&1&0&0\\0&0&0&1&0&0\\\end{pmatrix}}$

        *Les matrices d'adjacence des graphes non orientées sont symétriques*

    === "Graphe orienté B"
        ``` mermaid
        flowchart LR
        F((6)) --> D((4))
        D --> E((5))
        D --> C((3))
        E --> B((2))
        C --> B
        E --> A((1))
        B --> A
        ```
        Sa matrice d'adjacence est:

        ${\begin{pmatrix}0&0&0&0&0&0\\1&0&0&0&0&0\\0&1&0&0&0&0\\0&0&1&0&1&0\\1&1&0&0&0&0\\0&0&0&1&0&0\\\end{pmatrix}}$


## 3. Implémentation python


