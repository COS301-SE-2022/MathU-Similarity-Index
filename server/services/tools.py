import json
from datetime import datetime

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