{{initexo(0)}}
# Sujet2 - Correction
!!! abstract "{{ exercice() }}"
    **Partie 1**
    Q1. `nom`, `tab_voisines`, `tab_couleurs_disponibles` et `couleur_attribuee` sont des attributs de la classe Region.

    Q2. `nom_region` est de type string

    Q3. `ge = Region("Grand Est")`
    
    Q4.

    ```python
    def renvoie_premiere_couleur_disponible(self):
        return self.tab_couleurs_disponibles[0]
    ```

    Q5.

    ```python
    def renvoie_nb_voisines(self) :
        return len(self.tab_voisines)
    ```

    Q6.

    ```python
    def est_coloriee(self):
        return self.couleur_attribuee != None
    ```

    Q7.

    ```python
    def retire_couleur(self, couleur):
        if couleur in self.tab_couleurs_disponibles:
            self.tab_couleurs_disponibles.remove(couleur)
    ```

    Q8.

    ```python
    def est_voisine(self, region):
        for r in self.tab_voisines:
            if r == region:
                return True
        return False
    ```

    **Partie 2**

    Q9.

    ```python
    def renvoie_tab_regions_non_coloriees(self):
        tab_r =[]
        for r in self.tab_regions:
            if not r.est_coloriee():
                tab_r.append(r)
        return tab_r
    ```

    Q10.a. La méthode renvoie None dans le cas où toutes les régions sont coloriées

    Q10.b. La région renvoyée est non coloriée et possède le plus grand nombre de voisins

    Q11.

    ```python
    def colorie(self):
        r_max = self.renvoie_max()
        while r_max != None:
            couleur = r_max.renvoie_premiere_couleur_disponible()
            r_max.couleur_attribuee = couleur
            for r in r_max.tab_voisines :
                r.retire_couleur(couleur)
            r_max = self.renvoie_max()
    ```

!!! abstract "{{ exercice() }}"

    Q1.

    ```python
    def corrige(cop, corr):
        corrTM = []
        for i in range(len(cop)):
            corrTM.append(cop[i] == corr[i])
        return corrTM
    ```

    Q2.

    ```python
    def note(corr, cop):
        la_note = 0
        for i in range(len(cop)):
            if cop[i] == corr[i]:
                la_note += 1
        return la_note
    ```

    Q3.

    ```python
    def notes_paquet(p, corr):
        d = {}
        for nom in p.items():
            d[nom] = note(p[nom], corr)
        return d
    ```

    Q4. On ne peut pas utiliser de liste car une liste ne peut être hachée; c'est une structure mutable.

    Q5. Rajouter un champ date de naissance sur un entier de 8 digits dans le tuple (diminue le risque de collision).

    Q6. `((('Tom', 'Matt'), 6), (('Lambert', 'Ginne'), 4), (('Kurt', 'Jett'), 4), {('Carl', 'Roth'): 2, ('Ayet', 'Finzerb'): 3})

    Q7. Ce programme retourne un tuple contenant trois tuples et un dictionnaire. Ces trois tuples représentent les trois plus grandes valeurs du dictionnaire, tandis que le dictionnaire contient les valeurs restantes dans l'ordre où elles apparaissent.

    Q8. None pour les valeurs du tuple pour le(s) nom(s) absent(s) et dictionnaire vide.

    Q9.

    ```python
    def classement(notes):
        candidats = []
        suite = None
        while suite != {}:
            nom1, nom2, nom3, suite = enigme(notes)
            for nom in nom1, nom2, nom3:
                if nom is not None:
                    candidats += [nom]
            notes = suite
        return candidats
    ```

    *OU* (en récursif)

    ```python
    def classement(notes):
        if len(notes) == 0:
            return ()
        else:
            candidats = ()
            nom1, nom2, nom3, suite = enigme(notes)
            for nom in nom1, nom2, nom3:
                if nom is not None:
                    candidats += (nom)
            return candidats + classement(suite)
    ```

    *OU* (en récursif avec compréhension)

    ```python
    def classement(notes):
        if len(notes) == 0:
            return ()
        else:
            nom1, nom2, nom3, suite = enigme(notes)
            candidats = tuple([nom for nom in (nom1, nom2, nom3) if nom is not None])
            return candidats + classement(suite)
    ```

    Q10.

    ```python
    def renote_express2(copcorr) :
        gauche = 0
        droite = len(copcorr)
        while droite - gauche > 1 :
            milieu = (gauche + droite) // 2
            if copcorr[milieu] :
                gauche = milieu + 1
            else :
                droite = milieu - 1
        if copcorr[gauche] :
            return gauche + 1
        else :
            return gauche
    ```

    Q11.
    
    - `renote_express` : $O(n)$
    - `renote_express2` : $O(log(n))$

    Q12. Remplacer `copcorr[...]` par `cop[...] == corr[...]`

!!! abstract "{{ exercice() }}"
    **Partie A**

    Q1.

    - `a` : `[1949 , 1965 , 1951 , 1953 ,1968 , 1950 , 1943 , 1950 , 2003 , 1953]`
    - `b` : `Blade Runner`

    Q2.

    ```python
    def titre_livre(dico, id_livre):
        for i in range(len(dico['id'])):
            if dico['id'][i] == id_livre :
                return dico['titre'][i]
        return None
    ```

    Q3.

    ```python
    def note_maxi(dico):
        maxi = dico['note'][0]
        for note in dico['note']:
            if note > maxi :
                maxi = note
        return maxi
    ```

    Q4.

    ```python
    def livres_note(dico, note):
        lst = []
        for i in range(len(dico['note'])):
            if dico['note'][i] == note :
                lst.append(dico['titre'][i])
        return lst
    ```

    *OU*

    ```python
    def livres_note(dico, note):
        return [dico['titre'][i] for i in range(len(dico['note'])) if dico['note'][i] == note]
    ```

    Q5. 

    ```python
    def livre_note_maxi(dico):
        return livres_note(dico, note_maxi(dico))
    ```

    **Partie B**

    Q6.

    - Attribut : `liste_livre`
    - Méthode : `ajout_livre`

    Q7.

    ```python
    def get_note(self):
        return self.note
    ```

    Q8.

    ```python
    biblio = Bibliotheque()
    biblio.ajout_livre( Livre(5, "Blade Runner", "K.Dick", 1968, 8))
    ```

    Q9.

    ```python
    def titre_livre(self, id_livre):
        for livre in self.liste_livre :
            if livre.get_id() == id_livre :
                return livre.get_titre()
        return None
    ```

    **Partie C**

    Q10. Un auteur peut avoir écrit plusieurs livres. La clef n’est donc pas unique.

    Q11. 

    ```
    Fondation
    Les robots
    ```

    Q12.

    ```SQL
    SELECT titre
    FROM livres
    WHERE auteur = "Bradbury"
    AND ann_pub < 1951 ;
    ```

    Q13.

    ```SQL
    UPDATE livres
    SET note = 9
    WHERE id = 2 ;
    ```

    Q14. Évite de dupliquer les données (redondance) et facilite la mise à jour (évite les incohérences).

    Q15. Clef étrangère vers la table auteurs pour la mise en relation des tables livres et auteurs.

    Q16.

    ```SQL
    SELECT auteurs.nom, auteurs.prenom FROM auteurs
    JOIN livres ON livres.id_auteur = auteurs.id
    WHERE livres.ann_pub < 1950 ;
    ```

    Q17. Sélectionne les titres des livres dont leurs auteurs avaient moins de 40 ans au moment de leur publication.

    Q18. La création d’une base de données, contenant des données personnelles, est sujette à déclaration préalable
    auprès de la CNIL. Il faut protéger les données personnelles.