--------------/
-- NMEC: 93221
-- Pedro Santos
--------------/

-- Nota:
-- As inserções do id (uuid) do video são feitas de forma manual para facilitar a demonstração das queries,
-- numa situação real seria utilizada uma função (por exemplo, now()), para obter um uuid único que seria
-- utilizado nas tabelas em que fosse necessário o id do video.

INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('pedro_the_bear', 'bear@gmail.com', 'Pedro', '2020-01-01 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user1', 'user1@gmail.com', 'User1', '2020-05-01 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user2', 'user2@gmail.com', 'User2', '2020-05-02 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user3', 'user3@gmail.com', 'User3', '2020-05-03 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user4', 'user4@gmail.com', 'User4', '2020-05-04 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user5', 'user5@gmail.com', 'User5', '2020-05-05 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user6', 'user6@gmail.com', 'User6', '2020-05-06 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user7', 'user7@gmail.com', 'User7', '2020-05-07 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user8', 'user8@gmail.com', 'User8', '2020-05-08 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user9', 'user9@gmail.com', 'User9', '2020-05-09 10:15:35+0000');
INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('fake_user10', 'user10@gmail.com', 'User10', '2020-05-10 10:15:35+0000');

INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958501, 'user1@gmail.com', '2020-09-01 10:15:35+0000', 'Funny Video', 'Sample Description', ['comedy', 'happiness']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958502, 'user1@gmail.com', '2020-09-02 11:16:36+0000', 'My First Vlog', 'Sample Description', ['lifestyle', 'amateur']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958503, 'user1@gmail.com', '2020-09-03 12:17:37+0000', 'Prank Gone Wrong', 'Sample Description', ['prank', 'comedy', 'adult']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958504, 'user2@gmail.com', '2020-09-04 13:18:38+0000', 'Sample Video', 'Sample Description', ['test', 'bot']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958505, 'user2@gmail.com', '2020-09-05 14:19:39+0000', 'Sample Video V2', 'Sample Description', ['test', 'bot', 'fake']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958506, 'user2@gmail.com', '2020-09-06 15:20:40+0000', 'Sample Video V3', 'Sample Description', ['test', 'bot', 'fake', 'classic']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958507, 'user3@gmail.com', '2020-09-07 16:21:41+0000', 'Fall', 'Sample Description', ['music', 'hiphop', 'rap']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958508, 'user3@gmail.com', '2020-09-08 17:22:42+0000', 'Zeus', 'Sample Description', ['music', 'hiphop', 'rap', 'feature']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958509, 'user3@gmail.com', '2020-09-09 19:23:43+0000', 'Will', 'Sample Description', ['music', 'hiphop', 'experimental']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958510, 'user3@gmail.com', '2020-09-10 20:24:44+0000', 'Search', 'Sample Description', ['music', 'hiphop', 'instrumental', 'fresh']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958511, 'user3@gmail.com', '2020-09-11 21:25:45+0000', 'Ascend', 'Sample Description', ['music', 'album', 'trap', 'instrumental']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958512, 'user5@gmail.com', '2020-09-12 22:26:46+0000', 'Unreal Video', 'Sample Description', ['unreal', 'bot', 'fake']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958513, 'user6@gmail.com', '2020-09-13 23:27:47+0000', 'Cyberpunk 2077 Review', 'Sample Description', ['gaming', 'review', 'futuristic', 'glitches']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958514, 'user6@gmail.com', '2020-09-14 00:28:48+0000', 'GOT Review', 'Sample Description', ['gaming', 'review', 'japan', 'samurais', 'GOTY']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958515, 'user6@gmail.com', '2020-09-15 01:29:49+0000', 'Far Cry 5 Review', 'Sample Description', ['gaming', 'review', 'shooter', 'action', 'rpg']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958516, 'user7@gmail.com', '2020-09-16 02:30:50+0000', 'Bitcoin Guide', 'Sample Description', ['money', 'bitcoin', 'currency']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958517, 'user7@gmail.com', '2020-09-17 03:31:51+0000', 'Etherium Guide', 'Sample Description', ['money', 'ethereum', 'currency']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958518, 'user8@gmail.com', '2020-09-18 04:32:52+0000', 'Video Bots', 'Sample Description', ['unreal', 'bot', 'fake']);
INSERT INTO video_streaming.video (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958519, 'user9@gmail.com', '2020-09-19 05:33:53+0000', 'Definitely Not A Bot', 'Sample Description', ['real', 'notbot', 'legit']);

INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958501, 'user1@gmail.com', '2020-09-01 10:15:35+0000', 'Funny Video', 'Sample Description', ['comedy', 'happiness']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958502, 'user1@gmail.com', '2020-09-02 11:16:36+0000', 'My First Vlog', 'Sample Description', ['lifestyle', 'amateur']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958503, 'user1@gmail.com', '2020-09-03 12:17:37+0000', 'Prank Gone Wrong', 'Sample Description', ['prank', 'comedy', 'adult']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958504, 'user2@gmail.com', '2020-09-04 13:18:38+0000', 'Sample Video', 'Sample Description', ['test', 'bot']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958505, 'user2@gmail.com', '2020-09-05 14:19:39+0000', 'Sample Video V2', 'Sample Description', ['test', 'bot', 'fake']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958506, 'user2@gmail.com', '2020-09-06 15:20:40+0000', 'Sample Video V3', 'Sample Description', ['test', 'bot', 'fake', 'classic']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958507, 'user3@gmail.com', '2020-09-07 16:21:41+0000', 'Fall', 'Sample Description', ['music', 'hiphop', 'rap']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958508, 'user3@gmail.com', '2020-09-08 17:22:42+0000', 'Zeus', 'Sample Description', ['music', 'hiphop', 'rap', 'feature']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958509, 'user3@gmail.com', '2020-09-09 19:23:43+0000', 'Will', 'Sample Description', ['music', 'hiphop', 'experimental']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958510, 'user3@gmail.com', '2020-09-10 20:24:44+0000', 'Search', 'Sample Description', ['music', 'hiphop', 'instrumental', 'fresh']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958511, 'user3@gmail.com', '2020-09-11 21:25:45+0000', 'Ascend', 'Sample Description', ['music', 'album', 'trap', 'instrumental']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958512, 'user5@gmail.com', '2020-09-12 22:26:46+0000', 'Unreal Video', 'Sample Description', ['unreal', 'bot', 'fake']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958513, 'user6@gmail.com', '2020-09-13 23:27:47+0000', 'Cyberpunk 2077 Review', 'Sample Description', ['gaming', 'review', 'futuristic', 'glitches']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958514, 'user6@gmail.com', '2020-09-14 00:28:48+0000', 'GOT Review', 'Sample Description', ['gaming', 'review', 'japan', 'samurais', 'GOTY']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958515, 'user6@gmail.com', '2020-09-15 01:29:49+0000', 'Far Cry 5 Review', 'Sample Description', ['gaming', 'review', 'shooter', 'action', 'rpg']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958516, 'user7@gmail.com', '2020-09-16 02:30:50+0000', 'Bitcoin Guide', 'Sample Description', ['money', 'bitcoin', 'currency']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958517, 'user7@gmail.com', '2020-09-17 03:31:51+0000', 'Etherium Guide', 'Sample Description', ['money', 'ethereum', 'currency']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958518, 'user8@gmail.com', '2020-09-18 04:32:52+0000', 'Video Bots', 'Sample Description', ['unreal', 'bot', 'fake']);
INSERT INTO video_streaming.video_user (id, author, upload_date, name, description, tags) VALUES (9e04ffef-f74f-4677-aefd-28e8c8958519, 'user9@gmail.com', '2020-09-19 05:33:53+0000', 'Definitely Not A Bot', 'Sample Description', ['real', 'notbot', 'legit']);


INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user1@gmail.com','Sed pharetra, felis eget varius ultrices, mauris ipsum',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user9@gmail.com','eu neque pellentesque massa l, obortis',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','augue porttitor interdum. Sed auct or odio',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958511);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user2@gmail.com','tempus, lorem fringilla ornare placerat, orc i lacus',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user2@gmail.com','ipsum dolor sit amet, consectetuer adi piscing',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958508);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user5@gmail.com','penatibus et magnis dis parturient montes, nascetur ridiculus',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user4@gmail.com','nulla. Cras eu tellus eu augue',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user9@gmail.com','auctor quis, tristique ac, eleifend vitae, erat.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user3@gmail.com','ac nulla. In tincidunt congue turpis. In condimentum. Donec',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user3@gmail.com','gravida',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user6@gmail.com','molestie sodales. Mauris',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958505);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user7@gmail.com','tellus.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user3@gmail.com','massa. Quisque porttitor eros nec',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user9@gmail.com','pellentesque. Sed dictum.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','nec, euismod',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user6@gmail.com','mi eleifend egestas. Sed pharetra, felis',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958504);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user7@gmail.com','faucibus orci luctus et ultrices posuere',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Nam porttitor scelerisque neque.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user9@gmail.com','Aenean sed',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958503);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user5@gmail.com','elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user5@gmail.com','Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958502);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user4@gmail.com','bibendum ullamcorper. Duis cursus, diam',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user1@gmail.com','diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','non nisi. Aenean eget metus.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user1@gmail.com','Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Proin',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user7@gmail.com','aliquet magna a neque.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user9@gmail.com','mi, ac mattis velit justo',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user7@gmail.com','vulputate',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958509);
INSERT INTO video_streaming.comment_user (author,description,comment_date,video_id) VALUES ('user7@gmail.com','massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);

INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user1@gmail.com','Sed pharetra, felis eget varius ultrices, mauris ipsum',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user9@gmail.com','eu neque pellentesque massa l, obortis',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','augue porttitor interdum. Sed auct or odio',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958511);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user2@gmail.com','tempus, lorem fringilla ornare placerat, orc i lacus',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user2@gmail.com','ipsum dolor sit amet, consectetuer adi piscing',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958508);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user5@gmail.com','penatibus et magnis dis parturient montes, nascetur ridiculus',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user4@gmail.com','nulla. Cras eu tellus eu augue',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user9@gmail.com','auctor quis, tristique ac, eleifend vitae, erat.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user3@gmail.com','ac nulla. In tincidunt congue turpis. In condimentum. Donec',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user3@gmail.com','gravida',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user6@gmail.com','molestie sodales. Mauris',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958505);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user7@gmail.com','tellus.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user3@gmail.com','massa. Quisque porttitor eros nec',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user9@gmail.com','pellentesque. Sed dictum.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','nec, euismod',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user6@gmail.com','mi eleifend egestas. Sed pharetra, felis',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958504);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user7@gmail.com','faucibus orci luctus et ultrices posuere',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Nam porttitor scelerisque neque.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user9@gmail.com','Aenean sed',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958503);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user5@gmail.com','elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user5@gmail.com','Nunc sollicitudin commodo ipsum. Suspendisse non leo. Vivamus nibh',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958502);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user4@gmail.com','bibendum ullamcorper. Duis cursus, diam',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user1@gmail.com','diam nunc, ullamcorper eu, euismod ac, fermentum vel, mauris.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958517);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','non nisi. Aenean eget metus.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user1@gmail.com','Quisque varius. Nam porttitor scelerisque neque. Nullam nisl. Maecenas',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Proin',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user7@gmail.com','aliquet magna a neque.',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user8@gmail.com','Phasellus fermentum convallis ligula. Donec luctus aliquet odio. Etiam ligula',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user9@gmail.com','mi, ac mattis velit justo',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user7@gmail.com','vulputate',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958509);
INSERT INTO video_streaming.comment_video (author,description,comment_date,video_id) VALUES ('user7@gmail.com','massa. Vestibulum accumsan neque et nunc. Quisque ornare tortor',dateof(now()),9e04ffef-f74f-4677-aefd-28e8c8958512);

INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user2@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user2@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user4@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958508);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958509);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958510);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958511);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user8@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958504);
INSERT INTO video_streaming.follower_user (email,video_id) VALUES ('user8@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958519);

INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user2@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user2@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user4@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958508);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958509);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958510);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user5@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958511);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user8@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958504);
INSERT INTO video_streaming.follower_video (email,video_id) VALUES ('user8@gmail.com', 9e04ffef-f74f-4677-aefd-28e8c8958519);

INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user1@gmail.com', 'pause', '2020-10-01 14:23:53+0000', 121, 9e04ffef-f74f-4677-aefd-28e8c8958510);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user1@gmail.com', 'play', '2020-10-02 21:30:01+0000', 0, 9e04ffef-f74f-4677-aefd-28e8c8958512);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user2@gmail.com', 'play', '2020-10-10 14:30:00+0000', 0, 9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user2@gmail.com', 'pause', '2020-10-10 14:31:01+0000', 61, 9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user2@gmail.com', 'play', '2020-10-11 13:00:53+0000', 61, 9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user5@gmail.com', 'play', '2020-10-05 14:23:53+0000', 0, 9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user6@gmail.com', 'play', '2020-10-15 21:00:23+0000', 0, 9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user3@gmail.com', 'pause', '2020-10-03 10:00:32+0000', 34, 9e04ffef-f74f-4677-aefd-28e8c8958504);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user9@gmail.com', 'pause', '2020-10-23 12:00:01+0000', 56, 9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.event (email, type, event_date, video_time,video_id) VALUES ('user9@gmail.com', 'pause', '2020-10-23 12:01:03+0000', 32, 9e04ffef-f74f-4677-aefd-28e8c8958505);

INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 1, 9e04ffef-f74f-4677-aefd-28e8c8958501);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 2, 9e04ffef-f74f-4677-aefd-28e8c8958502);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 1, 9e04ffef-f74f-4677-aefd-28e8c8958503);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 4, 9e04ffef-f74f-4677-aefd-28e8c8958507);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 5, 9e04ffef-f74f-4677-aefd-28e8c8958508);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 4, 9e04ffef-f74f-4677-aefd-28e8c8958509);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 5, 9e04ffef-f74f-4677-aefd-28e8c8958510);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 5, 9e04ffef-f74f-4677-aefd-28e8c8958511);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 3, 9e04ffef-f74f-4677-aefd-28e8c8958513);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 4, 9e04ffef-f74f-4677-aefd-28e8c8958514);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 2, 9e04ffef-f74f-4677-aefd-28e8c8958516);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 2, 9e04ffef-f74f-4677-aefd-28e8c8958518);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 5, 9e04ffef-f74f-4677-aefd-28e8c8958519);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 1, 9e04ffef-f74f-4677-aefd-28e8c8958506);
INSERT INTO video_streaming.rating (id, value,video_id) VALUES (now(), 4, 9e04ffef-f74f-4677-aefd-28e8c8958513);
