import networkx as nx
from pyvis.network import Network
from random import randint
import matplotlib.pyplot as plt
from matplotlib.animation import HTMLWriter

class graphe:
    def __init__(self):
        #self.adj = dict()
        self.G = nx.DiGraph()
        self.pos = nx.kamada_kawai_layout(self.G)
        metadata = dict(title='Movie Test', artist='Matplotlib', comment='Movie support!')
        self.moviewriter = HTMLWriter(fps=2, metadata=metadata)

    def ajouter_sommet(self, sommet):
        #if sommet not in self.adj:
        #    self.adj[sommet] = dict()
        self.G.add_node(sommet, color='white', label=sommet)

    def ajouter_arc(self, depart, arrivee):
        self.ajouter_sommet(depart)
        self.ajouter_sommet(arrivee)
        #self.adj[depart][arrivee] = None
        self.G.add_edge(depart, arrivee)
        self.pos = nx.kamada_kawai_layout(self.G)

    def arc(self, depart, arrivee):
        return arrivee in list(self.G.neighbors(depart))

    def adjacents(self, sommet):
        #lst = []
        #for s in self.adj[sommet]:
        #    lst.append(s)
        #return lst
        return list(self.G.neighbors(sommet))
    
    def sommets(self):
        return list(self.G.nodes())
    

def parcours_profondeur(graphe, sommet, lst_marque = [], lst_parcours = []):
    if sommet not in lst_marque:
        lst_marque.append(sommet)
        lst_parcours.append(sommet)
        for sommet_adjacent in graphe.adjacents(sommet):
            parcours_profondeur(graphe, sommet_adjacent, lst_marque, lst_parcours)
    return lst_parcours

def grab(graphe):
    nx.draw_networkx(graphe.G, pos = graphe.pos, node_color=[attr['color'] for name, attr in graphe.G.nodes.items()])
    graphe.moviewriter.grab_frame()

def parcours_profondeur_anim(graphe, sommet, lst_marque = [], lst_parcours = []):
    if sommet not in lst_marque:
        graphe.G.nodes[sommet]['color'] = 'green'
        grab(graphe)
        graphe.G.nodes[sommet]['color'] = 'silver'
        grab(graphe)
        lst_marque.append(sommet)
        lst_parcours.append(sommet)
        for sommet_adjacent in graphe.adjacents(sommet):
            parcours_profondeur_anim(graphe, sommet_adjacent, lst_marque, lst_parcours)
            coul = graphe.G.nodes[sommet]['color']
            graphe.G.nodes[sommet]['color'] = 'green'
            grab(graphe)
            graphe.G.nodes[sommet]['color'] = coul
            grab(graphe)
        graphe.G.nodes[sommet]['color'] = 'dimgray'
        grab(graphe)
    else:
        coul = graphe.G.nodes[sommet]['color']
        graphe.G.nodes[sommet]['color'] = 'red'
        grab(graphe)
        graphe.G.nodes[sommet]['color'] = coul
        grab(graphe)
    return lst_parcours


def parcours_largeur_anim(graphe, depart):
    lst_marque, lst_parcours, lst_a_parcourir = [], [], [depart]
    while len(lst_a_parcourir) != 0:
        sommet = lst_a_parcourir.pop(0)
        graphe.G.nodes[sommet]['color'] = 'green'
        grab(graphe)
        graphe.G.nodes[sommet]['color'] = 'silver'
        grab(graphe)
        lst_marque.append(sommet)
        lst_parcours.append(sommet)
        for sommet_adjacent in graphe.adjacents(sommet):
            if sommet_adjacent not in lst_marque and sommet_adjacent not in lst_a_parcourir:
                lst_a_parcourir.append(sommet_adjacent)
                graphe.G.nodes[sommet_adjacent]['color'] = 'blue'
        grab(graphe)
    return lst_parcours


def creerHTMLanim(graphe, fonction, fichierHTML):
    nx.draw_networkx(graphe.G, pos = graphe.pos)
    fig, ax = plt.subplots()
    graphe.moviewriter.setup(fig, fichierHTML, dpi=100)
    fonction(graphe, 'A')
    graphe.moviewriter.finish()


# G = graphe()
# G.ajouter_arc('A', 'B')
# G.ajouter_arc('A', 'D')
# G.ajouter_arc('B', 'C')
# G.ajouter_arc('D', 'E')
# G.ajouter_arc('E', 'B')
# G.ajouter_arc('C', 'E')
# G.ajouter_arc('C', 'F')
# G.ajouter_arc('G', 'C')
# creerHTMLanim(G, parcours_largeur_anim, 'graphe_largeur.html')
G = graphe()
G.ajouter_arc('A', 'B')
G.ajouter_arc('A', 'D')
G.ajouter_arc('B', 'C')
G.ajouter_arc('D', 'E')
G.ajouter_arc('E', 'B')
G.ajouter_arc('C', 'E')
G.ajouter_arc('C', 'F')
G.ajouter_arc('G', 'C')
creerHTMLanim(G, parcours_profondeur_anim, 'graphe_profondeur.html')

