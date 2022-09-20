from http import server
from server import api
from server.api import app

from server.config import *
# import imp
# from flask import Flask
# app = Flask(__name__)

from ariadne import load_schema_from_path, make_executable_schema, \
    graphql_sync, snake_case_fallback_resolvers, ObjectType
from ariadne.constants import PLAYGROUND_HTML
from flask import request, jsonify
# from server.api.queries import resolve_api_status, resolve_get_all_equations, resolve_search, resolve_get_user_history, resolve_get_all_comments, resolve_get_comments, resolve_get_favorite_problems, resolve_authenticate_login, resolve_get_server_settings
from server.api.mutation import resolve_add_equation, resolve_add_favorite, resolve_create_comment, resolve_add_user_search_click, resolve_set_auto_caching, resolve_set_theme, resolve_user_sign_up
from server.api.queries2 import *

# calculation API
# from server.api.queries.resolve_area_of_circle import *

query = ObjectType("Query")

query.set_field("Search", resolve_search)
query.set_field("GetAllEquations", resolve_get_all_equations)
query.set_field("APIStatus", resolve_api_status)
query.set_field("GetUserHistory", resolve_get_user_history)
query.set_field("GetAllComments", resolve_get_all_comments)
query.set_field("GetComments", resolve_get_comments)
query.set_field("GetFavoriteProblems", resolve_get_favorite_problems)
query.set_field("AuthenticateLogin", resolve_authenticate_login)
query.set_field("GetServerSettings", resolve_get_server_settings)

# calculation API
# query.set_field("AreaOfCircle", resolve_area_of_circle)

mutation = ObjectType("Mutation")

mutation.set_field("CreateComment", resolve_create_comment)
mutation.set_field("AddFavorite", resolve_add_favorite)
mutation.set_field("AddUserSearchClick", resolve_add_user_search_click)
mutation.set_field("UserSignUp", resolve_user_sign_up)
mutation.set_field("AddEquation", resolve_add_equation)
mutation.set_field("SetAutoCaching", resolve_set_auto_caching)
mutation.set_field("SetTheme", resolve_set_theme)

type_defs = load_schema_from_path("schema.graphql")
schema = make_executable_schema(
    type_defs, query, snake_case_fallback_resolvers
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

# tests ######################################################
# from server.config import *
# from server.db.connect_db import *
# dbtest = MySQLDatabase("localhost", "3308", "root", "my-secret-pw", "mathu_similarity_index_database")
# results = dbtest.execute_query("SELECT * FROM mathu_similarity_index_database.problems;")
# for id, problem in results:
#     print(problem)
# sql = "INSERT INTO problems(problem) VALUES('z^{4}-4y+2=0');"
# dbtest.execute_query(sql)
# dbtest.commit()

print_config()