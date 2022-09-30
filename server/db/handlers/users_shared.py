from datetime import datetime
from db.handlers.users import *
from db.handlers.problems import get_problem_data
from db.connect_db import sql_query, sql_mutation

def get_user_favorite_problems(useremail):
    pars = (useremail,)
    sql_prepared = """select problem_id from favorites where user_email like %s;"""
    res = sql_query(sql_prepared, pars)

    problems = []
    for id in res:
        print("id: ", id)
        problems.append(get_problem_data(id[0])[0])

    return problems

def add_user_favorite_problem(problemid, useremail): #problemid: Int, useremail: String, apikey: String
    try:
        pars = (useremail, problemid,)
        sql_prepared = """insert into favorites (user_email, problem_id) values (%s, %s);"""
        sql_mutation(sql_prepared, pars)
        return True
    except:
        print("Error adding favorite problem.")
        return False

def remove_user_favorite_problem(problemid, useremail):
    try:
        pars = (useremail, problemid,)
        sql_prepared = """delete from favorites where user_email = %s and problem_id = %s;"""
        sql_mutation(sql_prepared, pars)
        return True
    except:
        print("Error removing favorite problem.")
        return False

def get_user_history():
    pass

def add_user_history(useremail, input):
    try:
        pars = (useremail, input, datetime.now())
        sql_prepared = """
        INSERT INTO mathu_similarity_index_database.history (user_email, search_input, date_time) 
        VALUES (%s,%s,%s);
        """
        sql_mutation(sql_prepared, pars)
        return True
    except:
        print("Error adding history")
        return False

def is_favorite(problemid, useremail):
    pars = (useremail, problemid,)
    sql_prepared = """select exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = %s) as favorite;"""
    res = sql_query(sql_prepared, pars)
    return res[0][0] == 1