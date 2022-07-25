import statistics
def mean():
	input = "1,2,3,4,5,6,7,8"
	text_input = str(input)
	abc = text_input.split(",")
	abc = list(map(int, abc))
	print(statistics.mean(abc))

mean()

	