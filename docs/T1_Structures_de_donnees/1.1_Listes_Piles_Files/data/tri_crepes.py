from crepes import *
from random import randint

# Création d'une pile de crèpes aléatoires
pile_de_crepes = pile_vide()
for i in range(10):
    empiler(pile_de_crepes, randint(1, 20))


cree_fenetre(400, 400) # début affichage

affichercrepes(pile_de_crepes) 

ferme_fenetre() # fin affichage