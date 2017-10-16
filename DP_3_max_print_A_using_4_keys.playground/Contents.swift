//: Playground - noun: a place where people can play

// Finding maximum number of printing A using 4 keys : A, Select_All, Cnt+Copy, Cnt+Paste

// It's not optimal beacuse we treat (select_all, copy, paste) only 1 time ( only by Observation )
public func getMaxPrint(n : Int) -> Int {
    if n <= 6 { return n }
    var max = 0
    for m in 1...n-3 {
        let val = m + m + (n-3-m) * m // m for Printing 1st m no of A , 2nd m for (select_all, copy, paste) , (n-3-m) times paste
        if val > max { max = val }
    }
    return max
}

// Optimal Solution :
// Recursion

public func getMaxPrintRecusion(n : Int) -> Int {
    if n <= 6 { return n }
    var max = 0
    for m in 1...n-3 {
        let val = (n-1-m) * getMaxPrintRecusion(n: m)
        if val > max { max = val }
    }
    return max
}
print("Print using Recursion ")
for i in 1...20 {
    print("Keys \(i) : Printing A = \(getMaxPrintRecusion(n: i))")
}

// Dynamic Programming
// create a lookup table

public func getMaxPrintDP(n : Int) -> Int {
    
    if n <= 6 { return n } // initial observation
    
    // create a look up table
    var lookup : [Int] = Array<Int>(repeating: 0, count: n+1)
    
    // fill first 6 elements, ignore 0th element
    for i in 1...6 { lookup[i] = i }
    
    var max = 0
    for i in 7...n { // traverse all key stokes
        for m in 1...n-3 { // paste frequency
        
            let val = (i-1-m) * lookup[m]
            if val > lookup[i] { lookup[i] = val }
        }
    }
    
    return lookup[n]
}
print("\nPrint using Dynamic programming ")
for i in 1...20 {
    print("Keys \(i) : Printing A = \(getMaxPrintDP(n: i))")
}




