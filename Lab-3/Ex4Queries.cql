--------------/
-- NMEC: 93221
-- Pedro Santos
--------------/

-- 1. Pesquisar por todos os jogos de um desenolvedor, ordenados por data de lançamento.
SELECT * FROM gaming_records.games_by_publisher WHERE publisher='Ubisoft' ORDER BY launch_date;

--  publisher | launch_date | name                     | developer        | genres                                                       | launch_price
-- -----------+-------------+--------------------------+------------------+--------------------------------------------------------------+--------------
--    Ubisoft |  2014-03-11 |        Rainbow Six Siege | Ubisoft Montreal |                        {'Multiplayer', 'Shooter', 'Tactics'} |        19.99
--    Ubisoft |  2018-03-27 |                Far Cry 5 | Ubisoft Montreal | {'Action', 'Co-op', 'First Person', 'Open World', 'Shooter'} |        59.99
--    Ubisoft |  2020-09-10 | Assassins Creed Valhalla | Ubisoft Montreal |        {'Action', 'Adventure', 'Open World', 'Third Person'} |        59.99
--    Ubisoft |  2020-10-29 |        Watch Dogs Legion |  Ubisoft Toronto |                    {'Open World', 'Shooter', 'Third Person'} |        59.99

-- 2. Pesquisar por jogos do genero "Platformer".
SELECT * FROM gaming_records.games_by_publisher WHERE genres CONTAINS 'Platformer' ;

--  genre      | game_name     | game_publisher
-- ------------+---------------+----------------
--  Platformer | Hollow Knight |    Team Cherry
--  Platformer |      Portal 2 |          Valve

-- 3. Pesquisar os jogos que o utilizador 'PedroS03' já jogou.
SELECT hours_played from gaming_records.users WHERE email='pedroS03@gmail.com';

--  hours_played
-- --------------------------------------------------------------
--  {'Dead Cells': 23, 'Dota 2': 153, 'Grand Theft Auto V': 246}

-- 4. Pesquisar pelo dia em que o jogo 'Life Is Strange' teve maior desconto;
SELECT sale_date, MAX(percent) FROM gaming_records.sales_by_game WHERE game_name='Life Is Strange';

--  sale_date  | system.max(percent)
-- ------------+---------------------
--  2017-01-07 |                  30



-- 5. Pesquisar por todas as reviews do jogador XXXXX.
SELECT * FROM gaming_records.reviews_by_user WHERE user='pedroS06@gmail.com';

--  user               | game_name                | game_publisher     | date                            | description                                                                                                                                                                                                                                                                                                                       | score
-- --------------------+--------------------------+--------------------+---------------------------------+-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+-------
--  pedroS06@gmail.com | Assassins Creed Valhalla |            Ubisoft | 2020-12-22 02:48:47.392000+0000 |                                                                                                                                              Possibly the best installment of the current Assassins Creed franchise, they have been perfecting the recent formula and the improvement from Odissey to Valhalla really shows that. |   4.7
--  pedroS06@gmail.com |            Borderlands 3 |                 2K | 2020-12-22 02:48:47.377000+0000 |                                                                                                                                                                                                           Awesome shooter with lots of unique weapons, definitely an improvement over the previous games of the Borderlands saga. |     4
--  pedroS06@gmail.com |                Far Cry 5 |            Ubisoft | 2020-12-22 02:48:47.396000+0000 |                                                                                                                                                         Its a good game no doubt, but an average Far Cry game, really feels like their once incredible formula has been getting repetitive, recommend getting the game on a sale. |     3
--  pedroS06@gmail.com |          Hotline Miami 2 |   Devolver Digital | 2020-12-22 02:48:47.381000+0000 | Looks pretty average at first but after experiencing the game for a few hours i can definitely say i recommend it! Missions can be approached through several ways and the story is interesting enough with a few comedic elemts to it. The mask system is one of the highlights adding different challenges throughout the game. |   4.3
--  pedroS06@gmail.com |          Life Is Strange |        Square Enix | 2020-12-22 02:48:47.384000+0000 |                                                                                                                                                                                                                                                      Brutally slow paced and not a lot of action, definitely not my type of game. |     1
--  pedroS06@gmail.com |             TESV: Skyrim | Bethesda Softworks | 2020-12-22 02:48:47.389000+0000 |                                                                                   One of the best open world games ive played, the atmosphere is incredible and has lots of content to explore in terms of quests and side quests. Definitely a gem for how long its been out, just a shame Bethesda is milking the game so much. |   4.6


-- 6. Pesquisar as ultimas 10 reviews feitas no jogo XXXXX, ordenadas inversamente por utilizador.
SELECT * FROM gaming_records.reviews_by_game  WHERE game_name='Dead Cells' ORDER BY user DESC;

--  game_name  | score | user               | date                            | description                                                                                                                                                      | game_publisher
-- ------------+-------+--------------------+---------------------------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------+------------------
--  Dead Cells |     2 | pedroS07@gmail.com | 2020-12-22 03:01:08.366000+0000 |                                                          Gets boring real quick, story is non-existant and the weapons are all pretty much the same. Its a pass. |      Motion Twin
--  Dead Cells |     3 | pedroS02@gmail.com | 2020-12-22 03:01:08.275000+0000 |                                                                                                 Not a bad metroidvania, good looter but gets repetitive quickly. |      Motion Twin
--  Dead Cells |     4 | pedroS09@gmail.com | 2020-12-22 03:01:08.353000+0000 |                                                                                  Do recommend! Expecially on sale, its very entertaining and a true time sinker. |      Motion Twin
--  Dead Cells |   4.3 | pedroS04@gmail.com | 2020-12-22 03:01:08.344000+0000 | One of this years hidden gems, great replayability and smooth gameplay, and as cheap as it is you really shouldnt ignore it, expecially if you enjoy roguelikes. | Devolver Digital


-- 7. Pesquisar todos os jogos da publicadora 'Ubisoft' lançados em 2020.
SELECT * FROM gaming_records.games_by_publisher WHERE publisher='Ubisoft' AND  launch_date > '2020-01-01' AND launch_date < '2021-01-01' ;

--  publisher | launch_date | name                     | developer        | genres                                                | launch_price
-- -----------+-------------+--------------------------+------------------+-------------------------------------------------------+--------------
--    Ubisoft |  2020-09-10 | Assassins Creed Valhalla | Ubisoft Montreal | {'Action', 'Adventure', 'Open World', 'Third Person'} |        59.99
--    Ubisoft |  2020-10-29 |        Watch Dogs Legion |  Ubisoft Toronto |             {'Open World', 'Shooter', 'Third Person'} |        59.99

-- 8. Pesquisar pelo maior disconto do jogo 'Grande Theft Auto V'.
SELECT MAX(percent) FROM gaming_records.sales_by_game WHERE game_name='Grand Theft Auto V';

--  system.max(percent)
-- ---------------------
--                   80

-- 9. Pesquisar pelas ultimas 2 sales do jogo 'TESV: Skyrim', ordenadas por percentagem.
SELECT * FROM gaming_records.sales_by_game WHERE game_name='TESV: Skyrim' ORDER BY percent LIMIT 2;

--  game_name    | percent | sale_date  | game_publisher
-- --------------+---------+------------+--------------------
--  TESV: Skyrim |      50 | 2015-07-05 | Bethesda Softworks
--  TESV: Skyrim |      65 | 2016-03-13 | Bethesda Softworks


-- 10. Pesquisar todos os jogos que estiveram em saldo em 2017, 2018 e 2019, entre os dias 21 e 25.
SELECT * FROM gaming_records.sales_by_date WHERE sale_date in ('2017-12-21', '2017-12-22', '2017-12-23', '2017-12-24','2018-12-21', '2018-12-22', '2018-12-23', '2018-12-24', '2019-12-21', '2019-12-22', '2019-12-23', '2019-12-24') ; 

--  sale_date  | game_name          | percent | game_publisher
-- ------------+--------------------+---------+--------------------
--  2017-12-23 |    Life Is Strange |      25 |        Square Enix
--  2017-12-23 |       TESV: Skyrim |      70 | Bethesda Softworks
--  2018-12-21 | Grand Theft Auto V |      75 |     Rockstar Games
--  2019-12-22 |         Dead Cells |      15 |        Motion Twin
--  2019-12-22 |       TESV: Skyrim |      75 | Bethesda Softworks


UPDATE gaming_records.reviews_by_game SET score=5 WHERE game_name='Borderlands 3' AND user='pedroS06@gmail.com' IF EXISTS;

UPDATE gaming_records.games_by_publisher SET genres = genres + {'Action'} WHERE name='Half-Life' AND publisher='Valve' AND launch_date='1998-11-08' IF EXISTS;

UPDATE gaming_records.users SET username='PedroSUpdated' WHERE email='pedroS06@gmail.com' IF EXISTS;

UPDATE gaming_records.users SET hours_played = hours_played + {'Hollow Knight': 1} WHERE email='pedroS09@gmail.com' IF EXISTS;

UPDATE gaming_records.users SET hours_played['Dead Cells'] = 70 WHERE email='pedroS09@gmail.com' IF EXISTS;

-- Eliminar os dados de saldos do jogo 'Half-Life' da tabela sales_by_game.
DELETE FROM gaming_records.sales_by_game WHERE game_name='Half-Life';

-- Eliminar o jogo 'Dota 2' da lista de jogos jogados do utilizador com email pedroS08@gmail.com.
DELETE hours_played['Dota 2'] FROM gaming_records.users WHERE email='pedroS08@gmail.com' IF EXISTS ;

-- Eliminar o preço de lançamento do jogo 'Hollow Knight'.
DELETE launch_price FROM gaming_records.games_by_publisher WHERE publisher='Team Cherry' AND name='Hollow Knight' AND launch_date='2017-02-24' IF EXISTS;

-- Eliminar todos os jogos da publicadora 'Bethesda Softworks'.
DELETE FROM gaming_records.games_by_publisher WHERE publisher='Bethesda Softworks';

-- Eliminar a review do jogo 'Dead Cells' do utilizador com email 'pedroS02@gmail.com' se esta tiver score abaixo de 4.
DELETE FROM gaming_records.reviews_by_game WHERE game_name='Dead Cells' AND user='pedroS02@gmail.com' IF score < 4;
