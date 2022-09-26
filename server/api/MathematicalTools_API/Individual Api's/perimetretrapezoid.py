def perimetretrapezoid():
	a = "1000,2,3,4"
	abc = a.split(",")
	abc = list(map(int, abc))
	firstbase = abc[0]
	secondbase = abc[1]
	firstside = abc[2]
	secondside = abc[3]
	Perimeter = firstbase + secondbase + firstside + secondside
	Answer = "Perimeter of the trapezoid: " + str(round(Perimeter,3))
	return Answer

print(perimetretrapezoid())