def file_vide():
    """Créé et renvoie une nouvelle file vide"""
    return []

def enfiler(p, e):
    """Place l’élément e dans la file p."""
    p.append(e)

def defiler(p):
    """Supprime et renvoie l’élément devant sortir de p."""
    assert not est_vide(p)
    return p.pop(0)

def est_vide(p):
    """Renvoie un booléen indiquant si p est vide ou non"""
    return len(p) == 0

def sommet(p):
    """Renvoie l'élement se trouvant au sommet de p (le prochain à sortir)"""
    return p[0]

def taille(p):
    """Renvoie la taille de la file"""
    return len(p)

def afficher(p):
    print('|'.join(str(e) for e in reversed(p)))
