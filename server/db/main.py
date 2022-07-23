from problems import problemss


probs = problemss(1,"Problem 1")

x = 1

with open('clean_output.txt','r') as f:
    for line in f:
         probs.addproblems(x,line)
         x+=1