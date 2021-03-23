###############
## NMEC: 93221
## Pedro Santos
###############

from neo4j import GraphDatabase
from csv import reader

DB_DIRECTORY  = "movie_info/"

class movie_engine:
    def __init__(self):
        self.driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "lab44"))
        self.query_list = ["----- Query List -----\n",
            "1 - Listar todos os utilizadores.",
            "2 - Listar todos os filmes.",
            "3 - Listar todos os ratings.",
            "4 - Listar o título dos filmes com o género 'Adventure', 'Action'. e 'Animation'.",
            "5 - Listar todos os utilizadores que deram um score igual ou superior a 4 ao filme \"X-Men (2000)\".",
            "6 - Listar todos os ratings do utilizador com id 433 ordenadas por score.",
            "7 - Listar os nomes e número de géneros de todos os filmes com mais de 6 géneros associados por ordem decrescente do número de géneros.",
            "8 - Os 100 filmes com pior average score, ordenados por score.",
            "9 - Por filme, a lista de todos os utilizadores que realizaram um rating com score abaixo de 1.",
            "10 - O número médio de tags realizadas por utilizador.",
            "11 - O id do utilizador com maior número de tags realizadas.",
            "12 - Todos os filmes com a tag \"funny\".",
            "13 - Listar a percentagem de filmes por género.",
            "14 - A lista de tags, por filme.",
            "15 - O caminho mais curto entre os filmes \"John Wick (2014)\" e \"The Revenant (2015)\"."]
    
    def clear_db(self):
        with self.driver.session() as session:
            session.run("match (a) -[r] -> (b) delete a, r, b")
            session.run("match (a) delete a")

    def add_constraints(self):
        with self.driver.session() as session:
            session.run("Create Constraint If Not Exists On (u:User) Assert u.user_id Is Unique;")
            session.run("Create Constraint If Not Exists On (m:Movie) Assert m.movie_id Is Unique;")
            session.run("Create Constraint If Not Exists On (g:Genre) Assert g.genre_name Is Unique;")

    def load_movies(self):
        print("Loading movie nodes...")
        with self.driver.session() as session:
            session.run(
                "USING PERIODIC COMMIT 500 "
                "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "movies.csv' AS row "
                "MERGE (movie: Movie {movie_id: toInteger(row.movieId)}) "
                "SET movie.movie_title=row.title;"
            )

    def load_users(self):
        print("Loading user nodes...")
        with self.driver.session() as session:
            session.run(
                    "USING PERIODIC COMMIT 500 "
                    "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "ratings.csv' AS row "
                    "MERGE (user: User {user_id: toInteger(row.userId)});"
                )

    def load_genres(self):
        print("Loading genre nodes and relationships...")
        with self.driver.session() as session:
            session.run(
                "USING PERIODIC COMMIT 500 "
                "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "movies.csv' AS row "
                "UNWIND split(row.genres, \"|\") as gen "
                "MERGE (genre:Genre {genre_name: gen});"
            )
            session.run(
                "USING PERIODIC COMMIT 500 "
                "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "movies.csv' AS row "
                "MATCH (mov: Movie {movie_id: toInteger(row.movieId)}) "
                "UNWIND split(row.genres, \"|\") as gen "
                "MATCH (genre: Genre {genre_name: gen}) "
                "MERGE (mov)-[:MOVIE_GENRE]->(genre);"
            )

    def load_ratings(self):
        print("Loading rating relationships...")
        with self.driver.session() as session:
            session.run(
                    "USING PERIODIC COMMIT 500 "
                    "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "ratings.csv' AS row "
                    "MATCH (user: User {user_id: toInteger(row.userId)}) "
                    "MATCH (mov: Movie {movie_id: toInteger(row.movieId)}) "
                    "MERGE (user)-[:RATED {score: toFloat(row.rating)}]->(mov);"
                )

    def load_tags(self):
        print("Loading tag relationships...")
        with self.driver.session() as session:
            session.run(
                    "USING PERIODIC COMMIT 500 "
                    "LOAD CSV WITH HEADERS FROM 'file:///" + DB_DIRECTORY + "tags.csv' AS row "
                    "MATCH (user: User {user_id: toInteger(row.userId)}) "
                    "MATCH (mov: Movie {movie_id: toInteger(row.movieId)}) "
                    "MERGE (user)-[:TAGGED {tag: row.tag, timestamp: toInteger(row.timestamp)}]->(mov);"
                )
    def get_counts(self):
        with self.driver.session() as session:
            print("User count: ", [el for el in session.run("MATCH (user:User) RETURN count(user);")])
            print("Movie count: ", [el for el in session.run("MATCH (movie:Movie) RETURN count(movie);")])
            print("Genre count: ", [el for el in session.run("MATCH (genre:Genre) RETURN count(genre);")])
            print("Ratings count: ", [el for el in session.run("MATCH (u:User)-[rating:RATED]->(m:Movie) RETURN count(rating);")])
            print("Movie genres count: ", [el for el in session.run("MATCH (m:Movie)-[movie_genre:MOVIE_GENRE]->(g:Genre) RETURN count(movie_genre);")])
            print("Tags count: ", [el for el in session.run("MATCH (u:User)-[tag:TAGGED]->(m:Movie) RETURN count(tag);")])
    
    def run_query(self, id, session):
        if (id==1):
            return session.run( "Match (u:User) Return u")
        if (id==2):
            return session.run( "Match (m:Movie) Return m")
        if (id==3):
            return session.run( "Match (u:User)-[rating:RATED]->(m:Movie) Return u.user_id, m.movie_title, rating")
        if (id==4):
            return session.run( "Match (m:Movie)-[:MOVIE_GENRE]->(:Genre {genre_name: \"Adventure\"}) "
                                "Match (m)-[:MOVIE_GENRE]->(:Genre {genre_name: \"Action\"}) "
                                "Match (m)-[:MOVIE_GENRE]->(:Genre {genre_name: \"Animation\"}) "
                                "Return m.movie_title as movie_title;")
        if (id==5):
            return session.run( "Match (u:User)-[rating:RATED]->(m:Movie {movie_title: \"X-Men (2000)\"}) " 
                                "Where rating.score >= 4.0 "
                                "Return u.user_id as user_id, m.movie_title as movie_title, rating.score as score;")
        if (id==6):
            return session.run( "Match (u:User {user_id: 433})-[r:RATED]-(m:Movie) "
                                "return u.user_id as user_id, m.movie_title as movie_title, r.score as score "
                                "Order By r.score;")
        if (id==7):
            return session.run( "Match (m:Movie)-[:MOVIE_GENRE]-(g:Genre) "
                                "With m, count(g) as n_genre "
                                "Where n_genre > 6 "
                                "Return m.movie_title as movie_title, n_genre "
                                "Order By n_genre DESC;")
        if (id==8):
            return session.run( "Match (:User)-[r:RATED]-(m:Movie) "
                                "With m, avg(r.score) as avg_rating "
                                "Return m.movie_title as movie_title, avg_rating "
                                "Order By avg_rating "
                                "Limit 100;")
        if (id==9):
            return session.run( "Match (u:User)-[r:RATED]-(m:Movie) "
                                "Where r.score <= 1 "
                                "Return m.movie_title as movie_title, collect(u.user_id) as users;")
        if (id==10):
            return session.run( "Match (u:User)-[t:TAGGED]->(m:Movie) "
                                "With count(DISTINCT u) as n_user, count(t) as n_tags "
                                "Return n_tags/n_user as avg_n_tags;")
        if (id==11):
            return session.run( "Match (u:User)-[t:TAGGED]->(:Movie) "
                                "With u, count(t) as n_tags "
                                "Return u.user_id as user_id "
                                "Order By n_tags DESC "
                                "Limit 1;")
        if (id==12):
            return session.run( "Match (:User)-[t:TAGGED {tag: \"funny\"}]->(m:Movie) "
                                "Return m.movie_title as movie_title;")
        if (id==13):
            return session.run( "Match (m:Movie) "
                                "With count(m) as movie_count "
                                "Match (m:Movie)-[:MOVIE_GENRE]->(g:Genre) "
                                "With movie_count, g, count(g) as n_genres "
                                "Return g.genre_name as genre, round(toFloat(n_genres)*100/movie_count * 100) / 100 as percentage;")
        if (id==14):
            return session.run( "Match (:User)-[t:TAGGED]->(m:Movie) "
                                "Return m.movie_title as movie_title, collect(t.tag) as tags;")
        if (id==15):
            return session.run( "MATCH (m1:Movie {movie_title: \"John Wick (2014)\"}),(m2:Movie {movie_title: \"The Revenant (2015)\"}), p = shortestPath((m1)-[*..100]-(m2)) "
                                "RETURN p as shortest_path;")
    def list_queries(self):
        for el in self.query_list:
            print(el)
        print()

    def run_menu(self):
        my_file = open("CBD_L44c_output.txt", "w")
        self.list_queries()
        while (True):
            print("\nType a query number to run that specific query (queries 4-15 will be written to the output file), or:")
            print("q - Quit")
            print("list - List Queries")
            print("all - Run queries 4-15")
            op = input()
            if op == "q":
                return
            if op == "list":
                self.list_queries()
                continue
            if op == "all":
                for i in range(4, 16):
                    print("-"*50)
                    print("# " + self.query_list[i])
                    my_file.write("-"*150 + "\n")
                    my_file.write("# " + self.query_list[i] + "\n")

                    with self.driver.session() as session:
                        result = self.run_query(i, session)

                        for r in result:
                            res = ''

                            for i in r.items():
                                res = res + str(i[0]) + ": " + str(i[1]) + ", "
                            my_file.write(res[:-2] + "\n")
                            print(res[:-2] + "\n")

                    my_file.write("\n")
                    print("\n")
            else:
                try:
                    query = int(op)
                except:
                    print("Invalid option.")
                    continue
                if query > 0 and query < 4:
                    print("-"*50)
                    print("# " + self.query_list[query])

                    with self.driver.session() as session:
                        result = self.run_query(query, session)

                        for r in result:
                            res = ''
                            for i in r.items():
                                res = res + str(i[0]) + ": " + str(i[1]) + ", "
                            print(res[:-2] + "\n")
                        print("\n")
                else:
                    if query > 4 and query < 16:
                        print("-"*50)
                        print("# " + self.query_list[query])
                        my_file.write("-"*150 + "\n")
                        my_file.write("# " + self.query_list[query] + "\n")
                        
                        with self.driver.session() as session:
                            result = self.run_query(query, session)

                            for r in result:
                                res = ''
                                
                                for i in r.items():
                                    res = res + str(i[0]) + ": " + str(i[1]) + ", "
                                my_file.write(res[:-2] + "\n")
                                print(res[:-2] + "\n")
                        my_file.write("\n")
                        print("\n")
                    else:
                        print("Invalid query number.")
        my_file.close()


def main():
    engine = movie_engine()
    val = input("Load Database?(y/n)")

    if val == "y":
        engine.clear_db()
        engine.add_constraints()
        engine.load_movies()
        engine.load_users()
        engine.load_genres()
        engine.load_ratings()
        engine.load_tags()
        engine.get_counts()
        print("Database loaded successfully!\n\n")

    engine.run_menu()
    engine.driver.close()

if __name__ == "__main__":
    main()
