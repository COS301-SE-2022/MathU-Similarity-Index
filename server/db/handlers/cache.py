from symbol import try_stmt
from db.connect_db import sql_query, sql_mutation

def insert_many_cached_simularity(list = []):
    try:
        if len(list) > 0:
            listlen = len(list)
            sql = "INSERT INTO mathu_similarity_index_database.cached_simularity (t_cs_id,similarity) VALUES "
            count = 0
            pars = ()
            for tcsid, sim in list:
                pars += (tcsid,sim,)

                # sql += "('" + tcsid + "'," + str(sim) + ")"
                sql += "(%s,%s)"
                count = count + 1
                if count < listlen:
                    sql+=","
                else:
                    sql+=";"
            # print(sql, pars)
            sql_mutation(sql, pars)
    except:
        print("insert error")

def insert_many_problems_cached_simularity(list = []):
    try:
        if len(list) > 0:
            listlen = len(list)
            sql = "INSERT INTO mathu_similarity_index_database.problems_cached_simularity (problem_id,t_cs_id) VALUES "
            count = 0
            pars = ()
            for pid, tcsid in list:
                pars += (pid, tcsid,)

                # sql += "(" + str(pid) + ",'" + tcsid + "')"
                sql += "(%s,%s)"
                count = count + 1
                if count < listlen:
                    sql+=","
                else:
                    sql+=";"
            # print(sql, pars)
            sql_mutation(sql, pars)
    except:
        print("insert error")