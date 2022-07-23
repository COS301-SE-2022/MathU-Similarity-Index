def perimetretriangle():
	a = "1000,2,3"
	abc = a.split(",")
	abc = list(map(int, abc))
	side1 = abc[0]
	side2 = abc[1]
	base = abc[2]
	Perimeter = side1 + side2 + base
	Answer = "Perimeter of the triangle: " + str(Perimeter)
	return Answer

print(perimetretriangle())