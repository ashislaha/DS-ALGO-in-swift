//: Playground - noun: a place where people can play

/*
 
 Given a matrix(m,n) : find out the min cost path matrix : (direction - right, corner ,  down)
 
 start index (0,0), end index : (m-1,n-1)
 
 Cost matrix :
 [
    [1,2,3],
    [4,8,2],
    [1,5,3]
 ]
 Path Matrix :
 [
    [1,3,6],
    [5,9,5],
    [6,10,8]
 ]
 
 Min Cost path : 8 (1 ->2 ->2 ->3)
 
 */


import Foundation

public func getMin(a : Int, b : Int, c : Int) -> Int {
    return a < b ? ( a < c ? a : c ) : ( b < c ? b : c )
}

public func minCost(costMatrix : [[Int]]) -> Int {
    guard !costMatrix.isEmpty else { return 0 }
    
    var pathMatrix = costMatrix
    let m = costMatrix.count
    let n = costMatrix[0].count
    
    for i in 1..<m{
        pathMatrix[i][0] += pathMatrix[i-1][0]
    }
    
    for j in 1..<n {
        pathMatrix[0][j] += pathMatrix[0][j-1]
    }
    
    for i in 1..<m {
        for j in 1..<n {
            pathMatrix[i][j] += getMin(a: pathMatrix[i-1][j-1], b: pathMatrix[i-1][j], c: pathMatrix[i][j-1])
        }
    }
    print("Path Matrix :", pathMatrix)
    return pathMatrix[m-1][n-1]
    
}

let costMatrix = [[1,2,3], [4,8,2], [1,5,3]]
let minCostVal = minCost(costMatrix: costMatrix)
print("Min cost path val :", minCostVal)


