print("start:")

from db.handlers.problems import get_all_problems_favorite, get_all_problems_favorite_autocache, get_problem_id

res = get_all_problems_favorite("bob@email.com",[]) #problem_id, problem, user_search, has_memo, favorite

print("len: ",len(res))
# print(res)

from db.handlers.problems_shared import add_problem_tags, add_problem_links

res_t = add_problem_tags(res, 0)
print("len: ",len(res_t))
# print(res_t)

res_l = add_problem_links(res_t, 0)
print("len: ",len(res_l))

res = get_all_problems_favorite_autocache(-1,"bob@email.com",[2,3]) #problem_id, problem, user_search, has_memo, favorite, similarity

print("len: ",len(res))
print(res)

from db.handlers.problems import get_problem_data
res = get_problem_data(4)
print("len: ",len(res))
print(res)

print("###############################")

from db.handlers.cache import insert_many_cached_simularity
ls = [
    (1,"2+1"),
    (2,"2+1"),
    (3,"2+1"),
    (4,"2+1"),
    (5,"2+1"),
    (6,"2+1"),
    (7,"2+1"),
    (8,"2+1"),
    (9,"2+1"),
    (10,"2+1"),
    (11,"2+1"),
    (12,"2+1")
]
# insert_many_cached_simularity(ls)

print(get_problem_id(""))