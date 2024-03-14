# TD

{{initexo(0)}}

!!! example "{{ exercice() }}"
    === "énoncé"
        En utilisant la fonction `filtre_liste` définie ci-dessous, proposer une fonction:

        1. `commence_par_a(txt)` renvoyant `True` si la chaine `txt` commence par `a` et `False` sinon. Exemple ci-dessous:
            ```python
            >>> filtre_liste(commence_par_a, ['allemand', 'anglais', 'francais'])
            ['allemand', 'anglais']
            ```
        2. `contient_roi(txt)` renvoyant `True` si la chaine `txt` contient la chaine `roi` et `False` sinon. Exemple ci-dessous:
            ```python
            >>> filtre_liste(contient_roi, ['roi des francs', 'roi du Maroc', 'prince de Galles'])
            ['roi des francs', 'roi du Maroc']
            ```
        3. `contient(chaine)` renvoyant une fonction de paramètre `txt` qui renvoie `True` si la chaine `txt` contient la chaine `chaine` et `False` sinon.
            ```python
            >>> filtre_liste(contient('Maroc'), ['roi des francs', 'roi du Maroc', 'prince de Galles'])
            ['roi du Maroc']
            ```

        ```python
        def filtre_liste(op, liste):
        lst = []
        for elem in liste:
            if op(elem):
                lst.append(elem)
        return lst
        ```

!!! example "{{ exercice() }}"
    === "énoncé"
        Compléter la fonction `applique_fonction_sur_liste(fonction, liste)` renvoyant une liste où chaque élément correspond à l'élément de la liste `liste` sur lequel on a appliqué la fonction `fonction`.

        Exemple :

        ```python
        def  oppose(a):
            return -a
        ```

        ```python
        >>> applique_fonction_sur_liste(oppose, [1, 2, 3, 4, -5])
        [-1, -2, -3, -4, 5]
        ```

        À compléter:

        ```python
        def applique_fonction_sur_liste(fonction, liste):
            liste_retour = ...
            for elem in ... :
                liste_retour.append(...)
            return ...
        ```

!!! example "{{ exercice() }}"
    === "énoncé"
        Compléter la fonction `reduire_liste(fonction, liste)` renvoyant une valeur où l'on applique successivement la fonction `fonction` sur la valeur précédente avec l'élément suivant de la liste `liste`.

        Exemple :

        ```python
        def  concat(a, b):
            return a + " " + b
        ```

        ```python
        >>> reduire_liste(concat, ["bonjour", 'les', 'NSI'])
        'bonjour les NSI'
        ```

!!! example "{{ exercice() }}"
    === "énoncé"
        En utilisant les lambda fonctions :

        1. Créer une fonction `superieur_a_0` renvoyant `True` si l'unique parametre d'entrée en positif et `False` sinon. 
        2. Créer une fonction `différence` renvoyant la différence entre le premier et le deuxième paramètre. 
        3. Créer une fonction `milieu` renvoyant la valeur au milieu du premier et du deuxième paramètre. 
        4. Créer une fonction `initiale` renvoyant les initiales (premières lettres) du premier et du deuxième paramètre séparées par un point.

!!! example "{{ exercice() }}"
    === "énoncé"
        Refaire les exercices 1, 2 et 3 en utilisant `filter`, `map` et `reduce` et les lambda fonctions.