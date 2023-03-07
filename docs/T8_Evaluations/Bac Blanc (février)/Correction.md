# Correction
## Exercice 1
### Partie 1
1. 
```python
def enlever(self, somme):
    self.solde -= somme
```
2. 
```python
def ajouter(self, somme):
    self.solde += somme
``` 
3. 
```python
def est_debiteur(self):
    return self.solde < 0
```

### Partie 2
1. 
```python
cpt_0123456A = Compte("0123456A", "B128672", "r.mebarek@bleu.fr")
```
2. 
```python
cpt_0123456A.enlever(43)
```
3. 
```python
def envoyer(self, autre_compte, montant):
    autre_compte.ajouter(montant)
    self.enlever(montant)
```

### Partie 3
1. 
```python
def recherche_debiteurs(liste_comptes):
    lst = []
    for compte in liste_comptes:
        if compte.est_debiteur():
            d = {}
            d['email'] = compte.email
            d['solde'] = compte.solde
            lst.append(d)
    return lst
```

2. 
```python
def urgent_debiteur(liste_debiteurs):
    if len(liste_debiteurs) == 0:
        return ""
    debiteur_min = liste_debiteur[0]
    for debiteur in liste_debiteurs:
        if debiteur['solde'] < debiteur_min['solde']:
            debiteur_min = debiteur
    return debiteur_min['email']
```

## Exercice 2
