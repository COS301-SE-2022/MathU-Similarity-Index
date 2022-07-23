def arearhombus():
	a = "1000,2"
	abc = a.split(",")
	abc = list(map(int, abc))
	diagonal1 = abc[0]
	diagonal2 = abc[1]
	Area = (diagonal1*diagonal2)/2
	Answer = "Area of the rhombus: " + str(Area)
	return Answer

print(arearhombus())