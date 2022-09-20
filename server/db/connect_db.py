from logging import exception
import re
import mysql.connector
from server.config import *

class MySQLDatabase:
    host = ""
    port = ""
    user = ""
    password = ""
    database = ""
    charset = "utf8"

    cnx = None
    cursor = None

    def __init__(self):
        self.host = ""
        self.port = ""
        self.user = ""
        self.password = ""
        self.database = ""

    # def __init__(self, host, port, user, password, database):
    #     self.host = host
    #     self.port = port
    #     self.user = user
    #     self.password = password
    #     self.database = database

    #     self.connect_to_db()

    def connect_to_db(self):
        self.cnx = mysql.connector.connect(
            host = self.host,
            port = self.port,
            user = self.user,
            passwd = self.password,
            database = self.database,
            charset = self.charset
        )

    def execute_query(self, query):
        self.cursor = self.cnx.cursor()

        self.cursor.execute(query)
        results = self.cursor

        # for x in self.cursor:
        #     print(x)

        return results
    
    def execute_mutation(self, mutation):
        self.cursor = self.cnx.cursor()

        self.cursor.execute(mutation)
        results = self.cursor

        return results
    
    def commit(self):
        self.cnx.commit()
    
    def close(self):
        pass
    
    def print_config_db(self):
        print("Server Configuration:")
        print("\tDatabase Details:")
        print("\t\tDB Name:\t",self.database)
        print("\t\tHost:\t\t",self.host)
        print("\t\tPort:\t\t",self.port)
        print("\t\tUser:\t\t",self.user)
        print("\t\tPassword:\t",self.password)

    def print_config_db(self):
        print("Database Config:")
        print("\tDB Name:\t",self.database)
        print("\tHost:\t\t",self.host)
        print("\tPort:\t\t",self.port)
        print("\tUser:\t\t",self.user)
        print("\tPassword:\t",self.password)

    def set_default(self):
        self.host = get_db_host()
        self.port = get_db_port()
        self.user = get_db_user()
        self.password = get_db_password()
        self.database = get_db_name()
    
    def set_custom(self, host, port, user, password, database):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database
    
    def set_charset(self, charset):
        self.charset = charset


# Helper Functions -------------------------------------------
# All in one functions
def check_sql(sql):
    return True

def sql_query_custom(sql, db: MySQLDatabase):
    results = None

    try:
        db.connect_to_db()

        try:
            results = db.execute_query(sql)
        except:
            print("sql error, sql: '", sql, "'")
        finally:
            db.commit()
    except:
        print("db connection error.")
        db.print_config_db()
    finally:
        db.close()
    
    return results

def sql_mutation_custom(sql, db: MySQLDatabase):
    results = None

    try:
        db.connect_to_db()

        try:
            results = db.execute_mutation(sql)
        except:
            print("sql error, sql: '", sql, "'")
        finally:
            db.commit()
    except:
        print("db connection error.")
        db.print_config_db()
    finally:
        db.close()
    
    return results

def sql_query(sql):
    db = MySQLDatabase()
    db.set_default()
    results = sql_query_custom(sql, db)
    return results

def sql_mutation(sql):
    db = MySQLDatabase()
    db.set_default()
    results = sql_mutation_custom(sql, db)
    return results





# tests
# print("\n\ntesting db connection\n")
# sql = "INSERT INTO `mathu_similarity_index_database`.`users` (`email`, `user_name`, `password`, `password_salt`) VALUES ('dj.jordaan@outlook.com', 'none', 'test', '58375327472');"
# print(sql)

# db = MySQLDatabase("localhost", "3308", "root", "my-secret-pw", "mathu_similarity_index_database")
# db2 = MySQLDatabase("localhost", "3308", "root", "my-secret-pw", "mathu_similarity_index_database")
# print(db.password)

# results = db.execute_sql_query(r"SELECT problem, levenshtein(problem, 'y^22+23 y-frac{256}{y(y+23)}=226') AS distance FROM problems ORDER BY distance ASC")
# print(results)

# mydb = mysql.connector.connect(
#     host = "localhost",
#     user = "root",
#     passwd = "my-secret-pw",
#     database = "test",
#     charset = "utf8",
#     port = "3308"
#     # use_unicode = True
# )
# # my_cursor = mydb.cursor()