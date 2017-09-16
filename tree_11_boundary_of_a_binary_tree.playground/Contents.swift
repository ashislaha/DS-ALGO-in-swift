//: Playground - noun: a place where people can play

import UIKit

/*
 create a Binary Tree : print the leaves, left, right view of the tree
 
                 1
                / \
               2   3
              / \  /
             4   5 7
              \  /  \
              20 6   8
                    / \
                   9  10
 
 Anti-clockwisw leaves: [20,6,9,10]
 Clockwisw leaves: [10,9,6,20]
 Anti-clockwisw Left tree: [1,2,4,20]
 Clockwisw Left tree: [20,4,2,1]
 Anti-clockwisw Right tree: [10,8,7,3,1]
 Clockwisw Right tree: [1,3,7,8,10]
 
 */

enum traverse {
    case clockwise
    case antiClockwise
}

class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(val: Int) {
        data = val
        left = nil
        right = nil
    }
}

class BinaryTree {
    
    var root : Node?
    
    // print the leaves of tree
    public func printLeaves(root : Node?, traversal : traverse ) {
        
        guard let root = root , let rootData = root.data else { return }
        
        if root.left == nil && root.right == nil {
            print("\(rootData)")
        } else {
            switch traversal {
            case .antiClockwise :
                printLeaves(root: root.left, traversal: traversal)
                printLeaves(root: root.right, traversal: traversal)
            case .clockwise :
                printLeaves(root: root.right, traversal: traversal)
                printLeaves(root: root.left, traversal: traversal)
            }
        }
    }
    
    // print left side of the binary tree
    public func printLeft(root : Node?, traversal : traverse) {
        guard let root = root , let rootData = root.data else { return }
        
        switch traversal {
        case .antiClockwise:
            print(rootData)
            if root.left != nil {
                printLeft(root: root.left, traversal: traversal)
            } else if root.right != nil {
                printLeft(root: root.right, traversal: traversal)
            }
        case .clockwise:
            if root.left != nil {
                printLeft(root: root.left, traversal: traversal)
            } else if root.right != nil {
                printLeft(root: root.right, traversal: traversal)
            }
            print(rootData)
        }
    }
    
    // print the right side of the binary tree
    public func printRightTree(root : Node? , traversal : traverse) {
        guard let root = root , let rootData = root.data else { return }
        
        switch traversal {
        case .antiClockwise:
            if let right = root.right {
                printRightTree(root: right, traversal: traversal)
            } else if let left = root.left {
                printRightTree(root: left, traversal: traversal)
            }
            print(rootData)
            
        case .clockwise:
            print(rootData)
            if let right = root.right {
                printRightTree(root: right, traversal: traversal)
            } else if let left = root.left {
                printRightTree(root: left, traversal: traversal)
            }
            
        }
    }
}

let bt = BinaryTree()
bt.root = Node(val: 1)

bt.root?.left = Node(val: 2)
bt.root?.left?.left = Node(val: 4)
bt.root?.left?.left?.right = Node(val: 20)
bt.root?.left?.right =  Node(val: 5)
bt.root?.left?.right?.left = Node(val: 6)

bt.root?.right = Node(val: 3)
bt.root?.right?.left = Node(val: 7)
bt.root?.right?.left?.right = Node(val: 8)
bt.root?.right?.left?.right?.left = Node(val: 9)
bt.root?.right?.left?.right?.right = Node(val: 10)

print("Anti-clockwisw leaves:")
bt.printLeaves(root: bt.root, traversal: .antiClockwise)

print("Clockwisw leaves:")
bt.printLeaves(root: bt.root, traversal: .clockwise)

print("Anti-clockwisw Left tree:")
bt.printLeft(root: bt.root, traversal: .antiClockwise)

print("Clockwisw Left tree:")
bt.printLeft(root: bt.root, traversal: .clockwise)

print("Anti-clockwisw Right tree:")
bt.printRightTree(root: bt.root, traversal: .antiClockwise)

print("Clockwisw Right tree:")
bt.printRightTree(root: bt.root, traversal: .clockwise)





