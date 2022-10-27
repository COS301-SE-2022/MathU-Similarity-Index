# Global server config setup
# init vars:
index_add_counter = 0
GLOBAL_SERVER_DATA = dict()
GLOBAL_SERVER_CONFIG_AUTO_CACHE = True #Auto Caching, Save default History 

# init data partial
GLOBAL_SERVER_DATA["users"] = dict()

# Server Setup
from api import app

from config import *

from ariadne import load_schema_from_path, make_executable_schema, \
    graphql_sync, snake_case_fallback_resolvers, ObjectType
from ariadne.constants import PLAYGROUND_HTML
from flask import request, jsonify, session
from flask import g as flask_globals

from api.mutation_main import *
from api.queries_main import *
from api.mutations.resolve_favorites import resolve_add_favorite, resolve_remove_favorite
from api.queries.resolve_similarity_search import resolve_similarity_search


query = ObjectType("Query")

query.set_field("SimilaritySearch", resolve_similarity_search)
# query.set_field("Search", resolve_search)
query.set_field("GetAllEquations", resolve_get_all_equations)
query.set_field("APIStatus", resolve_api_status)
query.set_field("GetUserHistory", resolve_get_user_history)
query.set_field("GetAllComments", resolve_get_all_comments)
query.set_field("GetComments", resolve_get_comments)
query.set_field("GetFavoriteProblems", resolve_get_favorite_problems)
query.set_field("AuthenticateLogin", resolve_authenticate_login)
query.set_field("GetServerSettings", resolve_get_server_settings)
query.set_field("GetAllTags", resolve_get_all_tags)

query.set_field("GetPermanentAPIKey", resolve_get_permanent_apiKey)

# query.set_field("TestSession", test_sessions_var)
# query.set_field("SetTestGlob", set_test_global_nolock)
# query.set_field("GetTestGlob", get_test_global_nolock)
# query.set_field("GetTestGlobFull", get_test_global_nolock_full)

mutation = ObjectType("Mutation")

mutation.set_field("CreateComment", resolve_create_comment)
mutation.set_field("AddFavorite", resolve_add_favorite)
mutation.set_field("RemoveFavorite", resolve_remove_favorite)
mutation.set_field("AddUserSearchClick", resolve_add_user_search_click)
mutation.set_field("UserSignUp", resolve_user_sign_up)
mutation.set_field("AddEquation", resolve_add_equation)
mutation.set_field("SetServerSettings", resolve_set_server_settings)
mutation.set_field("SetTheme", resolve_set_theme)

# Math API
from api.queries.resolve_math_api_data import resolve_math_api_data
from api.queries.resolve_math_past_paper_data import resolve_math_past_paper_data

query.set_field("GetMathCalculationsData", resolve_math_api_data)
query.set_field("GetMathPastPaperData", resolve_math_past_paper_data)

type_defs = load_schema_from_path("schema.graphql")
schema = make_executable_schema(
    type_defs, query, mutation, snake_case_fallback_resolvers
)

@app.route("/graphql", methods=["GET"])
def graphql_playground():
    return PLAYGROUND_HTML, 200

@app.route("/graphql", methods=["POST"])
def graphql_server():
    data = request.get_json()

    success, result = graphql_sync(
        schema,
        data,
        context_value=request,
        debug=app.debug
    )

    status_code = 200 if success else 400
    return jsonify(result), status_code

from services.authentication import APIKey

# init server globals
GLOBAL_SERVER_DATA["users"]["default"] = dict()
GLOBAL_SERVER_DATA["users"]["default"]["perm_keys"] = ["Qx0m5eK38EHYNNwxcytbkpWR92KNTnrOQbBETydtHr2B57LrEyjnaksbeQXJ"]
GLOBAL_SERVER_DATA["users"]["default"]["apikeys"] = dict()
GLOBAL_SERVER_DATA["users"]["default"]["apikeys"]["Qx0m5eK38EHYNNwxcytbkpWR92KNTnrOQbBETydtHr2B57LrEyjnaksbeQXJ"] = APIKey("Qx0m5eK38EHYNNwxcytbkpWR92KNTnrOQbBETydtHr2B57LrEyjnaksbeQXJ", 1, "default", -1, datetime(9999, 12, 31, 23, 59, 59), 0, True, -1)


#Load config:
# 

# ##################################################################################

# print_config()

# print("Flask Session var type: ", session.__class__.__name__)

# var_value = "def-test-value_"+str(0)

# session['users'] = dict()
# session['int_val'] = 0
# session['users']["default"] = var_value