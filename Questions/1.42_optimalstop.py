
# expectation of optimal strategy when remain r,b reds & blacks
# recursive version
def E(r,b):
	if r == 0:
		return 0
	if b == 0:
		return r
	return max(0, r/(r+b) *(1+E(r-1,b)) + b/(r+b) *(-1+E(r,b-1)))
# triangle version
def solveE(R,B):
	k = R+B
	Expec = [[None]*(k+1) for j in range(k+1)]
	for i in range(k+1):
		Expec[0][i] = 0
		Expec[i][0] = i
	for i in range(2, k+1):
		for r in range(1, i):
			b = i - r
			Expec[r][b] = (max(0, 
				r/(r+b) *(1+Expec[r-1][b]) + b/(r+b) *(-1+Expec[r][b-1]) ))
	#print(Expec)
	return Expec[R][B]
print(solveE(26,26))
	
