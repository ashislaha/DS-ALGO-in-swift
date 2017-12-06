//: Playground - noun: a place where people can play

import Foundation

/*
 
 given input : [10,20,9,33,21,50,41,60,80]

 longest increasing subsequence : [10,20,33,50,60,80] and size = 6
 
 inpit :      [10,20,9,33,21,50,41,60,80]
 
 lookupTable: [1, 2, 1, 3, 3, 4, 3, 5, 6] which tracks of every element position for increasing subsequence.
 
 */

public func longestIncreasingSubsuquence(arr : [Int]) -> Int {
    var lookupTable : [Int] = Array<Int>(repeating : 1, count: arr.count)
    
    for i in 1..<arr.count {
        for j in 0..<i {
            
            if arr[i] > arr[j] && lookupTable[i] < lookupTable[j] + 1 {
                lookupTable[i] = lookupTable[j] + 1
            }
        }
    }
    print("LookupTable",lookupTable)
    return lookupTable[arr.count-1]
}

let input = [10,20,9,33,21,50,41,60,80]
let output = longestIncreasingSubsuquence(arr: input)
print("output",output)
