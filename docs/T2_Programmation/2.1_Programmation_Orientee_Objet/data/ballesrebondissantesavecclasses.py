from davistk import *
import time
from random import randint

class Balle:
    balles = []
    def __init__(self):
        self.x = randint(10, 390)
        self.y = randint(10, 390)
        self.dx = randint(-2, 2)
        self.dy = randint(-2, 2)
        self.taille = randint(5, 10)
        Balle.balles.append(self)

    def dessiner(self):
        cercle(self.x, self.y, self.taille)

    def gerer_collisions():
        couples_de_balle = [(a, b) for idx, a in enumerate(Balle.balles) for b in Balle.balles[idx + 1:]]
        for balle1, balle2 in couples_de_balle:
            if balle1.en_collision(balle2):
                balle1.rebondir_contre_une_balle(balle2)
        for balle in Balle.balles:
            if balle.contre_un_mur():
                balle.rebondir_contre_un_mur()

    def bouger(self):
        self.x += self.dx
        self.y += self.dy

    def distance(self, autre_balle):
        return ((self.x - autre_balle.x) ** 2+ (self.y - autre_balle.y) ** 2) ** 0.5 - self.taille - autre_balle.taille

    def en_collision(self, autre_balle):
        return self.distance(autre_balle) <= 1

    def contre_un_mur(self):
        return self.x + self.taille >= 400 or self.x - self.taille <= 0 or self.y + self.taille >= 400 or self.y - self.taille <= 0

    def rebondir_contre_un_mur(self):
        if self.contre_un_mur:
            if self.x + self.taille >= 400 or self.x - self.taille <= 0:
                self.dx = -self.dx
            if self.y + self.taille >= 400 or self.y - self.taille <= 0:
                self.dy = -self.dy

    def rebondir_contre_une_balle(self, balle):
        self.dx, balle.dx = balle.dx, self.dx
        self.dy, balle.dy = balle.dy, self.dy


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
    Balle.gerer_collisions()
    for balle in balles:
        balle.bouger()


balles = [Balle() for i in range(30)]
cree_fenetre(400, 400) 
encore = True # Booléen permettant d'arrêter lorsqu'on appuie sur l'icone pour fermer la fenêtre
while encore: # Boucle (on verra ca plus tard) permettant de répéter les actions indentées ci-dessous à chaque rafraichissement d'image
    gestion_affichage() # permet de gérer le temps et le reaffichage
    encore = gestion_evenement() # permet de récupérer les touches claviers et les clics
    bouger_balles(balles)
    affiche_balles(balles) # Affiche la balle
ferme_fenetre() # ferme la fenêtre lorque l'on clique sur l'icone pour fermer la fenetre