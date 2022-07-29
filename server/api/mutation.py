from datetime import datetime

from sqlalchemy import true

def resolve_create_comment(obj, info, problemid, useremail, apikey, comment):
    payload = {
        "success": True,
        "msg": "",
        "comment": {
            "problemid": 0,
            "datetiem": {
                "year": 0,
                "month": 0,
                "day": 0,
                "hour": 0,
                "minute": 0,
                "second": 0,
                "timezone": "",
            },
            "useremail": "test@email.com",
            "comment": "test comment"
        }
    }
    return payload

def resolve_add_favorite(obj, info, problemid, useremail, apikey):
    return True

def resolve_add_user_search_click(obj, info, problemid, useremail, apikey):
    return True

def resolve_user_sign_up(obj, info, useremail, password):
    payload = {
        "success": True,
        "msg": "signup Success",
        "user": {
            "useremail": "test@email.com",
            "username": "none",
            "apikey": "testkey",
            "isadmin": False,
            "darktheme": False
        }
    }
    return payload

def resolve_add_equation(obj, info, useremail, apikey, equation):
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

def resolve_set_auto_caching(obj, info, useremail, apikey, autocaching):
    return True

def resolve_set_theme(obj, info, useremail, apikey, darktheme):
    return True