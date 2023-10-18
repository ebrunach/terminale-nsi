SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

CREATE TABLE joueur (
  idJoueur INT PRIMARY KEY,
  nomJoueur VARCHAR(30) NOT nULL,
  pnomJoueur VARCHAR(30) NOT NULL
);


CREATE TABLE partie(
    idpartie INT PRIMARY KEY,
    idJoueur1 INT NOT NULL,
    idJoueur2 INT NOT NULL,
    score1 INT NOT NULL,
    score2 INT NOT NULL,
    idvainqueur INT NOT NULL,
    CHECK((idjoueur1 <>idjoueur2)),
    FOREIGN KEY (idJoueur1) REFERENCES joueur(idjoueur),
    FOREIGN KEY (idJoueur2) REFERENCES joueur(idjoueur),
    FOREIGN KEY (idvainqueur) REFERENCES joueur(idjoueur)
);

INSERT INTO joueur (idjoueur,nomJoueur,pnomJoueur) VALUES (1,'Terez','Pascual'),
    (2,'Melusine','Enfaillite'),
    (3,'Leponge','Bob'),
    (4,'Kalité','Filtre'),
    (5,'Gosse','Bo');


INSERT INTO partie (idpartie,idjoueur1,idjoueur2,score1,score2,idvainqueur) VALUES  
    (1,1,2,54,45,2),
    (2,1,3,45,85,3),
    (3,4,5,96,35,4),
    (4,2,5,54,8,2),
    (5,2,3,9,12,3),
    (6,2,4,56,84,2),
    (7,1,4,9,23,4),
    (8,1,5,15,35,5),
    (9,3,5,6,12,5),
    (10,3,4,8,7,3);