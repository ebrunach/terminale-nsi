# TD

{{ initexo(0) }}

!!! example "{{ exercice() }} : Maximum"
    === "énoncé"
        Que fait la fonction récursive ci-dessous:

        ```python
        def mystere(lst, i = 0, j = None):
            if j is None:
                j = len(lst) - 1
            if i == j:
                return lst[i]
            else:
                milieu = (i + j) // 2
                return max(mystere(lst, i, milieu), mystere(lst, milieu + 1, j))
        ```

!!! example "{{ exercice() }} : Mediane"
    === "énoncé"
        1. Réfléchir à l'utilisation da la méthode "diviser pour régner" pour déterminer la valeur médiane d'un tableau d'entier non trié.
        2. Mise en place: pour réaliser cet algorithme, nous allons chercher la k-ième valeur dans une liste.

            1. Réaliser une fonction `sous_listes(lst, pivot)` ayant en entrée une liste `lst`et une valeur de la liste `pivot` et retournant 3 sous-listes:

                - la sous-liste `lst_g` des valeurs strictement inférieures au paramètre
                - la sous-liste `lst_d` des valeurs strictement supérieures au paramètre
                - la sous-liste `lst_m` des valeurs strictement égales au paramètre
            
            On a alors trois cas possibles en fonction de la taille de ces trois sous-listes:

            - Si `k` est inférieur à la taille de la sous-liste de gauche, alors la k-ième valeur est dans la sous-liste de gauche
            - Sinon, si `k` est inférieur à la somme de la taille de la sous-liste de gauche et la taille de la sous-liste du milieu, alors la k-ième valeur est le pivot.
            - Sinon, la k-ième valeur appartient à la sous liste de droite (mais elle n'est plus la k-ième valeur de cette liste)

            2. Réaliser une fonction récursive `rang(lst, k)` implémentant cet algorithme.
        3. Le code suivant permet de mesurer le temps d'exécution:

            ```python
            import timeit
            from random import randint

            lst = [randint(-100, 100) for i in range(1000)]
            l = (len(lst) + 1)//2
            lst_trie = sorted(lst)

            def affiche_temps():
                print(timeit.timeit("rang(lst, l)", number=1000, globals=globals()))
                print(timeit.timeit("rang(lst_trie, l)", number=1000, globals=globals()))
            ```

            il affiche:
            
            ```python
            >>> affiche_temps()
            0.4649738329972024
            10.53528591000213
            ```

            Analyser les temps obtenus. Que pouvez vous en conclure ?
        

!!! example "{{ exercice() }} : Type bac"
    === "énoncé"
        ...