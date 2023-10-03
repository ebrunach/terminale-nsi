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

def affiche(x, y, taille):
    ... # A modifier

def gestion_collision(x, y, dx, dy, taille):
    return x, y, dx, dy # A modifier

x, y = 100, 50 # Position initiale de la balle
taille = 10 # Rayon de la balle
dx, dy = 3, -4 # Vitesse initiale de la balle à chaque rafraichissement la basse se déplace de dx et de dy
cree_fenetre(400, 400) 
encore = True # Booléen permettant d'arrêter lorsqu'on appuie sur l'icone pour fermer la fenêtre
while encore: # Boucle (on verra ca plus tard) permettant de répéter les actions indentées ci-dessous à chaque rafraichissement d'image
    gestion_affichage() # permet de gérer le temps et le reaffichage
    encore = gestion_evenement() # permet de récupérer les touches claviers et les clics
    x, y = mise_a_jour_position(x, y, dx, dy) # permet de calculer la nouvelle position de la balle en fonction de sa vitesse
    x, y, dx, dy = gestion_collision(x, y, dx, dy, taille) # Permet de gérer les collisions avec les murs
    affiche(x, y, taille) # Affiche la balle
ferme_fenetre() # ferme la fenêtre lorque l'on clique sur l'icone pour fermer la fenetre