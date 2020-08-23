//
//  main.swift
//  codesignal
//
//  Created by Ashis Laha on 23/08/20.
//  Copyright © 2020 Microsoft. All rights reserved.
//

import Foundation

// rotate an image

func rotateImage(a: [[Int]]) -> [[Int]] {
	
	
	guard !a.isEmpty && a.count != 1 else { return a }
	
	var b = a
	// do transform of the input matrix
	for i in 0..<b.count-1 {
		for j in i+1..<b.count {
			swapIn2D(matrix: &b, ai: i, aj: j, bi: j, bj: i)
		}
	}
	
	// reverse colum wise
	var low = 0
	var high = b.count-1
	while low < high {
		
		for i in 0..<b.count {
			swapIn2D(matrix: &b, ai: i, aj: low, bi: i, bj: high)
		}
		low += 1
		high -= 1
	}
	
	return b
}

func swapIn2D(matrix: inout [[Int]], ai: Int, aj: Int, bi: Int, bj: Int) {
	
	let temp = matrix[ai][aj]
	matrix[ai][aj] = matrix[bi][bj]
	matrix[bi][bj] = temp
}

//let image: [[Int]] = [[1,2,3,4], [5,6,7,8], [9,10,11,12], [13,14,15,16]]
let image: [[Int]] = [[1,2,3], [4,5,6], [7,8,9]]
let r = rotateImage(a: image)
print(r)
