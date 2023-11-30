
# TD

{{ initexo(0) }}


!!! example "{{ exercice() }}"
    === "énoncé"
        Dessiner tous les arbres binaires ayant respectivement 3 et 4 nœuds.
    === "corrigé"
        3 noeuds :

        ```mermaid
        graph TB
            A((1))-->B((2))
            B-->C((3))
        ```

        ```mermaid
        graph TB
            A((1))-->B((2))
            A-->C((3))
        ```

        4 noeuds:

        ```mermaid
        graph TB
            A((1))-->B((2))
            A-->C((3))
            A-->D((4))
        ```

        ```mermaid
        graph TB
            A((1))-->B((2))
            A-->C((3))
            B-->D((4))
        ```

        ```mermaid
        graph TB
            A((1))-->B((2))
            A-->C((3))
            C-->D((4))
        ```

        ```mermaid
        graph TB
            A((1))-->B((2))
            B-->C((3))
            C-->D((4))
        ```

!!! example "{{ exercice() }}"
    === "énoncé"
        Ci dessous un arbre binaire :

        ![exo_parcours](./data/exo_parcours.png)

        Donner le rendu de chaque parcours :

        1. Parcours en largeur
        2. Parcours préfixe
        3. Parcours infixe
        4. Parcours postfixe

!!! example "{{ exercice() }}"
    === "énoncé"
        Ci-dessous un arbre binaire :

        ![exo_2](./data/exo_2.png)

        Donner le rendu de chaque parcours :

        1. Parcours en largeur
        2. Parcours préfixe
        3. Parcours infixe
        4. Parcours postfixe
