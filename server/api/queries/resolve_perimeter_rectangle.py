def perimetrerectangle():
	a = "1000,2"
	abc = a.split(",")
	abc = list(map(int, abc))
	length = abc[0]
	width = abc[1]
	Perimeter = 2*length + 2* width
	Answer = "Perimeter of the rectangle: " + str(Perimeter)
	return Answer

print(perimetrerectangle())
