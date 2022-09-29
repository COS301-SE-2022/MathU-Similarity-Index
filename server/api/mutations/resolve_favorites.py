from db.handlers.users_shared import *
from db.handlers.problems import *

def resolve_add_favorite(obj, info, problemid, useremail, apikey):
    print("resolve_add_favorite")
    if(is_favorite(problemid, useremail)):
        add_user_favorite_problem(problemid, useremail)
        payload = {
        "success": True,
        "msg": "Added problem to favorites."
        }
    else:
        payload = {
        "success": True,
        "msg": "Problem already in favorites."
        }
    return payload

def resolve_remove_favorite(obj, info, problemid, useremail, apikey):
    print("resolve_remove_favorite")
    if(is_favorite(problemid, useremail)):
        remove_user_favorite_problem(problemid, useremail)
        payload = {
        "success": True,
        "msg": "Removed problem from favorites."
        }
    else:
        payload = {
        "success": True,
        "msg": "Problem not in favorites."
        }
    return payload