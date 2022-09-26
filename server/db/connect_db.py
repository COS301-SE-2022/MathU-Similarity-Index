from ast import And
from logging import exception
import re
from unittest import result
import mysql.connector
from config import *

class MySQLDatabase:
    host = ""
    port = ""
    user = ""
    password = ""
    database = ""
    charset = "utf8"

    prepared = False

    cnx = None # Connection
    cursor = None # Cursor

    def __init__(self, host = get_db_host(), port = get_db_port(), user = get_db_user(), password = get_db_password(), database = get_db_name(), connect_to_db = False, prepared = False):
        self.host = host
        self.port = port
        self.user = user
        self.password = password
        self.database = database

        self.prepared = prepared

        if connect_to_db:
            self.connect_to_db()

    def connect_to_db(self):
        self.cnx = mysql.connector.connect(
            host = self.host,
            port = self.port,
            user = self.user,
            passwd = self.password,
            database = self.database
        )

    def execute_query(self, query, tuple=None):
        if self.prepared and tuple != None:
            self.cursor = self.cnx.cursor(prepared=True)
            self.cursor.execute(query, tuple)
        else:
            self.cursor = self.cnx.cursor()
            self.cursor.execute(query)

        return self.cursor
    
    # def execute_mutation(self, mutation, tuple=None):
    #     if self.prepared and tuple != None:
    #         self.cursor = self.cnx.cursor(prepared=True)
    #         self.cursor.execute(mutation, tuple)
    #     else:
    #         self.cursor = self.cnx.cursor()
    #         self.cursor.execute(mutation)

    #     return self.cursor
    
    def commit(self):
        self.cnx.commit()
    
    def close(self):
        self.cnx.close()

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
def sql_query_custom(sql, db: MySQLDatabase, tuple = None):
    results = None

    try:
        db.connect_to_db()

        try:
            cursor = db.execute_query(sql, tuple)
            results = cursor.fetchall()
            cursor.close()
        except:
            print("sql error, sql: /<", sql, ">/\ttuple:",tuple)
        finally:
            db.commit()
    except:
        print("db connection error with", end=" ")
        db.print_config_db()
    finally:
        db.close()
    
    return results

def sql_mutation_custom(sql, db: MySQLDatabase, tuple = None):
    try:
        db.connect_to_db()

        try:
            cursor = db.execute_query(sql, tuple)
            cursor.close()
        except:
            print("sql error, sql: /<", sql, ">/")
        finally:
            db.commit()
    except:
        print("db connection error", end=" ")
        db.print_config_db()
    finally:
        db.close()

def sql_query(sql, tuple):
    results = sql_query_custom(sql, MySQLDatabase(prepared=True), tuple=tuple)
    return results

def sql_mutation(sql, tuple):
    sql_mutation_custom(sql, MySQLDatabase(prepared=True), tuple=tuple)




def sql_q_test(sql, db: MySQLDatabase, tuple = None):
    results = ""
    db.connect_to_db()
    print("line130")
    try:
        results = db.execute_mutation(sql)
        print("ln133")
    except:
        print("sql error, sql: /<", sql, ">/")
    finally:
        # db.commit()
        print("ln138")
    print("ln139")
    return results