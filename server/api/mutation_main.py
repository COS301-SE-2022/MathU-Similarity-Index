from datetime import datetime
import re
from db.connect_db import sql_mutation, sql_query
from services.tools import get_date_time_type

# from sqlalchemy import true

def resolve_create_comment(obj, info, problemid, useremail, apikey, comment):
    print("resolve_create_comment")
    # check if problem exists
    sql_prepared = """SELECT count(*) FROM mathu_similarity_index_database.problems where problem_id = %s;"""
    x = sql_query(sql_prepared, (problemid,))
    if x[0][0] > 0:
        # insert problem
        # check user //todo
        # insert comment
        dt = datetime.now()
        dt_nano = dt.strftime("%f")

        sql_prepared = """insert into mathu_similarity_index_database.comments (problem_id, date_time, nanosecond, user_email, comment) values (%s,%s,%s,%s,%s);"""
        sql_mutation(sql_prepared, (problemid,dt,dt_nano,useremail,comment,))

        payload = {
            "success": True,
            "msg": "Success",
            "comment": {
                "problemid": problemid,
                "datetime": get_date_time_type(dt),
                "useremail": "useremail",
                "comment": "comment"
            }
        }
        return payload
    else:
        payload = {
            "success": False,
            "msg": "Problem not in database"
        }
        return payload

def resolve_add_favorite(obj, info, problemid, useremail, apikey):
    print("resolve_add_favorite")

    payload = {
        "success": True,
        "msg": ""
    }
    return payload

def resolve_add_user_search_click(obj, info, problemid, useremail, apikey):
    print("resolve_add_user_search_click")

    payload = {
        "success": True,
        "msg": ""
    }
    return payload

def resolve_user_sign_up(obj, info, apikey, useremail, password):
    print("resolve_user_sign_up")
    # print("signup: ", useremail, password)
    # valid email
    valid_email = re.match(r"^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*$", useremail)
    # print("signup v email")
    if valid_email:
        sql_prepared = """SELECT count(*) FROM mathu_similarity_index_database.users where email like %s;"""
        x = sql_query(sql_prepared, (useremail,))
        # print("x: ",x) # prints: [(1,)]
        # print("x: ",x[0][0]) # < use that for 1 value returns
        if x[0][0] == 0:
            # insert user:
            sql_prepared = """insert into mathu_similarity_index_database.users (email,user_name,password,password_salt,is_admin) values (%s,%s,%s,%s,%s);"""
            sql_mutation(sql_prepared, (useremail,"None",password,password,False,))
            sql_prepared = """insert into mathu_similarity_index_database.user_settings (user_email, dark_theme) values (%s,%s);"""
            sql_mutation(sql_prepared, (useremail,False,))

            # Select user
            # sql_prepared = """SELECT count(*) FROM mathu_similarity_index_database.users where email like %s;"""
            # results = sql_query(sql_prepared, (useremail,))

            payload = {
                "success": True,
                "msg": "Signup Success",
                "user": {
                    "useremail": useremail,
                    "username": "None",
                    "apikey": "testkey",
                    "isadmin": False,
                    "darktheme": False
                }
            }
            return payload
        else:
            payload = {
                "success": False,
                "msg": "Signup Failed, email already exists"
            }
            return payload
    else:
        payload = {
            "success": False,
            "msg": "Signup Failed, not a valid email"
        }
        return payload

def resolve_add_equation(obj, info, useremail, apikey, equation):
    print("resolve_add_equation")
    # Authenticate as admin
    # Insert
    sql_prepared = """//"""

    payload = {
        "success": True,
        "msg": "",
        "equation": {
            "id": 0,
            "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
            "latex": "1+2",
            "type": "Equation",
            "category": "Addition"
        }
    }
    return payload

def resolve_set_server_settings(obj, info, useremail, apikey, password, autocaching):
    print("resolve_set_server_settings")

    payload = {
        "success": True,
        "msg": ""
    }
    return payload

def resolve_set_theme(obj, info, useremail, apikey, darktheme):
    print("resolve_set_theme")

    payload = {
        "success": True,
        "msg": ""
    }
    return payload

# todo remove favorite, remove equasion