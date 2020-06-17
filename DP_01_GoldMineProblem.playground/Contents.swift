//: Playground - noun: a place where people can play

import UIKit

/*
 Given - N*M dimension matrix 
       - Each field contains a +ve number which is gold amount.
       - start from 1st column till end colum , collect the max gold 
       - traverse right, right-up, right-down
 */


/// find max gold collection
class GoldMine {
	
	
	// traverse right column to left column
	public func getMaxGoldRightToLeft( gold : [[Int]]) -> Int {
		
		let rows = gold.count
		let columns = gold[0].count
		
		// create a look-up matrix
		var lookUp = gold
		
		// traverse from end column to begin
		for col in stride(from: columns-1, to: -1, by: -1) {
			for row in 0..<rows {
				
				let right = (col == columns-1) ? 0 : lookUp[row][col+1]
				let rigth_up = (col == columns-1 || row == 0) ? 0 : lookUp[row-1][col+1]
				let right_down = (col == columns-1 || row == rows-1) ? 0 : lookUp[row+1][col+1]
				let maxVal = max(right, max(rigth_up, right_down))
				lookUp[row][col] += maxVal  // gold[row][col] is same as lookup[row][col]
			}
		}
		print("lookup table (right to left): \(lookUp)")
		
		// find out the max value from 1st column
		var maxFind = lookUp[0][0]
		for i in 1..<rows {
			if maxFind < lookUp[i][0] { maxFind = lookUp[i][0] }
		}
		return maxFind
	}
	
	// traverse left to right columns
	public func getMaxGoldLeftToRight(array: [[Int]]) -> Int {
		
		var lookup = array
		let N = lookup.count
		let M = lookup[0].count
		
		for col in 0..<M {
			for row in 0..<N {
				
				// let's consider each element
				let left = (col == 0) ? 0: lookup[row][col-1]
				let leftTop = (col == 0 || row == 0) ? 0: lookup[row-1][col-1]
				let leftDown = (col == 0 || row == N-1) ? 0: lookup[row+1][col-1]
				
				let max = left > leftTop ? (left > leftDown ? left: leftDown): (leftTop > leftDown ? leftTop: leftDown)
				lookup[row][col] += max
			}
		}
		
		// find out the max in last column
		var maxGold = lookup[0][M-1]
		for i in 1..<N {
			if lookup[i][M-1] > maxGold {
				maxGold = lookup[i][M-1]
			}
		}
		print("look up table (left to right)", lookup)
		return maxGold
	}
}


let goldMine = GoldMine()
let matrix = [[1,3,3], [2,1,4], [0,6,4]]
print("Input matrix: \(matrix)")

//print(goldMine.getMaxGoldRightToLeft(gold: matrix))
print(goldMine.getMaxGoldLeftToRight(array: matrix))





