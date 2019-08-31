//: Playground - noun: a place where people can play

import UIKit

/*
     finding the common elements in k number of sorted array , print the common elements.
     let arr1 = [4, 10, 20, 30, 40]
     let arr2 = [5, 10, 20, 24, 34, 56]
     let arr3 = [10, 11, 12, 13, 20, 14]
 
     Result = [10,20]
 */


// Solution 1 : Do intersection of all 3

// Soution 2 : Do Comaprison beacause they are sorted in nature

public func printCommonElements(arr1 : [Int], arr2 : [Int], arr3 : [Int] ) -> [Int] {
    
    var i = 0
    var j = 0
    var k = 0
    var result : [Int] = []
    // loop through the 3 list
    while i < arr1.count && j < arr2.count && k < arr3.count {
        if arr1[i] == arr2[j] && arr2[j] == arr3[k] {
            result.append(arr1[i])
            i += 1
            j += 1
            k += 1
        } else if arr1[i] < arr2[j] { // smaller in 1st array
            i += 1
        } else if arr2[j] < arr3[k] {  // smaller in 2nd array
            j += 1
        } else { // smaller in 3rd array
            k += 1
        }
    }
    return result
}

let arr1 = [4, 10, 20, 30, 40]
let arr2 = [5, 10, 20, 24, 34, 56]
let arr3 = [10, 11, 12, 13, 20, 14]
let r = printCommonElements(arr1: arr1, arr2: arr2, arr3: arr3)
print(r)




