//: Playground - noun: a place where people can play

import UIKit

/*
 
 Heap is mostly used as a priority Queue .
 We can perform the follwing ops on heap :
 
 1. Insert(key : Int) // O(log n)
 2. Delete(key : Int) // O(log n)
 3. decreaseKey(key : Int, priority : Int ) // O(log n)
 4. extractMin()
 
 */

// MIN-HEAP

class Node {
    var data : Int?
    init(val : Int) {
        data = val
    }
}

class Heap {
    
    // heap_array , heap_size
    var heap_arr : [Node] = []
    var heap_size = 0
    
    init(arr : [Int]) {
        for item in arr {
            heap_arr.append(Node(val: item))
        }
        heap_size = arr.count
        createHeap()
    }
    
    // create heap
    public func createHeap() {
        var i = (heap_size-1) / 2
        while i >= 0 {
            heapify(index: i)
            i -= 1
        }
    }
    
    // Heapify
    public func heapify(index : Int ){
        let left = 2 * index + 1
        let right = 2 * index + 2
        
        print("left : \(left) , right : \(right)")
        guard let item = heap_arr[index].data else { return }
        
        var smallest = index
        
        // find the smallest element
        if left < heap_size {
            if let leftItem = heap_arr[left].data, leftItem < item {
                smallest = left
            }
        }
        
        if right < heap_size {
            if let rightItem = heap_arr[right].data, let smallestElement = heap_arr[smallest].data , rightItem < smallestElement {
                smallest = right
            }
        }
        
        // swap if required
        if smallest != index {
            swap(&heap_arr[index], &heap_arr[smallest])
            heapify(index: smallest)
        }
    }
    
    
    // insert
    public func insert(val : Int ) {
        
        // append at the end
        heap_size += 1
        heap_arr.append(Node(val: val))
        
        // check with parent to maintain the heap-property
        var index = heap_size-1
        var parent = (index - 1) / 2

        while let parentData = heap_arr[parent].data, let childData = heap_arr[index].data, childData < parentData, index != 0 {
            swap(&heap_arr[parent], &heap_arr[index])
            print("swapping at \(heap_arr[parent].data ?? -1) & \(heap_arr[index].data ?? -1)")
            index = parent
            parent = (index - 1) / 2
        }
    }
    
    // print
    public func printHeap() {
        print("\n")
        for item in heap_arr {
            print(item.data ?? -1 , terminator : " ")
        }
    }
    
    // decreaseKey
    
    //extractMin
    
    // delete
    
}

let arr : [Int] = [10,20,30,15,25,35]
let heap = Heap(arr: arr)
heap.printHeap()

heap.insert(val: 12)
heap.printHeap()

