print("start:")

from db.handlers.problems import get_all_problems_favorite, get_all_problems_favorite_autocache

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