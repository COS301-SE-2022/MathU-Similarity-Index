def compoundintrest():
	a = "1000,2,5"
	abc = a.split(",")
	abc = list(map(int, abc))
	p = abc[0]
	t = abc[1]
	r = abc[2]
	ci =  p * (pow((1 + r / 100), t)) 
	Answer = "The total amount accrued, principal plus interest, from compound interest on a principal of R"+ str(abc[0]) + "  at a rate of " + str(abc[1]) + "% per year for "+str(abc[2]) + " years is R" + str(ci)
	return Answer

print(compoundintrest())