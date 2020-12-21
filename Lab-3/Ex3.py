from cassandra.cluster import Cluster

cluster = Cluster()
session = cluster.connect()
session.execute('use video_streaming')

def main():
    ''' INSERT '''
    query = "INSERT INTO video_streaming.user (username, email, name, register_date) VALUES ('IS2Python', 'pydriver@python.org', 'Python Cassandra', '2020-12-12 12:12:12+0000');"
    session.execute(query)

    ''' UPDATE '''
    query = "UPDATE video_streaming.user SET name='Java Is Better' WHERE email='pydriver@python.org' IF EXISTS;"
    for x in session.execute(query):
        print(x)
    print()

    ''' SEARCH '''
    query = "SELECT * FROM video_streaming.user"
    for x in session.execute(query):
        print(x)
    print()

    ''' DELETE '''
    query = "DELETE FROM user WHERE email='pydriver@python.org';"
    session.execute(query)

    ''' Queries... '''
    query = "SELECT * FROM event WHERE video_id=13 AND email='user2@gmail.com' LIMIT 5;"
    for x in session.execute(query):
        print(x)
    print()
    query = "SELECT * FROM video_user WHERE author='user3@gmail.com' AND upload_date > '2020-09-08' AND upload_date < '2020-09-10';"
    for x in session.execute(query):
        print(x)
    print()
    query = "SELECT * FROM follower_video WHERE video_id=1;"
    for x in session.execute(query):
        print(x)
    print()
    query = "SELECT * FROM video WHERE id IN ( 1,2,3,4,5,6,7,8,9,10);"
    for x in session.execute(query):
        print(x)
    print()

if __name__ == "__main__":
    main()