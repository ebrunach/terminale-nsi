
# TD

{{ initexo(0) }}


!!! example "{{ exercice() }}"
    === "énoncé"
        Dessiner tous les arbres binaires ayant respectivement 3 et 4 nœuds.
    


!!! example "{{ exercice() }}"
    === "énoncé"
        Ci dessous un arbre binaire :

        ![exo_parcours](./data/exo_parcours.png)

        Donner le rendu de chaque parcours :

        1. Parcours en largeur
        2. Parcours préfixe
        3. Parcours infixe
        4. Parcours postfixe
    
    {{correction(True,
    """
    === \"correction\"
        1. largeur : `1, 2, 3, 4, 5, 6, 7, 8, 9`
        2. préfixe : `1, 2, 4, 5, 7, 8, 3, 6, 9`
        3. infixe : `4, 2, 7, 5, 8, 1, 9, 6, 3`
        4. postfixe : `4, 7, 8, 5, 2, 9, 6, 3, 1`
    """)}}

!!! example "{{ exercice() }}"
    === "énoncé"
        Ci-dessous un arbre binaire :

        ![exo_2](./data/exo_2.png)

        Donner le rendu de chaque parcours :

        1. Parcours en largeur
        2. Parcours préfixe
        3. Parcours infixe
        4. Parcours postfixe

    {{correction(True,
    """
    === \"correction\"
        1. largeur : `9, 8, 7, 6, 2, 5, 1, 4, 3`
        2. préfixe : `9, 8, 6, 2, 1, 7, 5, 4, 3`
        3. infixe : `6, 8, 1, 2, 9, 4, 5, 3, 7`
        4. postfixe : `6, 1, 2, 8, 4, 3, 5, 7, 9`
    """)}}
