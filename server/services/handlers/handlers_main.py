from app import GLOBAL_SERVER_CONFIG_AUTO_CACHE
from db.handlers.problems import get_all_problems_favorite_autocache, get_problem_id, create_problem, add_problem_tags,add_problem_links
from services.confidence_calc import get_conf
from db.handlers.cache import insert_many_cached_simularity, insert_many_problems_cached_simularity
from db.handlers.users_shared import add_user_history

def handle_search(user_email, input, tags, must_have_memo=False, allow_user_search=True):#problem_id, problem, user_search, has_memo, favorite, distance, [tag_id, tag_name, description], [link], sim
    pid = -1
    if GLOBAL_SERVER_CONFIG_AUTO_CACHE: # if autocaching on
        pid = get_problem_id(input)

    results_set = get_all_problems_favorite_autocache(pid, user_email, tags) #problem_id, problem, user_search, has_memo, favorite, similarity
    pid_index = 0
    sim_dist_index = 5
    cols = 6

    pidx = pid
    if pid == -1:
            # insert
            create_problem(input, True, False)
            pidx = get_problem_id(input)

    #auto cache insert lists
    cached_simularity_values = [] #t_cs_id, similarity
    problems_cached_simularity_values = [] #problem_id, t_cs_id

    # add sim_distance
    results = []
    for problem_id, problem, user_search, has_memo, favorite, similarity in results_set:
        if similarity == -1:
            #csv
            similarity = get_conf(input, problem)
            tcsid = str(pidx) + "+" + str(problem_id)
            csv = (tcsid,similarity,)
            cached_simularity_values.append(csv)
            #pcsv
            pcsv1 = (pidx, tcsid,)
            pcsv2 = (problem_id,tcsid,)
            problems_cached_simularity_values.append(pcsv1)
            problems_cached_simularity_values.append(pcsv2)
        
        new_row = (problem_id, problem, user_search, has_memo, favorite, similarity)
        results.append(new_row)
        
    # add tags and links
    results = add_problem_tags(results, 0)
    results = add_problem_links(results, 0)

    # create auto caching
    if GLOBAL_SERVER_CONFIG_AUTO_CACHE: # if autocaching on
        if len(problems_cached_simularity_values) > 0 and len(cached_simularity_values) > 0:
            print("inserting auto cache")
            insert_many_cached_simularity(cached_simularity_values)
            insert_many_problems_cached_simularity(problems_cached_simularity_values)
            print("Auto caching complete")

    # insert history
    add_user_history(user_email, input) #TODO use insert queue

    # sort
    output = sorted(results, key=lambda data: data[sim_dist_index])

    #normalize sim
    res_size = len(output)
    max_sim = output[res_size-1][sim_dist_index]
    min_size = 0

    print("stuff: size:", res_size)

    results = []
    for row in output:
        sim_distance = row[sim_dist_index]
        # print("stuff 2: ", sim_distance)
        inverse_sim = max_sim - sim_distance
        normalized_sim = inverse_sim / (max_sim) * 100
        # print("-")
        new_row = row + (normalized_sim,)
        results.append(new_row)

    return results