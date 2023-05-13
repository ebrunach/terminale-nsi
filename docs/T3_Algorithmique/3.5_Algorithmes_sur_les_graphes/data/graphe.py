import networkx as nx
from pyvis.network import Network
from random import randint
import matplotlib.pyplot as plt

class graphe:
    def __init__(self):
        #self.adj = dict()
        self.G = nx.DiGraph()

    def ajouter_sommet(self, sommet):
        #if sommet not in self.adj:
        #    self.adj[sommet] = dict()
        self.G.add_node(sommet, color='white', label=sommet)

    def ajouter_arc(self, depart, arrivee):
        self.ajouter_sommet(depart)
        self.ajouter_sommet(arrivee)
        #self.adj[depart][arrivee] = None
        self.G.add_edge(depart, arrivee)

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

G = graphe()
G.ajouter_arc('A', 'B')
G.ajouter_arc('A', 'D')
G.ajouter_arc('B', 'C')
G.ajouter_arc('D', 'E')
G.ajouter_arc('E', 'B')
G.ajouter_arc('C', 'E')
G.ajouter_arc('C', 'F')
G.ajouter_arc('G', 'C')

print(parcours_profondeur(G, 'A'))

# pos = nx.kamada_kawai_layout(G.G)
# nx.draw_networkx(G.G, pos = pos)
# plt.show()
# net = Network(notebook=True, directed=True)
# net.from_nx(G.G)
# net.show("essai.html")

from matplotlib.animation import FFMpegWriter


# for name, attr in G.G.nodes.items():
#     print(attr['color'])

def grab(graphe):
    nx.draw_networkx(graphe.G, pos = pos, node_color=[attr['color'] for name, attr in graphe.G.nodes.items()])
    moviewriter.grab_frame()

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


metadata = dict(title='Movie Test', artist='Matplotlib', comment='Movie support!')
moviewriter = FFMpegWriter(fps=2, metadata=metadata)
pos = nx.kamada_kawai_layout(G.G)
nx.draw_networkx(G.G, pos = pos)
fig, ax = plt.subplots()
moviewriter.setup(fig, 'graphe_profondeur.mp4', dpi=100)
parcours_profondeur_anim(G, 'A')
moviewriter.finish()
