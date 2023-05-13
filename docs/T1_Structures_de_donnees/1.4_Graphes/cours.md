# Graphes

![image](data/BO1.png){: .center}

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
    - Lorsqu'un sommet $x$ est relié (par un arc ou une arête) au sommet $y$, on dit que $y$ est **adjacent** à $x$.
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

L'objectif va être de créer une classe implémentant l'interface d'un graphe orienté suivant:

| Opération | Description |
|---|---|
| ajouter_sommet(sommet) | Ajouter un sommet nommé *sommet* au graphe |
| ajouter_arc(sommet_debut, sommet_fin) | AJouter un arc orienté de sommet_debut à sommet_fin |
| arc(sommet_debut, sommet_fin) | Retoune True si un arc relie sommet_debut à sommet_fin |
| adjacents(sommet) | Retourne la liste des sommets adjacents accessibles |

### 3.1 En utilisant la matrice d'adjacence

```python
class graphe:
    def __init__(self):
        self.A = list()
        self.ordre = 0
        
    def ajouter_noeud(self, sommet):
        """sommet est de type entier"""
        for i in range(self.ordre, sommet + 1):
            for ligne in self.A: # Boucle ajoutant un élément à chaque liste
                ligne.append(False)
            self.A.append([False for i in range(self.ordre + 1)]) # Ajoute une liste à la fin
            self.ordre += 1
        
    def ajouter_arc(self, depart, arrivee):
        self.ajouter_noeud(depart)
        self.ajouter_noeud(arrivee)
        self.A[depart][arrivee] = True
        
    def arc(self, depart, arrivee):
        return self.A[depart][arrivee]
    
    def adjacents(self, sommet):
        lst = []
        for j in range(len(self.A[sommet])):
            if self.A[sommet][j]:
                lst.append(j)
        return lst
```

```python
>>> G = graphe()
>>> G.ajoute_arc(0, 1)
>>> G.ajoute_arc(0, 2)
>>> G.ajoute_arc(1, 2)
>>> G.A
[[False, True, True], [False, False, True], [False, False, False]]
>>> G.arc(0, 1), G.arc(1, 0)
(True, False)
>>> G.adjacents(0)
[1, 2]
```

### 3.2 En utilisant la liste d'adjacence

```python
class graphe:
    def __init__(self):
        self.adj = dict()

    def ajouter_sommet(self, sommet):
        if sommet not in self.adj:
            self.adj[sommet] = dict()

    def ajouter_arc(self, depart, arrivee):
        self.ajouter_sommet(depart)
        self.ajouter_sommet(arrivee)
        self.adj[depart][arrivee] = None

    def arc(self, depart, arrivee):
        return arrivee in self.adj[depart]

    def adjacents(self, sommet):
        lst = []
        for s in self.adj[sommet]:
            lst.append(s)
        return lst
```

```python
>>> G = graphe()
>>> G.ajouter_arc('A','B')
>>> G.ajouter_arc('A','C')
>>> G.ajouter_arc('B','C')
>>> G.adj
{'A': {'B': None, 'C': None}, 'B': {'C': None}, 'C': {}}
>>> G.arc('A','B'), G.arc('B','A')
(True, False)
>>> G.adjacents('A')
['B', 'C']
```

Pour implémenter un graphe non orienté, on utilisera le même principe en assurant maintenant que deux arcs (dans un sens et dans l'autre) soient systématiquement créés pour représenter une arête.

