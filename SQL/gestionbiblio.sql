-- Active: 1716027378001@@127.0.0.1@3306
-- Mises en places des structures importantes
BEGIN TRANSACTION

PRAGMA foreign_keys = ON

DROP TABLE if EXISTS Livres;
DROP TABLE if EXISTS Emprunteurs;
DROP TABLE if EXISTS Emprunt;
DROP TABLE if EXISTS Retour;


CREATE TABLE Livres (
    titre VARCHAR (250) NOT NULL,
    isbn INTEGER NOT NULL PRIMARY KEY,
    auteurs VARCHAR (250) NOT NULL,
    categories VARCHAR(250) NOT NULL,
    dateDePublication DATE NOT NULL,
    copieDisponible INTEGER NOT NULL
);
CREATE TABLE Emprunteurs(
    nom VARCHAR(250) NOT NULL,
    prenom VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    numero INTEGER NOT NULL PRIMARY KEY
);
CREATE TABLE Emprunts(
    numeroEmprunteur INTEGER NOT NULL,
    isbnLivres INTEGER NOT NULL,
    dateEmprunt DATE NOT NULL,
    statu CHAR NOT NULL,
    dateRetour DATE NOT NULL,
    Foreign Key (numeroEmprunteur) REFERENCES Emprunteurs(numero) ON DELETE CASCADE,
    Foreign Key (isbnLivres) REFERENCES Livres(isbn) ON DELETE CASCADE
);
CREATE TABLE Retour(
    numeroEmprunteur INTEGER NOT NULL,
    dateRetour DATE NOT NULL,
    etatDuLivre VARCHAR(250) NOT NULL,
    statu VARCHAR(250) NOT NULL,
    Foreign Key (numeroEmprunteur) REFERENCES Emprunteurs ON DELETE CASCADE
);
-- Insertion des données dans les colonnes
INSERT INTO Livres (titre, isbn, auteurs, categories, dateDePublication, copieDisponible) VALUES
('Brave New World', 1234567890, 'Aldous Huxley', 'Science Fiction', '2010-04-13', 9),
('The Hobbit', 2345678901, 'J.R.R. Tolkien', 'Fantasy', '2017-07-22', 5),
('Fahrenheit 451', 3456789012, 'Ray Bradbury', 'Science Fiction', '2005-09-30', 14),
('Jane Eyre', 4567890123, 'Charlotte Bronte', 'Classic', '2018-03-19', 3),
('Wuthering Heights', 5678901234, 'Emily Bronte', 'Romance', '2021-05-25', 8),
('The Lord of the Rings', 6789012345, 'J.R.R. Tolkien', 'Fantasy', '2016-12-14', 12),
('The Picture of Dorian Gray', 7890123456, 'Oscar Wilde', 'Classic', '2008-11-08', 4),
('Anna Karenina', 8901234567, 'Leo Tolstoy', 'Historical', '2011-01-17', 6),
('Dracula', 9012345678, 'Bram Stoker', 'Thriller', '2019-06-05', 7),
('The Brothers Karamazov', 1238904567, 'Fyodor Dostoevsky', 'Classic', '2014-08-29', 10),
('The Shining', 9812345670, 'Stephen King', 'Thriller', '2015-08-23', 10),
('The Alchemist', 9823456781, 'Paulo Coelho', 'Fiction', '2011-05-14', 8),
('The Da Vinci Code', 9834567892, 'Dan Brown', 'Mystery', '2019-03-27', 12),
('The Catch-22', 9845678903, 'Joseph Heller', 'Classic', '2007-12-11', 5),
('The Kite Runner', 9856789014, 'Khaled Hosseini', 'Fiction', '2016-09-30', 14),
('Life of Pi', 9867890125, 'Yann Martel', 'Fantasy', '2020-02-17', 7),
('The Road', 9878901236, 'Cormac McCarthy', 'Fiction', '2012-04-25', 3),
('Gone Girl', 9889012347, 'Gillian Flynn', 'Thriller', '2018-11-20', 6),
('The Help', 9890123458, 'Kathryn Stockett', 'Historical', '2013-01-15', 9),
('The Girl on the Train', 9801234569, 'Paula Hawkins', 'Mystery', '2021-07-05', 11);
-- Insertions des données  sur les emprunteurs
INSERT INTO Emprunteurs (nom, prenom, email, numero) VALUES
('Johnson', 'Alice', 'alice.johnson@example.com', 1234),
('Smith', 'Bob', 'bob.smith@example.com', 2345),
('Williams', 'Charlie', 'charlie.williams@example.com', 3456),
('Brown', 'David', 'david.brown@example.com', 4567),
('Jones', 'Eve', 'eve.jones@example.com', 5678),
('Garcia', 'Frank', 'frank.garcia@example.com', 6789),
('Miller', 'Grace', 'grace.miller@example.com', 7890),
('Davis', 'Hannah', 'hannah.davis@example.com', 8901),
('Martinez', 'Ivy', 'ivy.martinez@example.com', 9012),
('Hernandez', 'Jack', 'jack.hernandez@example.com', 1023),
('Anderson', 'Emily', 'emily.anderson@example.com', 5674),
('Thomas', 'Liam', 'liam.thomas@example.com', 6785),
('Jackson', 'Olivia', 'olivia.jackson@example.com', 7896),
('White', 'Noah', 'noah.white@example.com', 8907),
('Harris', 'Sophia', 'sophia.harris@example.com', 9018),
('Martin', 'Mason', 'mason.martin@example.com', 1239),
('Thompson', 'Isabella', 'isabella.thompson@example.com', 2340),
('Moore', 'Ethan', 'ethan.moore@example.com', 3451),
('Taylor', 'Ava', 'ava.taylor@example.com', 4562),
('Lee', 'Logan', 'logan.lee@example.com', 5673);
-- INsertions des données sur les emprunts
INSERT INTO Emprunts (numeroEmprunteur, isbnLivres, dateEmprunt, statu, dateRetour) VALUES
(1234, 1234567890, '2021-06-15', 'R', '2021-07-15'),
(2345, 2345678901, '2022-03-22', 'E', '2022-04-21'),
(3456, 3456789012, '2020-11-10', 'R', '2020-12-10'),
(4567, 4567890123, '2023-01-05', 'E', '2023-02-04'),
(5678, 5678901234, '2021-08-18', 'R', '2021-09-17'),
(6789, 6789012345, '2022-10-09', 'E', '2022-11-08'),
(7890, 7890123456, '2020-05-14', 'R', '2020-06-13'),
(8901, 8901234567, '2023-04-11', 'E', '2023-05-11'),
(9012, 9012345678, '2021-12-01', 'R', '2021-12-31'),
(1023, 1238904567, '2022-07-23', 'E', '2022-08-22'),
(2340, 9823456781, '2021-07-21', 'E', '2021-08-05'),
(6785, 3456789012, '2022-10-11', 'R', '2022-10-25'),
(7896, 4567890123, '2023-01-17', 'E', '2023-01-30'),
(8907, 1238904567, '2022-03-22', 'R', '2022-04-15'),
(9018, 9878901236, '2020-06-05', 'E', '2020-06-20'),
(1239, 9012345678, '2021-09-30', 'R', '2021-10-10'),
(2345, 6789012345, '2022-02-14', 'E', '2022-02-28'),
(7890, 7890123456, '2023-04-20', 'R', '2023-05-05'),
(6789, 9801234569, '2020-12-05', 'E', '2020-12-25'),
(5673, 9834567892, '2021-11-12', 'R', '2021-12-02');

INSERT INTO Retour (numeroEmprunteur, dateRetour, etatDuLivre, statu) VALUES
(2340, '2021-07-21', 'Bon état', 'Retour accepté'),
(6785, '2022-10-11', 'État moyen', 'Retour refusé'),
(7896, '2023-01-17', 'Mauvais état', 'Retour accepté'),
(8907, '2022-03-22', 'Bon état', 'Retour accepté'),
(9018, '2020-06-05', 'État moyen', 'Retour refusé'),
(1239, '2021-09-30', 'Mauvais état', 'Retour accepté'),
(2345, '2022-02-14', 'Bon état', 'Retour accepté'),
(7890, '2023-04-20', 'État moyen', 'Retour refusé'),
(6789, '2020-12-05', 'Mauvais état', 'Retour accepté'),
(5673, '2021-11-12', 'Bon état', 'Retour accepté'),
(3451, '2021-05-12', 'Bon état', 'Retour accepté'),
(5678, '2022-07-21', 'État moyen', 'Retour refusé'),
(7890, '2023-02-17', 'Mauvais état', 'Retour accepté'),
(8901, '2022-08-30', 'Bon état', 'Retour accepté'),
(9012, '2020-11-05', 'État moyen', 'Retour refusé'),
(1234, '2021-12-25', 'Mauvais état', 'Retour accepté'),
(2345, '2022-03-14', 'Bon état', 'Retour accepté'),
(6789, '2023-06-20', 'État moyen', 'Retour refusé'),
(8907, '2020-09-05', 'Mauvais état', 'Retour accepté'),
(5673, '2021-01-12', 'Bon état', 'Retour accepté');
