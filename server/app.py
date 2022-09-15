from server.api import app

from ariadne import load_schema_from_path, make_executable_schema, \
    graphql_sync, snake_case_fallback_resolvers, ObjectType
from ariadne.constants import PLAYGROUND_HTML
from flask import request, jsonify
from server.api.queries import resolve_api_status, resolve_get_all_equations, resolve_search, resolve_get_user_history, resolve_get_all_comments, resolve_get_comments, resolve_get_favorite_problems, resolve_authenticate_login, resolve_get_server_settings
from server.api.mutation import resolve_add_equation, resolve_add_favorite, resolve_create_comment, resolve_add_user_search_click, resolve_set_auto_caching, resolve_set_theme, resolve_user_sign_up

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


#----------------------------------------------------------------------------------------------------------------------------------------------------
#MatheMatical Tools Queries
#1. Query for area of circle API
query.set_field("AreaOfCircle", resolve_area_of_circle)

#2area of parallelogram API
query.set_field("AreaOfParallelogram", resolve_area_of_parallelogram)

#3 area of rhombus API
query.set_field("AreaOfRhombus", resolve_area_of_rhombus)

#4 area of square API
query.set_field("AreaOfSquare",resolve_area_of_square)

#5 area of rectangle API
query.set_field("AreaOfRectangle",resolve_area_of_rectangle)


#6 area of trapezoid API
query.set_field("AreaOfTrapeZoid",resolve_area_of_trapezoid)

#7 AREA OF TRIANGLE API
query.set_field("AreaOfTriangle",resolve_area_of_triangle)

#8 COMPOUND INTEREST API
query.set_field("CompoundInterest",resolve_compund_interest)

#9 Conversion to degress API Query
query.set_field("Converted",resolve_converted)

#10
query.set_field("geometric_sequence",resolve_geometric_sequence)

#11 Mean api query
query.set_field("Mean",resolve_mean)

#13 median hgih api query
query.set_field("MedianHigh",resolve_median_high)

#14 median low api query
query.set_field("MedianLow",resolve_median_low)

#15 median api query
query.set_field("Median",resolve_median)

#16 mode api query
query.set_field("Mode",resolve_mode)

#17 perimeter of circle api query
query.set_field("PerimeterOfCircle",resolve_perimeter_of_circle)

#18 perimeter of parallelogram api query
query.set_field("perimeterOfParallelogram",resolve_perimeter_of_parallelogram)

#19 perimeter of rectangle api query
query.set_field("PerimeterOfRectangle",resolve_perimeter_of_rectangle)

#20 perimeter of rhombus api query
query.set_field("PerimeterOfRhombus",resolve_perimeter_of_rhombus)

#21 perimeter of square api query
query.set_field("PerimeterOfSquare",resolve_perimeter_of_square)

#22 perimeter of trisngle api query
query.set_field("perimeterOfTriangle",resolve_perimeter_of_triangle)

#23 pstdev api query
query.set_field("pstdev",resolve_pstdev)

#24 pvarience api query
query.set_field("pvariance",resolve_pvariance)

#25 simple interest api query
query.set_field("SimpleInterest",resolve_simple_interest)

#26 simultaneous equations api query
query.set_field("SimultaneousEquations",resolve_simultaneous_equations)

#27 stdev api query
query.set_field("stdev",resolve_stdev)

#28 varience api query
query.set_field("varience",resolve_varience)


#-----------------------------------------------------------------------------------



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
