//: Playground - noun: a place where people can play

//import UIKit
//import Foundation

// Let's create a linked list 

class LinkedList {

    var root : Node?
    
    class Node {
        var value : Int?
        var next : Node?
        
        init(value : Int) {
            self.value = value
            self.next = nil
        }
    }
    
    public func addToList(val : Int, root : Node?) -> Node {
    
        if let rootNode = root {
            // traverse till end and append it 
            var traverseNode : Node? = rootNode
            while(traverseNode?.next != nil) {
                traverseNode = traverseNode?.next
            }
            
            // add the new node
            traverseNode?.next = Node(value: val)
            return rootNode
        } else {
            let node = Node(value: val)
            return node
        }
    }

    public func printList(root : Node?) {
        var traverseNode : Node? = root
        while(traverseNode != nil ) {
            print(traverseNode?.value ?? -1)
            traverseNode = traverseNode?.next
        }
    }
    
    public func reverse(root : Node?) -> Node? {
        guard let root = root else { return nil }
        
        var next : Node? = root
        var prev : Node?
        var cur : Node? = root
        
        while(cur != nil) {
            next = cur?.next
            cur?.next = prev
            
            prev = cur
            cur = next
        }
        return prev
    }
}


let linkedList = LinkedList()
linkedList.root = nil

linkedList.root = linkedList.addToList(val: 1, root: linkedList.root)
linkedList.addToList(val: 2, root: linkedList.root)
linkedList.addToList(val: 3, root: linkedList.root)
linkedList.addToList(val: 4, root: linkedList.root)
print("Initial List :")
linkedList.printList(root: linkedList.root)

linkedList.root = linkedList.reverse(root: linkedList.root)
print("After Reverse List :")
linkedList.printList(root: linkedList.root)





