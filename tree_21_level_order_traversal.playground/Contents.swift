//: Playground - noun: a place where people can play

import Foundation

/*
 
 level order traversal of a binary tree
 
        1
      2   3
     4 5  6 7
 
 printing - 1, 2, 3, 4, 5, 6, 7
 
 */

class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(val : Int) {
        data = val
    }
}

class BinaryTree {
    
    var root : Node?
    
    // maintain a Queue to track the node in level wise, Time Complexity = O(n)
    public func levelOrderTraversal(root : Node?) {
        guard let root = root else { return }
        
        var Q : [Node] = []
        Q.append(root)
        
        while !Q.isEmpty {
            let pop = Q.removeFirst()
            print(pop.data ?? -1)
            
            // insert left and right of pop node
            if let left = pop.left {
                Q.append(left)
            }
            if let right = pop.right {
                Q.append(right)
            }
        }
    }
}

let tree = BinaryTree()
tree.root = Node(val: 1)
tree.root?.left = Node(val: 2)
tree.root?.right = Node(val: 3)
tree.root?.left?.left = Node(val: 4)
tree.root?.left?.right = Node(val: 5)
tree.root?.right?.left = Node(val: 6)
tree.root?.right?.right = Node(val: 7)

tree.levelOrderTraversal(root: tree.root)




