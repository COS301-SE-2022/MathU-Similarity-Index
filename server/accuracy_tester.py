import random
from services.confidence_calc import get_conf

search_vars = [
    "x",
    "x+1",
    "2x",
    "2*x",
    "\\frac{1}{2}",
    "f(x)=x+1",
    "g(x)=2x",
    "h(x)=\\frac{1}{2}",
    "f(x)=x+1, g(x)=2x, h(x)=\\frac{1}{2}",
    "y=x+1",
    "3764",
    "x^2",
    "x^2+1",
    "1+2+3+4+5+6+7+8+9+10",
    "1*2*3*4*5*6*7*8*9*10",
    "(x+1)*(x+2)",
    "x^2+2x+1",
    "(x-(x+1))",
    "(((x)))",
    "f(x)=1",
]
test_vars1 = [
    "y",
    "2+y",
    "3y",
    "y*2",
    "\\frac{5y}{1+2}",
    "y=x+1",
    "y=2x",
    "y=\\frac{1}{2}",
    "y=x+1, y=2x, y=\\frac{1}{2}",
    "f(x)=x+1",
    "901",
    "y^2",
    "y^2+1",
    "126323+3764246+3764",
    "10*2*3*4*5*6*7*8*9*10",
    "(y+3)*(y+7)",
    "y^3+5y+11",
    "((x+1)-x)",
    "x",
    "1=f(x)",
]
test_vars2 = [
    "1",
    "321",
    "-1",
    "2=2",
    "13131341*131313",
    "723x=x*1",
    "1111+2x",
    "y+\\frac{1}{2}",
    "31313, 485645, 4356563243",
    "x^2+1",
    "x+11",
    "x+2",
    "x+2+1",
    "1*2*3*4*5*6*7*8*9*10",
    "1+2+3+4+5+6+7+8+9+10",
    "(z*2)+(z*3)",
    "q+1*43*2",
    "x^2+2x+1",
    "1+2+3",
    "f-1+2",
]

tot = len(search_vars)
pas = 0
print("Accuracy tests:\nSimi -> (similarity distance).\nlowest similarity is most similar to search.\nFirst value should have the lowest similarity.")
for i in range(0,tot):
    print("Test:",i)
    print("\tSearch:",search_vars[i])

    sim1 = get_conf(search_vars[i],test_vars1[i])
    sim2 = get_conf(search_vars[i],test_vars2[i])

    print("\tValue 1:",test_vars1[i], "\tsimilarity:",sim1)
    print("\tValue 2:",test_vars2[i], "\tsimilarity:",sim2)

    if sim1<=sim2:
        print("\t\tpass")
        pas += 1
    else:
        print("\t\tfail")
    # x = random.randint(0,100)
    # if(x > 0) and (x < 70):
    #     print("\tpass")
    #     pas += 1
    # else:
    #     print("\tfail")
print("Passed:",pas,"/",tot,"=",round(pas/tot*100,2),"%")