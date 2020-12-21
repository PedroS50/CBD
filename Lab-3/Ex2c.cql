-- c)
-- 7.
SELECT * FROM video_user WHERE author='user2@gmail.com';

-- 8.
SELECT * FROM comment_user WHERE author='user2@gmail.com';

-- 9.
SELECT * FROM comment_video WHERE video_id=3;

-- 10.
SELECT AVG(value) FROM rating WHERE video_id=13;
SELECT COUNT(*) FROM rating WHERE video_id=13;

-- d)
-- 1.
SELECT * FROM comment_video WHERE video_id=13 LIMIT 3;

-- 2.
SELECT tags FROM video WHERE id=11;

-- 3.
SELECT * FROM video_user WHERE tags CONTAINS 'Aveiro';

-- 4.
SELECT * FROM event WHERE video_id=13 AND email='user2@gmail.com' LIMIT 5;

-- 5.
SELECT * FROM video_user WHERE author='user3@gmail.com' AND upload_date > '2020-09-08' AND upload_date < '2020-09-10' ;

-- 6.
-- Este query não é possível fazer em Cassandra. O mais próximo seria, por exemplo, os ultimos 10 videos
-- de um utilizador, ordenados inversamente pela data de partilha.

-- 7.
SELECT * FROM follower_video WHERE video_id=1;

-- 8.
-- Para obter os resultados seria necessário realizar pelo menos 2 queries. 
-- O primeiro para obter a lista de videos que o utilizador segue, 
-- e de seguida um query por video para obter os comentários.
SELECT * FROM follower_user WHERE email='user8@gmail.com';
 email           | video_id
-----------------+----------
 user8@gmail.com |        4
 user8@gmail.com |       19


SELECT * FROM comment_video WHERE video_id=4;
 video_id | comment_date                    | author          | description
----------+---------------------------------+-----------------+------------------------------------------
        4 | 2020-12-21 02:25:10.938000+0000 | user6@gmail.com | mi eleifend egestas. Sed pharetra, felis

SELECT * FROM comment_video WHERE video_id=19;
 video_id | comment_date                    | author          | description
----------+---------------------------------+-----------------+---------------------------------------------------------------
       19 | 2020-12-21 02:25:10.951000+0000 | user5@gmail.com | elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris
       19 | 2020-12-21 02:25:10.924000+0000 | user9@gmail.com |                                     pellentesque. Sed dictum.

-- 9. 
-- Impossivel realizar em Cassandra. 

-- 10.
SELECT * FROM video WHERE id IN ( 1,2,3,4,5,6,7,8,9,10);

-- 11.
-- ???




