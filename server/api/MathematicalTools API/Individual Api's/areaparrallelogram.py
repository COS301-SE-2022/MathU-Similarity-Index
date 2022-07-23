def areaparrallelogram():
	a = "1000,2"
	abc = a.split(",")
	abc = list(map(int, abc))
	base = abc[0]
	height = abc[1]
	Area = base * height
	Answer = "Area of the parrallelogram: " + str(Area)
	return Answer

print(areaparrallelogram())