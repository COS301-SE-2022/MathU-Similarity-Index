def areatrapezoid():
	a = "1000,2,3"
	abc = a.split(",")
	abc = list(map(int, abc))
	firstbase = abc[0]
	secondbase = abc[1]
	height = abc[2]
	Area = 0.5*(firstbase*secondbase) * height
	Answer = "Area of the trapezoid: " + str(round(Area,3))
	return Answer

print(areatrapezoid())
