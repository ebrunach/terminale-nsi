
# TD

{{ initexo(0) }}


!!! example "{{ exercice() }} : BD"
    === "énoncé"
        Coder la fonction `prix(etage)` de la BD présentée dans le cours.

!!! example "{{ exercice() }} : Factorielle"
    === "énoncé"
        On considère la fonction factorielle(n) (notée $n!$ en mathématiques), qui calcule le produit d'un entier  par les entiers positifs qui lui sont inférieurs:

        $$n! = n \times (n-1) \times (n-2) \times \ldots \times 3 \times 2 \times 1$$

        Exemple : $5! = 5 \times 4 \times 3 \times 2 \times 1 = 120$

        Par convention, $0! = 1$

        1. Programmer de manière itérative (manière classique) la fonction factorielle. On l'appelera `fact_it()`.
        2. Programmer de façon récursive la fonction factorielle. On l'appelera `fact_rec()`.

        Quelle paradigme de programmation vous a semblé le plus naturel ?

!!! example "{{ exercice() }} : Minimum liste"
    === "énoncé"
        Supposons que nous ayons une fonction `min(a, b)` qui renvoie le plus petit des entiers `a` et `b` et une liste d'entiers dont il faut déterminer le minimum.

        1. Programmmer une fonction itérative `mini_it(lst)` permettant de déterminer le minimum de la liste `lst`.
        2. Programmmer une fonction récursive `mini_rec(lst)` permettant de déterminer le minimum de la liste `lst`.
        3. Ecrire l'arbre d'appels récursifs de cette dernière fonction pour l'appel de `mini_rec([4, 7, -1, 8])`
        4. Ecrire une fonction récursive `mini_rec2(lst, i = 0)` déterminant le minimum de la liste `lst` sans détruire la liste. *`i = 0` est un paramètre optionnel à 0 par défaut permettant de gérer l'indice à partir duquel on cherche le minimum.*

!!! example "{{ exercice() }} : Occurences liste"
    === "énoncé"
        Programmer une fonction récursive `counr_rec(lst, elem, i = 0)` comptant le nombre d'occurence de l'élément `elem` dans la liste `lst`.

!!! example "{{ exercice() }} : Doublons liste"
    === "énoncé"
        Programmer une fonction récursive `contient_doublons(lst, i = 0)` renvoyant `True` si la liste `lst` contient des doublons, et `False` sinon.

!!! example "{{ exercice() }} : Palindrome"
    === "énoncé"
        Pour rappel, un palindrome est un mot qui se lit indifféremment de gauche à droite ou de droite à gauche (par exemple: “kayak”, “elle” ou “radar”). Écrivez la fonction récursive `est_palindrome(chaine)` renvoyant :
        
        - `True` si la chaîne passée en paramètre est un palindrome, et 
        - `False` sinon (on suppose que tous les caractères sont des minuscules non accentuées).

!!! example "{{ exercice() }} : Fibonacci"
    === "énoncé"
        Considérons la suite numérique ainsi définie:

        - $F_0 = 0$
        - $F_1 = 1$
        - $\forall n \in \mathbb{N}, F_{n+2} = F_{n+1}+F_n$

        On a donc $F_2=0+1=1, F_3=F_2+F_1=1+1=2, F_4=F_3+F_2=2+1=3, F_5=F_4+F_3=3+2=5$ ...

        1. Programmer une fonction itérative `fibo_it(n)` retournant $F_n$. Exemple:
        ```python
        >>> fibo_it(5)
        5
        ```
        2. Programmer un fonction récursive `fibo_rec(n)` retournont $F_n$. *Conseil: se rapprocher de la définition*
        3. Dessiner l'arbre d'appel de `fibo_rec(5)`.

!!! example "{{ exercice() }}"
    === "Énoncé"
        La conjecture de Syracuse (ou de Collatz) postule ceci :  

        *Prenons un nombre $n$ : si $n$ est pair, on le divise par 2, sinon on le multiplie par 3 puis on ajoute 1. On recommence cette opération tant que possible. Au bout d'un certain temps, on finira toujours par tomber sur le nombre 1.*

        1. Proposer un programme récursif ```syracuse(n)``` écrivant tous les termes de la suite de Syracuse, s'arrêtant (on l'espère) à la valeur 1.
        2. On appelle «temps de vol» le nombre d'étapes nécessaires avant de retomber sur 1. Modifier la fonction précédente afin qu'elle affiche le temps de vol pour tout nombre ```n```.

    === "Correction"
        {{ correction(False,
        "
        1.
        ```python linenums='1'
        def syracuse(n):
            print(n)
            if n == 1:
                return None
            if n % 2 == 0:
                syracuse(n // 2)
            else:
                syracuse(3*n + 1)
        ```
        2.
        ```python linenums='1'
        def syracuse(n, t=0):
            print(n)
            t += 1
            if n == 1:
                print('temps de vol :', t)
                return None
            if n % 2 == 0:
                syracuse(n // 2, t)
            else:
                syracuse(3*n + 1, t)
        ``` 
        "
        ) }}        

!!! example "{{ exercice() }}"
    === "Énoncé"
        On considère le jeu des **Tours de Hanoï**.
        Le but est de faire passer toutes les assiettes de A vers C, sachant qu'une assiette ne peut être déposée que sur une assiette de diamètre inférieur.
        ![](data/hanoi0.png){: .center width=60%}

        Une version jouable en ligne peut être trouvée [ici](https://www.mathsisfun.com/games/towerofhanoi.html).

        1. S'entraîner et essayer d'établir une stratégie de victoire.
        2. Observer les images ci-dessous :
        ![](data/hanoi1.png){: .center width=60%}
        ![](data/hanoi2.png){: .center width=60%}
        ![](data/hanoi3.png){: .center width=60%}
        ![](data/hanoi4.png){: .center width=60%}


        Écrire une fonction récursive ```hanoi(n, A, B, C)``` qui donnera la suite d'instructions (sous la forme " A vers C") pour faire passer une pile de taille n de A vers C en prenant B comme intermédiaire.

    === "Correction"
        {{ correction(False,
        """
        ```python linenums='1'
        def hanoi(n, depart, inter, arrivee):
            ''' n : nombre d'assiettes dans la pile
            # depart : la pile de départ('A', 'B' ou 'C')
            # inter : la pile intermédaire('A', 'B' ou 'C')
            # arrivee : la pile d'arrivée ('A', 'B' ou 'C') '''

            if n == 1 :
                print(depart + ' vers ' + arrivee)
            else :
                hanoi(n-1, depart, arrivee, inter) 
                print(depart + ' vers ' + arrivee)
                hanoi(n-1, inter, depart, arrivee)

        hanoi(5, 'A', 'B', 'C')
        ```
        """)}}







