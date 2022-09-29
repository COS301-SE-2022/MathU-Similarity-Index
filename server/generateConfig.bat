@echo off
call :config >config.py 

:config
echo:DB_HOST = "db host location"
echo:DB_PORT = "0000"
echo:DB_USER = "db user you would like use"
echo:DB_PASSWORD = "db password goes here"
echo:DATABASE = "mathU_similarity_index_database"
echo:
echo:def get_db_host():
echo:    return DB_HOST
echo:
echo:def get_db_user():
echo:    return DB_USER
echo:
echo:def get_db_password():
echo:    return DB_PASSWORD
echo:
echo:def get_db_name():
echo:    return DATABASE
echo:
echo:def get_db_port():
echo:    return DB_PORT
echo:
echo:def print_config():
echo:    print("Server Configuration:")
echo:    print("\tDatabase Details:")
echo:    print("\t\tDB Name:\t",get_db_name())
echo:    print("\t\tHost:\t\t",get_db_host())
echo:    print("\t\tPort:\t\t",get_db_port())
echo:    print("\t\tUser:\t\t",get_db_user())
echo:    print("\t\tPassword:\t",get_db_password())
exit /b