-- Active: 1716147357968@@127.0.0.1@3306
--SQLite
--Mise en place des structures importantes

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS petitfils;
DROP TABLE IF EXISTS fils;
DROP TABLE IF EXISTS datafamily;

--Création de la table  "datafamily"
CREATE TABLE datafamily(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nom varchar(200) NOT NULL,
    prenom varchar(200) NOT NULL,
    age int NOT NULL,
    metier varchar(200) NOT NULL,
    revenu INT NOT NULL,
    caracter text
);

--Création de la table "fils"
CREATE  TABLE fils(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nom varchar(200) NOT NULL,
    metier varchar(200) NOT NULL,
    revenu INT NOT NULL,
    propriete INT, NOT NULL,
);

-- Creation de la table sur "petitfils"
CREATE TABLE petitfils(
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    nom varchar(200) NOT NULL,
    prenom varchar(200) NOT NULL,
    age int NOT NULL,
    sexe CHAR(1),
    fils_id,
    FOREIGN KEY(fils) REFERENCES fils(id)ON DELETE CASCADE
);

--Insertion des données
    -- Dans la table "datafamily"
INSERT INTO datafamily (nom, prenom, age,  metier,revenu) VALUES ('Lucas','Luc',35,'Ingénieur',60000),
('Sophie','Sophie',28,'Commercial',45000), ('Esther', 'xavier',34, 'data scientist', 100000);

    -- Dans la table "fils"
INSERT INTO fils (nom, metier, revenu, propriete) VALUES
('Abdiças', 'Développeur mobile',70000,23), ("josue",'Dev back end', 140000, 1),('Malick','Cusinier', 21000, 21);

--Affichage des données dans la base de données

SELECT * FROM datafamily;
SELECT metier, revenu FROM fils;