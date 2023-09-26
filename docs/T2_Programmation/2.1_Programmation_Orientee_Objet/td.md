# TD

{{initexo(0)}}

!!! example "{{ exercice() }}"
    === "énoncé"

        1. Proposer les attributs et les méthodes d'une classe `véhicule`.
        1. Proposer les attributs et les méthodes d'une classe `personnage`.
        1. Proposer les attributs et les méthodes d'une classe `jeu_de_societe`.

!!! example "{{ exercice() }}"
    === "Énoncé"
        1. Écrire une classe ```Eleve``` qui contiendra les attributs ```nom```, ```classe``` et ```note```.
        2. Instancier trois élèves de cette classe.
        3. Écrire une fonction ```compare(eleve1, eleve2)``` qui renvoie le nom de l'élève ayant la meilleure note.

        ??? info "Exemple d'utilisation de la classe"
            ```python
            >>> riri = Eleve("Henri", "TG2", 12)
            >>> fifi = Eleve("Philippe", "TG6", 15)
            >>> loulou = Eleve("Louis", "TG1", 8)
            >>> compare(riri, fifi)
            'Philippe'
            ```

<!--    === "Correction"

   
        ```python linenums='1'
        class Eleve:
            def __init__(self, nom, classe, note):
                self.nom = nom
                self.classe = classe
                self.note = note
                
        def compare(eleve1, eleve2):
            if eleve1.note > eleve2.note:
                return eleve1.nom
            else:
                return eleve2.nom
        ``` 
-->

!!! example "{{ exercice() }}"
    === "énoncé"

        ```python
        class Point:
            def __init__(self, x, y):
                self.x = x
                self.y = y
            
            def deplacer(self, dx, dy):
                self.x += dx
                self.y += dy
        ```

        1. créer deux points de la classe Point
        2. déplacer le premier point de 40 suivant x et 50 suivant y.
        3. proposer une fonction prenant en paramètre deux instances de la classe Point et retournant la distance entre ceux-ci. Je rappelle que la distance entre $A(x_A, y_A)$ et $B(x_B, y_B)$ est $\sqrt{(x_B-x_A)^2+(y_B-y_A)^2}$
        4. Ecrire une méthode `distance_origine` de la classe Point qui renvoie la distance entre le point et l'origine du repère.


!!! aexample "{{ exercice() }}"
    === "Énoncé"
        **Cet exercice est l'exercice 5.2 de la BNS (version 2022)**.

        On dispose d’un programme permettant de créer un objet de type `PaquetDeCarte`,
        selon les éléments indiqués dans le code ci-dessous.
        Compléter ce code aux endroits indiqués par `#A compléter`, puis ajouter des
        assertions dans l’initialiseur de `Carte`, ainsi que dans la méthode `getCarteAt()`.

        ```python linenums='1'
        class Carte:
            """Initialise Couleur (entre 1 a 4), et Valeur (entre 1 a 13)"""
            def __init__(self, c, v):
                self.Couleur = c
                self.Valeur = v

            """Renvoie le nom de la Carte As, 2, ... 10, 
               Valet, Dame, Roi"""
            def getNom(self):
                if ( self.Valeur > 1 and self.Valeur < 11):
                    return str( self.Valeur)
                elif self.Valeur == 11:
                    return "Valet"
                elif self.Valeur == 12:
                    return "Dame"
                elif self.Valeur == 13:
                    return "Roi"
                else:
                    return "As"

            """Renvoie la couleur de la Carte (parmi pique, coeur, carreau, trefle"""
            def getCouleur(self):
                return ['pique', 'coeur', 'carreau', 'trefle' ][self.Couleur - 1]

        class PaquetDeCarte:
            def __init__(self):
                self.contenu = []

            """Remplit le paquet de cartes"""
            def remplir(self):
                ??? = [ ??? for couleur in range(1, ???) for valeur in range( 1, ???)]

            """Renvoie la Carte qui se trouve a  la position donnee"""
            def getCarteAt(self, pos):
                if 0 <= pos < ??? :
                    return ???
        ```

        Exemple :

        ```python
        >>> unPaquet = PaquetDeCarte()
        >>> unPaquet.remplir()
        >>> uneCarte = unPaquet.getCarteAt(20)
        >>> print(uneCarte.getNom() + " de " + uneCarte.getCouleur())
        8 de coeur
        ```

<!-- === "Correction"
        ```python linenums='1'
        class Carte:
            """Initialise Couleur (entre 1 à 4), et Valeur (entre 1 à 13)"""
            def __init__(self, c, v):
                assert c in range(1,5)
                assert v in range(1,14)
                self.Couleur = c
                self.Valeur = v

            """Renvoie le nom de la Carte As, 2, ... 10, Valet, Dame, Roi"""
            def getNom(self):
                if (self.Valeur > 1 and self.Valeur < 11):
                    return str( self.Valeur)
                elif self.Valeur == 11:
                    return "Valet"
                elif self.Valeur == 12:
                    return "Dame"
                elif self.Valeur == 13:
                    return "Roi"
                else:
                    return "As"

            """Renvoie la couleur de la Carte (parmi pique, coeur, carreau, trefle"""
            def getCouleur(self):
                return ['pique', 'coeur', 'carreau', 'trefle'][self.Couleur - 1]

        class PaquetDeCarte:
            def __init__(self):
                self.contenu = []

            """Remplit le paquet de cartes"""
            def remplir(self):
                self.contenu = [Carte(couleur, valeur) for couleur in range(1, 5) for valeur in range(1, 14)]

            """Renvoie la Carte qui se trouve à la position donnée"""
            def getCarteAt(self, pos):
                if 0 <= pos < len(self.contenu) :
                    return self.contenu[pos]

        ``` 
-->

!!! example "{{ exercice() }}"
    === "énoncé"

        1. créer une classe `Personnage` ayant pour attribut:

            - `pseudo`: pseudo du personnage incarné par le joueur
            - `health`: points de vie du personnage
            - `attack`: points d’attaque du personnage
        2. créer un constructeur ayant pour paramètre le pseudo uniquement et mettant les points de vie à 100 et les points d'attaque à 10.
        3. Créer les méthodes:

            - `get_pseudo`: retourne la valeur de l’attribut pseudo
            - `get_health`: retourne la valeur de l’attribut health
            - `get_attack`: retourne la valeur de l’attribut attack
            - `damage`: inflige un nombre depoints de dégâts
            - `attack_player`: permet au personnage d’attaquer le personage passé en paramètre en lui infligeant des dégâts
            - `__str(self)__`: méthode spéciale affichant les attributs d’un personnage via print(instance)
        4. Créer une classe `Arme` ayant pour :

            - Attributs:

                - `name` : nom de l’arme
                - `damage` : nombre de points de dégâts infligés par l’arme
            - Méthodes:

                - Un constructeur demandant la valeur des deux attributs
                - `get_name` : retourne le nom de l’arme
                - `get_damage_amount` - retourne le nombre de points de dégâtsinfligés par l’arme
        5. Modifier et adapter la classe `Personnage` de manière à ce qu’un joueur puisse utiliser une arme instanciée par la classe `Arme`. Pour cela créer dans la classe `Personnage`:

            - Attribut:

                - `arme`: par défaut `self.arme = None`
            - Méthodes:

                - `set_arme` : change l’arme du joueur
                - `has_arme` : vérifie si un joueur à une arme
        6. Modifier en conséquence la méthode `attack_player` de la classe `Personnage` pour que si un joueur à une arme, les points de dégâts infligés par l’arme s’ajoutent aux points d’attaque du joueur.

        **Exemple d'utilisation**
        ```python
        obi = Personnage("Obi-Wan",30,5)
        ani = Personnage("Anakin",40,10)
        print(obi)
        print(ani)
        sabre_jedi = Arme("Sabre Jedi",10}
        sabre_sith = Arme("Sabre Sith",15}
        obi.set_arme(sabre_jedi)
        ani.set_arme(sabre_sith)
        ani.attack_player(obi)
        print(obi)
        print(ani)
        obi.attack_player(ani)
        print(obi)
        print(ani)
        ```
        Afficherait:
        ```
        Personnage : Obi-Wan | Points de vie : 30| Points d'attaque : 5
        Personnage : Anakin | Points de vie : 40| Points d'attaque : 10
        Anakin attaque Obi-Wan
        Personnage : Obi-Wan | Points de vie : 5| Points d'attaque : 5
        Personnage : Anakin | Points de vie : 40| Points d'attaque : 10
        Obi-Wan attaque Anakin
        Personnage : Obi-Wan | Points de vie : 5| Points d'attaque : 5
        Personnage : Anakin | Points de vie : 25| Points d'attaque : 10
        ```
   
!!! example "{{ exercice() }}"
    === "énoncé"

        1. À partir de la structure abstraire Pile vue en cours, proposer une implémentation sous forme de classe.
        2. On proposera de la même manière une implémentation de la file.

        **Remarque** : On utilisera le type `list` de Python pour typer notre attribut privé contenant les éléments. Nous n’avons ici pas besoin d’accesseurs ou de mutateurs, seulement les méthodes publiques.

!!! example "{{ exercice() }}"
    === "énoncé"
        Soit la classe Date définie par les attributs suivant: `jour` de type `int`, `mois` de type `int`, `annee` de type `int`.

        1. Implémenter cette classe en Python avec un constructeur permettant d'éviter les dates impossibles (du genre 32/14/2020). Dans ce cas, la création doit provoquer une erreur, chose possible grâce à l’instruction raise (documentation à rechercher !).
        2. Créer deux dates le 20 janvier 2012 et le 14 février 2022.
        3. Ajouter une méthode `__repr__` permettant d’afficher la date sous la forme “25 janvier 1989”. Les noms des mois seront définis en tant qu’attribut de classe à l’aide d’une liste.
        4. Ajouter une méthode `__lt__` qui permet de comparer deux dates. L’expression `d1 < d2` (`d1` et `d2` étant deux objets de type `Date`) doit grâce à cette méthode renvoyer `True` ou `False` .
