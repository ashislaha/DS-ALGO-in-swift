import UIKit

class MyHashSet {
	
	// hash function - can be used % with prime number - use array with list
	// chaining - can use a list
	
	private var array: [Node] = []
	private let primeNumber: Int = 37
	
	class Node {
		let value: Int
		var next: Node?
		init(value: Int) {
			self.value = value
		}
	}
	
	/** Initialize your data structure here. */
	init() {
		
		for i in 0...primeNumber-1 {
			array.append(Node(value: i))
		}
	}
	
	func add(_ key: Int) {
		
		// adding also, we need to check whether the item is present or not.
		// as set does not allow duplicate element
		
		let hashValue = key % primeNumber
		
		// check whether the item is present or not
		var child: Node? = array[hashValue].next
		while child != nil {
			if let childValue = child?.value, childValue == key { // value is present, no need to add
				return
			}
			child = child?.next
		}
		
		
		let node = Node(value: key)
		node.next = array[hashValue].next
		array[hashValue].next = node
		
	}
	
	func remove(_ key: Int) {
		
		// if the element is present then delete it, else do not do anything
		
		let hashValue = key % primeNumber
		
		// check whether the item is present or not
		var parent: Node? = array[hashValue].next
		var child: Node? = array[hashValue]
		
		while parent != nil {
			if let parentValue = parent?.value, parentValue == key {
				child?.next = parent?.next
				parent?.next = nil
				break
			}
			child = parent
			parent = parent?.next
		}
		
	}
	
	/** Returns true if this set contains the specified element */
	func contains(_ key: Int) -> Bool {
		
		let hashValue = key % primeNumber
		
		// check whether the item is present or not
		var parent: Node? = array[hashValue].next
		
		while parent != nil {
			if let parentValue = parent?.value, parentValue == key {
				return true
			}
			parent = parent?.next
		}
		
		return false
	}
	
	public func printSet() {
		
		for i in 0...primeNumber-1 {
			var temp: Node? = array[i].next
			while temp != nil {
				let value = temp?.value ?? -1
				print(value)
				temp = temp?.next
			}
		}
	}
}


 // Your MyHashSet object will be instantiated and called as such:

let obj = MyHashSet()
obj.add(2)
obj.add(3)
obj.add(4)
obj.remove(3)
let ret_3: Bool = obj.contains(2)
obj.printSet()


