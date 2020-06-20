import Foundation

/*
	let's design a LRU cache

	the cache will keep the records which are most recently used and remove the records which are least recently used.

	given: input stream - 1,2,3,4,1,2,5,1,2,3,4,5
	
	cache size - 3
	
	how to design?
	- we need a hashset to maintain the current state of the cache. (identify the elemenets are present in the cache)
	- maintain a Queue (use linked list) - to keep the items ordered based on their freshness.

*/

class Node {
	let value: Int
	var next: Node?
	
	init(value: Int) {
		self.value = value
	}
}

class LRUQueue {
	
	var root: Node?
	var queueSize: Int = 0
	
	func push(item: Int) {
		
		if root == nil {
			root = Node(value: item)
		} else {
			// push at top
			let node = Node(value: item)
			node.next = root
			root = node
		}
		queueSize += 1
	}
	
	func moveFront(nodeValue: Int) {
		
		// If root Value is same as nodeValue -- node change in Queue
		guard let rootValue = root?.value, rootValue != nodeValue else {
			return
		}
		
		// find out the item and move it front
		var parent = root
		var child = root
		
		while let parentNode = parent, parentNode.value != nodeValue {
			child = parent
			parent = parent?.next
		}
		
		if parent != nil { // let's move it
			child?.next = parent?.next
			parent?.next = root
			root = parent
		}
	}
	
	func deleteLastItem() -> Node? {
		
		guard root != nil else {
			return nil
		}
		
		// loop to the end of the list
		var parent = root
		var child = root
		
		while parent?.next != nil {
			child = parent
			parent = parent?.next
		}
		
		// delete it
		child?.next = parent?.next // and parent.next is already nil already
		queueSize -= 1
		return parent
	}
	
	func printQueue() {
		var item = root
		print("Queue:")
		while let value = item?.value {
			print(value)
			item = item?.next
		}
	}
}

class LRU {
	
	var size: Int // define the LRU cache size limit
	init(size: Int) {
		self.size = size
	}
	
	private var q = LRUQueue()
	private var set: Set<Int> = Set()
	
	func processRequest(item: Int) -> Bool {
		
		var cacheHit = false
		
		if set.contains(item) { // item is present in the cache // hit
			q.moveFront(nodeValue: item)
			cacheHit = true
			
		} else { // item is not present in the cache // miss
			
			// 1. update set
			set.insert(item)
			
			// 2. insert to the front of the queue
			q.push(item: item)
			
			// delete the last item only if it Queue size crossed LRU limit
			if q.queueSize > size {

				// 3. delete the last element of the queue // least frequently used item
				if let leastItem = q.deleteLastItem() {
					
					// 4. delete the leastItem from hashSet
					set.remove(leastItem.value)
				}
			}
			cacheHit = false
		}
		
		// print internal state of LRU
		print(q.printQueue())
		
		return cacheHit
	}
}

// Test
let inputs: [Int] = [1,2,3,4,1,2,5,1,2,3,4,5]
let LRUObject = LRU(size: 3)

var cacheHitsRecords: [Bool] = []

for each in inputs {
	print("\nInputs: ",inputs)
	print("processing: \(each)")
	
	let hit = LRUObject.processRequest(item: each)
	
	print("cacheHit: \(hit)")
	cacheHitsRecords.append(hit)
}

print("\n", cacheHitsRecords)
let hits = cacheHitsRecords.filter { $0 == true }
let percentage = Double(hits.count) / Double(cacheHitsRecords.count) * 100.0
print("Hit percentage = \(percentage) %")


