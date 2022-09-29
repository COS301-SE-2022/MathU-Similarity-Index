from db.connect_db import sql_query, sql_mutation
from db.handlers.problems_shared import add_problem_tags, add_problem_links

# def get_all_problems(tags=[], has_memo=False, allow_user_search=True):
#     pass

def create_problem():
    pass

def remove_problem(problem_id):
    try:
        pars = (problem_id,)
        sql_prepared = """delete from problems where problem_id = %s;"""
        sql_mutation(sql_prepared, pars)

        sql_prepared = """delete from problem_tags where problem_id = %s;"""
        sql_mutation(sql_prepared, pars)

        sql_prepared = """delete from problem_links where problem_id = %s;"""
        sql_mutation(sql_prepared, pars)

        return True
    except:
        return False

def get_all_problems_favorite(user="default", tags=[], must_have_memo=False, allow_user_search=True): #problem_id, problem, user_search, has_memo, favorite
    if len(tags) == 0:
        imhm = not must_have_memo
        pars = (user, must_have_memo, imhm, allow_user_search, allow_user_search,)
        sql_prepared = """select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = problems.problem_id) as favorite from problems left join favorites on favorites.problem_id = problems.problem_id where (problems.has_memo = %s or %s) and (problems.user_search = %s or %s) group by problems.problem_id order by problems.problem_id;"""
        result = sql_query(sql_prepared, pars)
        return result
    else:
        imhm = not must_have_memo
        # pars = (user, tags, must_have_memo, imhm, allow_user_search, allow_user_search,)
        pars = (user,)
        for t in tags:
            pars += (t,)
        pars += (must_have_memo, imhm, allow_user_search, allow_user_search,)
        # print("Params: ",pars)

        sql_prepared = """select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = problems.problem_id) as favorite from ((problems left join favorites on favorites.problem_id = problems.problem_id) inner join problem_tags on problems.problem_id = problem_tags.problem_id) where problem_tags.tag_id in ({0}) and (problems.has_memo = %s or %s) and (problems.user_search = %s or %s) group by problems.problem_id order by problems.problem_id;"""
        sql_prepared = sql_prepared.format(','.join('?' * len(tags)))
        # print("sql: ", sql_prepared)

        result = sql_query(sql_prepared, pars)
        return result

def get_all_problem_data(user = "default", tags=[], must_have_memo=False, allow_user_search=True): #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link]
    res = get_all_problems_favorite(user, tags, must_have_memo, allow_user_search)
    res_t = add_problem_tags(res, 0)
    results = add_problem_links(res_t, 0)
    return results

def get_problem_data(problem_id, user = "default"): #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link]
    pars = (user, problem_id, )
    sql_prepared = """select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = problems.problem_id) as favorite from problems left join favorites on favorites.problem_id = problems.problem_id where problems.problem_id = %s group by problems.problem_id order by problems.problem_id;"""
    res = sql_query(sql_prepared, pars)
    res_t = add_problem_tags(res, 0)
    results = add_problem_links(res_t, 0)
    return results

def get_problem_id(problem):
    pars = (problem,)
    sql_prepared = """select problem_id from problems where problem = %s limit 1;"""
    res = sql_query(sql_prepared, pars)
    if len(res) == 0:
        return -1
    else:
        return res[0][0]