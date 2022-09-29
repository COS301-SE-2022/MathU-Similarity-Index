import json
from latex2sympy2 import latex2sympy
from datetime import datetime
from db.handlers.problems import remove_problem, get_all_problem_data
from services.tagging import tag_function

#this function converts a json file to a txt file (replacing duplicate backslashes with single ones)
def removeBackslashes(filename):
    file = open(filename, "r")
    jsonString = file.read()
    latexList = json.loads(jsonString)

    for i in range(len(latexList["data"])):
        latexList["data"][i] = latexList["data"][i].replace("\\\\", "\\")
        with open("clean_output.txt", "a") as writer:
            writer.write(latexList["data"][i])
            writer.write("\n")

def get_date_time_type(dt: datetime):
    str = dt.strftime("%Y-%m-%d %H:%M:%S.%f")
    year = dt.strftime("%Y")
    month = dt.strftime("%m")
    day = dt.strftime("%d")
    h = dt.strftime("%H")
    m = dt.strftime("%M")
    s = dt.strftime("%S")
    dt_nano = dt.strftime("%f")

    payload = {
        "string": str,
        "year": year,
        "month": month,
        "day": day,
        "hour": h,
        "minute": m,
        "second": s,
        "nano": dt_nano,
        "timezone": ""
    }
    # print(payload)
    return payload

def detectCorruptLatex(latexIn):
    try:
        latex2sympy(latexIn)
        #print("passed latex test! "+ latexIn)
        return True
    except:
        #print("corrupt latex detected:" + latexIn)
        return False
    return False

def cleanDB():
    allProblems = get_all_problem_data()
    #print(allProblems)
    for problem in allProblems:
        if detectCorruptLatex(problem[1]) == False:
            if(tag_function(problem[1]) == False):
                if(problem[1].find("frac") == -1):
                    remove_problem(problem[0])
                    print("removed problem " + str(problem[0]))