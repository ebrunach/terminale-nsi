# TD

**Sur les listes**

{{initexo(0)}}

!!! example "{{ exercice() }}: Utilisation simple de l'interface Liste"
    === "énoncé"
        1. Ecrire le code permettant de faire la liste chainée suivante `|"World"|*|-->|"!"|None|`
        2. Ecrire le code permettant modifier liste précédente en `|"Hello"|*|-->|"World"|*|-->|"!"|None|`
        3. Ecrire le code permettant modifier liste précédente en `|"Hello"|*|-->|"world"|*|-->|"!"|None|`
        3. Ecrire le code permettant modifier liste précédente en `|"Hello"|*|-->|"world"|*|-->|" "|*|-->|"!"|None|`

    === "corrigé"
        1. 
            ```python
            lst = creer_liste()
            inserer_tete(lst, "!")
            inserer_tete(lst, "World")
            ```
        2. 
            ```python
            inserer_tete(lst, "Hello")
            ```
        3. 
            ```python
            set_maillon_indice(lst, 1, "world")
            ```
        4. 
            ```python
            inserer_apres(lst, " ", get_maillon_indice(lst, 1))
            ```

!!! example "{{ exercice() }}:  Liste chainée vers liste python"
    === "énoncé"
        Ecrire une fonction `TransformeListeChainee(liste)` transformant une liste chainée en liste python.

        ```python
        >>> afficher(liste)
        |1|*|-->|2|*|-->|3|None|
        >>> TransformeListeChainee(liste)
        [1, 2, 3]
        ```

    === "corrigé"

        ```python
        def TransformeListeChainee(liste):
            lst = []
            for i in range(taille(liste)):
                lst.append(get_valeur_maillon_indice(liste, i))
            return lst
        ```

!!! example "{{ exercice() }}:  Quelques opérations sur les listes"
    === "énoncé"
        Ecrire les fonctions renvoyant les valeurs suivantes:

        1. Le maximum d'une liste passée en paramètre
        2. Le minimum d'une liste passée en paramètre
        3. La somme des éléments de la liste
        4. La moyenne des éléments de la liste

    === "correction"
        1.
            ```python
            def maximum(liste):
                if not est_vide(liste):
                    max = get_valeur_maillon_indice(liste,0)
                    for i in range(1, taille(liste)):
                        val = get_valeur_maillon_indice(liste,i)
                        if val > max:
                            max = val
                    return max
            ```

        2.
            ```python
            def minimum(liste):
                if not est_vide(liste):
                    min = get_valeur_maillon_indice(liste,0)
                    for i in range(1, taille(liste)):
                        val = get_valeur_maillon_indice(liste,i)
                        if val < min:
                            min = val
                    return min
            ```

        3.
            ```python
            def somme(liste):
                val = 0
                for i in range(taille(liste)):
                    val += get_valeur_maillon_indice(liste,i)
                return val
            ```

        4.
            ```python
            def moyenne(liste):
                if not est_vide(liste):
                    return somme(liste)/taille(liste)
            ```

**Sur les piles**

!!! example "{{ exercice() }}:  Utilisation de l'interface Pile"
    Écrire les instructions permettant de :

    - créer une pile
    - la remplir avec les entiers 0,2,4,6,8
    - la faire afficher
    - "dépiler" la pile en faisant afficher l’élément récupéré

!!! example "{{ exercice() }}:  Extension de l'interface"
    1. Ecrire une fonction sommet() renvoyant le dernier élément de la pile (sans l'enlever)
    2. Ecrire une fonction taille() renvoyant la hauteur de la pile

!!! example "{{ exercice() }}:  Contrôle de parenthésage"
    Il s’agit d’écrire une fonction qui contrôle si une expression mathématique, donnée sous forme d’une chaîne de caractères, est bien parenthésée, c’est- à-dire s’il y a autant de parenthèses ouvrantes que de fermantes, et qu’elles sont bien placées

    Par exemple :
    - (..(..)..) est bien parenthésée
    - (...(..(..)...) ne l’est pas

    1. Décrire l'algorithme permettant de contrôler le parenthésage (explication en texte)
    2. Ecrire la fonction `verification(expr)` vérifiant si une expression mathématique passée en paramètre est correctement parenthésée.
    ```python
    >>> verification("(2 + 4) * 3")
    True
    >>> verification('(2 + 4 * 3')
    False
    ```
    3. Faire en sorte que le programme tienne compte également des `[`

!!! example "{{ exercice() }}:  Addition"

    En utilisant uniquement les 4 primitives d’une pile, écrire en langage Python la fonction `addition(p)` qui prend en paramètre une pile p d’au moins deux éléments et qui remplace les deux nombres du sommet d’une pile p par leur somme.
    *Remarque* : cette fonction ne renvoie rien, mais la pile p est modifiée.

**Sur les files**

!!! example "{{ exercice() }}:  Extension de l'interface"
    1. Ecrire une fonction sommet() renvoyant le dernier élément de la file (sans l'enlever)
    2. Ecrire une fonction taille() renvoyant la taille de la file

**Vers le bac**

!!! example "{{ exercice() }}:  Une épreuve 2022"

    La poussette est un jeu de cartes en solitaire. Cet exercice propose une version simplifiée de ce jeu basée sur des nombres.

    On considère une pile constituée de nombres entiers tirés aléatoirement. Le jeu consiste à réduire la pile suivant la règle suivante : quand la pile contient du haut vers le bas un triplet dont les termes du haut et du bas sont de même parité, on supprime l'élément central.

    Par exemple :
    - Si la pile contient du haut vers le bas, le triplet 1 0 3, on supprime le 0.
    - Si la pile contient du haut vers le bas, le triplet 1 0 8, la pile reste inchangée.

    On parcourt la pile ainsi de haut en bas et on procède aux réductions. Arrivé en bas de la pile, on recommence la réduction en repartant du sommet de la pile jusqu'à ce que la pile ne soit plus réductible. Une partie est « gagnante » lorsque la pile finale est réduite à deux éléments exactement.

    Voici un exemple détaillé de déroulement d'une partie. 

    ![](sources/annale2022%20-%201.png)

    1. 
        1. Donner les différentes étapes de réduction de la pile suivante :
        ![](sources/annale2022%20-%202.png)
        2. Parmi les piles proposées ci-dessous, donner celle qui est gagnante. 
        ![](sources/annale2022%20-%203.png)

        L'interface d'une pile est proposée ci-dessous. On utilisera uniquement les fonctions
        figurant dans le tableau suivant : 

        |Structure de données abstraite : Pile|
        |---|
        |• `creer_pile_vide()` renvoie une pile vide|
        |• `est_vide(p)` renvoie `True` si `p` est vide, `False` sinon|
        |• `empiler(p, element)` ajoute element au sommet de `p`|
        |• `depiler(p)` retire l'élément au sommet de `p` et le renvoie|
        |• `sommet(p)` renvoie l'élément au sommet de `p` sans le retirer de `p`|
        |• `taille(p)`: renvoie le nombre d'éléments de `p`|

    2. La fonction `reduire_triplet_au_sommet` permet de supprimer l'élément central des trois premiers éléments en partant du haut de la pile, si l'élément du bas et du haut sont de même parité. Les éléments dépilés et non supprimés sont replacés dans le bon ordre dans la pile.

        Recopier et compléter sur la copie le code de la fonction `reduire_triplet_au_sommet` prenant une pile `p` en paramètre et qui la modifie en place. Cette fonction ne renvoie donc rien.

        ```python
        def reduire_triplet_au_sommet(p):
            a = depiler(p)
            b = depiler(p)
            c = sommet(p)
            if a % 2 != .... :
                empiler(p, ...)
            empiler(p, ...) 
        ```

    3. On se propose maintenant d'écrire une fonction `parcourir_pile_en_reduisant` qui parcourt la pile du haut vers le bas en procédant aux réductions pour chaque triplet rencontré quand cela est possible.
        1. Donner la taille minimale que doit avoir une pile pour être réductible.
        2. Recopier et compléter sur la copie :

        ```python
        def parcourir_pile_en_reduisant(p):
            q = creer_pile_vide()
            while taille(p) >= ....:
                reduire_triplet_au_sommet(p)
                e = depiler(p)
                empiler(q, e)
            while not est_vide(q):
                .............
                .............
            return p 
        ```

    4. Partant d'une pile d'entiers p, on propose ici d'implémenter une fonction récursive jouer renvoyant la pile p entièrement simplifiée. Une fois la pile parcourue de haut en bas et réduite, on procède à nouveau à sa réduction à condition que cela soit possible. Ainsi :

        - Si la pile p n’a pas subi de réduction, on la renvoie.
        - Sinon on appelle à nouveau la fonction jouer , prenant en paramètre la pile réduite.

        Recopier et compléter sur la copie le code ci-dessous : 
        ```python
        def jouer(p):
            q = parcourir_pile_en_reduisant(p)
            if .............. :
                return p
            else:
                return jouer(...) 
        ```
