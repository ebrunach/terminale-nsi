from davistk import *
from pile import *
from file import *


def affichercrepes(crepes):
    sauv =  pile_vide()
    hauteur = taille(crepes)
    for i in range(hauteur):
        crepe = depiler(crepes)
        rectangle(200 - crepe * 10, 400 - hauteur * 10, 200 + crepe * 10, 400 - (hauteur -1) * 10,remplissage="yellow")
        hauteur -= 1
        empiler(sauv, crepe)
    while not est_vide(sauv):
        empiler(crepes, depiler(sauv))
    attend_ev()
    efface_tout()

