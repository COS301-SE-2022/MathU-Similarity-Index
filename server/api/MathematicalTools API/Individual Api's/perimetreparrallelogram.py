def perimetreparrallelogram():
	a = "1000,2"
	abc = a.split(",")
	abc = list(map(int, abc))
	base = abc[0]
	height = abc[1]
	Perimetre = 2*(base + height)
	Answer = "Perimeter of the parrallelogram: " + str(Perimetre)
	return Answer

print(perimetreparrallelogram())