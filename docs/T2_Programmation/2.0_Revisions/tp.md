---
title:  "TP -- Recherche liste/dico"
header: Terminale NSI
footer: ${pageNo} / ${pageCount}
---
{{initexo(0)}}

Zone de rendu : [TNSINF1](https://moodle.monlycee.net/mod/assign/view.php?id=67411), [TNSINF2](https://moodle.monlycee.net/mod/assign/view.php?id=68455)

!!! example "{{ exercice() }}: Comparaison recherche liste/dico"

    **Préparation des données**

    Considérons deux fonctions fabrique_liste() et fabrique_dict() capables de fabriquer respectivement des listes et des dictionnaires de taille donnée en paramètre.

    ```python
    def fabrique_liste(nb):
        lst = [k**2 for k in range(nb)]
        return lst

    def fabrique_dict(nb):
        dct = {}
        for k in fabrique_liste(nb):
            dct[k] = 42
        return dct
    ```

    1. Tester ces fonctions

        Le contenu de ces listes ou dictionnaires n'a pas grand intérêt. Dans nos mesures, on y cherchera une valeur qui n'y figure pas : la chaîne de caractères "a". On dit qu'on se place dans le pire des cas.

        On crée une fonction permettant de mesurer le temps d'éxécution d'une instruction

        ```python
        def mesure_temps_execution(expr):
            import timeit
            return timeit.timeit(expr, globals=globals(), number = 10000)
        ```

        Celle ci permet de tester le temps d'exécution de 10000 fois l'expression `expr` passé en paramètre.

        Exemple:
        ```python
        >>> mesure_temps_execution('mot = "bonjour"')
        0.0024999999999977263
        ```
        Cela signifie qu'affecter 10000 fois "bonjour" à la variable mot prend 0,0025 seconde.

    2. Utiliser cette fonction pour mesurer le temps d'exécution pour la recherche de 5 dans une liste de taille 10, 100 et 1000 (il faut utiliser `fabrique_liste` pour créer ces listes)

    3. Utiliser cette fonction pour mesurer le temps d'exécution pour la recherche de 5 dans un dictionnaire de taille 10, 100 et 1000 (il faut utiliser `fabrique_dict` pour créer ces dictionnaires)

    4. Que remarquez vous ? Que peut-on en déduire concernant la complexité de ces deux recherches.

!!! example "{{ exercice() }}: Préparation épreuve pratique"

    ## recherche caractère

    Écrire une fonction `recherche` qui prend en paramètres `caractere`, un caractère, et
    `mot`, une chaîne de caractères, et qui renvoie le nombre d’occurrences de `caractere`
    dans `mot`, c’est-à-dire le nombre de fois où `caractere` apparaît dans `mot`.

    Exemples :
    ```python
    >>> recherche('e', "sciences")
    2
    >>> recherche('i',"mississippi")
    4
    >>> recherche('a',"mississippi")
    0
    ```

    ## recherche successions

    Écrire une fonction `recherche` qui prend en paramètre un tableau de nombres entiers
    `tab`, et qui renvoie la liste (éventuellement vide) des couples d'entiers consécutifs
    successifs qu'il peut y avoir dans `tab`.

    Exemples :
    ```python
    >>> recherche([1, 4, 3, 5])
    []
    >>> recherche([1, 4, 5, 3])
    [(4, 5)]
    >>> recherche([7, 1, 2, 5, 3, 4])
    [(1, 2), (3, 4)]
    >>> recherche([5, 1, 2, 3, 8, -5, -4, 7])
    [(1, 2), (2, 3), (-5, -4)]
    ```

    ## recherche min max

    Écrire une fonction `RechercheMinMax` qui prend en paramètre un tableau de nombres non triés `tab`, et qui renvoie la plus petite et la plus grande valeur du tableau sous la forme d’un dictionnaire à deux clés ‘min’ et ‘max’. Les tableaux seront représentés sous forme de liste Python.

    Exemples :
    ```python
    >>> tableau = [0, 1, 4, 2, -2, 9, 3, 1, 7, 1]
    >>> resultat = rechercheMinMax(tableau)
    >>> resultat
    {'min': -2, 'max': 9}
    >>> tableau = []
    >>> resultat = rechercheMinMax(tableau)
    >>> resultat
    {'min': None, 'max': None}
    ```

    ## recherche max

    Écrire une fonction `maxi` qui prend en paramètre une liste `tab` de nombres entiers et qui renvoie un couple donnant le plus grand élément de cette liste ainsi que l’indice de la première apparition de ce maximum dans la liste.

    Exemple :
    ```python
    >>> maxi([1,5,6,9,1,2,3,7,9,8])
    (9,3)
    ```

    ## recherche indice

    Écrire une fonction `recherche` qui prend en paramètres `elt` un nombre entier et `tab` un tableau de nombres entiers, et qui renvoie l’indice de la première occurrence de `elt` dans `tab` si `elt` est dans `tab` et -1 sinon.

    Exemples :
    ```python
    >>> recherche(1, [2, 3, 4])
    -1
    >>> recherche(1, [10, 12, 1, 56])
    2
    >>> recherche(50, [1, 50, 1])
    1
    >>> recherche(15, [8, 9, 10, 15])
    3
    ```

    ## création dictionnaire

    L’occurrence d’un caractère dans un phrase est le nombre de fois où ce caractère est
    présent.

    Exemples :

    - l’occurrence du caractère ‘o’ dans ‘bonjour’ est 2 ;
    - l’occurrence du caractère ‘b’ dans ‘Bébé’ est 1 ;
    - l’occurrence du caractère ‘B’ dans ‘Bébé’ est 1 ;
    - l’occurrence du caractère ‘ ‘ dans ‘Hello world !’ est 2.

    On cherche les occurrences des caractères dans une phrase. On souhaite stocker ces occurrences dans un dictionnaire dont les clefs seraient les caractères de la phrase et les valeurs l’occurrence de ces caractères.

    Par exemple : avec la phrase 'Hello world !' le dictionnaire est le suivant :

    `{'H': 1,'e': 1,'l': 3,'o': 2,' ': 2,'w': 1,'r': 1,'d': 1,'!': 1}` (l’ordre des clefs n’ayant pas d’importance).

    Écrire une fonction `occurence_lettres` avec prenant comme paramètre une variable `phrase` de type str. Cette fonction doit renvoyer un dictionnaire de type constitué des occurrences des caractères présents dans la phrase.