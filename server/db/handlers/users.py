from db.connect_db import sql_query, sql_mutation

def get_user_data(useremail): #email, user_name, password, password_salt, is_admin
    try:
        sql_prepared = """SELECT email, user_name, password, password_salt, is_admin FROM mathu_similarity_index_database.users where email like %s;"""
        results = sql_query(sql_prepared, (useremail,))
        return results
    except:
        print("get_user_data error")
        return None

def create_user():
    pass