from server.api import app

from ariadne import load_schema_from_path, make_executable_schema, \
    graphql_sync, snake_case_fallback_resolvers, ObjectType
from ariadne.constants import PLAYGROUND_HTML
from flask import request, jsonify
from server.api.queries2 import resolve_api_status, resolve_get_all_equations, resolve_search, resolve_get_user_history, resolve_get_all_comments, resolve_get_comments, resolve_get_favorite_problems, resolve_authenticate_login, resolve_get_server_settings
from server.api.mutation import resolve_add_equation, resolve_add_favorite, resolve_create_comment, resolve_add_user_search_click, resolve_set_auto_caching, resolve_set_theme, resolve_user_sign_up

from server.config import *

# from server.api.queries.resolve_area_of_circle import areacircle
# from server.api.queries.resolve_area_of_parallelogram import areaparrallelogram
# from server.api.queries.resolve_area_of_rectangle import arearectangle
# from server.api.queries.resolve_area_of_rhombus import arearhombus
# from server.api.queries.resolve_area_of_square import areasquare as resolve_area_of_square
# from server.api.queries.resolve_area_of_trapezoid import areatrapezoid as resolve_area_of_trapezoid
# from server.api.queries.resolve_area_of_triangle import areatriangle as resolve_area_of_triangle
# from server.api.queries.resolve_compound_interest import resolve_compund_interest
# from server.api.queries.resolve_converted import convertdr as resolve_converted
# from server.api.queries.resolve_geometric_sequence import geometric as resolve_geometric_sequence
# from server.api.queries.resolve_mean import mean as resolve_mean
# from server.api.queries.resolve_median import median as resolve_median
# from server.api.queries.resolve_median_high import median_high  as resolve_median_high
# from server.api.queries.resolve_median_low import median_low as resolve_median_low
# from server.api.queries.resolve_mode import mode as resolve_mode
# from server.api.queries.resolve_perimeter_circle import perimetrecircle as resolve_perimeter_of_circle
# from server.api.queries.resolve_perimeter_parallelogram import perimetreparrallelogram as resolve_perimeter_of_parallelogram
# from server.api.queries.resolve_perimeter_rectangle import perimetrerectangle as resolve_perimeter_of_rectangle
# from server.api.queries.resolve_perimeter_rhombus import perimetrerhombus as resolve_perimeter_of_rhombus
# from server.api.queries.resolve_perimeter_square import perimetresquare as resolve_perimeter_of_square
# from server.api.queries.resolve_perimeter_triangle import  resolve_perimeter_of_triangle
# from server.api.queries.resolve_pstdev import pstdev as resolve_pstdev
# from server.api.queries.resolve_pvarience import pvariance as resolve_pvariance
# from server.api.queries.resolve_simple_interest import simpleintrest as resolve_simple_interest
# #from server.api.queries.resolve_simultaneous_equations import solvesimultaneousequation
# from server.api.queries.resolve_simultaneous_equation import solvesimultaneousequation as resolve_simultaneous_equations
# from server.api.queries.resolve_stdev import stdev as resolve_stdev
# from server.api.queries.resolve_varience import variance as resolve_varience
# from server.config import print_config
# print("------not my problem it is the api code that is wrong -------")
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

# print("here ")
# query.set_field("AreaOfCircle", areacircle)
# print("area circle ")
# #2area of parallelogram API
# query.set_field("AreaOfParallelogram", areaparrallelogram)

# #3 area of rhombus API
# query.set_field("AreaOfRhombus", arearhombus)

# #4 area of square API
# query.set_field("AreaOfSquare",resolve_area_of_square)

# #5 area of rectangle API
# query.set_field("AreaOfRectangle",arearectangle)


# #6 area of trapezoid API
# query.set_field("AreaOfTrapeZoid",resolve_area_of_trapezoid)

# #7 AREA OF TRIANGLE API
# query.set_field("AreaOfTriangle",resolve_area_of_triangle)

# #8 COMPOUND INTEREST API
# query.set_field("CompoundInterest",resolve_compund_interest)

# #9 Conversion to degress API Query
# query.set_field("Converted",resolve_converted)

# #10
# query.set_field("geometric_sequence",resolve_geometric_sequence)

# #11 Mean api query
# query.set_field("Mean",resolve_mean)

# #13 median hgih api query
# query.set_field("MedianHigh",resolve_median_high)

# #14 median low api query
# query.set_field("MedianLow",resolve_median_low)

# #15 median api query
# query.set_field("Median",resolve_median)

# #16 mode api query
# query.set_field("Mode",resolve_mode)

# #17 perimeter of circle api query
# query.set_field("PerimeterOfCircle",resolve_perimeter_of_circle)

# #18 perimeter of parallelogram api query
# query.set_field("perimeterOfParallelogram",resolve_perimeter_of_parallelogram)

# #19 perimeter of rectangle api query
# query.set_field("PerimeterOfRectangle",resolve_perimeter_of_rectangle)

# #20 perimeter of rhombus api query
# query.set_field("PerimeterOfRhombus",resolve_perimeter_of_rhombus)

# #21 perimeter of square api query
# query.set_field("PerimeterOfSquare",resolve_perimeter_of_square)

# #22 perimeter of trisngle api query
# query.set_field("perimeterOfTriangle",resolve_perimeter_of_triangle)

# #23 pstdev api query
# query.set_field("pstdev",resolve_pstdev)

# #24 pvarience api query
# query.set_field("pvariance",resolve_pvariance)

# #25 simple interest api query
# query.set_field("SimpleInterest",resolve_simple_interest)

# #26 simultaneous equations api query
# query.set_field("SimultaneousEquations",resolve_simultaneous_equations)

# #27 stdev api query
# query.set_field("stdev",resolve_stdev)

# #28 varience api query
# query.set_field("varience",resolve_varience)


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

print_config()