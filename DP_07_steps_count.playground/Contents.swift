import UIKit

/*
	given:
		- N - target value
		- X - given set which contains a set of integers which are used to sum and get the result

Example:
	N - 4
	X - {1,2}

Ouput: 5

	N(1) = 1 --> {1}
	N(2) = 2 --> {1,N(1)}, {2} => {1,1}, {2}
	N(3) = 3 --> {1, N(2)}, {2, N(1)} = 2 + 1 = 3 => {1,1,1} {1,2}, {2,1}
	N(4) = 5 --> {1,N(3)}, {2,N(2)} => 3 + 2 = 5 => {1,1,1,1} {1,1,2} {1,2,1} {2,1,1} {2,2}

-- we can keep a look up table and reuse the sub-optimal result.
-- we will start N --> N(n-{1}) + N(n-{2}) and proceed to base case N(1)
*/

class StepsCount {
	
	private var N: Int = 0
	private var X: [Int] = []
	private var lookupTable: [Int: Int] = [:] // this will keep track of N(x) = value
	
	init(X: [Int], N: Int) {
		self.N = N
		self.X = X
		calculate(steps: N)
	}
	
	private func calculate(steps: Int) {
		
	}
}


