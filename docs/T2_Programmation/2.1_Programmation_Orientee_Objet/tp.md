# TP : balles rebondissantes

![image](data/balles1.png){: .center witdh=40%}

## Objectifs:

- Se familiariser avec une bibliothèque graphique
- Travailler sur le concept de classes

**NE PAS OUBLIER LE COMPTE RENDU : [Zone de rendu]()**

## 1. Davistk

Ce TP utilise le module de dessin **[davistk](./data/davistk.py)** que vous devez télécharger et placer dans le même dossier que les programmes que vous allez écrire. 
Pour pouvoir l'utiliser dans un programme, vous devez charger les fonctions de ce module en écrivant la ligne `from davistk import`  en début de fichier. 
La documentation du module se trouve là: [davistk.brunache.ovh](https://davistk.brunache.ovh)
Ce TP vous permettra de manipuler les fonctions du module de dessin et leurs arguments.

1. Copier le code ci-dessous dans un fichier et l'exécuter:

    ```python
    from davistk import * # Importe les fonctions du module davistk

    cree_fenetre(600,600) # Crée un fenetre de 600 par 600
    
    rectangle(10,10,100,50) # Crée un rectangle
    rectangle(200,100,300,150) # Crée un autre rectangle

    attend_ev() # Attend un evenement (clic, touche clavier...)
    ferme_fenetre() # ferme la fenêtre
    ``` 

1. Dans un nouveau fichier
    1. Créer une fenêtre de 400 par 400
    2. Dessiner un cercle de rayon 100 centré au milieu de la fenêtre
    3. Dessiner un cercle rouge de rayon 100 légèrement à gauche du premier cercle.

## 2. Balles rebondissantes sans classes

1. Copier le code ci-dessous dans un nouveau fichier dans le même dossier que précédemment. L'exécuter. Que se passe-t-il ?

    ```python linenums='1'
    from davistk import *
    import time

    def gestion_affichage():
        mise_a_jour()
        time.sleep(1/30)
        efface_tout()

    def gestion_evenement():
        ev = donne_ev()
        tev = type_ev(ev)
        # Action dépendant du type d'événement reçu :
        if tev == 'Quitte':  # on sort de la boucle
            return False
        else:  # dans les autres cas, on ne fait rien
            return True

    def mise_a_jour_position(x, y, dx, dy):
        return x + dx, y+ dy

    def gestion_collision_mur(x, y, dx, dy, taille):
        return dx, dy # A modifier

    x, y = 100, 50 # Position initiale de la balle
    taille = 10 # Rayon de la balle
    dx, dy = 3, -4 # Vitesse initiale de la balle à chaque rafraichissement la basse se déplace de dx et de dy
    couleur = "red"
    cree_fenetre(400, 400) 
    encore = True # Booléen permettant d'arrêter lorsqu'on appuie sur l'icone pour fermer la fenêtre
    while encore: # Boucle (on verra ca plus tard) permettant de répéter les actions indentées ci-dessous à chaque rafraichissement d'image
        gestion_affichage() # permet de gérer le temps et le reaffichage
        encore = gestion_evenement() # permet de récupérer les touches claviers et les clics
        x, y = mise_a_jour_position(x, y, dx, dy) # permet de calculer la nouvelle position de la balle en fonction de sa vitesse
        dx, dy = gestion_collision_mur(x, y, dx, dy, taille) # Permet de gérer les collisions avec les murs
        affiche_balle(x, y, taille, couleur) # Affiche la balle
    ferme_fenetre() # ferme la fenêtre lorque l'on clique sur l'icone pour fermer la fenetre

    ```

2. Modifier la fonction `affiche_balle` de manière à ce qu'elle affiche un cercle de rayon `taille` centré en `(x, y)` et de couleur `couleur`. 

3. Modifiez la fonction `gestion_collision_mur` afin que la balle rebondisse sur chaque paroi (il suffit de modifier intelligemment les variables de vitesse ```dx``` et ```dy```). La fonction devra suivre les doctests suivant:

    ```python
    def gestion_collision_mur(x, y, dx, dy, taille):
        """
        >>> gestion_collision(391, 25, 3, -4, 10)
        -3, -4
        """
    ```

4. Ajouter une deuxième balle. :warning: Attention au nommage des variables...

5. Gestion de la collision entre les deux balles

    1. À l'aide d'un schéma (papier-crayon !), mettez en évidence le test devant être réalisé pour détecter une collision.

    2. Implémentez ce test dans la fonction `gestion_collision_balles` affichez "collision" en console lorsque les deux balles se touchent.

6. Pour l'illusion du rebond, échangez les valeurs respectives de ```dx``` et ```dy``` pour les deux balles. Finir la fonction `gestion_collision_balles` de manière à ce que les doctests suivant fonctionnent:

    ```python
    def gestion_collision_balles(xA, yA, xB, yB, dxA, dyA, dxB, dyB,tailleA, tailleB):
        """ Cette fonction renvoie les nouvelles vitesses de balles A et B

        Args:
            xA, yA (int): coordonnées de la balle A
            xB, yB (int): coordonnées de la balle B
            dxA, dyA (int): vitesses de la balle A
            dxB, dyB (int): vitesses de la balle B
            tailleA, tailleB: tailles des balles A et B

        Returns:
            dxA, dyA, dxB, dyB : nouvelles vitesses des balles A et B

        >>> gestion_collision_balles(50, 80, 70, 80, 3, -4, 5, 2, 10, 10)
        5, 2, 3, -4
        >>> gestion_collision_balles(49, 80, 70, 80, 3, -4, 5, 2, 10, 10)
        3, -4, 5, 2
        """
    ```

7. On veut ajouter une troisième balle. Peut-on continuer comme précédemment ?

## 3. Balles rebondissantes avec classes

1. LA structure du programme est maintenant la suivante. La copier dans un nouveau fichier dans le même dossier.

    ```python
    from davistk import *
    import time
    from random import randint

    class Balle:
        balles = [] # attribut de classe permettant d'accéder à toutes les balles crées
        def __init__(self):
            ... # A faire

        def dessiner(self):
            """Dessine la balle"""
            ... # A faire

        def bouger(self):
            """Déplace la balles en fonction de sa vitesse"""
            ... # A faire 

        def distance(self, autre_balle):
            """Calcule la distance séparant self et autre_balle"""
            return ... # A faire

        def en_collision(self, autre_balle):
            """Renvoie True si la balle self et autre_balle sont en collision, False sinon"""
            return ... # A faire

        def contre_un_mur(self):
            """Renvoie 'HautBas' si la balle self touche le mur du haut ou du bas, 'DroiteGauche' si la balle self touche le mur de gauche ou de droite, None sinon"""
            return ... # A faire

        def rebondir_contre_un_mur(self, mur):
            """Modifie la vitesse de la balle self quand elle est contre un mur, mur vallant soit 'HautBas' soit 'DroiteGauche' """
            ... # A faire

        def rebondir_contre_une_balle(self, autre_balle):
            """Modifie la vitesse des balles self et autre_balle quand elles rebondissent l'une contre l'autre.
            Les vitesses de self et de autre_balle sont échangées."""
            ... # A faire

        def gerer_collisions(self):
            """Modifie les vitesses en cas de collisoin ou de mur"""
            for balle in Balle.balles:
                if self != balle and self.en_collision(balle):
                    self.rebondir_contre_une_balle(balle)
            mur = self.contre_un_mur()
            if mur is not None:
                self.rebondir_contre_un_mur(mur)


    def gestion_affichage():
        mise_a_jour()
        time.sleep(1/60)
        efface_tout()

    def gestion_evenement():
        ev = donne_ev()
        tev = type_ev(ev)
        # Action dépendant du type d'événement reçu :
        if tev == 'Quitte':  # on sort de la boucle
            return False
        else:  # dans les autres cas, on ne fait rien
            return True

    def affiche_balles(balles):
        for balle in balles:
            balle.dessiner()

    def bouger_balles(balles):
        for balle in balles:
            balle.gerer_collisions()
            balle.bouger()


    balles = [Balle() for i in range(10)] # Instancie 10 balles
    cree_fenetre(400, 400) 
    encore = True # Booléen permettant d'arrêter lorsqu'on appuie sur l'icone pour fermer la fenêtre
    while encore: # Boucle (on verra ca plus tard) permettant de répéter les actions indentées ci-dessous à chaque rafraichissement d'image
        gestion_affichage() # permet de gérer le temps et le reaffichage
        encore = gestion_evenement() # permet de récupérer les touches claviers et les clics
        bouger_balles(balles)
        affiche_balles(balles) # Affiche la balle
    ferme_fenetre() # ferme la fenêtre lorque l'on clique sur l'icone pour fermer la fenetre
    ```

2. Finir le constructeur. L'objectif est que la méthode constructeur dote chaque nouvelle balle de valeurs aléatoires : abscisse, ordonnée, vitesse.

3. Dans l'ordre des méthodes du fichier, les compléter et exécuter le programme régulèrement.





