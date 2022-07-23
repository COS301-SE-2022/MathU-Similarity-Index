def areatriangle():
	a = "1000,2"
	abc = a.split(",")
	abc = list(map(int, abc))
	base = abc[0]
	height = abc[1]
	Area = (0.5*base) * height
	Answer = "Area of the triangle: " + str(Area)
	return Answer

print(areatriangle())