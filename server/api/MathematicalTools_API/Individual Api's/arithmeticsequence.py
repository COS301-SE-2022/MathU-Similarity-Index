def arithmeticsequence():
    a = "2,3,100"
    abc = a.split(",")
    abc = list(map(int, abc))
    commonDifference = abc[0]
    firstTerm = abc[1]
    N = abc[2]
    nthTerm = firstTerm + (N - 1) * commonDifference
    returning = "Common Difference in the arithmetic sequence is:" + str(abc[0]) + "\n" + "First term in the arithmetic sequence is:" + str(abc[1]) + "\n" + "100th term in the arithmetic sequence is:" + str(nthTerm)
    return returning

print(arithmeticsequence())