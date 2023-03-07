# Correction
!!! abstract "{{ exercice() }}"
    **Partie 1**
    ??? tip "Q1" 
        ```python
        def enlever(self, somme):
            self.solde -= somme
        ```
    ??? tip "Q2" 
        ```python
        def ajouter(self, somme):
            self.solde += somme
        ``` 
    ??? tip "Q3"  
        ```python
        def est_debiteur(self):
            return self.solde < 0
        ```

    **Partie 2**
    ??? tip "Q1"  
        ```python
        cpt_0123456A = Compte("0123456A", "B128672", "r.mebarek@bleu.fr")
        ```
    ??? tip "Q2"  
        ```python
        cpt_0123456A.enlever(43)
        ```
    ??? tip "Q3" 
        ```python
        def envoyer(self, autre_compte, montant):
            autre_compte.ajouter(montant)
            self.enlever(montant)
        ```

    **Partie 3**
    ??? tip "Q1" 
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

    ??? tip "Q2"  
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

!!! abstract "{{ exercice() }}"
    ??? tip "Q1.a" 
        Une fonction récursice est une fonction qui s'appelle elle-même

    ??? tip "Q1.b" 
        Le programme s'arrête après l'affichage de 9 car l'appel récursif suivant est `mystere(10)`. Or, lors de cet appel, le test du `if` (`n < 10`) est `False` donc l'appel se termine sans rien afficher et la pile d'appel commence alors à se vider.

    ??? tip "Q2" 
        ```python
        def mult(lst, i = None):
            if i is None:
                i = len(lst) - 1
            if i == 0:
                return lst[i]
            else:
                return lst[i] * mult(lst, i - 1)
        ```
    ??? tip "Q3.a"  
        ```
        ce sujet ?
        dur
        est
        il
        Alors,
        ```
    
    ??? tip "Q3.b"  
        ```
        Alors, il est dur ce sujet ?
        ```
    
    ??? tip "Q4" 
        ```python
        def joindre(lst):
            sortie = ""
            for mot in lst:
                sortie += mot
            return sortie
        ```

!!! abstract "{{ exercice() }}"
    ??? tip "Q1" 
        Le couple `(NumVacancier, NumEmplacement)` ne peut pas servir de clé primaire car cela signifierait qu'un vacancier ne peut pas faire deux séjours différents (à différentes vacances) au même emplacement car la clé primaire doit rester unique.
    ??? tip "Q2.a" 
        ```SQL
        SELECT NumEmplacement, Prix FROM Emplacement;
        ``` 
    
    ??? tip "Q2.b" 
        ```SQL
        SELECT Email FROM Vacancier WHERE Prenom = "Ada" AND Nom = "Lovelace";
        ```
    
    ??? tip "Q3" 
        ```SQL
        SELECT NumEmplacement FROM Reservation WHERE date(DateArrivee) <= date('2023-02-23') and date(DateDepart) > date('2023-02-23');
        ```
    
    ??? tip "Q4.a" 
        ```SQL
        UPDATE Emplacement SET Prix = 25 WHERE NumEmplacement = 302
        ```
    
    ??? tip "Q4.b" 
        ```SQL
        SELECT Surface FROM Emplacement
        JOIN Reservation ON Reservation.NumEmplacement = Emplacement.NumEmplacement
        JOIN Vacancier ON Vacancier.NumVacancier = Reservation.NumVacancier
        WHERE Vacancier.Prenom = "Hedy" AND Vacancier.Nom = "Lamarr";
        ```