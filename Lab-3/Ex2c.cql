-- c)
-- 7.
SELECT * FROM video_user WHERE author='user2@gmail.com';
-- author          | upload_date                     | description        | id                                   | name            | tags
-- -----------------+---------------------------------+--------------------+--------------------------------------+-----------------+------------------------------------
-- user2@gmail.com | 2020-09-06 15:20:40.000000+0000 | Sample Description | 9e04ffef-f74f-4677-aefd-28e8c8958506 | Sample Video V3 | ['test', 'bot', 'fake', 'classic']
-- user2@gmail.com | 2020-09-05 14:19:39.000000+0000 | Sample Description | 9e04ffef-f74f-4677-aefd-28e8c8958505 | Sample Video V2 |            ['test', 'bot', 'fake']
-- user2@gmail.com | 2020-09-04 13:18:38.000000+0000 | Sample Description | 9e04ffef-f74f-4677-aefd-28e8c8958504 |    Sample Video |                    ['test', 'bot']

-- 8.
SELECT * FROM comment_user WHERE author='user2@gmail.com';
-- author          | comment_date                    | description                                          | video_id
-- -----------------+---------------------------------+------------------------------------------------------+--------------------------------------
-- user2@gmail.com | 2020-12-21 16:53:41.344000+0000 |       ipsum dolor sit amet, consectetuer adi piscing | 9e04ffef-f74f-4677-aefd-28e8c8958508
-- user2@gmail.com | 2020-12-21 16:53:41.341000+0000 | tempus, lorem fringilla ornare placerat, orc i lacus | 9e04ffef-f74f-4677-aefd-28e8c8958507

-- 9.
SELECT * FROM comment_video WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958518;

-- video_id                             | comment_date                    | author          | description
-- --------------------------------------+---------------------------------+-----------------+---------------------------------------------------------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958518 | 2020-12-21 16:53:41.473000+0000 | user9@gmail.com |                                     mi, ac mattis velit justo
-- 9e04ffef-f74f-4677-aefd-28e8c8958518 | 2020-12-21 16:53:41.432000+0000 | user3@gmail.com |                                                       gravida
-- 9e04ffef-f74f-4677-aefd-28e8c8958518 | 2020-12-21 16:53:41.429000+0000 | user3@gmail.com |   ac nulla. In tincidunt congue turpis. In condimentum. Donec
-- 9e04ffef-f74f-4677-aefd-28e8c8958518 | 2020-12-21 16:53:41.422000+0000 | user5@gmail.com | penatibus et magnis dis parturient montes, nascetur ridiculus
-- 9e04ffef-f74f-4677-aefd-28e8c8958518 | 2020-12-21 16:53:41.411000+0000 | user1@gmail.com |        Sed pharetra, felis eget varius ultrices, mauris ipsum

-- 10.
SELECT AVG(value) FROM rating WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958513;

-- system.avg(value)
-- -------------------
--                 3

SELECT COUNT(*) FROM rating WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958513;

-- count
-- -------
--      2

-- d)
-- 1.
SELECT * FROM comment_video WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958513 LIMIT 3;
-- video_id                             | comment_date                    | author          | description
-- --------------------------------------+---------------------------------+-----------------+------------------------------------------------------------------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958513 | 2020-12-21 17:01:29.457000+0000 | user1@gmail.com | Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas
-- 9e04ffef-f74f-4677-aefd-28e8c8958513 | 2020-12-21 17:01:29.446000+0000 | user8@gmail.com |                                       Nam porttitor scelerisque neque.

-- 2.
SELECT tags FROM video WHERE id=9e04ffef-f74f-4677-aefd-28e8c8958511;
-- tags
-- --------------------------------------------
-- ['music', 'album', 'trap', 'instrumental']

-- 3.
SELECT * FROM video WHERE tags CONTAINS 'Aveiro';
-- id | upload_date | author | description | name | tags
-- ----+-------------+--------+-------------+------+------

-- 4.
SELECT * FROM event WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958513 AND email='user2@gmail.com' LIMIT 5;

-- video_id                             | email           | event_date                      | type  | video_time
-- --------------------------------------+-----------------+---------------------------------+-------+------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958513 | user2@gmail.com | 2020-10-10 14:30:00.000000+0000 |  play |          0
-- 9e04ffef-f74f-4677-aefd-28e8c8958513 | user2@gmail.com | 2020-10-10 14:31:01.000000+0000 | pause |         61
-- 9e04ffef-f74f-4677-aefd-28e8c8958513 | user2@gmail.com | 2020-10-11 13:00:53.000000+0000 |  play |         61


-- 5.
SELECT * FROM video_user WHERE author='user3@gmail.com' AND upload_date > '2020-09-08' AND upload_date < '2020-09-10' ;
-- author          | upload_date                     | description        | id                                   | name | tags
-- -----------------+---------------------------------+--------------------+--------------------------------------+------+---------------------------------------
-- user3@gmail.com | 2020-09-09 19:23:43.000000+0000 | Sample Description | 9e04ffef-f74f-4677-aefd-28e8c8958509 | Will |   ['music', 'hiphop', 'experimental']
-- user3@gmail.com | 2020-09-08 17:22:42.000000+0000 | Sample Description | 9e04ffef-f74f-4677-aefd-28e8c8958508 | Zeus | ['music', 'hiphop', 'rap', 'feature']

-- 6.
-- Este query não é possível fazer em Cassandra. O mais próximo seria, por exemplo, os ultimos 10 videos
-- de um utilizador, ordenados inversamente pela data de partilha.

-- 7.
SELECT * FROM follower_video WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958501;
-- video_id                             | email
-- --------------------------------------+-----------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958501 | user2@gmail.com
-- 9e04ffef-f74f-4677-aefd-28e8c8958501 | user4@gmail.com

-- 8.
-- Para obter os resultados seria necessário realizar pelo menos 2 queries. 
-- O primeiro para obter a lista de videos que o utilizador segue, 
-- e de seguida um query por video para obter os comentários.
SELECT * FROM follower_user WHERE email='user8@gmail.com';
-- email           | video_id
-- -----------------+--------------------------------------
-- user8@gmail.com | 9e04ffef-f74f-4677-aefd-28e8c8958504
-- user8@gmail.com | 9e04ffef-f74f-4677-aefd-28e8c8958519


SELECT * FROM comment_video WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958504;
-- video_id                             | comment_date                    | author          | description
-- --------------------------------------+---------------------------------+-----------------+------------------------------------------
--  9e04ffef-f74f-4677-aefd-28e8c8958504 | 2020-12-21 17:01:29.443000+0000 | user6@gmail.com | mi eleifend egestas. Sed pharetra, felis

SELECT * FROM comment_video WHERE video_id=9e04ffef-f74f-4677-aefd-28e8c8958519;
-- video_id                             | comment_date                    | author          | description
-- --------------------------------------+---------------------------------+-----------------+---------------------------------------------------------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958519 | 2020-12-21 17:01:29.448000+0000 | user5@gmail.com | elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris
-- 9e04ffef-f74f-4677-aefd-28e8c8958519 | 2020-12-21 17:01:29.439000+0000 | user9@gmail.com |                                     pellentesque. Sed dictum.

-- 9. 
-- Impossivel realizar em Cassandra. 

-- 10.
SELECT * FROM video WHERE id IN ( 9e04ffef-f74f-4677-aefd-28e8c8958501,9e04ffef-f74f-4677-aefd-28e8c8958502,9e04ffef-f74f-4677-aefd-28e8c8958503,9e04ffef-f74f-4677-aefd-28e8c8958504,9e04ffef-f74f-4677-aefd-28e8c8958505,9e04ffef-f74f-4677-aefd-28e8c8958506,9e04ffef-f74f-4677-aefd-28e8c8958507,9e04ffef-f74f-4677-aefd-28e8c8958508,9e04ffef-f74f-4677-aefd-28e8c8958509,9e04ffef-f74f-4677-aefd-28e8c8958510);

-- id                                   | upload_date                     | author          | description        | name             | tags
-- --------------------------------------+---------------------------------+-----------------+--------------------+------------------+----------------------------------------------
-- 9e04ffef-f74f-4677-aefd-28e8c8958501 | 2020-09-01 10:15:35.000000+0000 | user1@gmail.com | Sample Description |      Funny Video |                      ['comedy', 'happiness']
-- 9e04ffef-f74f-4677-aefd-28e8c8958502 | 2020-09-02 11:16:36.000000+0000 | user1@gmail.com | Sample Description |    My First Vlog |                     ['lifestyle', 'amateur']
-- 9e04ffef-f74f-4677-aefd-28e8c8958503 | 2020-09-03 12:17:37.000000+0000 | user1@gmail.com | Sample Description | Prank Gone Wrong |                 ['prank', 'comedy', 'adult']
-- 9e04ffef-f74f-4677-aefd-28e8c8958504 | 2020-09-04 13:18:38.000000+0000 | user2@gmail.com | Sample Description |     Sample Video |                              ['test', 'bot']
-- 9e04ffef-f74f-4677-aefd-28e8c8958505 | 2020-09-05 14:19:39.000000+0000 | user2@gmail.com | Sample Description |  Sample Video V2 |                      ['test', 'bot', 'fake']
-- 9e04ffef-f74f-4677-aefd-28e8c8958506 | 2020-09-06 15:20:40.000000+0000 | user2@gmail.com | Sample Description |  Sample Video V3 |           ['test', 'bot', 'fake', 'classic']
-- 9e04ffef-f74f-4677-aefd-28e8c8958507 | 2020-09-07 16:21:41.000000+0000 | user3@gmail.com | Sample Description |             Fall |                   ['music', 'hiphop', 'rap']
-- 9e04ffef-f74f-4677-aefd-28e8c8958508 | 2020-09-08 17:22:42.000000+0000 | user3@gmail.com | Sample Description |             Zeus |        ['music', 'hiphop', 'rap', 'feature']
-- 9e04ffef-f74f-4677-aefd-28e8c8958509 | 2020-09-09 19:23:43.000000+0000 | user3@gmail.com | Sample Description |             Will |          ['music', 'hiphop', 'experimental']
-- 9e04ffef-f74f-4677-aefd-28e8c8958510 | 2020-09-10 20:24:44.000000+0000 | user3@gmail.com | Sample Description |           Search | ['music', 'hiphop', 'instrumental', 'fresh']


-- 11.
-- ???




