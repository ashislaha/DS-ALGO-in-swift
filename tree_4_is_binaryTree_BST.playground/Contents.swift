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
    
    public func isBST(root : Node?) -> Bool {
        guard let root = root else { return true }
        
        // Do Inoder traversal
        
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
}

let binaryTree = BinaryTree()
binaryTree.root = Node(val:10)
binaryTree.root?.left = Node(val: 5)
binaryTree.root?.right = Node(val: 15)
binaryTree.root?.right?.right = Node(val: 12)
binaryTree.inorder(root: binaryTree.root)

print(binaryTree.isBST(root: binaryTree.root))


