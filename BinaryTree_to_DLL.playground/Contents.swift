import UIKit

class Node {
	let value: Int
	var left: Node?
	var right: Node?
	var prev: Node?
	var next: Node?
	
	init(value: Int) {
		self.value = value
	}
}


class Tree {
	
	var root: Node?
	
	// used for procesing
	var previous: Node?
	var head: Node? // DLL head
	
	// calculate forward flow
	func DLLForwardBackwar(current: Node?) {
		
		guard current != nil else { return }
		
		print("processing start => ", current?.value ?? "")
		
		DLLForwardBackwar(current: current?.left)
		
		if previous == nil {
			// root of DLL
			head = current
		} else {
			// point from previous to current node
			previous?.next = current
			current?.prev = previous // we can update previous pointer at the same // no need of DLLBackward
		}
		previous = current
		
		DLLForwardBackwar(current: current?.right)
		
		print("processing finish => ", current?.value ?? "")
	}
	
	func DLLBackward(current: Node?) {
		
		var parent: Node? = current
		var child: Node? = nil
		
		while parent != nil {
			parent?.prev = child
			child = parent
			parent = parent?.next
		}
	}
	
	func convertTreeToDLL() {
		guard let root = root else { return }
		
		DLLForwardBackwar(current: root)
		//DLLBackward(current: head)
		
		print("\n print the linked list")
		var node: Node? = head
		while node != nil {
			print("\(node?.prev?.value ?? -1) <-- \(node?.value ?? -1) --> \(node?.next?.value ?? -1)")
			node = node?.next
		}
	}
}

// create a tree
let tree = Tree()
tree.root = Node(value: 1)
tree.root?.left = Node(value: 2)
tree.root?.left?.left = Node(value: 4)
tree.root?.left?.right = Node(value: 5)
tree.root?.right = Node(value: 3)
tree.root?.right?.right = Node(value: 7)

tree.convertTreeToDLL()

