import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "movies_user",
    "password": "popcorn",
    "host": "localhost",
    "database": "movies",
    "raise_on_warnings": True
}

try:

    db = mysql.connector.connect(**config)

    print("\n Database user {} connected to MySQL on host {} with database {}".format(config["user"], config["host"], config["database"]))

    input("\n\n Press any key to continue...")

except mysql.connector.Error as err:

    if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
        print(" The supplied username or password are invalid")

    elif err.errno == errorcode.ER_BAD_DB_ERROR:
        print(" The specified database does not exist")

    else:
        print(err)

finally:

    cursor = db.cursor()

    cursor.execute("SELECT studio_id, studio_name FROM studio")

    fetch_studio = cursor.fetchall()

    print(" -- DISPLAYING Studio RECORDS -- ")

    for record in fetch_studio:
	
         print("Studio ID: {}\n Studio Name: {}\n".format(record[0], record[1]))


    cursor.execute("SELECT genre_id, genre_name FROM genre")
	
    fetch_genre = cursor.fetchall()

    print(" -- DISPLAYING Genre RECORDS -- ")

    for record in fetch_genre:

         print("Genre ID: {}\n Genre Name: {}\n".format(record[0], record[1]))

    
    cursor.execute("SELECT film_name, film_runtime FROM film WHERE film_runtime < 120")

    fetch_runtime = cursor.fetchall()

    print(" -- DISPLAYING Short Film RECORDS -- ")

    for record in fetch_runtime:

         print("Film Name: {}\n Runtime: {}\n".format(record[0], record[1]))


    cursor.execute("SELECT film_name, film_director FROM film ORDER BY film_director")

    fetch_director = cursor.fetchall()

    print(" -- DISPLAYING Director RECORDS in Order -- ")

    for record in fetch_director:

         print("Film Name: {}\n Director: {}\n".format(record[0], record[1]))					
	


