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

    def colorer_zone(self, i, j, couleur):
        c_prec = self.image[i][j]
        if c_prec != couleur:
            self.set_pixel(i, j, couleur)
        pile = self.voisins(i, j)
        while not pile.est_vide():
            x, y = pile.depiler()
            if self.get_pixel(x, y) == c_prec:
                self.colorer_zone(x, y, couleur)

    def affiche(self):
        plt.imshow(self.image, vmin = 0, vmax = 2)
        plt.show()

i = Image()
i.affiche()
i.colorer_zone(2,2,1)
i.affiche()