import mysql.connector
from server.config import *

class MySQLDatabase:
    host = ""
    port = ""
    user = ""
    password = ""
    database = ""

    cnx = None
    cursor = None

    def __init__(self):
        self.host = get_db_host()
        self.port = get_db_port()
        self.user = get_db_user()
        self.password = get_db_password()
        self.database = get_db_name()

        self.connect_to_db()

    def __init__(self, host, port, user, password, database):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database

        self.connect_to_db()

    def connect_to_db(self):
        self.cnx = mysql.connector.connect(
            host = self.host,
            port = self.port,
            user = self.user,
            passwd = self.password,
            database = self.database,
            charset = "utf8"
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

        self.cursor.execute(query)
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