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


class X {
	var id: Int
	init(id: Int) {
		self.id = id
	}
}


var dataSource: [X] = [X(id: 1), X(id: 2)]
func foo() {
	
	guard !dataSource.isEmpty else { return }
	let cachedFirstObj = dataSource[0] // retrieve the first object for computation
	
	// some business logic -- need to update first object id
	// dataSource[0].id = 5 // not recommeneded as we already cached it inside cachedFirstObj
	cachedFirstObj.id = 6
	
	for each in dataSource {
		print(each.id)
	}
}
foo()

var str1 = "abcd"
str1.removeLast()
print(str1)

// swap char inside a string
let array = Array(str1)
print(array)
print(String(array))
