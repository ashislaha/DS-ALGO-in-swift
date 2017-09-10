//: Playground - noun: a place where people can play

import UIKit

public func isNumberSumPresent(arr : [Int], sum : Int) -> Bool {
    
    // create a hash table of array elements
    let hashTable = Set(arr)
    
    for each in arr {
        if hashTable.contains(sum-each) {
            return true
        }
    }
    return false
}

let test = isNumberSumPresent(arr: [10,20,30,4,50], sum: 24)
print(test)
