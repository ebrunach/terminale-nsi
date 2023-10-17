
# TP2

**NE PAS OUBLIER LE COMPTE RENDU : Zone de rendu [TNSINF1](), [TNSINF2]()**


{{initexo(0)}}


!!! example "{{ exercice() }}: Messagerie"
    === "énoncé"
        1. Récupérer le [zip](./data/4%20-%20SGBD%20-%20TP2.zip) et le décompresser. Executer serveur.py puis aller dans un navigateur web et taper l'adresse [http://127.0.0.1:5000/conversation.html](http://127.0.0.1:5000/conversation.html). Il s'agit d'une application web, le serveur étant vous même. Vous êtes donc à la fois le client (navigateur) et le serveur (serveur.py).
        2. Le serveur utilise un fichier csv pour stocker les données. Modifier ceci pour stocker les données dans une base de données SQLite et utiliser la bibliothèque `sqlite3`. S'aider de l'exemple du cours.