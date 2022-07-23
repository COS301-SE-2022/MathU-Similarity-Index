import math
def perimetrecircle():
	a = "5";
	r = int(a)
	Perimeter = math.pi * 2 * r
	Answer = "Perimeter of the circle: " + str(round(Perimeter,3))
	return Answer

print(perimetrecircle())
