//: Playground - noun: a place where people can play

import UIKit

public func solution(_ S : inout String) -> Int {
    // write your code in Swift 3.0 (Linux)
    
    guard !S.isEmpty else { return 0 }
    
    
    var result: Int = 0
    let operations = S.components(separatedBy: " ") // parse the input
    
    var stack = Stack()
    
    do {
        try operations.forEach {
            switch $0 {
            case "POP": try stack.pop()
            case "DUP": try stack.duplicate()
            case "+": try stack.add()
            case "-": try stack.subtract()
            default:
                // push the number into stack
                if let num = Int($0) {
                    stack.push(item: num)
                }
            }
        }
    } catch let error {
        switch error {
        case StackOperationsError.InsufficientIntInStackToPerformOperation:
            print("InsufficientIntInStackToPerformOperation")
        case StackOperationsError.StackIsEmpty:
            print("StackIsEmpty")
        default:
            print("Some Generic error")
        }
    }
    
    // return the top element of the stack as result
    do {
        result = try stack.top() ?? 0
    } catch let error {
        print(error.localizedDescription)
    }
    
    return result
}

// Error handling
enum StackOperationsError: Error {
    case InsufficientIntInStackToPerformOperation
    case StackIsEmpty
}

// define a stack
struct Stack {
    
    var items : [Int] = []
    
    // push
    mutating func push(item : Int) { items.append(item) }
    
    // pop
    @discardableResult
    mutating func pop() throws -> Int? {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        return items.removeLast()
    }
    
    // top
    mutating func top() throws-> Int? {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        return items.last
    }
    
    // duplicate
    mutating func duplicate() throws {
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        if let top = items.last {
            items.append(top)
        }
    }
    
    // addition
    mutating func add() throws {
        // add top 2 items
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        let firstPop = items.removeLast()
        guard !items.isEmpty else { throw StackOperationsError.InsufficientIntInStackToPerformOperation }
        let secondPop = items.removeLast()
        let result = firstPop + secondPop
        items.append(result)
    }
    
    // subtraction
    mutating func subtract() throws {
        // subtract top 2 Ints
        guard !items.isEmpty else { throw StackOperationsError.StackIsEmpty }
        
        let firstPop = items.removeLast()
        guard !items.isEmpty else { throw StackOperationsError.InsufficientIntInStackToPerformOperation }
        let secondPop = items.removeLast()
        let result = firstPop - secondPop
        items.append(result)
    }
}

var input = "3 DUP 5 - -"
let r = solution(&input)
print(r)
