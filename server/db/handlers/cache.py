from symbol import try_stmt
from db.connect_db import sql_query, sql_mutation

def insert_many_cached_simularity():
    try:
        sql_prepared = "INSERT INTO mathu_similarity_index_database.cached_simularity (t_cs_id,similarity)"
    except:
        print("insert error")

def insert_many_problems_cached_simularity():
    try:
        pass
    except:
        print("insert error")