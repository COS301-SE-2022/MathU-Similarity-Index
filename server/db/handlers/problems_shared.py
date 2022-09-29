from re import I
from tempfile import tempdir
from db.connect_db import sql_query

def get_all_tags(tags = []): #tag_id, tag_name, description
    pass

def add_problem_tags(problems, id_index): #++ [tag_id, tag_name, description]
    if len(problems) > 0:
        ids = [item[0] for item in problems]

        sql_prepared = """select problem_tags.problem_id, problem_tags.tag_id, tag_name, description from problem_tags inner join tags on tags.tag_id = problem_tags.tag_id where problem_tags.problem_id in ({0}) or true order by problem_id;"""
        sql_prepared = sql_prepared.format(','.join('?' * len(ids)))

        tags = sql_query(sql_prepared, ids)

        results = []
        index_count = 0
        for problem in problems:
            temp = []

            for i in range(index_count, len(tags)):
                pid, tid, name, des = tags[i]
                if problem[id_index] == pid:
                    temptup = (tid, name, des)
                    temp.append(temptup)
                elif problem[id_index] < pid:
                    index_count = i
                    break
                elif problem[id_index] > pid:
                    pass
                    
            curr = problem + (temp,)
            results.append(curr)
        
        return results

def add_problem_links(problems, id_index): #++ [link]
    if len(problems) > 0:
        ids = [item[0] for item in problems]

        sql_prepared = """select problem_links.problem_id, problem_links.link_id, problem_links.link from problem_links where problem_id in ({0})  order by problem_id;"""
        sql_prepared = sql_prepared.format(','.join('?' * len(ids)))

        links = sql_query(sql_prepared, ids)

        results = []
        index_count = 0
        for problem in problems:
            temp = []

            for i in range(index_count, len(links)):
                pid, lid, link = links[i]
                if problem[id_index] == pid:
                    temptup = link
                    temp.append(temptup)
                elif problem[id_index] < pid:
                    index_count = i
                    break
                elif problem[id_index] > pid:
                    pass
                    
            curr = problem + (temp,)
            results.append(curr)
        
        return results