# Graphes

![image](data/BO1.png){: .center}

![image](data/BO2.png){: .center}

## 1. Définitions

!!! abstract "Graphe, Sommet, Arrête"
    Un **graphe** est une structure composée d'objets dans laquelle certaines paires d'objets sont en relation.
    Les objets sont appelés **sommets** (ou nœuds), et les relations entre sommets sont des **arêtes** (ou liens)1.

!!! abstract "Représentation"
    Un graphe est fréquemment représenté par un **diagramme** sous la forme d'un ensemble de points pour les sommets, joints entre eux par des lignes droites ou courbes pour les arêtes.

!!! example
    <figure markdown>
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

On distingue les **graphes non orientés**, où les arêtes relient deux sommets de manière symétrique, et les **graphes orientés**, où les arêtes, alors appelées **arcs**, relient deux sommets de manière asymétrique.

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
