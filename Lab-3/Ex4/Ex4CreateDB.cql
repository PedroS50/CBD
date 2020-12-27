--------------/
-- NMEC: 93221
-- Pedro Santos
--------------/

-- Descrição da BD:
-- Armazenamento de informação sobre jogos, com utilizadores e reviews feitas por estes.

-- Utilizadores com email, username, horas jogadas por jogo (map)

-- jogos favoritos de jogadores

-- Jogos com nome, publicadora, desenvolvedor, set de generos, data de lançamento, preço de lançamento

-- Reviews de jogos feitas por um utilizador, com descrição, rating, data da review, utilizador que a fez

-- Historico de saldos dos jogos, com data de sale, percentagem

CREATE KEYSPACE IF NOT EXISTS gaming_records WITH replication = { 'class': 'SimpleStrategy', 'replication_factor': 1 };

DROP TABLE IF EXISTS gaming_records.users;
DROP TABLE IF EXISTS gaming_records.games_by_publisher;
DROP TABLE IF EXISTS gaming_records.reviews_by_user;
DROP TABLE IF EXISTS gaming_records.reviews_by_game;
DROP TABLE IF EXISTS gaming_records.sales_by_date;
DROP TABLE IF EXISTS gaming_records.sales_by_game;

CREATE TABLE gaming_records.users (email text, username text, hours_played map<text, int>, PRIMARY KEY(email));
CREATE INDEX ON gaming_records.users (ENTRIES(hours_played));

CREATE TABLE gaming_records.games_by_publisher (name text, launch_date date, genres set<text>, publisher text, developer text, launch_price float, PRIMARY KEY(publisher, launch_date, name)) WITH CLUSTERING ORDER BY (launch_date ASC, name ASC);
CREATE INDEX ON gaming_records.games_by_publisher (genres);

CREATE TABLE gaming_records.reviews_by_user (user text, description text, score float, date timestamp, game_name text, game_publisher text, PRIMARY KEY (user, score, game_name)) WITH CLUSTERING ORDER BY (score ASC, game_name DESC);
CREATE TABLE gaming_records.reviews_by_game (user text, description text, score float, date timestamp, game_name text, game_publisher text, PRIMARY KEY (game_name, user)) WITH CLUSTERING ORDER BY (user ASC);

CREATE TABLE gaming_records.sales_by_date (sale_date date, percent int, game_name text, game_publisher text, PRIMARY KEY(sale_date, game_name, percent));
CREATE TABLE gaming_records.sales_by_game (sale_date date, percent int, game_name text, game_publisher text, PRIMARY KEY(game_name, percent, sale_date)) WITH CLUSTERING ORDER BY (percent ASC, sale_date ASC);

