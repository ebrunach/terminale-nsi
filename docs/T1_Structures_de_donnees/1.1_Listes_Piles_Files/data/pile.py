def pile_vide():
    """Créé et renvoie une nouvelle pile vide"""
    return []

def empiler(p, e):
    """Place l’élément e au sommet de la pile p."""
    p.append(e)

def depiler(p):
    """Supprime et renvoie l’élément se trouvant au sommet de p."""
    return p.pop()

def est_vide(p):
    """Renvoie un booléen indiquant si p est vide ou non"""
    return len(p) == 0

def sommet(p):
    """Renvoie l'élement se trouvant au sommet de p"""
    return p[-1]

def taille(p):
    """Renvoie la taille de la pile"""
    return len(p)

def afficher(p):
    print('|'.join(str(e) for e in p))