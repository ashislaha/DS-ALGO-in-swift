//: Playground - noun: a place where people can play

import UIKit


class SubsetArray {
    
    // given two array
    // find out whether one array contains of another array or not
    // time complexity O(size of arr2), space complexity = O(size of arr1)
    
    //contain logic
    
    public func isContain(arr1 : [Int], arr2 : [Int]) -> Bool { // arr2 contains within arr1
        guard arr2.count > 0  else { return true }
        
        // create a Hash-table based on arr1
        let hashSet = Set(arr1)
        print("Hash-table : \(hashSet)") // create a hash-table of unique elements 
        
        for each in arr2 {
            if !hashSet.contains(each) {
                return false
            }
        }
        return true
    }
}

let test = SubsetArray()
let isContain = test.isContain(arr1: [1,2,3,4,5,6,1], arr2: [6,3])
print("\(isContain)")

