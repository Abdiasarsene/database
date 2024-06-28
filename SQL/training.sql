-- SQLite
-- Mise en place des structures importantes

PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS new_table_openclassroom;
DROP TABLE IF EXISTS ingredients_recipes;
DROP TABLE IF EXISTS produit;
DROP TABLE IF EXISTS categories_recipes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS recipes;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ingredients;

--Création de la table 'users"
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username varchar(200) NOT NULL UNIQUE,
    -- email varchar (250) UNIQUE NOT NULL
); 

-- Création de la tables des Recipes
CREATE TABLE recipes (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title TEXT,
    slug varchar(250) UNIQUE,
    date CURRENT_DATE,
    duration INT DEFAULT 0 NOT NULL,
    user_id INT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Création de la table Catégories
CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    title varchar(250)
);

--Création de la table ingrédients
CREATE TABLE ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL,
    name varchar(160)
);

--Création de la table intermédiaire Catégories-recipes
CREATE TABLE categories_recipes (
    category_id INT,
    recipe_id INT,
    FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE CASCADE,
    FOREIGN KEY(recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    PRIMARY KEY (category_id, recipe_id),
    UNIQUE(category_id, recipe_id)
);

--Création de la table ingrédients-recipes
CREATE TABLE ingredients_recipes(
    recipe_id INT,
    ingredient_id INT,
    quantity INT,
    unit varchar(50),
    FOREIGN KEY(recipe_id) REFERENCES recipe(id) ON DELETE CASCADE;
    FOREIGN KEY(ingredient_id) REFERENCES ingredients(id) ON DELETE CASCADE,
    FOREIGN KEY(recipe_id) REFERENCES recipes(id) ON DELETE CASCADE,
    PRIMARY KEY(recipe_id, ingredient_id),  
    UNIQUE(recipe_id, ingredient_id)
);

--Création de la table des produits
CREATE TABLE produit(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tite varchar(10)
);

--Création d'une nouvelle table dans ma base donnée relmationnelle pour le cours de openclassroom
CREATE TABLE new_table_openclassroom (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    montant INTEGER NOT NULL,
    type_categorie VARCHAR (255) NOT NULL,
    date DATE NOT NULL,
    FOREIGN KEY (type_categorie) REFERENCES categories_recipes(title) ON DELETE CASCADE
)
--Insertions des données
INSERT INTO users (username, email) VALUES
('admin', 'admin@gmail.com');

INSERT INTO categories (title) VALUES 
('Desserts'), ('Plats chauds'), ('Entrées'), ('Divers'), ('Boissons');

INSERT INTO recipes (title, slug, duration, user_id) VALUES
('Tarte aux fraises', 'tarte-aux-fraises', 30, 1),
('Salade de fruits verts', 'salade-de-fruits-verts', 15, 2),
('Poulet grillé au fromage', 'poullet-grele',  45, 1),
('Soupe au poivre', 'soupe-au-poivre',  90, 2),
('Coca-cola', 'cocacola', 0, 3);

INSERT INTO catogies_recipes (category_id, recipe_id) VALUE
(1, 1), -- Desserts / Tarte aux fraises 
(2, 2), -- Plats chauds / Salade de fruits verts
(3, 3); -- Entrées/ Poulet grillé au fromage

-- INSERT INTO ingredients(name) VALUES
-- ('Fraise', 'Poire', 'Oignon', 'Fromage', 'Champignons', 'Lait', 'Sucre', 'Eggs', 'Viande de poulet', 'Feuille de sel'),
-- ('Fraise', 'Poivron rouge', 'Oignon', 'Tomate cerise', 'Fromage de chèvre', 'Vinaigrette', 'Su  cre glace', 'Citron'),
-- ('Fraise', 'Poivron rouge', 'Oignon', 'Tomate cerise', 'Fromage de chèvre', 'Viande de poulet', 'Lait', 'Sucre', 'Eau'),
-- ('Fraise', 'Poivron rouge', 'Oignon', 'Tomate cerise', 'Fromage de chèvre', 'Vinaigrette', 'Sucre glace', 'Citron'),
-- ('Fraise', 'Poivron  rouge', 'Oignon', 'Tomate cerise', 'Fromage de chèvre', 'Viande de poulet', 'Lait', 'Sucre', 'Beurre'),
-- ('Fraise', 'Poivron rouge', 'Oignon', 'Tomate cerise', 'Fromage de chèvre');
SELECT title, slug FROM recipes;

INSERT INTO new_table_openclassroom(montant, type_categorie, date) VALUES
('10', 'riz','20/01/2024'),('23', 'com','01/01/2001')

SELECT date FROM new_table_openclassroom
