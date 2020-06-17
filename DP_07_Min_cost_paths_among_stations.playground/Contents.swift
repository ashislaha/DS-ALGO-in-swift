//: Playground - noun: a place where people can play

import Foundation

/*
 
	Assumption: the train is moving to single direction.

	Input cost matrix between 2 stations:
	[
		[0, 15, 80, 90],
		[INF, 0, 40, 50],
		[INF, INF, 0, 70],
		[INF, INF, INF, 0]
	]

 */


func getMinCost(costMatrix: [[Int]]) -> Int {
	
	let numberOfStations = costMatrix.count
	
	// check the number of stations are non-empty
	// check the cost matrix is proper 2D matrix (N*N)
	guard numberOfStations > 0 &&
		costMatrix[0].count == numberOfStations else {
			return 0
	}
	
	// create a look up array - which contains the optimal value
	var lookup = Array<Int>(repeating: 0, count: numberOfStations)
	lookup[0] = 0
	
	for currentStation in 1..<lookup.count { // each station
		
		var minValue = Int.max
		
		// check all the possibility of previous (0..CurrentStation-1) stations to reach CurrentStation th station
		for i in 0..<currentStation {
			
			let cost = lookup[i] + costMatrix[i][currentStation]
			if cost < minValue {
				minValue = cost
			}
		}
		
		// update the lookup at current station
		lookup[currentStation] = minValue
	}
	
	print(lookup)
	return lookup[numberOfStations-1]
}

let costMatrix = [[0,15,80,90], [Int.max,0,40,50], [Int.max, Int.max, 0, 70], [Int.max, Int.max, Int.max, 0]]
let cost = getMinCost(costMatrix: costMatrix)
print(cost)
