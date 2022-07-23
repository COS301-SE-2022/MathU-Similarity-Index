def perimetrerhombus():
	a = "1000"
	abc = a.split(",")
	abc = list(map(int, abc))
	side = abc[0]
	Perimeter = side * 4
	Answer = "Perimeter of the rhombus: " + str(Perimeter)
	return Answer

print(perimetrerhombus())