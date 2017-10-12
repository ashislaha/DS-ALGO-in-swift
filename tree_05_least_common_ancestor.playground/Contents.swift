//: Playground - noun: a place where people can play

import UIKit

/*  least common ancestor of a BST between 2 nodes */

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

class BST {

    var root : Node?
    
    // LCA of two node
    public func lca(root : Node? , val1 : Int, val2 : Int) -> Node? {
        guard let root = root else { return nil }
        guard let rootVal = root.data else { return nil }
        
        if val1 < rootVal && val2 < rootVal { // search on left tree
            return lca(root: root.left, val1: val1, val2: val2)
        } else if val1 > rootVal && val2 > rootVal { // search on right tree
            return lca(root:root.right, val1:val1 , val2:val2)
        }
        return root
    }
    
    // Insert into BST 
    public func insert(root : Node? , val : Int) -> Node {
    
        if let root = root, let rootData = root.data {
            if val < rootData {
                root.left = insert(root: root.left, val: val)
            } else if val > rootData {
                root.right = insert(root: root.right, val: val)
            }
            return root
        } else {
            return Node(val: val)
        }
    }
    
    // inoder of BST
    public func inorder(root : Node?) {
        guard let root = root  else { return }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator : " ")
        inorder(root: root.right)
    }
}

let bst = BST()
bst.root = nil
bst.root = bst.insert(root: bst.root, val: 10)
bst.insert(root: bst.root, val: 20)
bst.insert(root: bst.root, val: 5)
bst.insert(root: bst.root, val: 15)
bst.insert(root: bst.root, val: 4)
bst.insert(root: bst.root, val: 7)

bst.inorder(root: bst.root)

var node1 = 5
var node2 = 20
var node = bst.lca(root: bst.root, val1: node1, val2: node2)
print("\nlca  of \(node1) & \(node2) = \(node?.data ?? -1)")


node1 = 4
node2 = 7
node = bst.lca(root: bst.root, val1: node1, val2: node2)
print("lca  of \(node1) & \(node2) = \(node?.data ?? -1)")





