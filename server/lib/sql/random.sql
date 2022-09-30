SELECT tag_id, tag_name, description FROM mathu_similarity_index_database.tags;

SELECT * FROM mathu_similarity_index_database.favorites;

SELECT * FROM mathu_similarity_index_database.comments;

SELECT * FROM mathu_similarity_index_database.history;

SELECT * FROM mathu_similarity_index_database.temporary_access_key;

SELECT count(*) FROM mathu_similarity_index_database.users where email like "test@email.com";

SELECT * FROM mathu_similarity_index_database.user_settings;

-- insert into mathu_similarity_index_database.users (email,user_name,password,password_salt,is_admin) values ();
SELECT email, user_name, is_admin FROM mathu_similarity_index_database.users;

SELECT * FROM mathu_similarity_index_database.problems where problem_id = 1 or 1=1;

-- insert into mathu_similarity_index_database.comments (problem_id, date_time, nanosecond, user_email, comment) values (%s,%s,%s,%s,%s);
SELECT problem_id, date_time, nanosecond, user_email, comment FROM mathu_similarity_index_database.comments where problem_id = 1 order by date_time;

SELECT problem_id, problem, user_search, has_memo, 0 as sim FROM mathu_similarity_index_database.problems;

SELECT problem_id, problem, 0 AS distance FROM mathu_similarity_index_database.problems;

SELECT email, user_name, password, password_salt, is_admin, dark_theme FROM mathu_similarity_index_database.users 
inner join mathu_similarity_index_database.user_settings on users.email = user_settings.user_email
where email like "admin" or 1=1;

SELECT tag_id, tag_name, description FROM mathu_similarity_index_database.tags order by tag_id;


-- #############################################################################################################

-- #select problem_id, problem, (select tag_id from problem_tags where problem_tags.problem_id = problems.problem_id) from problems group by problem_id;
select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like "default" and favorites.problem_id = problems.problem_id) as favorite from problems
left join favorites on favorites.problem_id = problems.problem_id
where (problems.has_memo = false or true) and (problems.user_search = true or true)
group by problems.problem_id order by problems.problem_id;

-- #has memo only (t,f) all (f,t)
-- #no user search (f,f) allow serches (t,t)

-- # select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = problems.problem_id) as favorite from problems left join favorites on favorites.problem_id = problems.problem_id group by problems.problem_id;

-- #############################################################################################################

select problems.problem_id, problem, user_search, has_memo, 
exists(select distinct user_email from favorites where user_email like "bob@email.com" and favorites.problem_id = problems.problem_id) as favorite 
from ((problems
left join favorites on favorites.problem_id = problems.problem_id) inner join problem_tags on problems.problem_id = problem_tags.problem_id)
where problem_tags.tag_id in (2,3,1) 
and (problems.has_memo = false or true) and (problems.user_search = true or true)
-- #where problems.problem_id in (1,2,3,4,5,6,7,8,9,10)
group by problems.problem_id order by problems.problem_id;

-- #must have memo (t,f) else (f,t)
-- #no user search (f,f) allow serches (t,t)

-- # select problems.problem_id, problem, user_search, has_memo, exists(select distinct user_email from favorites where user_email like %s and favorites.problem_id = problems.problem_id) as favorite from ((problems left join favorites on favorites.problem_id = problems.problem_id) inner join problem_tags on problems.problem_id = problem_tags.problem_id) where problem_tags.tag_id in (%s) group by problems.problem_id;

-- #############################################################################################################

-- #update problems set user_search = true where problems.problem_id = 1

select problem_tags.problem_id, problem_tags.tag_id, tag_name, description from problem_tags inner join tags on tags.tag_id = problem_tags.tag_id where problem_tags.problem_id in (1) or true order by problem_id;
-- #where problem_id in (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40)
select problem_links.problem_id, problem_links.link_id, problem_links.link from problem_links where problem_id in (1)  order by problem_id;

-- #############################################################################################################

select problems.problem_id, problem, user_search, has_memo,
exists(select distinct user_email from favorites where user_email like "bob@email.com" and favorites.problem_id = problems.problem_id) as favorite,
IFNULL(problems.similarity, -1) as similarity
from
(
    SELECT problems.problem_id, problem, user_search, has_memo,
        (
            select distinct similarity
            from problems_cached_simularity
            inner join cached_simularity on cached_simularity.t_cs_id = problems_cached_simularity.t_cs_id
            where problems_cached_simularity.problem_id = problems.problem_id
            and problems_cached_simularity.t_cs_id in
                (
                select problems_cached_simularity.t_cs_id
                from problems_cached_simularity
                where problem_id = -1
                )
            and problems.problem_id != -1
        ) as similarity
    FROM problems
    left join problems_cached_simularity on problems.problem_id = problems_cached_simularity.problem_id
    group by problems.problem_id
    order by problems.problem_id
) problems
left join favorites on favorites.problem_id = problems.problem_id
inner join problem_tags on problems.problem_id = problem_tags.problem_id
where problem_tags.tag_id in (3,2,1)
and (problems.has_memo = false or true)
and (problems.user_search = true or true)
group by problems.problem_id
order by problems.problem_id;