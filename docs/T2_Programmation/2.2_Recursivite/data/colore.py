import matplotlib.pyplot as plt

class Pile:
    def __init__(self):
        self.contenu = []

    def empiler(self, elem):
        self.contenu.append(elem)

    def depiler(self):
        return self.contenu.pop()

    def est_vide(self):
        return len(self.contenu) == 0



class Image:
    lst_voisins = ((-1, 0), (1, 0), (0, -1), (0, 1))

    def __init__(self):
        self.image = [[2] * (5-i) + [0] * (2*i+1) + [2] * (5-i) for i in range(5)]
        self.hauteur = len(self.image)
        self.largeur = len(self.image[0])

    def get_pixel(self, i, j):
        return self.image[i][j]
    
    def set_pixel(self, i, j, c):
        self.image[i][j] = c

    def est_dedans(self, i, j):
        return 0 <= i < self.hauteur and 0 <= j < self.largeur

    def voisins(self, i, j):
        p =  Pile()
        for x, y in Image.lst_voisins:
            if self.est_dedans(x + i, y + j):
                p.empiler((x + i, y +j))
        return p
    
    def voisins_de_meme_couleur(self, i, j):
        c =  self.get_pixel(i, j)
        p =  Pile()
        for x, y in Image.lst_voisins:
            if self.est_dedans(x + i, y + j) and c == self.get_pixel(x + i, y + j):
                p.empiler((x + i, y +j))
        return p
    
    def voisins_de_meme_couleur_ens(self, i, j):
        c =  self.get_pixel(i, j)
        p =  set()
        for x, y in Image.lst_voisins:
            if self.est_dedans(x + i, y + j) and c == self.get_pixel(x + i, y + j):
                p.add((x + i, y +j))
        return p


    def colorer_zone_old(self, i, j, couleur):
        cpt = 1
        c_prec = self.get_pixel(i, j)
        self.set_pixel(i, j, couleur)
        pile = self.voisins(i, j)
        while not pile.est_vide():
            cpt += 1
            x, y = pile.depiler()
            if self.get_pixel(x, y) == c_prec:
                cpt += self.colorer_zone_old(x, y, couleur)
        return cpt
    

    def colorer_zone(self, i, j, couleur):
        cpt = 1
        c_prec = self.get_pixel(i, j)
        pile = self.voisins_de_meme_couleur(i, j)
        self.set_pixel(i, j, couleur)
        while not pile.est_vide():
            cpt += 1
            x, y = pile.depiler()
            if self.get_pixel(x, y) == c_prec:
                cpt += self.colorer_zone(x, y, couleur)
        return cpt

    def colorer_zone_ens(self, i, j, couleur, ens = set()):
        cpt = 1
        c_prec = self.get_pixel(i, j)
        ens_voisin = self.voisins_de_meme_couleur_ens(i, j)
        ens.update(ens_voisin)
        self.set_pixel(i, j, couleur)
        while len(ens) != 0:
            cpt += 1
            x, y = ens.pop()
            cpt += self.colorer_zone_ens(x, y, couleur, ens)
        return cpt

    def affiche(self):
        plt.imshow(self.image, vmin = 0, vmax = 2)
        plt.show()

i = Image()
i.affiche()
print(i.colorer_zone_old(2,1,1))
i.affiche()