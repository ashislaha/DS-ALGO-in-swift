//: Playground - noun: a place where people can play

import UIKit

/*
 Given an array : [1,2,3,4,5,1,2,3] , k = 3 , return false. Distance between duplicate 1 = 5
 
 [1,2,3,6,5,6] k= 3 return true bcz duplicate element 6 distance is = 2
 
*/


// Using Hash table of size k - Time Complexity O(arr.size) , space complexity = O(k)
public func isDuplicatePresentWithinRange(arr : [Int], k : Int) -> Bool {
    // create a hash-set
    var hashSet = Set([Int]())
    
    //looping through array
    for i in 0..<arr.count {
        if hashSet.contains(arr[i]) { return true }
        hashSet.insert(arr[i])
        if i >= k { hashSet.remove(arr[i-k]) }
    }
    return false
}


// Brute Force approach, Time Complexity = O(arr.size * k), space complexity = O(1)
public func isDuplicatePresentWithinRangeBruteForce(arr : [Int], k : Int) -> Bool {
    
    for i in 0..<arr.count {
        for j in 1...k {
            if i+j < arr.count && arr[i] == arr[i+j] { return true }
        }
    }
   return false
}

// Hash-table approach
let test1 = isDuplicatePresentWithinRange(arr: [1,2,3,4,5,1,2,3], k: 3)
print(test1)

let test2 = isDuplicatePresentWithinRange(arr: [1,2,3,6,5,6], k: 3)
print(test2)

// Brute Force approach
let test3 = isDuplicatePresentWithinRangeBruteForce(arr: [1,2,3,4,5,1,2,3], k: 3)
print(test3)

let test4 = isDuplicatePresentWithinRangeBruteForce(arr: [1,2,3,6,5,6], k: 3)
print(test4)




