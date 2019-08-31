//: Playground - noun: a place where people can play

import UIKit

/*
     find out the symmetric pairs in an array
     arr = [[10,20], [20,10], [30,40], [50,60]]
     symmetric pairs present -- [10,20] & [20,10]
 */


public func symmetricPresent(arr : [[Int]]) -> [[Int]] {
    
    var results = [[Int]]()
    var dictionary = Dictionary<Int,Int>()
    
    for each in arr {
        let first = each[0]
        let second = each[1]
        
        if let secondPresent = dictionary[second] , secondPresent == first {
            // Symmetric present
            results.append([second,first])
        } else {
            // insert into dictionary
            dictionary[first] = second
        }
    }
    return results
}

let results = symmetricPresent(arr: [[10,20],[20,10], [30,40], [50,60], [40,30]])
if results.count > 0 { print(results) }



