CREATE KEYSPACE IF NOT EXISTS video_streaming WITH replication = { 'class': 'SimpleStrategy', 'replication_factor': 1 };

DROP TABLE IF EXISTS video_streaming.user;
DROP TABLE IF EXISTS video_streaming.video;
DROP TABLE IF EXISTS video_streaming.video_user;
DROP TABLE IF EXISTS video_streaming.comment_user;
DROP TABLE IF EXISTS video_streaming.comment_video;
DROP TABLE IF EXISTS video_streaming.follower_user;
DROP TABLE IF EXISTS video_streaming.follower_video;
DROP TABLE IF EXISTS video_streaming.event;
DROP TABLE IF EXISTS video_streaming.rating;

--- Table definitions
-- User
CREATE TABLE video_streaming.user (username text, email text, name text, register_date timestamp, PRIMARY KEY (email));

-- Video
CREATE TABLE video_streaming.video (id uuid, author text, name text, description text, tags list<text>, upload_date timestamp, PRIMARY KEY(id, upload_date)) WITH CLUSTERING ORDER BY (upload_date DESC);
CREATE TABLE video_streaming.video_user (id uuid, author text, name text, description text, tags list<text>, upload_date timestamp, PRIMARY KEY(author, upload_date)) WITH CLUSTERING ORDER BY (upload_date DESC);
CREATE INDEX ON video_streaming.video (tags);

-- Comment
CREATE TABLE video_streaming.comment_user (author text, description text, comment_date timestamp, video_id uuid, PRIMARY KEY(author, comment_date)) WITH CLUSTERING ORDER BY (comment_date DESC);
CREATE TABLE video_streaming.comment_video (author text, description text, comment_date timestamp, video_id uuid, PRIMARY KEY(video_id, comment_date)) WITH CLUSTERING ORDER BY (comment_date DESC);

-- Follower
CREATE TABLE video_streaming.follower_user (email text, video_id uuid, PRIMARY KEY(email, video_id));
CREATE TABLE video_streaming.follower_video (email text, video_id uuid, PRIMARY KEY(video_id, email));

-- Event
CREATE TABLE video_streaming.event (email text, type text, event_date timestamp, video_time int, video_id uuid, PRIMARY KEY((video_id, email), event_date));

-- Rating
CREATE TABLE video_streaming.rating (id timeuuid, value int, video_id uuid, PRIMARY KEY(video_id, id));




