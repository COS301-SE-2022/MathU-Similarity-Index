DB_HOST = "db host location"
DB_PORT = "0000"
DB_USER = "db user you would like use"
DB_PASSWORD = "db password goes here"
DATABASE = "mathU_similarity_index_database"

def get_db_host():
    # return DB_HOST
    return "localhost"

def get_db_user():
    # return DB_USER
    return "root"

def get_db_password():
    # return DB_PASSWORD
    return "my-secret-pw"

def get_db_name():
    # return DATABASE
    return "mathu_similarity_index_database"

def get_db_port():
    # return DB_PORT
    return "3308"

def print_config():
    print("Server Configuration:")
    print("\tDatabase Details:")
    print("\t\tDB Name:\t",get_db_name())
    print("\t\tHost:\t\t",get_db_host())
    print("\t\tPort:\t\t",get_db_port())
    print("\t\tUser:\t\t",get_db_user())
    print("\t\tPassword:\t",get_db_password())