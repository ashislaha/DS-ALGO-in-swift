//: Playground - noun: a place where people can play

import UIKit

// Min Heap Implementation //

class Heap {
    
    var heap_arr : [Int] = []
    var heap_size : Int = 0
    
    init(arr : [Int], n : Int) {
        heap_arr = arr
        heap_size = n
        createHeap()
    }
    
    // left index
    public func getLeft(index : Int ) -> Int { return 2*index + 1 }
    // right index
    public func getRight(index : Int) -> Int { return 2*index + 2 }
    // create heap 
    public func createHeap() {
        var i = (heap_size - 1 ) / 2
        while i >= 0  {
            heapify(index: i)
            i -= 1
        }
        print("Heap Create : \(heap_arr) \n")
    }
    
    // heapify 
    public func heapify(index : Int) {
        let left = getLeft(index: index)
        let right = getRight(index: index)
        var smallest = index
        // find the smallest element 
        if left < heap_size && heap_arr[left] < heap_arr[index] { smallest = left }
        if right < heap_size && heap_arr[right] < heap_arr[smallest] { smallest = right }
        
        // if smallest changes
        if smallest != index {
            // swap element and call heapify
            swap(&heap_arr[smallest], &heap_arr[index])
            heapify(index: smallest)
        }
    }
    
    // heap sort
    public func heapSort() {
        while heap_size > 1 {
            swap(&heap_arr[0], &heap_arr[heap_size-1]) // replace 1st element with last element
            heap_size -= 1 // decrease heap_size
            heapify(index: 0) // do heapify until all are covered
        }
    }
}

let arr = [10, 30, 5, 50, 25, 15, 35, 22]
let heap = Heap(arr: arr, n: arr.count)
heap.heapSort()
print("Sorted Array : \(heap.heap_arr)")




