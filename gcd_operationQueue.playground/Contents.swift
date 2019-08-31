import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// 1. sort clousure
let sortClosure = {
    let array = [ 704147158, 42836771, 151385606, 22744961, 82017990, 417886331, 137670726 ]
    _ = array.sorted()
}

// 2. Define measure function with multiple back-ground queues
func measure(block: @escaping () -> Void, count: Int = 50, completion: @escaping (Double) -> Void) {
    
    // 3. accumulate total
    var measureTotal = Double(0)
    
    // 4. initialise dispatch Group
    let dispatchGroup = DispatchGroup()
    
    for _ in 0 ..< count {
        
        // 5. create back-ground queue
        DispatchQueue.global(qos: .background).async {
            
            // 6. entering into dispatch group
            dispatchGroup.enter()
            
            // 7. calculate measure
            let measureSingle = measure(block: block)
            
            // 8. update total
            measureTotal += measureSingle
            
            // 9. leaving dispatch group
            dispatchGroup.leave()
        }
    } // 10. finish all queues
    
    
    // 11. dispatch group notifies to main queue that all blocks are executed completely
    dispatchGroup.notify(queue: .main) {
        
        // 12. calcuate average
        let measuredAverage = measureTotal / Double(count)
        
        // 13. return the result in completion handler
        completion(measuredAverage)
    }
}

measure( block: sortClosure, count: 100, completion: { (measuredAverage) in
    print("measure using multiple back ground thread: \(measuredAverage)")
})

func measure(block: @escaping () -> Void) -> Double {
    let date = Date()
    block()
    return -Double(date.timeIntervalSinceNow)
}

let measuredSingle = measure(block: sortClosure)
print("measured using Single Thread: \(measuredSingle)")


// execute it in NSOperationQueue instead of GCD

func measureInOperationQueue(block: @escaping () -> Void, count: Int = 50, completion: @escaping (Double) -> Void) {
    
    var measureTotal = Double(0)
    let operationQueue = OperationQueue()
    let dispatchGroup = DispatchGroup()
    
    for index in 0 ..< count { // adding number of block operations
        
        dispatchGroup.enter()
        let operation = BlockOperation {
            let measureSingle = measure(block: block)
            measureTotal += measureSingle
            print(index, measureTotal, measureSingle)
        }
        operationQueue.addOperation(operation)
        dispatchGroup.leave()
    }
    
    dispatchGroup.notify(queue: .main) {
        print("dispatch group will notify to main queue: \(measureTotal) ")
        let measuredAverage = measureTotal / Double(count)
        completion(measuredAverage)
    }
}

measureInOperationQueue( block: sortClosure, count: 50, completion: { (measuredAverage) in
        print("measure average using Operation Queue: \(measuredAverage)")
})


