import statistics
def variance():
	input = "1,2,2,3,4,5,6,7,8,200,2932,3434"
	text_input = str(input)
	abc = text_input.split(",")
	abc = list(map(int, abc))
	print(statistics.variance(abc))

variance()