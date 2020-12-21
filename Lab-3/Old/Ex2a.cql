CREATE KEYSPACE IF NOT EXISTS video_streaming WITH replication = { 'class': 'SimpleStrategy', 'replication_factor': 1 };

DROP TABLE IF EXISTS video_streaming.user;
DROP TABLE IF EXISTS video_streaming.video;
DROP TABLE IF EXISTS video_streaming.comment;
DROP TABLE IF EXISTS video_streaming.follower;
DROP TABLE IF EXISTS video_streaming.event;
DROP TABLE IF EXISTS video_streaming.rating;

--- Table definitions
-- User
CREATE TABLE video_streaming.user (username text, email text, name text, register_date timestamp, PRIMARY KEY (email));

-- Video
CREATE TABLE video_streaming.video (author text, name text, description text, tags list<text>, upload_date timestamp, PRIMARY KEY(upload_date, author));
CREATE INDEX ON video (tags);

-- Comment
CREATE TABLE video_streaming.comment (author text, description text, comment_date timestamp, video_author text, video_upload_date timestamp, PRIMARY KEY(author, comment_date)) WITH CLUSTERING ORDER BY (comment_date DESC);

-- Follower
CREATE TABLE video_streaming.follower (email text, video_author text, video_upload_date timestamp, PRIMARY KEY(video_author, video_upload_date, email));

-- Event
CREATE TABLE video_streaming.event (email text, type text, event_date timestamp, video_time int, video_author text, video_upload_date timestamp, PRIMARY KEY(email, event_date, video_author, video_upload_date));

-- Rating
CREATE TABLE video_streaming.rating (id timeuuid, value int, video_author text, video_upload_date timestamp, PRIMARY KEY(id, video_author, video_upload_date));


