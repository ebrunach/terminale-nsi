{{initexo(0)}}
# Sujet1 - Correction
!!! abstract "{{ exercice() }}"
    Q1.a. Cette ligne permet d’importer la fonction `sqrt` de la bibliothèque `math` permettant de calculer des racine carrées.

    Q1.b. Cette expression renvoie `False` à cause du problème d’arrondi des flottants (impossible de représenter 0.1 en mémoire avec exactitude)

    Q1.c. `point_A` est un tulpe et la ligne `point_A[0] = 2` a pour but de modifier ce tuple, alors qu’un tuple n’est pas modifiable. Il n'est pas mutable.

    Q2.a. 

    ```python
    from math import sqrt
    class Segment:
        def __init__(self, point1, point2):
            self.p1 = point1
            self.p2 = point2
            self.longueur = sqrt((self.p1[0]-self.p2[0])**2 + (self.p1[1]-self.p2[1])**2)
    ```

    Q2.b.

    ```python
    def liste_segments(liste_points):
        n = len(liste_points)
        segments = []
        for i in range(n-1):
            for j in range(i+1, n):
                seg = Segment(liste_points[i], liste_points[j])
                segments.append(seg)
        return segments
    ```

    Q2.c. $(n - 1) + (n - 2) + (n - 3) + … + 1$

    Q2.d. La complexité est en $O(n^2)$ (boucles imbriquées)

    Q3.a.

    ```python
    def plus_court_segment(tab_seg):
        if len(tab_seg) == 1 :
            return tab_seg[0]
        else :
            seg_g = plus_court_segment(moitie_gauche(tab_seg))
            seg_d = plus_court_segment(moitie_droite(tab_seg))
            if seg_g.longueur < seg_d.longueur :
                return seg_g
            else :
                return seg_d
    ```

    Q4.a. `nuage_points = liste_segments([(3, 4), (2, 3), (-3, -1)])`

    Q4.b.

    ```python
        seg = plus_court_segment(nuage_points)
        print("point 1 : ("+str(seg.p1[0])+","+str(seg.p1[1])+")")
        print("point 2 : ("+str(seg.p2[0])+","+str(seg.p2[1])+")")
    ```


!!! abstract "{{ exercice() }}"
    Q1. 

    Q2. `4 → 2 → 5 → 6 (17)`

    Q3. 

    ```
    2 → 5 → 2 (9)
    2 → 5 → 3 (10)
    2 → 1 → 3 (6)
    2 → 1 → 9 (12)
    ```

    Q4. Du chemin tout à gauche codée `000...00` (ou le nombre de 0 correspond à n) et le chemin tout à droite codée `111...11`, toutes les valeurs binaires sont représentées. Or `111...11` correspond à $2 ^ {n} -1$. Donc tous les nombres de 0 à $2 ^ {n} -1$ sont représentés. Il y a donc $2 ^ n$ chemins.

    Q5. La complexité est exponentielle en $O(2^n)$

    Q6.

    ```python
    def score_max(i, j, p):
        if i == len(p)-1:
            return p[len(p)-1][j]
        else:
            return p[i][j] + max(score_max(i+1, j, p), score_max(i+1, j+1, p))
    ```

    Q7. 

    ```python
    def pyramide_nulle(n : int) -> list:
        return [[0] * (i+1) for i in range(0, n+1)]
    ```

    Q8.

    ```python
    def prog_dyn(p):
        n = len(p)
        s = pyramide_nulle(n-1)
        # remplissage du dernier niveau
        for j in range(len(s[n-1])):
            s[n-1][j] = p[n-1][j]
        # remplissage des autres niveaux
        for i in range(n-2, -1, -1):
            for j in range(len(p[i])):
                s[i][j] = p[i][j] + max(s[i+1][j], s[i+1][j+1])
        # renvoie du score maximal
        return s[0][0]
    ```

    Q9. La boucle imbriquée des lignes 8 et 9 donnent : $1 + 2 + 3 + … + (n+1)$ itérations soit $\frac{(n+1)(n+2)}{2}$ itérations. La complexité est donc en $O(n^2)$.

!!! abstract "{{ exercice() }}"
    **Partie A**

    Q1.

    - `a` : `[ 1 , 2 , 14 , 4 , 5 , 8 , 7 , 15 , 9 , 10 ]`
    - `b` : `Dune`

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

    - Attribut : `id`
    - Méthode : `get_id`

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
    Chroniques martiennes
    Fahrenheit 451
    ```

    Q12.

    ```SQL
    SELECT titre
    FROM livres
    WHERE auteur = "K. Dick"
    AND ann_pub > 1960 ;
    ```

    Q13.

    ```SQL
    UPDATE livres
    SET note = 7
    WHERE id = 2 ;
    ```

    Q14. Évite de dupliquer les données (redondance) et facilite la mise à jour (évite les incohérences).

    Q15. Clef étrangère vers la table auteurs pour la mise en relation des tables livres et auteurs.

    Q16.

    ```SQL
    SELECT auteurs.nom, auteurs.prenom FROM auteurs
    JOIN livres ON livres.id_auteur = auteurs.id
    WHERE livres.ann_pub > 1955 ;
    ```

    Q17. Sélectionne les titres des livres dont leurs auteurs avaient plus de 50 ans au moment de leur publication.

    Q18. La création d’une base de données, contenant des données personnelles, est sujette à déclaration préalable
    auprès de la CNIL. Il faut protéger les données personnelles.