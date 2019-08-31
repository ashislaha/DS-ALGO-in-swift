//: Playground - noun: a place where people can play

import Foundation

/*
 
 Steps :
 (1). If totalGas > totalCost then there is a solution
 (2). If tank < 0 for jth index then update the start index as (j+1)
 
 */

public func gasStation(gas : [Int], cost : [Int]) -> Int {
    
    guard gas.count == cost.count else { return -1 }
    var gasSum = 0
    var costSum = 0
    var start = 0
    var tank = 0
    
    for i in 0..<gas.count {
        gasSum += gas[i]
        costSum += cost[i]
        tank += gas[i] - cost[i]
        if tank < 0 {
            start = i+1
            tank = 0
        }
    }
    
    if gasSum < costSum { return -1 }
    return start
}

let gas = [1,2]
let cost = [2,1]
let index = gasStation(gas: gas, cost: cost)

print(index)

