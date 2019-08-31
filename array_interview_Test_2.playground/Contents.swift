//: Playground - noun: a place where people can play

import Foundation

/*
 Subarray sum problem.
 [1,2,3] = 20, as subarray ([1],[1,2], [1,2,3], [2], [2,3], [3])
 
 ith item appears in 2 types subset
  (1) sub-array starts with that item in (n-i) times
  (2) item present somewhere else in the subarray i*(n-i)
 total appearance = (n-i) + i(n-i) = (n-i) * (1+i)
 */

func subarraySum(arr: [Int]) -> Int {
    guard arr.count > 0  else { return 0 }
    
    var result = 0
    for index in arr.indices {
        result += arr[index] * (arr.count - index) * (index+1)
    }
    return result
}
print("Subarray Sum :" , subarraySum(arr: [1,2,3]))

/*
 given num  = 15 , consecutive sum of these arrays (4,5,6) , (1,2,3,4,5), (7,8), output = 3
 */

func consecutive(num: Int) -> Int {
    
    guard num > 0 else { return 0 }
    
    var start = 1
    var end = 1
    var sum = 1
    var result = 0
    
    while start <= num/2 {
        
        if sum < num {
            // update end
            end += 1
            // update sum
            sum += end
            
        } else if sum > num {
            // update sum first
            sum -= start
            // update sum
            start += 1
        } else { // sum == num
            // we find out a solution, update result
            result += 1
            print(start,"to",end)
            // update sum
            sum -= start
            //update start
            start += 1
        }
    }
    return result
}

print("consecutive sum :",consecutive(num: 15))







