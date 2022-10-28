from services.handlers.handlers_main import handle_search
from app import GLOBAL_SERVER_CONFIG_AUTO_CACHE, GLOBAL_SERVER_DATA, GLOBAL_SERVER_CONFIG_SEQURITY
from services.authentication import authenticate, generate_key, APIKey

def resolve_similarity_search(obj, info, useremail, apikey, input, tags, musthavememo, allowusersearch):
    try:
        print("resolve_similarity_search")
        # Auth
        print("apikey: " + apikey)
        auth = authenticate(useremail, apikey)
        if (not auth) and GLOBAL_SERVER_CONFIG_SEQURITY:
            final_payload = {
                "success": False,
                "msg": "Access Denied"
            }
            return final_payload

        print("tags: ", tags)
        # auth
        # search
        result_set = handle_search(useremail, input, tags, musthavememo, allowusersearch) #problem_id, problem, user_search, has_memo, favorite, distance, [tag_id, tag_name, description], [link], sim
        payload = []
        for problem_id, problem, user_search, has_memo, favorite, distance, tags, links, sim in result_set:
            tags_arr = []
            links_arr = []
            for tag_id, tag_name, tag_description in tags:
                tag = {
                    "id": tag_id,
                    "name": tag_name,
                    "description": tag_description
                }
                tags_arr.append(tag)

            equation = {
                "id": problem_id,
                "latex": problem,
                "tags": tags_arr,
                "mathml": "String",
                "memolinks": links,
                "favorite": favorite,
                "issearch": user_search
            }
            equation_similarity = {
                "equation": equation,
                "similarity": sim,
                "distance": distance
            }
            payload.append(equation_similarity)

        search_result = {
            "success": True,
            "msg": "",
            "numberofresults":len(result_set),
            "equations": payload
        }
        return search_result
    except:
        payload = {
            "success": False,
            "msg": "TC-Error"
        }
        return payload