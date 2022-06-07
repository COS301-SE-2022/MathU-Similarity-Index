from audioop import add
from main import MathsQuestions,Session,engine
from datetime import datetime

from itertools import count


File  = open('final_output.txt','r')
Lines = File.readlines()
count = 0
local_session = Session(bind=engine)
for line in Lines:
    count += 1
    new_question = MathsQuestions(id=count,questions=line)
    local_session.add(new_question)
    local_session.commit()
