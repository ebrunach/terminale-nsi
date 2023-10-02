# TD

{{initexo(0)}}

!!! example "{{ exercice() }}"
    === "énoncé"

        1. Proposer les attributs et les méthodes d'une classe `véhicule`.
        1. Proposer les attributs et les méthodes d'une classe `personnage`.
        1. Proposer les attributs et les méthodes d'une classe `jeu_de_societe`.

    === "corrigé"
        1. 
            - Attributs: nombre de roues, couleur, année de construction, direction....
            - Méthodes: tourner, freiner, accélérer, faire le plein, recharger...
        2. 
            - Attributs: points de vie, taille, poids,....
            - Méthodes: dormir, manger, attaquer, vieillir...
        3. 
            - Attributs: points de vie, taille, poids,....
            - Méthodes: dormir, manger, attaquer, vieillir...


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

    === "Correction"

   
        ```python linenums='1'
        # Q1
        class Eleve:
            def __init__(self, nom, classe, note):
                self.nom = nom
                self.classe = classe
                self.note = note

        #Q2
        eleve1 = Eleve("Atos", "Mousquetaire", "18")
        eleve2 = Eleve("Portos", "Mousquetaire", "16")
        eleve3 = Eleve("Aramis", "Mousquetaire", "17")

        #Q3   
        def compare(eleve1, eleve2):
            if eleve1.note > eleve2.note:
                return eleve1.nom
            else:
                return eleve2.nom
        ``` 


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

    === "corrigé"
        1. 
            ```python
            p1 = Point(40, 50)
            p2 = Point(60, -10)
            ```

        2. 
            ```python
            p1.deplacer(40, 50)
            ```

        3. 
            ```python
            def distance(point1, point2):
                return ((point1.x - point2.x) ** 2 + (point1.y - point2.y) ** 2) ** 0.5
            ```

        4. 
            ```python
            class Point:
                def __init__(self, x, y):
                    self.x = x
                    self.y = y
                
                def deplacer(self, dx, dy):
                    self.x += dx
                    self.y += dy

                def distance_origine(self):
                    return ((self.x) ** 2 + (self.y) ** 2) ** 0.5
            ```

        


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

    === "Correction"
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


!!! example "{{ exercice() }}"
    === "énoncé"

        La classe `Personnage` ayant pour attribut:

            - `pseudo`: pseudo du personnage incarné par le joueur
            - `health`: points de vie du personnage
            - `attack`: points d’attaque du personnage
        
        1. créer un constructeur ayant pour paramètre le pseudo uniquement et mettant les points de vie à 100 et les points d'attaque à 10.
        3. Créer les méthodes:

            - `get_pseudo`: retourne la valeur de l’attribut pseudo
            - `get_health`: retourne la valeur de l’attribut health
            - `get_attack`: retourne la valeur de l’attribut attack
            - `damage`: inflige un nombre depoints de dégâts
            - `attack_player`: permet au personnage d’attaquer le personage passé en paramètre en lui infligeant des dégâts
            - `__repr__(self)`: méthode spéciale affichant les attributs d’un personnage via print(instance)
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
        obi = Personnage("Obi-Wan")
        ani = Personnage("Anakin")
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
        Personnage : Obi-Wan | Points de vie : 100| Points d'attaque : 10
        Personnage : Anakin | Points de vie : 100| Points d'attaque : 10
        Anakin attaque Obi-Wan
        Personnage : Obi-Wan | Points de vie : 75| Points d'attaque : 10
        Personnage : Anakin | Points de vie : 100| Points d'attaque : 10
        Obi-Wan attaque Anakin
        Personnage : Obi-Wan | Points de vie : 75| Points d'attaque : 10
        Personnage : Anakin | Points de vie : 80| Points d'attaque : 10
        ```
<!--     === "corrigé"
        ```python
        # Q1
        class Personnage:
            def __init__(self, pseudo):
                self.pseudo = pseudo
                self.health = 100
                self.attack = 10

            #Q2
            def get_pseudo(self):
                return self.pseudo

            def get_health(self):
                return self.health

            def get_attack(self):
                return self.attack

            def damage(self, degat):
                self.health -= degat

            def attack_player(self, autre_perso):
                autre_perso.damage(self.attack)

            def __repr__(self):
                return "Personnage : " + self.pseudo + " | Points de vie : " + str(self.health) + " | Points d'attaque : " + str(self.attack)

        #Q3
        class Arme:
            def __init__(self, name, damage):
                self.name = name
                self.damage = damage

            def get_name(self):
                return self.name

            def get_damage_amount(self):
                return self.damage

        #Q4
        class Personnage:
            def __init__(self, pseudo):
                self.pseudo = pseudo
                self.health = 100
                self.attack = 10
                self.arme = None

            #Q5
            def set_arme(self, arme):
                self.arme = arme

            def has_arme(self):
                return self.arme is not None

            #Q6
            def attack_player(self, autre_perso):
                autre_perso.damage(self.attack + self.arme.get_damage_amount())
        ```
 -->   
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

!!! example "{{ exercice() }} : Bac metropole 2022"
    === "énoncé"
        Les participants à un jeu de LaserGame sont répartis en équipes et s’affrontent dans ce jeu de tir, revêtus d’une veste à capteurs et munis d’une arme factice émettant des infrarouges. Les ordinateurs embarqués dans ces vestes utilisent la programmation orientée objet pour modéliser les joueurs. La classe Joueur est définie comme suit :

        ```python linenums='1'
        class Joueur:
            def __init__(self, pseudo, identifiant, equipe):
                ’’’ constructeur ’’’
                self.pseudo = pseudo
                self.equipe = equipe
                self.id = identifiant
                self.nb_de_tirs_emis = 0
                self.liste_id_tirs_recus = []
                self.est_actif = True
            def tire(self):
                ’’’méthode déclenchée par l'appui sur la gachette’’’
                if self.est_actif == True:
                    self.nb_de_tirs_emis = self.nb_de_tirs_emis + 1
            def est_determine(self):
                ’’’methode qui renvoie True si le joueur réalise un
                grand nombre de tirs’’’
                return self.nb_de_tirs_emis > 500
            def subit_un_tir(self, id_recu):
                ’’’méthode déclenchée par les capteurs de la
                veste’’’
                if self.est_actif == True:
                    self.est_actif = False
                    self.liste_id_tirs_recus.append(id_recu)
        ```

        1. Parmi les instructions suivantes, recopier celle qui permet de déclarer un objet `joueur1`, instance de la classe `Joueur`, correspondant à un joueur dont l`pseudo est “Sniper”, dont l’identifiant est 319 et qui est intégré à l’équipe “A”:

            - Instruction 1 : `joueur1 = ["Sniper", 319, "A"]`
            - Instruction 2 : `joueur1 = new Joueur["Sniper", 319, "A"]`
            - Instruction 3 : `joueur1 = Joueur("Sniper", 319, "A")`
            - Instruction 4 : `joueur1 = Joueur{"pseudo":"Sniper", "id":319, "equipe":"A"}` 

        2. La méthode `subit_un_tir` réalise les actions suivantes : Lorsqu’un joueur actif subit un tir capté par sa veste, l’identifiant du tireur est ajouté à l’attribut `liste_id_tirs_recus` et l’attribut `est_actif` prend la valeur `False` (le joueur est désactivé). Il doit alors revenir à son camp de base pour être de nouveau actif.

            1. Écrire la méthode `redevenir_actif` qui rend à nouveau le joueur actif
            uniquement s’il était précédemment désactivé.
            2. Écrire la méthode `nb_de_tirs_recus` qui renvoie le nombre de tirs reçus
            par un joueur en utilisant son attribut `liste_id_tirs_recus`.

        3.  Lorsque la partie est terminée, les participants rejoignent leur camp de base respectif où un ordinateur, qui utilise la classe Base, récupère les données. La classe Base est définie par :

            - ses attributs :

                – equipe : nom de l’équipe (str). Par exemple, “A” ,
                – liste_des_id_de_l_equipe qui correspond à la liste (list) des
                identifiants connus des joueurs de l’équipe,
                – score : score (int) de l’équipe, dont la valeur initiale est 1000 ;

            - ses méthodes :

                – est_un_id_allie qui renvoie True si l’identifiant passé en paramètre
                est un identifiant d’un joueur de l’équipe, False sinon,
                – incremente_score qui fait varier l’attribut score du nombre passé en
                paramètre,
                – collecte_information qui récupère les statistiques d’un participant
                passé en paramètre (instance de la classe Joueur) pour calculer le score
                de l’équipe . 

            ```python linenums='1'
            def collecte_information(self,participant):
                if participant.equipe == self.equipe : # test 1
                    for id in participant.liste_id_tirs_recus:
                        if self.est_un_id_allie(id): # test 2
                            self.incremente_score(-20)
                        else:
                            self.incremente_score(-10) 
            ```
        
            1. Indiquer le numéro du test (test 1 ou test 2) qui permet de vérifier qu’en fin de partie un participant égaré n’a pas rejoint par erreur la base adverse.
            2. Décrire comment varie quantitativement le score de la base lorsqu’un joueur de cette équipe a été touché par le tir d’un coéquipier

            On souhaite accorder à la base un bonus de 40 points pour chaque joueur particulièrement déterminé (qui réalise un grand nombre de tirs)

        4. Recopier et compléter, en utilisant les méthodes des classes `Joueur` et `Base`, les 2 lignes de codes suivantes qu’il faut ajouter à la fin de la méthode `collecte_information` : 

        ```python
        ........ #si le participant réalise un grand nombre de tirs
            ......... #le score de la Base augmente de 40
        ```