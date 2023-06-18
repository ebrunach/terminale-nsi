import requests
import sqlite3
import pandas
import matplotlib.pyplot as plt
import json

class QuotelessEncoder(json.JSONEncoder):
    def default(self, obj):
        # Replace quotes for keys and string values
        obj = self.replace_quotes(obj)
        return super().encode(obj)

    def replace_quotes(self, obj):
        if isinstance(obj, dict):
            return {str(k): self.replace_quotes(v) for k, v in obj.items()}
        elif isinstance(obj, str):
            return obj.replace('"', '').replace("'", '')
        elif isinstance(obj, (list, tuple)):
            return [self.replace_quotes(item) for item in obj]
        return obj

def importer_fichier_parcoursup(filename, conn):
    from datetime import date
    with open(filename,'r') as csvfile:
        df = pandas.read_csv(csvfile, sep=";")
        df["date"] = date.today()
        df.to_sql("details_admi", conn, if_exists='append', index=False)


def importer_fichier_resultats_spe(filename, conn):
    with open(filename,'r') as csvfile:
        df = pandas.read_csv(csvfile, sep=",")
        df.to_sql("eleves", conn, if_exists='replace', index=False)

def definir_query():
    nombre_oui_query = 'select count(Nom) from (select distinct Nom, Prenom, "Réponse de la formation" from details_admi WHERE "Réponse de la formation" = "Oui")'
    spe1_spe2_Nom_Oui_query = 'SELECT DISTINCT Spé1, Spé2, Nom, (IFNULL(HGGSP, 0) + IFNULL(HLP, 0) + IFNULL(MATHS, 0) + IFNULL(NSI, 0) + IFNULL("PH-CH", 0) + IFNULL(SVT, 0) + IFNULL(SES, 0) + IFNULL(LLCE, 0) + IFNULL(CBPH, 0) + IFNULL(STSS, 0)) / 2.0 AS Moyenne_Spe FROM eleves JOIN details_admi ON eleves.Code = details_admi."Numéro d\'inscription" WHERE "Réponse de la formation" = "Oui"'
    spe1_spe2_Nom = 'SELECT DISTINCT Spé1, Spé2, Nom, Code, date, (IFNULL(HGGSP, 0) + IFNULL(HLP, 0) + IFNULL(MATHS, 0) + IFNULL(NSI, 0) + IFNULL("PH-CH", 0) + IFNULL(SVT, 0) + IFNULL(SES, 0) + IFNULL(LLCE, 0) + IFNULL(CBPH, 0) + IFNULL(STSS, 0)) / 2.0 AS Moyenne_Spe FROM eleves JOIN details_admi ON eleves.Code = details_admi."Numéro d\'inscription"'
    spe1_spe2_Count_Oui_query = f'SELECT Spé1, Spé2, AVG(Moyenne_Spe), COUNT(*) AS total FROM ({spe1_spe2_Nom_Oui_query}) GROUP BY Spé1, Spé2'
    spe1_spe2_Count = f'SELECT Spé1, Spé2, AVG(Moyenne_Spe), COUNT(*) AS total FROM ({spe1_spe2_Nom}) GROUP BY Spé1, Spé2'
    spe1_spe2_freq_oui = f'SELECT oui.Spé1, oui.Spé2, CAST(oui.total AS REAL) / CAST(tot.total AS REAL) * 100.0 AS Pourcentage_Oui FROM ({spe1_spe2_Count_Oui_query}) AS oui JOIN ({spe1_spe2_Count}) AS tot ON oui.Spé1=tot.Spé1 AND oui.Spé2=tot.Spé2'
    Order = 'ORDER BY CASE "Réponse de la formation" WHEN "Oui" THEN 0 WHEN "Oui Si" THEN 1 WHEN "En recherche de contrat" THEN 3 WHEN "En liste d\'attente" THEN 4 WHEN "En liste d\'attente - Oui Si" THEN 5 WHEN "Non" THEN 6 WHEN "Refusé" THEN 7 WHEN "Décision connue ultérieurement" THEN 8 WHEN " " THEN 9 END'
    Moyenne = f'SELECT details_admi.date,"Réponse de la formation", AVG(Moyenne_Spe) AS Moyenne, MIN(Moyenne_Spe), COUNT(eleves.Nom) AS Nombre_Voeux FROM ({spe1_spe2_Nom}) AS eleves JOIN details_admi ON eleves.Code = details_admi."Numéro d\'inscription" GROUP BY "Réponse de la formation", details_admi.date' + " " + Order
    Formation_Oui = 'SELECT DISTINCT details_admi.date, Voeu, Nom, (IFNULL(HGGSP, 0) + IFNULL(HLP, 0) + IFNULL(MATHS, 0) + IFNULL(NSI, 0) + IFNULL("PH-CH", 0) + IFNULL(SVT, 0) + IFNULL(SES, 0) + IFNULL(LLCE, 0) + IFNULL(CBPH, 0) + IFNULL(STSS, 0)) / 2.0 AS Moyenne_Spe FROM eleves JOIN details_admi ON eleves.Code = details_admi."Numéro d\'inscription" WHERE "Réponse de la formation" = "Oui"'
    Type = """CASE 
    WHEN Voeu LIKE 'BUT%' THEN 'BUT'
    WHEN Voeu LIKE 'Licence%' THEN 'Licence'
    WHEN Voeu LIKE 'BTS%' THEN 'BTS'
    WHEN Voeu LIKE 'Classe préparatoire%' THEN 'Classe préparatoire'
    WHEN Voeu LIKE 'DCG%' THEN 'DCG'
    WHEN Voeu LIKE 'D.E%' THEN 'D.E'
    WHEN Voeu LIKE 'DEUST%' THEN 'DEUST'
    WHEN Voeu LIKE "Formation des écoles%" THEN "Ecoles (commerce, ingénieur...)"
    WHEN Voeu LIKE "%Formations  des écoles%" THEN "Ecoles (commerce, ingénieur...)"
    WHEN Voeu LIKE "Mise à niveau%" THEN "Mise à niveau"
    WHEN Voeu LIKE "Formations Bac + 5%" THEN "Archi"
    WHEN Voeu LIKE "%Année préparatoire aux Etudes de Santé%" THEN "Année préparatoire aux Etudes de Santé"
    WHEN Voeu LIKE "%CPES%" THEN "Classe préparatoire"
    ELSE "Autre"
    END Type
    """
    super = f'SELECT {Type}, "Qualification présentée", "Division de classe", "Numéro Candidat", "Spé1" || " / "|| "Spé2" As "Spe","Phase", "Réponse de la formation", "Situation du voeu", "Date de la situation", "date", (IFNULL(HGGSP, 0) + IFNULL(HLP, 0) + IFNULL(MATHS, 0) + IFNULL(NSI, 0) + IFNULL("PH-CH", 0) + IFNULL(SVT, 0) + IFNULL(SES, 0) + IFNULL(LLCE, 0) + IFNULL(CBPH, 0) + IFNULL(STSS, 0)) / 2.0 AS Moyenne_Spe FROM eleves JOIN details_admi ON eleves.Code = details_admi."Numéro d\'inscription";'
    Type_Formation_Oui = f'SELECT date, {Type}, AVG(Moyenne_Spe) AS Moyenne, COUNT(*) AS Nombre_Voeux FROM ({Formation_Oui}) GROUP BY Type, date ORDER BY date, Moyenne'
    return {"Type_Formation_Oui" : Type_Formation_Oui,
            "Moyenne" : Moyenne,
            "Super": super}



def show_graphes_moyennes(moyenne, conn):
    fig, ax = plt.subplots()
    df_essai = pandas.read_sql_query(moyenne, conn)

    couleur ={
        "Oui" : 'lime',
        "Oui Si" : 'darkgreen',
        "En recherche de contrat": 'green',
        "En liste d'attente": "orange",
        "En liste d'attente - Oui Si": "darkorange",
        "Non" : "red",
        "Refusé": "darkred",
        "Décision connue ultérieurement": "grey",
        ' ':"white"
    }

    premier = True
    for date in df_essai['date'].unique():
        bottom = 0
        for index, row in df_essai.iterrows():
            if row['date'] == date:
                p = ax.bar(row["date"], row["Nombre_Voeux"],bottom = bottom, color = couleur[row["Réponse de la formation"]], label = row["Réponse de la formation"] if premier else "")
                # Ajout d'un label spécifique
                if row["Nombre_Voeux"] > 200:
                    plt.text(row["date"], bottom + row["Nombre_Voeux"]//2 , str(row["Nombre_Voeux"]) + " / " + str(round(row["Moyenne"],1)), ha='center', va='center')
                bottom += row["Nombre_Voeux"]
        premier = False

    # Suppression des labels existants
    for c in ax.containers:
        labels = ["" for v in c.datavalues]    
        ax.bar_label(c, labels=labels, label_type="center")

    ax.set_title('Evolution des réponses \n(nbre de voeux / moyennes épreuves de spé)')
    ax.legend(bbox_to_anchor=(1, 0.5), loc='center left', fontsize='small')

    plt.tight_layout()
    plt.show()

def export_json_moyennes(moyenne, conn):
    df = pandas.read_sql_query(moyenne, conn)
    data = list()
    for reponse in df['Réponse de la formation'].unique():
        if reponse != ' ':
            data.append({"name":reponse, "x":[], "y":[], "type" : "bar", "hovertext":[], "text":[], "textposition": "inside"})
            for date in df['date'].unique():
                ligne = df.loc[(df["date"]==date) & (df["Réponse de la formation"]==reponse)]
                nombre_de_voeux = int(ligne["Nombre_Voeux"].iloc[0])
                moy = float(int(ligne["Moyenne"].iloc[0] * 10) / 10)
                data[-1]["hovertext"].append(str(nombre_de_voeux) + " / " + str(moy))
                data[-1]["text"].append(str(nombre_de_voeux) + " / " + str(moy))
                data[-1]["x"].append(date)
                data[-1]["y"].append(int(df.loc[(df["date"]==date) & (df["Réponse de la formation"]==reponse)]["Nombre_Voeux"].iloc[0]))
    return data

def export_json_types_oui(type_oui, conn):
    df = pandas.read_sql_query(type_oui, conn)
    data = list()
    for type in df['Type'].unique():
        if type != ' ':
            data.append({"name":type, "x":[], "y":[], "type" : "bar", "hovertext":[], "text":[], "textposition": "inside"})
            for date in df['date'].unique():
                ligne = df.loc[(df["date"]==date) & (df["Type"]==type)]
                if ligne.size > 0:
                    nombre_de_voeux = int(ligne["Nombre_Voeux"].iloc[0])
                    moy = float(int(ligne["Moyenne"].iloc[0] * 10) / 10)
                    data[-1]["hovertext"].append(str(nombre_de_voeux) + " / " + str(moy))
                    data[-1]["text"].append(str(nombre_de_voeux) + " / " + str(moy))
                    data[-1]["x"].append(date)
                    data[-1]["y"].append(int(df.loc[(df["date"]==date) & (df["Type"]==type)]["Nombre_Voeux"].iloc[0]))
                else:
                    data[-1]["x"].append(date)
                    data[-1]["y"].append(0)
    return data

def export_json_super(super, conn):
    df = pandas.read_sql_query(super, conn)
    return df.to_csv("data_super.csv")

def export_json(json_file_path, data):

    # # Write data to JSON file
    with open(json_file_path, 'w') as json_file:
        #e = QuotelessEncoder()
        #datae = e.default(data)
        json.dump(data, json_file)


queries = definir_query()
conn = sqlite3.connect("/mnt/8db36fc9-e85d-4f5c-836f-33bd7ae1acdd/Documents/Google Drive Linux/Vie professionelle et scolaire/Professeur de Math/Fonctionnaire/2022-2023 - La Plaine/TNSI/Site/docs/data/parcoursup.db")
importer_fichier_parcoursup("2023-06-18_0932667U_details_admi.csv", conn)
moyenne_query = queries["Moyenne"]
# show_graphes_moyennes(moyenne_query, conn)
data = export_json_moyennes(moyenne_query, conn)
export_json('data.json', data)

data_type_oui = export_json_types_oui(queries["Type_Formation_Oui"], conn)
export_json('data_type_oui.json', data_type_oui)

data_super = export_json_super(queries["Super"], conn)
# export_json('data_super.json', data_super)