//: Playground - noun: a place where people can play


import Foundation

/*
 
 You will start from 0th number and you have to reach to some other number (+ve or -ve),
 But you can take ith Step(any direction either +ve or -ve) at ith move. How many moves do you need to reach destination ?
 
 Example :  destination = +2 ( 0 -> +1 (step = 1) -> -1 (step = 2) -> +2 (step = 3)) #moves = 3
            destination = -2 ( 0 -> -1 (step = 1) -> +1 (step = 2) -> -2 (step = 3)) #moves = 3
            destination = 4 (0 -> -1 -> -3 -> 0 -> 4)
 
 It is same for any +ve or -ve number destination.
 
 */

public func reachDestination(source : Int, destination : Int , steps : Int) -> Int {
    
    if abs(source) > destination { // there is no solution
        return Int.max
    } else if source == destination {
        return steps
    } else {
        // print(steps)
        let positive = reachDestination(source: source+steps+1, destination: destination, steps: steps+1) // +ve direction
        let negative = reachDestination(source: source-steps-1, destination: destination, steps: steps+1) // -ve direction
        return min( positive, negative)
    }
}

let d = reachDestination(source: 0, destination: abs(2), steps: 0)
print(d)
