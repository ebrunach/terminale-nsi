# TD

{{initexo(0)}}

!!! example "{{ exercice() }}: vocabulaires"
    Sur les deux graphes ci-dessous:
    <table><tr><td>
    <figure markdown>
    ```mermaid
    flowchart LR
    F((F)) --- D((D))
    D --- E((E))
    D --- C((C))
    E --- B((B))
    C --- B
    E --- A((A))
    B --- A
    F --- A
    E --- F
    D --- G((G))
    G --- B
    ```
    </figure>
    </td><td>
    <figure markdown>
    ```mermaid
    flowchart RL
    F((F)) --> D((D))
    E((E)) --> D
    D --> C((C))
    E --> B((B))
    C --> B
    E --> A((A))
    E --> F
    D --> G((G))
    G --> B
    A --> A
    ```
    </figure>
    </td></tr></table>

    1. Donner l'ordre.
    2. Donner le nombre d'arêtes ou d'arcs.
    3. Donner les sommets adjacents à A
    4. Donner le degré du sommet A
    5. Donner trois chemins allant de E à B

!!! example "{{ exercice() }}: modélisation"
    Modéliser par un graphe les situations suivantes (que représentent les sommets et les arrêtes (ou arcs)):
    
    1. Réseau routier
    2. Boggle
    3. Labyrinthe
