/*
 
    given 2 array and a target value. find out the pairs whose sum is closest to the target value.
 
    Example:
        [7, 4, 1, 10] & [4,5,8,7] and target = 13
    Answer: (7,5) = 12,  (4,8)= 12, (10,4) = 14,  (7, 7) = 14
 
    // sort each array
    // create a look up table
    // choose the minimum distance from target
 
 Time complexity = O(nlogn) and space complexity = O(n)
 
 */


import Foundation

class FindClosest {
    
    private var input1: [Int] = []
    private var input2: [Int] = []
    private var target: Int = 0
    
    init(input1: [Int], input2: [Int], target: Int) {
        guard !input1.isEmpty && input1.count == input2.count else { return }
        self.input1 = input1
        self.input2 = input2
        self.target = target
    }
    
    public func compute() {
        input1 = input1.sorted()
        input2 = input2.sorted()
        print(input1)
        print(input2)
        var lookup: [(Int, Int)] = []
        
        // i traverse row wise and j traverse column wise
        let n = input1.count
        var i = 0
        var j = n-1
        while i < n && j >= 0 {
            let inputOne = input1[i]
            let inputTwo = input2[j]
            let total = inputOne + inputTwo
            lookup.append((inputOne, inputTwo))
            if total <= target {
                // increment i
                i = i + 1
            } else if total > target {
                // decrement j
                j = j - 1
            }
        }
        print("Lookup: ", lookup)
        // choose the smallest distance elements from results array with respect to target
        // find out the smallest element from results dictionary keys and returns the results
        var results: [(Int, Int)] = []
        
        var smallest = abs(target - (lookup[0].0 + lookup[0].1))
        for i in 1..<lookup.count {
            let total = abs(target - (lookup[i].0 + lookup[i].1))
            if total <= smallest {
                smallest = total
                results.append((lookup[i].0, lookup[i].1))
            }
        }
        if smallest == abs(target - (lookup[0].0 + lookup[0].1)) { // the first element was the smallest one
            results.append((lookup[0].0, lookup[0].1))
        }
        
        print("Results: ", results)
    }
    
}

let obj = FindClosest(input1: [4,5,8,7], input2: [7,4,1,10], target: 13)
obj.compute()




