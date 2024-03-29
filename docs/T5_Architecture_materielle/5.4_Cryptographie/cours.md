

# Cours

![image](data/BO.png){: .center}

## 1. Les enjeux

L'utilisation d'internet pour réaliser des transactions bancaires, communiquer des informations sensibles nécessitent que ces actions se fassent de manière sécurisé. 

Or le principe sur lequel est basé internet est un empilement de protocoles en couche:

1. Couche matérielle (transfert de 0 et de 1 sur Ethernet ou par onde)
2. Couche IP (découpage de l'information en paquet indépendant)
3. Couche TCP (ou UDP) (fiabilisation du transfert par numérotation et comptage des paquets)
4. Couche applicative: HTTP, IMAP, FTP

Donc les paquets passent de routeur en routeur et "tout le monde" peut regarder ce qu'il y a dedans. L'enjeu est donc d'éviter qu'une personne "regardant" un paquet passer sur un cable ou par une onde puisse récupérer une information sensible.

On souhaite donc:

1. Que seuls la source et le destinataire puissent lire les communications. C'est le chiffrement.
2. Garantir que l'on soit sûr de communiquer à la personne avec laquelle on veut communiquer.
3. Faire tout ceci sans modifier les couches matérielle, IP et TCP.

## 2. Quelques définitions

!!! abstract "Chiffrement"
    Le **chiffrement** est l'action de rendre incompréhensible une information (suite de symboles) au moyen d'une **clé**.

!!! abstract "Algorithme de chiffrement/déchiffrement"
    L'**algorithme de chiffrement** ou déchiffrement est la suite des actions à réaliser (utilisant la clé) pour chiffrer ou déchiffrer une information.

Exemple: "CPMKPVS" au lieu de "BONJOUR" en décallant les lettre de 1. Ici la clé est 1, et l'algorithme est le fait de décaller les lettres dans l'ordre de l'alphabet.

Une clé peut être :

- un nombre (dans un simple décalage des lettres de l'alphabet, comme [le chiffre de César](https://fr.wikipedia.org/wiki/Chiffrement_par_d%C3%A9calage))
- une phrase (dans la méthode du [masque jetable](https://fr.wikipedia.org/wiki/Masque_jetable))

!!! abstract "Principe de Kerckhoffs"
    Tout chiffrement suit le principe de Kerckhoffs : la sécurité d'un système de chiffrement ne doit reposer que sur la sécurité de la clé, et non pas sur la connaissance de l'algorithme de chiffrement. Cet algorithme peut même être public (ce qui est pratiquement toujours le cas).


## 3. Chiffrement symétrique

<!-- ### 1.1 Activité du masque jetable

!!! example "Exercice"
    === "Énoncé"
        On considère la variable suivante :

        ```python
        masque = "CETTEPHRASEESTVRAIMENTTRESTRESLONGUEMAISCESTFAITEXPRES"
        ```

        - Créer une fonction ```chiffre(message, masque)``` qui chiffre ```message ``` en le XORant avec ```masque```.
        - Cette fonction doit pouvoir **aussi** servir à déchiffrer le message chiffré.

    === "Aide"
        - Le ```XOR``` (voir [ici](https://glassus.github.io/premiere_nsi/T2_Representation_des_donnees/2.5_Booleens/cours/#disjonction-exclusive-xor){target = "_blank"}) est une opération symétrique :
        ```python
        >>> 34 ^ 23
        53
        >>> 53 ^ 23
        34
        ```
        - La fonction ```ord``` permet de renvoyer le code ASCII d'un caractère. La fonction ```chr``` fait l'opération inverse.
        ```python
        >>> ord('A')
        65
        >>> chr(65)
        'A'
        ```

      

    === "Correction"
        ```python linenums='1'
        masque = "CETTEPHRASEESTVRAIMENTTRESTRESLONGUEMAISCESTFAITEXPRES"

        def chiffre(message, masque):
            message_chiffre = ""
            for i in range(len(message)):
                lettre_chiffree = chr(ord(message[i]) ^ ord(masque[i]))
                message_chiffre += lettre_chiffree
            return message_chiffre
        ``` -->


### 3.1 Principe du chiffrement symétrique

> Dans un chiffrement symétrique, c'est **la même clé** qui va servir au chiffrement et au déchiffrement.

![image](data/sym.png){: .center}


### 3.2 Avantages et inconvénients

| avantages | inconvénients |
|:---|:---|
|rapides| comment se communiquer la clé de manière sécurisée |
|robustes (difficile à casser) | |

Les chiffrements symétriques sont adaptés au chiffrement de flux important d'informations. Ils sont par exemple utilisés pour la sécurisation des données transitant par le protocole ```https``` .

### 3.3 Masque jetable

#### 3.3.1 Avec des lettres

!!! example "Exemple"
    Imaginons qu'Alice veuille transmettre le message clair "LUNDI".
    Elle le chiffre avec un masque jetable (que connait aussi Bob), et Bob reçoit donc "KHZOK". 
    Si Marc a intercepté le message "KHZOK", *même s'il sait que la méthode de chiffrement utilisée est celle du masque jetable* (principe de Kerckhoffs), il n'a pas d'autre choix que de tester tous les masques de 5 lettres possibles.
    Ce qui lui donne $26^5$ possibilités (plus de 11 millions) pour le masque, et par conséquent $26^5$ possibilités pour le message «déchiffré»...

    Cela signifie que Marc verra apparaître, dans sa tentative de déchiffrage, les mots "MARDI", "JEUDI", "JOUDI", "STYLO", "FSDJK", "LUNDI, "LUNDA"... 
    Il n'a aucune possibilité de savoir où est le bon message original parmi toutes les propositions (on parle de *sécurité sémantique*).

#### 3.3.2 En binaire

En binaire, nous n'avons qu'un deux possibilités pour chaque chiffre du masque 0 ou 1.

Listons toutes les possibilités d'information à chiffrer et de masque dans un tableau:

| à chiffrer | masque | chiffré |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |

On reconnait la table de vérité du [XOR](https://fr.wikipedia.org/wiki/Fonction_OU_exclusif) (vu en première)

Or une propriété du XOR est A ⊕ M ⊕ M = A . Donc si M est le masque, on retrouve l'information initiale en appliquant le masque deux fois à l'aide d'un XOR.


!!! example "Exemple"
    On veut chiffrer 45 à l'aide de la clé (masque) 56

    ```python
    >>> bin(45)
    '0b101101'          # 45 = 101101 (en binaire)
    >>> bin(56)
    '0b111000'          # 52 = 111000 (en binaire)
    >>> bin(45 ^ 56)    # ^ permet de faire un XOR bit à bit
    '0b010101'          # Prenez le temps bit à bit de vérifier que cela fonctionne
    >>> 45 ^ 56
    21                  # 21 est donc l'information chiffrée
                        # Pour la déchiffrée, je dois de nouveau faire un XOR
    >>> bin(21 ^ 56)
    '0b101101'          # On retombe bien sur l'écriture en binaire de 45
                        # Prenez encore le temps de le faire bit à bit
    >>> 21 ^ 56
    45                  # On retombre bien sur le nombre à chiffrer
    ```

    
### 3.4 Quels sont les chiffrements symétriques modernes ?

L'algorithme de chiffrement symétrique le plus utilisé actuellement est le chiffrement [AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard), pour Advanced Encryption Standard.

C'est ce chiffrement qui assure la sécurité du protocole HTTPS.

## 2. Chiffrement asymétrique

Inventé par Whitfield Diffie et Martin Hellman en 1976, le chiffrement asymétrique vient résoudre l'inconvénient essentiel du chiffrement symétrique : le nécessaire partage d'un secret (la clé) avant l'établissement de la communication sécurisée.

### 2.1 Principe du chiffrement asymétrique

Le principe de base est l'existence d'une **clé publique**, appelée à être distribuée largement, et d'une **clé privée**, qui ne quitte jamais son propriétaire. 

![image](data/asym.png){: .center}


### 2.2 Le rôle interchangeable des clés publiques et privées

L'illustration précédente associe :

- une image de cadenas à la clé publique (car on s'en sert pour chiffrer les messages)
- une image de clé à la clé privée (car on s'en sert pour déchiffrer les messages)

Concrètement, (nous le verrons dans l'application par le chiffrement RSA), la clé privée et la clé publique sont **deux nombres** aux rôles identiques. Appelons-les A et B :

- il est impossible de trouver A en fonction de B. Réciproquement, si on connaît A, il est impossible d'en déduire B.
- si on chiffre un message avec A, on peut le déchiffrer avec B. Réciproquement, si on chiffre avec B, on peut déchiffrer le message grâce à A.
- on peut donc chiffrer avec une clé publique et déchiffrer avec la clé privée associée (ce qui est fait dans l'exemple précédent). Mais on peut aussi chiffrer avec la clé privée, et déchiffrer avec la clé publique associée.

A et B ont donc des rôles interchangeables (chacun peut être un cadenas, chacun peut être une clé), et ce n'est qu'en connaissant A **et** B qu'on peut déchiffrer le message.

Nous allons donc maintenant adopter une nouvelle convention infographique :

| Information | Infographie |
|---|---|
| Message non chiffré | ![image](data/a1.png){: .center}|
| Message chiffré avec la clé publique d'Alice | ![image](data/a2.png){: .center}|
| Message chiffré avec la clé publique et déchiffré avec la clé privée d'Alice <br> *l'application de la clé privée sur la clé publique, ou bien de la clé publique sur la clé privée, permet de retrouver le message en clair.*| ![image](data/gif_auth.webp){: .center}|





### 2.3 Communication authentifiée.

Dans la situation du 2.1, Alice (qui a distribué largement sa clé publique) ne peut pas s'assurer que le message vient bien de Bob. Il peut avoir été créé par Marc, qui signe «Bob» et usurpe ainsi son identité. 

Le protocole que nous allons décrire ci-dessous permet :

- d'empêcher qu'un message intercepté soit déchiffré (ce qui était déjà le cas dans le 2.1)
- mais aussi de s'assurer que chaque personne est bien celle qu'elle prétend être : on résout le **problème d'authentification**.

![image](data/total_auth.png){: .center}

**En résumé :**

- Alice est sûre que seul Bob pourra déchiffrer le message qu'elle envoie.
- Bob est sûr que le message qu'il reçoit vient bien d'Alice.

### 2.4 Un exemple de chiffrement asymétrique : le chiffrement RSA
 
#### 2.4.1 Histoire
Lorsqu'en 1976 Diffie et Hellman (chercheurs à Stanford) présentent le concept de chiffrement asymétrique (souvent appelé _cryptographie à clés publiques_), ils en proposent uniquement un modèle théorique, n'ayant pas trouvé une réelle implémentation de leur protocole.

Trois chercheurs du MIT (Boston), Ron Rivest, Adi Shamir et Len Adleman se penchent alors sur ce protocole, convaincus qu'il est en effet impossible d'en trouver une implémentation pratique. En 1977, au cours de leurs recherches, ils démontrent en fait l'inverse de ce qu'ils cherchaient : ils créent le premier protocole concret de chiffrement asymétrique : le chiffrement **RSA**.


![image](data/pic_RSA.jpeg){: .center width=60%}

??? note "Et pourtant"
    Au même moment à Londres, Clifford Cocks, (chercheur au très secret [GCHQ](https://fr.wikipedia.org/wiki/Government_Communications_Headquarters){. target="_blank"}) apprend que Rivest, Shamir et Adleman viennent de découvrir ce que lui-même a découvert **3 ans auparavant** mais qui est resté classé Secret Défense.

    Il est le véritable inventeur du RSA... mais le reste du monde ne l'apprendra qu'en 1997 au moment de la déclassification de cette information. 

#### 2.4.2 Description

Le chiffrement RSA est basé sur *l'arithmétique modulaire*. Faire des calculs *modulo* un entier $n$, c'est ne garder que le reste de la division euclidienne par $n$.

Le fait que 15 soit égal à 1 modulo 7 (car $15=2 \times 7+1$) s'écrira $15 \equiv 1 [7]$.

De même, $10 \equiv  3 [7]$, $25 \equiv 4 [7]$, $32 \equiv 2 [10]$, etc.

| Etapes | Exemple |
|---|---|
| **Étape 1** Alice choisit 2 grands nombres premiers $p$ et $q$ | Dans notre exemple, nous prendrons $p = 3$ et $q = 11$. Dans la réalité ces nombres seront vraiment très grands (plus de 100 chiffres) |
| **Étape 2** Alice multiplie ces deux nombres $p$ et $q$ et obtient ainsi un nombre $n$. <br> *Il est très facile pour Alice de calculer $n$ en connaissant $p$ et $q$, mais il  extrêmement difficile de faire le travail inverse : trouver $p$ et $q$ en connaissant $n$ prend un temps exponentiel avec la taille de $n$.* <br> C'est sur cette difficulté (appelée difficulté de *factorisation*) que repose la robustesse du système RSA. | $n = p \times q = 33$  |
| **Étape 3** Alice choisit un nombre $e$ qui doit être premier avec $(p-1)(q-1)$ (que l'on note parfois $\phi(n)$). <br> Le couple $(e, n)$ sera **la clé publique** d'Alice. Elle la diffuse à qui veut lui écrire.| Dans notre exemple, $(p-1)(q-1) = 20$, Alice choisit donc $e = 3$. (mais elle aurait pu aussi choisir 7, 9, 13...). La clé publique d'Alice est donc $(3, 33)$.|
| **Étape 4** Alice calcule maintenant sa clé privée : elle doit trouver un nombre $d$ qui vérifie l'égalité $e d \equiv 1 [\phi(n)]$. En pratique, il existe un algorithme simple (algorithme d'[Euclide étendu](https://fr.wikipedia.org/wiki/Algorithme_d%27Euclide_%C3%A9tendu)) pour trouver cette valeur $d$, appelée *inverse de e*. <br> Le couple $(d, n)$ sera **la clé privée** d'Alice. Elle ne la diffuse à personne.| Dans notre exemple, comme $7 \times 3  \equiv 1 [20]$, ce nombre $d$ est égal à 7. La clé privée d'Alice est donc $(7, 33)$.|
| **Étape 5** Supposons que Bob veuille écrire à Alice pour lui envoyer un nombre M. Il possède la clé publique d'Alice $(e, n)$, il chiffre le nombre M en calculant $M^e$ modulo $n$. Notons le message chiffré $M_c$| Bob veut envoyer le nombre 4 à Alice. Il possède la clé publique d'Alice, qui est $(3, 33)$. Il calcule donc $4^3$ modulo 33, qui vaut 31. C'est cette valeur 31 qu'il transmet à Alice. Si Marc intercepte cette valeur 31, même en connaissant la clé publique d'Alice $(3,33)$, il ne peut pas résoudre l'équation $x^3 \equiv 31 [33]$ de manière efficace.|
| **Étape 6** Alice reçoit le message chiffeé $M_c$. Il suffit alors d'élever $M_c$ à la puissance $d$ et de calculer le reste modulo $n$. Le résultat est $M$. | Alice reçoit le nombre 31. Il lui suffit alors d'élever 31 à la puissance 7 (sa clé privée), et de calculer le reste modulo 33 : $31^7 = 27512614111$. Or $27512614111 \equiv 4 [33]$. Elle récupère la valeur 4, qui est bien le message original de Bob.|

> **Comment ça marche ?**
Grâce au [Petit Théorème de Fermat](https://fr.wikipedia.org/wiki/Petit_th%C3%A9or%C3%A8me_de_Fermat), on démontre (voir [ici](https://fr.wikipedia.org/wiki/Chiffrement_RSA)) assez facilement que $M^{ed} \equiv M [n]$.

Il faut remarquer que $M^{ed} = M^{de}$. On voit que les rôles de la clé publique et de la clé privée sont **symétriques** : un message chiffré avec la clé publique se déchiffrera en le chiffrant avec la clé privée, tout comme un message chiffré avec la clé privée se déchiffrera en le chiffrant avec la clé publique.

**Animation interactive**
voir [https://animations.interstices.info/interstices-rsa/rsa.html](https://animations.interstices.info/interstices-rsa/rsa.html)



#### 2.4.3 Avantages et inconvénients


| avantages | inconvénients |
|:---|:---|
|Inviolable (à condition de prendre des grands nombres premiers avec certaines conditions)| grande consommation de ressources (due à la manipulation des grands nombres) |


??? note "Explications"
    Actuellement, il n'existe pas d'algorithme efficace pour factoriser un nombre ayant plusieurs centaines de chiffres.
    Deux évènements pourraient faire s'écrouler la sécurité du RSA :

    - la découverte d'un algorithme efficace de factorisation, capable de tourner sur les ordinateurs actuels. Cette annonce est régulièrement faite, et tout aussi régulièrement contredite par la communauté scientifique. (voir, le 05/03/2021,  [https://www.schneier.com/blog/archives/2021/03/no-rsa-is-not-broken.html](https://www.schneier.com/blog/archives/2021/03/no-rsa-is-not-broken.html))
    - l'avènement d'[ordinateurs quantiques](https://fr.wikipedia.org/wiki/Calculateur_quantique), dont la vitesse d'exécution permettrait une factorisation rapide. Il est à noter que l'algorithme de factorisation destiné à tourner sur un ordinateur quantique existe déjà : [l'algorithme de Schor](https://fr.wikipedia.org/wiki/Algorithme_de_Shor).

## 3. HTTPS : exemple d'utilisation conjointe d'un chiffrement asymétrique et d'un chiffrement symétrique.

### 3.1 Principe général
Aujourd'hui, plus de 90 % du trafic sur internet est chiffré : les données ne transitent plus en clair (protocole ```http```) mais de manière chiffrée (protocole ```https```), ce qui empêche la lecture de paquets éventuellements interceptés.





Le protocole ```https``` est la réunion de deux protocoles :

-  le protocole ```TLS``` (Transport Layer Security, qui a succédé au SSL) : ce protocole, basé sur du **chiffrement asymétrique**, va conduire à la génération d'une clé identique chez le client et chez le serveur.
- le (bon vieux) protocole  ```http```, mais qui convoiera maintenant des données chiffrées avec la clé générée à l'étape précédente. Les données peuvent toujours être interceptées, mais sont illisibles. Le **chiffrement symétrique** utilisé est actuellement le chiffrement AES.

**Pourquoi ne pas utiliser que le chiffrement asymétrique, RSA par exemple ?**
Car il est très gourmand en ressources ! Le chiffrement/déchiffrement doit être rapide pour ne pas ralentir les communications ou l'exploitation des données.
Le chiffrement asymétrique est donc réservé à l'échange de clés (au début de la communication).
Le chiffrement symétrique, bien plus rapide, prend ensuite le relais pour l'ensemble de la communication.


![image](data/https.png){: .center}



### 3.2 (HP) Fonctionnement du TLS : explication du *handshake*

 Observons en détail le fonctionnement du protocole ```TLS```, dont le rôle est de générer de manière sécurisée une clé dont disposeront à la fois le client et le serveur, leur permettant ainsi d'appliquer un chiffrement symétrique à leurs échanges.

![image](data/tls.png){: .center}


- **étape 1** : le «client Hello». Le client envoie sa version de TLS utilisée. 

- **étape 2** : le «server Hello». Le serveur répond en renvoyant son certificat prouvant son identité, ainsi que sa clé publique.

- **étape 3** : le client interroge l'autorité de certification pour valider le fait que le certificat est bien valide et que le serveur est bien celui qu'il prétend être. Cette vérification est faite grâce à un mécanisme de chiffrement asymétrique.

> La présentation du certificat à l'autorité de certification peut se représenter comme le scan d'une pièce d'identité dans un aéroport. L'autorité de certification est alors l'État (dont la base de données est interrogée par un logiciel) qui valide que la pièce d'identité est bien un document officiel.


- **étape 4** : une fois vérifiée l'authenticité du serveur et que son certificat est valide, le client calcule ce qui sera la future clé de chiffrement symétrique (appelée «clé AES» dans l'infographie). Cette clé est chiffrée avec la clé publique du server (transmise à l'étape 1), ce qui assure la sécurité de son transfert. Le serveur déchiffre cette clé grâce à sa clé privée, et dispose ainsi lui aussi de la clé. 

Le transmission par protocole ```http``` de données chiffrées au préalable avec la clé AES peut commencer. 

>Remarque : en réalité, ce n'est pas la clé AES qui est transmise à l'étape 4, mais un nombre choisi par le client, qui permettra, avec deux autres nombres choisis par le client (étape 1) et le serveur (étape 2) de reconstituer la clé AES, qui sera donc identique côté client et côté serveur.


---
## Bibliographie
- Le [cours](https://glassus.github.io/terminale_nsi/T5_Architecture_materielle/5.4_Cryptographie/cours/) de Gilles Lassus du lycée François Mauriac 
- Numérique et Sciences Informatiques, Terminale, T. BALABONSKI, S. CONCHON, J.-C. FILLIATRE, K. NGUYEN, éditions ELLIPSES.
- Prépabac NSI, Terminale, G. CONNAN, V. PETROV, G. ROZSAVOLGYI, L. SIGNAC, éditions HATIER.
- https://www.cloudflare.com/fr-fr/learning/ssl/what-happens-in-a-tls-handshake/


---
