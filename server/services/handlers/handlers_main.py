from db.handlers.problems import get_all_problem_data
from services.confidence_calc import get_all as get_all_conf

def handle_search(user_email, input, tags, must_have_memo, allow_user_search):#problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link], distance, sim
    results_no_sim = get_all_problem_data(user_email, tags, must_have_memo, allow_user_search) #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link]

    # get confidence
    results_conf = get_all_conf(input, results_no_sim, 1, 7) #problem_id, problem, user_search, has_memo, favorite, [tag_id, tag_name, description], [link], distance

    #normalize sim
    res_size = len(results_conf)
    max_sim = results_conf[res_size-1]
    min_size = 0

    results = []
    for row in results_conf:
        sim_distance = row[7]
        inverse_sim = max_sim - sim_distance
        normalized_sim = inverse_sim / (max_sim) * 100
        new_row = row + (normalized_sim,)
        results.append(new_row)

    # auto caching
    # insert search as problem

    return results