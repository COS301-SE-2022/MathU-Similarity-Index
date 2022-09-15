def geometric():
	#STARTING NUMBER
	#COMMON RATIO
	#NTH NUMBER
	a = "2,5,10"
	abc = a.split(",")
	abc = list(map(int, abc))
	a = abc[0]
	r = abc[1]
	length = abc[2]
	geometric = [a * r ** (n - 1) for n in range(1, length + 1)]
	output = "[" + ", ".join(str(i) for i in geometric) + "]"
	return output

print(geometric())
