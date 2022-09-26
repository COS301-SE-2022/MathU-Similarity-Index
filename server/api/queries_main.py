from unittest import result
from db.connect_db import MySQLDatabase, sql_query, sql_q_test, sql_query_custom
from datetime import datetime
from config import *
from services.tools import get_date_time_type
from services.confidence_calc import get_all as get_all_conf

# import latex2mathml.converter

def resolve_api_status(obj, info):
    print("resolve_api_status")
    return f'API is running'

def resolve_get_all_equations(obj, info):
    print("resolve_get_all_equations")
    # get all equations from database
    sql = "SELECT problem_id, problem FROM mathu_similarity_index_database.problems;"

    db = MySQLDatabase()
    db.set_default()
    db.connect_to_db()
    results = db.execute_query(sql)

    payload = []

    for id, problem in results:
        # print(str(id) + problem)
        payload.append({
            "id": str(id),
            "mathml": problem,
            "latex": problem,
            "type": "unknown",
            "category": "unknown"
        })

    # payload = [
    #     {
    #         "id": 3,
    #         "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>',
    #         "latex": "1+2",
    #         "type": "Equation",
    #         "category": "Addition"
    #     },
    #     {
    #         "id": 2,
    #         "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>',
    #         "latex": "3-2",
    #         "type": "Equation",
    #         "category": "Subtraction"
    #     }
    # ]
    return payload

def resolve_search(obj, info, input, isloggedin, useremail, apikey):
    print("resolve_search")
    print("input:", input, "\tislogedin", isloggedin, "\tuseremail", useremail, "\tapikey",apikey)

    # sql = "SELECT problem_id, problem, levenshtein2(problem, '" + input + "') AS distance FROM problems ORDER BY distance ASC;"
    # sql = "SELECT problem_id, problem, 0 AS distance FROM problems;"
    sql = "SELECT problem_id, problem, user_search, has_memo, 0 as sim FROM mathu_similarity_index_database.problems;"
    db = MySQLDatabase()
    db.set_default()
    # db.print_config_db()
    db.connect_to_db()
    results = db.execute_query(sql)

    results = get_all_conf(input, results)

    ids = []
    problems = []
    similarities = []
    indexed_problems = []
    for id, problem, user_search, has_memo, similarity in results:
        ids.append(id)
        problems.append(problem)
        similarities.append(similarity)

        # print(id)

        # indexed_prob = {
        #     "id" : id,
        #     "problem" : problem,
        #     "similarity" : similarity
        # }

        # indexed_problems.append(indexed_prob)
    
    db.commit()

    # mark problem for insert problem if not in db
    insert_problem = False
    if similarities[0] > 0:
        insert_problem = True
    
    # sql = "INSERT INTO problems(problem) VALUES('" + input + "');"
    db_insert = MySQLDatabase()
    db_insert.set_default()
    # db_insert.print_config_db()
    db_insert.connect_to_db()
    try:
        sql = "INSERT INTO mathu_similarity_index_database.history (user_email, search_input, date_time) VALUES ('" + useremail + "', '" + input + "', '" + str(datetime.now()) + "');"
        print("insert sql: ",sql)
        db_insert.execute_query(sql)
    except:
        print("sql error")
    finally:
        db_insert.commit()

    indexed_problems_len = len(ids)

    min_sim = 0
    max_sim = similarities[indexed_problems_len-1]

    if(max_sim == 0):
        max_sim = 1

    equations = []

    for i in range(indexed_problems_len):
        sim = similarities[i]
        inverse_sim = max_sim - sim
        normalized_sim = inverse_sim / (max_sim) * 100

        similarities[i] = normalized_sim

        equations.append({
            "equation": {
                "id": ids[i],
                "mathml": problems[i],
                "latex": problems[i],
                "type": "unknown",
                "category": "unknown"
            },
            "similarity": similarities[i]
        })
    
    payload = {
        "numberofresults": indexed_problems_len,
        "equations": equations
    }

    # payload = {
    #     "numberofresults": 2,
    #     "equations": [
    #         {
    #             "equation": {
    #                 "id": 1,
    #                 "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
    #                 "latex": "1+2",
    #                 "type": "Equation",
    #                 "category": "Addition"
    #             },
    #             "similarity": 0
    #         },
    #         {
    #             "equation": {
    #                 "id": 2,
    #                 "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
    #                 "latex": "3-2",
    #                 "type": "Equation",
    #                 "category": "Subtraction"
    #             },
    #             "similarity": 0
    #         }
    #     ]
    # }
    return payload

def resolve_get_user_history(obj, info, useremail, apikey):
    print("resolve_get_user_history")
    # payload = [{
    #         "id": 3,
    #         "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>',
    #         "latex": "1+2",
    #         "type": "Equation",
    #         "category": "Addition"
    #     },
    #     {
    #         "id": 2,
    #         "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>',
    #         "latex": "3-2",
    #         "type": "Equation",
    #         "category": "Subtraction"
    #     }]
    payload = []

    # print(useremail)

    sql = "SELECT user_email, search_input, date_time FROM mathu_similarity_index_database.history where user_email LIKE '" + useremail + "' ORDER BY date_time desc;"
    db = MySQLDatabase()
    db.set_default()
    db.connect_to_db()
    results = db.execute_query(sql)

    emails = []
    problems = []
    dates = []
    for email, problem, date in results:
        emails.append(email)
        problems.append(problem)
        dates.append(date)

        eq = {
            "id": 0,
            "mathml": "",
            "latex": problem,
            "type": "",
            "category": ""
        }

        payload.append(eq)

    return payload

def resolve_get_all_comments(obj, info):
    print("resolve_get_all_comments")
    payload = [
        {
            "problemid": 0,
            "datetime": {
                "year": 0,
                "month": 0,
                "day": 0,
                "hour": 0,
                "minute": 0,
                "second": 0,
                "nano": 0,
                "timezone": "",
            },
            "useremail": "test@email.com",
            "comment": "test comment"
        },
        {
            "problemid": 0,
            "datetime": {
                "year": 0,
                "month": 0,
                "day": 0,
                "hour": 0,
                "minute": 0,
                "second": 1,
                "nano": 0,
                "timezone": "",
            },
            "useremail": "test@email.com",
            "comment": "test comment 2"
        },
        {
            "problemid": 1,
            "datetime": {
                "year": 0,
                "month": 0,
                "day": 0,
                "hour": 0,
                "minute": 0,
                "second": 1,
                "nano": 0,
                "timezone": "",
            },
            "useremail": "test@email.com",
            "comment": "test comment 3"
        }
    ]
    return payload

def resolve_get_comments(obj, info, problemid):
    print("resolve_get_comments")
    # get comments
    payload = []
    sql_prepared = """SELECT problem_id, date_time, nanosecond, user_email, comment FROM mathu_similarity_index_database.comments where problem_id = %s order by date_time;"""
    result = sql_query(sql_prepared, (problemid,))

    for problem_id, date_time, nanosecond, user_email, comment in result:
        # str = date_time+"."+nanosecond
        # print(date_time)
        # print(date_time.__class__.__name__)
        # dt = datetime.strptime(date_time, "%Y-%m-%d %H:%M:%S.%f")
        dt = datetime.now()
        comment = {
            "problemid": problem_id,
            "datetime": get_date_time_type(date_time),
            "useremail": user_email,
            "comment": comment
        }

        payload.append(comment)

    return payload

def resolve_get_favorite_problems(obj, info, useremail):
    print("resolve_get_favorite_problems")
    payload = [
        {
            "id": 3,
            "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>',
            "latex": "1+2",
            "type": "Equation",
            "category": "Addition"
        },
        {
            "id": 2,
            "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>',
            "latex": "3-2",
            "type": "Equation",
            "category": "Subtraction"
        }
    ]
    return payload

def resolve_authenticate_login(obj, info, useremail, passwordsalt):
    print("resolve_authenticate_login")
    payload = {
        "success": True,
        "msg": "Login Success",
        "user": {
            "useremail": "test@email.com",
            "username": "none",
            "apikey": "testkey",
            "isadmin": False,
            "darktheme": False
        }
    }
    return payload

def resolve_get_server_settings(obj, info, useremail, apikey):
    print("resolve_get_server_settings")
    payload = {
        "autocaching": True
    }
    return payload

def resolve_get_all_tags(obj, info, apikey):
    print("resolve_get_all_tags")
    # print("arr",testarr)
    # print("api key: ",apikey)

    # results = sql_query("SELECT tag_id, tag_name, description FROM mathu_similarity_index_database.tags;")
    sql = "SELECT tag_id, tag_name, description FROM mathu_similarity_index_database.tags;"
    # for i in range(0,1):
    #     db = MySQLDatabase()
    #     db.set_default()
    #     results2 = sql_q_test(sql, db)
    #     print(results2.__class__.__name__)
    #     results = results2.fetchall()
    #     print(results.__class__.__name__)
    #     results2.close()
    #     db.commit()
    #     db.close()
    # db.connect_to_db()
    # results = db.execute_query(sql)

    results = sql_query_custom(sql, MySQLDatabase())

    # print("slq done")
    # print(results[0][0])
    # print(results)

    payload = []

    for id, name, description in results:
        tag = {
            "id": id,
            "name": name,
            "description": description
        }

        payload.append(tag)
    
    return payload