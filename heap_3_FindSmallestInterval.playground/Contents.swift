

/*
 
    problem statement: given k number of sorted arrary
    find out the smallest interval in k number of sorted array:
 
    Example: [
                [0,1,4,17,20,25,31],
                [5,6,10],
                [0,3,7,8,12]
    ]
 
    smallest inteval [3,5] as 4 is picked from 1st array, 5 is picked from 2nd array, 3 is picked from 3rd array
 
 */


/*
    Solution:
 
        -- 1. lets create min heap of k size
        -- 2. check the distance (min and max) in the heap (will take O(k) time to find out the max) and update the interval if needed
        -- 3. pick the minimum one and replace it next item in the same array
        -- 4. heapify
        -- 5. repeat 2 to 5 until an array is finished.
 */


struct HeapElement {
    let value: Int
    var arrayIndex: Int // specify the current array index
    var indexInsideArray: Int // says the current index inside array
}

// create a heap of size k
class MinHeap {
    
    private var heap: [HeapElement] = []
    private var heapSize: Int = 0
    
    init(input: [HeapElement]) {
        heap = input
        heapSize = input.count
        createHeap()
    }
    
    private func createHeap() {
        guard !heap.isEmpty else { return }
        
        var i = (heapSize-1) / 2
        while i >= 0 {
            heapify(i)
            i -= 1
        }
    }
    
    private func heapify(_ index: Int) {
        var smallest = index
        let left = leftIndex(index)
        let right = rightIndex(index)
        
        if left < heapSize && heap[left].value < heap[smallest].value {
            smallest = left
        }
        if right < heapSize && heap[right].value < heap[smallest].value {
            smallest = right
        }
        
        if index != smallest {
            // swap between smallest and index
            heap.swapAt(smallest, index)
            heapify(smallest)
        }
    }
    
    private func leftIndex(_ index: Int) -> Int { return 2 * index + 1 }
    private func rightIndex(_ index: Int) -> Int { return 2 * index + 2 }
    
    // public property
    public func getMin() -> HeapElement? {
        return heap.first
    }
    
    public func getMax() -> HeapElement? {
        guard !heap.isEmpty else { return nil }
        var max = heap[0]
        for i in 1..<heapSize {
            if heap[i].value > max.value {
                max = heap[i]
            }
        }
        return max
    }
    
    public func insert(element: HeapElement) {
        guard !heap.isEmpty else { return }
        heap[0] = element
        heapify(0)
    }
}


class ClosestSet {
    
    private var input: [[HeapElement]] = []
    private var arrayIndexToTotalCountDict: [Int: Int] = [:]
    
    var resultSet: (Int, Int) = (0, Int.max)
    
    init(input: [[Int]]) {
        
        // update input matrix
        for (index, each) in input.enumerated() {
            arrayIndexToTotalCountDict[index] = each.count
            
            var tempArray: [HeapElement] = []
            for (elementIndex, element) in each.enumerated() {
                let heapElement = HeapElement(value: element, arrayIndex: index, indexInsideArray: elementIndex)
                tempArray.append(heapElement)
            }
            self.input.append(tempArray)
        }
        
      
        
        // initialise min heap based on number of arrays
        
        // arrayIndexToTotalCountDict contains the array number and the number of elements of each array.
        var minHeapInput: [HeapElement] = []
        for (key, value) in arrayIndexToTotalCountDict {
            if value > 0 { // the array contains some data
                minHeapInput.append(self.input[key][0])
            }
        }
        let minHeap = MinHeap(input: minHeapInput)
        
        while true {
            // iterate over until one of the array reached to last element
            guard let min = minHeap.getMin(), let max = minHeap.getMax() else { break }
            
            let difference = max.value - min.value
            if difference < resultSet.1 - resultSet.0 {
                resultSet = (min.value, max.value)
            }
            print("ResultSet...progress... \(resultSet)")
            
            
            // find out the next element for insertion into heap
            let currentElementIndex = min.indexInsideArray
            let nextIndex = currentElementIndex + 1
            let currentArraySize = arrayIndexToTotalCountDict[min.arrayIndex] ?? 0
            
            if nextIndex < currentArraySize {
                // proceed
                minHeap.insert(element: self.input[min.arrayIndex][nextIndex])
            } else {
                // you reach to the final step
                break
            }
        }
        print("\nFinal ResultSet", resultSet)
    }
    
}


let input: [[Int]] = [
    [0,1,4,17,20,25,31],
    [5,6,10],
    [0,3,7,8]
]

let _ = ClosestSet(input: input)

