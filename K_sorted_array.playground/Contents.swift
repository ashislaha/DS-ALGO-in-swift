import UIKit


 // Definition for singly-linked list.
public class ListNode {
	public var val: Int
	public var next: ListNode?
	public init() { self.val = 0; self.next = nil; }
	public init(_ val: Int) { self.val = val; self.next = nil; }
	public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
 
class Solution {
	func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
		
		var result: ListNode?
		var resultEndPtr: ListNode?
		var lists = lists
		
		while true {
			
			// compare all the k nodes
			var minNode: ListNode?
			var i: Int = -1
			
			// this section is taking O(k) time and can be improved to log(k) using min-heap
			for (index, each) in lists.enumerated() {
				
				if let each = each { // not nil
					if each.val < (minNode?.val ?? Int.max) {
						minNode = each
						i = index
					}
				}
			}
			
			if minNode == nil {
				// we covered all the nodes
				return result
			}
			
			// result updating
			if result == nil {
				// first time updating the result
				result = minNode
				resultEndPtr = minNode
			} else {
				resultEndPtr?.next = minNode
				resultEndPtr = minNode
			}
			
			// update the list pointers
			lists[i] = lists[i]?.next
			resultEndPtr?.next = nil
		}
	}
}

class MinHeap {
    
    private var arr: [(Int, Int)] = [] // item and which list they belongs
    private var heapSize: Int = 0
    
    init(array: [(Int, Int)]) {
        arr = array
        heapSize = array.count
        createHeap()
    }
    
    func createHeap() {
        guard heapSize != 0 else { return }
        
        var i = heapSize / 2;
        while i >= 0 {
            heapify(i)
			i -= 1
        }
    }
    
    func getMin() -> (Int, Int) {
        guard heapSize != 0 else { return (-1, -1) }
        
        return arr[0]
    }
    
    func insertAndHeapify(_ item: (Int, Int) ) {
        guard heapSize != 0 else { return }
        
        arr[0] = item
        heapify(0)
    }
    
    func heapify(_ index: Int) {
        let leftIndex = left(index)
        let rightIndex = right(index)
        
        var minValueIndex = index
        var minValue = arr[index].0
        
        if leftIndex < heapSize && arr[leftIndex].0 < minValue {
            minValueIndex = leftIndex
            minValue = arr[leftIndex].0
        }
        if rightIndex < heapSize && arr[rightIndex].0 < minValue {
            minValueIndex = rightIndex
            minValue = arr[rightIndex].0
        }
        
        if minValueIndex != index {
            // swap between minValueIndex and index
            arr.swapAt(index, minValueIndex)
            heapify(minValueIndex)
        }
    }
    
    private func left(_ index: Int) -> Int { return 2*index + 1 }
    private func right(_ index: Int) -> Int { return 2*index + 2 }
}
