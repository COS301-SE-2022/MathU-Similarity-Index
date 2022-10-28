from db.handlers.users_shared import add_user_favorite_problem
from db.handlers.users_shared import remove_user_favorite_problem
from db.handlers.users_shared import is_favorite

from app import GLOBAL_SERVER_CONFIG_AUTO_CACHE, GLOBAL_SERVER_DATA, GLOBAL_SERVER_CONFIG_SEQURITY
from services.authentication import authenticate, generate_key, APIKey

def resolve_add_favorite(obj, info, problemid, useremail, apikey):
    try:
        print("resolve_add_favorite")
        # Auth
        print("apikey: " + apikey)
        auth = authenticate(useremail, apikey)
        if (not auth) and GLOBAL_SERVER_CONFIG_SEQURITY:
            final_payload = {
                "success": False,
                "msg": "Access Denied"
            }
            return final_payload

        if(not is_favorite(problemid, useremail)):
            add_user_favorite_problem(problemid, useremail)
            payload = {
            "success": True,
            "msg": "Added problem to favorites."
            }
        else:
            payload = {
            "success": False,
            "msg": "Problem already in favorites."
            }
        return payload
    except:
        payload = {
            "success": False,
            "msg": "TC-Error"
        }
        return payload

def resolve_remove_favorite(obj, info, problemid, useremail, apikey):
    try:
        print("resolve_remove_favorite")
        # Auth
        print("apikey: " + apikey)
        auth = authenticate(useremail, apikey)
        if (not auth) and GLOBAL_SERVER_CONFIG_SEQURITY:
            final_payload = {
                "success": False,
                "msg": "Access Denied"
            }
            return final_payload

        if(is_favorite(problemid, useremail)):
            remove_user_favorite_problem(problemid, useremail)
            payload = {
            "success": True,
            "msg": "Removed problem from favorites."
            }
        else:
            payload = {
            "success": False,
            "msg": "Problem not in favorites."
            }
        return payload
    except:
        payload = {
            "success": False,
            "msg": "TC-Error"
        }
        return payload