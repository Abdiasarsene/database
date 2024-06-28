-- Active: 1716027378001@@127.0.0.1@3306
-- SQL
-- Mises en places des structures importantes
PRAGMA foreign_keys = ON

DROP TABLE if EXISTS Oeuvre;
DROP Table if EXISTS SocieteDeProduction;
DROP TABLE if EXISTS Realisateur;
DROP TABLE if EXISTS Asso_oeuvre_real;
DROP TABLE if EXISTS Lieu;
DROP TABLE if EXISTS Tournage;
DROP TABLE if EXISTS Asso_societe_real;

-- Creation des tables importantes
CREATE TABLE SocieteDeProduction (
    nomProd VARCHAR(250) NOT NULL,
    nomDeOeuvre VARCHAR(250) NOT NULL PRIMARY KEY
);
CREATE TABLE Oeuvre (
    titre TEXT PRIMARY KEY NOT NULL,
    typeDeTournage VARCHAR NOT NULL,
    resumé_oeuvre TEXT NOT NULL,
    socProd_nom VARCHAR(250) NOT NULL,
    Foreign Key (socProd_nom) REFERENCES SocieteDeProduction(nomDeOeuvre) ON DELETE CASCADE
);
CREATE TABLE Realisateur (
    nom VARCHAR(250) PRIMARY KEY NOT NULL
);
CREATE TABLE Asso_oeuvre_real (
    id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    nom_Realisateur VARCHAR(250) NOT NULL,
    titre_oeuvre TEXT NOT NULL,
    Foreign Key (titre_oeuvre) REFERENCES Oeuvre(titre) ON DELETE CASCADE,
    Foreign Key (nom_Realisateur) REFERENCES Realisateur (nom) ON DELETE CASCADE 
);
CREATE TABLE Lieu(
    codePostal INTEGER PRIMARY KEY NOT NULL,
    localisationDeScene VARCHAR NOT NULL,
    longitude FLOAT NOT NULL,
    latitude FLOAT NOT NULL
);
CREATE TABLE Tournage (
    id INTEGER PRIMARY KEY NOT NULL,
    dateDeDebut DATE NOT NULL,
    dateDeFin DATE NOT NULL,
    codePostal_lieu INTEGER NOT NULL,
    titre_oeuvre TEXT NOT NULL,
    Foreign Key (codePostal_lieu) REFERENCES Lieu(codePostal)ON DELETE CASCADE,
    Foreign Key (titre_oeuvre) REFERENCES Oeuvre(titre) ON DELETE CASCADE
);
CREATE TABLE Asso_societe_real(
    id INTEGER PRIMARY KEY NOT NULL,
    nomSocieteProduction VARCHAR(250) NOT NULL,
    nomRealisateur VARCHAR(250) NOT NULL,
    Foreign Key (nomSocieteProduction) REFERENCES societeDeProduction(nomDeOeuvre) ON DELETE CASCADE,
    Foreign Key (nomRealisateur) REFERENCES Realisateur(nom) ON DELETE CASCADE
)