from http import server
from api import app

from config import *

from ariadne import load_schema_from_path, make_executable_schema, \
    graphql_sync, snake_case_fallback_resolvers, ObjectType
from ariadne.constants import PLAYGROUND_HTML
from flask import request, jsonify

from api.mutation_main import *
from api.queries_main import *

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
query.set_field("GetAllTags", resolve_get_all_tags)

mutation = ObjectType("Mutation")

mutation.set_field("CreateComment", resolve_create_comment)
mutation.set_field("AddFavorite", resolve_add_favorite)
mutation.set_field("AddUserSearchClick", resolve_add_user_search_click)
mutation.set_field("UserSignUp", resolve_user_sign_up)
mutation.set_field("AddEquation", resolve_add_equation)
mutation.set_field("SetAutoCaching", resolve_set_auto_caching)
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

# print_config()