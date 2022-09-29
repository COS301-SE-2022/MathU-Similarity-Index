from app import GLOBAL_SERVER_CONFIG
from db.handlers.problems import get_all_problem_data, get_all_problems_favorite_autocache, problem_exists, get_problem_id, create_problem, add_problem_tags,add_problem_links
from services.confidence_calc import get_all as get_all_conf
from services.confidence_calc import get_conf

def handle_search(user_email, input, tags, must_have_memo=False, allow_user_search=True):#problem_id, problem, user_search, has_memo, favorite, distance, sim, [tag_id, tag_name, description], [link]
    # results_no_sim = get_all_problem_data(user_email, tags, must_have_memo, allow_user_search) #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link]

    # # get confidence
    # results_conf = get_all_conf(input, results_no_sim, 1, 7) #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link], distance

    # #normalize sim
    # res_size = len(results_conf)
    # max_sim = results_conf[res_size-1]
    # min_size = 0

    # results = []
    # for row in results_conf:
    #     sim_distance = row[7]
    #     inverse_sim = max_sim - sim_distance
    #     normalized_sim = inverse_sim / (max_sim) * 100
    #     new_row = row + (normalized_sim,)
    #     results.append(new_row)
    
    pid = -1
    if GLOBAL_SERVER_CONFIG[0]: # if autocaching on
        pid = get_problem_id(input)
        if pid == -1:
            # insert
            create_problem(input, True, False)
            pid = get_problem_id(input)

    results_set = get_all_problems_favorite_autocache(pid, user_email, tags) #problem_id, problem, user_search, has_memo, favorite, similarity
    pid_index = 0
    sim_dist_index = 5
    cols = 6

    #auto cache insert lists
    cached_simularity_values = [] #t_cs_id, similarity
    problems_cached_simularity_values = [] #problem_id, t_cs_id

    # add sim_distance
    results = []
    for problem_id, problem, user_search, has_memo, favorite, similarity in results_set:
        if similarity == -1:
            #csv
            similarity = get_conf(input, problem)
            tcsid = str(pid) + "+" + str(problem_id)
            csv = (tcsid,similarity,)
            cached_simularity_values.append(csv)
            #pcsv
            pcsv1 = (pid, tcsid,)
            pcsv2 = (problem_id,tcsid)
            problems_cached_simularity_values.append(pcsv1)
            problems_cached_simularity_values.append(pcsv2)
        
        new_row = (problem_id, problem, user_search, has_memo, favorite, similarity)
        results.append(new_row)
        
    # add tags and links
    results = add_problem_tags(results, 0)
    results = add_problem_links(results, 0)

    # create auto caching
    if GLOBAL_SERVER_CONFIG[0]: # if autocaching on
        pass

    # insert search as problem

    return results