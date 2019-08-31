//: Playground - noun: a place where people can play

import UIKit

/*
 Given - N*M dimension matrix 
       - Each field contains a +ve number which is gold amount.
       - start from 1st column till end colum , collect the max gold 
       - traverse right, right-up, right-down
 */


class GoldMine {
    
    // find max gold collection 
    
    public func getMaxGold( gold : [[Int]]) -> Int {
    
        let rows = gold.count
        let columns = gold[0].count
        
        // create a look-up matrix 
        var lookUp = gold
        print("Input  : \(lookUp)")
        
        // traverse from end column to begin 
        for col in stride(from: columns-1, to: -1, by: -1) {
            for row in 0..<rows {
                
                let right = (col == columns-1) ? 0 : lookUp[row][col+1]
                let rigth_up = (col == columns-1 || row == 0) ? 0 : lookUp[row-1][col+1]
                let right_down = (col == columns-1 || row == rows-1) ? 0 : lookUp[row+1][col+1]
                let maxVal = max(right, max(rigth_up, right_down))
                lookUp[row][col] += maxVal  // gold[row][col] is same as lookup[row][col]
            }
        }
        print("lookup : \(lookUp)")
        
        // find out the max value from 1st column 
        var maxFind = lookUp[0][0]
        for i in 1..<rows {
            if maxFind < lookUp[i][0] { maxFind = lookUp[i][0] }
        }
        return maxFind
    }
}


let goldMine = GoldMine()
let matrix = [[1,3,3], [2,1,4], [0,6,4]]
print(goldMine.getMaxGold(gold: matrix))




