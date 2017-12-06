//: Playground - noun: a place where people can play

import UIKit

// Basic Divide and conquer approach 

let dictioanry = ["i", "like", "mango", "man", "go", "ice", "cream", "icecream"]

class WordBreak {
    
    public func isWordsPresentRecursion(str : String) -> Bool {
        if str.isEmpty { return true }
        else if dictioanry.contains(str) { return true }
        else {
            for i in 0..<str.characters.count {
                let prefix = str[str.index(str.startIndex, offsetBy: i)]
                let suffix = str.substring(from: str.index(str.startIndex, offsetBy: i+1))
                return dictioanry.contains(String(prefix)) && isWordsPresentRecursion(str:suffix)
            }
        }
        return false
    }
    
    public func isWordPresentInDP(str : String) -> Bool {
        if str.isEmpty { return true }
        else if dictioanry.contains(str) { return true }
        else {
            
            // create a look up table of string size, initially all are false
            var lookup : [Bool] = []
            for _ in 0..<str.characters.count {
                lookup.append(false)
            }
            
            // traverse
            for i in 0..<str.characters.count {
                let substring = str[str.index(str.startIndex, offsetBy: i)]
                if !lookup[i] && dictioanry.contains(String(substring)) { lookup[i] = true }
                
                if lookup[i] {
                    if i == str.characters.count-1 { return true }
                    // traverse from i+1 to end
                    for j in i+1..<str.characters.count {
                        // create a substring from i+1 to j
                        let startIndex = str.index(str.startIndex, offsetBy: i+1)
                        let endIndex = str.index(str.startIndex, offsetBy: j)
                        let subStr = str[startIndex...endIndex]
                        
                        if !lookup[j] && dictioanry.contains(String(subStr)) {
                            lookup[j] = true
                            if j == str.characters.count-1 { return true }
                        }
                    }
                }
            }
        }
       return false
    }
}

let wb = WordBreak()

print(wb.isWordsPresentRecursion(str: "ilike"))
print(wb.isWordPresentInDP(str: "ilikemango"))
print(wb.isWordPresentInDP(str: "ilikemangoe"))




