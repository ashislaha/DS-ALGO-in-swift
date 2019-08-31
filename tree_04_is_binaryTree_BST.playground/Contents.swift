//: Playground - noun: a place where people can play

import UIKit

/* Check whether a binary tree is a BST or not */

class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(val : Int) {
        data = val
        left = nil
        right = nil
    }
}

class BinaryTree {
    
    var root : Node?
    var prev : Node?
    
    //Method 1 : Do Inoder traversal
    public func isBST(root : Node?) -> Bool {
        guard let root = root else { return true }
        if isBST(root: root.left) == false { return false }
        if let prev = prev, root.data! < prev.data! { return false } // not in ordered
        prev = root
        return isBST(root: root.right)
    }
    
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator: " ")
        inorder(root: root.right)
    }
    
    // method 2 : using range of min and max
    public func isBSTusingRange(root : Node?, min : Int, max : Int) -> Bool {
        guard let root = root ,let rootData = root.data else { return true }
        
        if rootData > min && rootData < max {
            return isBSTusingRange(root:root.left, min: min, max:rootData-1) && isBSTusingRange(root:root.right, min: rootData+1,max:max)
        }
        return false
    }
}

let binaryTree = BinaryTree()
binaryTree.root = Node(val:10)
binaryTree.root?.left = Node(val: 5)
binaryTree.root?.right = Node(val: 15)
binaryTree.root?.right?.right = Node(val: 12)
binaryTree.inorder(root: binaryTree.root)

print(binaryTree.isBST(root: binaryTree.root))
print(binaryTree.isBSTusingRange(root: binaryTree.root, min: Int.min, max: Int.max))


