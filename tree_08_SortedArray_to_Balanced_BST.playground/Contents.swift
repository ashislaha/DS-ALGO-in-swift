//: Playground - noun: a place where people can play

import UIKit

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
    
    // create tree from sorted array 
    
    public func createTreeFromSortedArray(arr : [Int], start : Int, end : Int) -> Node? {
        
        if start > end { return nil }
        let mid = (start + end) / 2
        let node = Node(val: arr[mid])
        node.left = createTreeFromSortedArray(arr: arr, start: start, end: mid-1)
        node.right = createTreeFromSortedArray(arr: arr, start: mid+1, end: end)
        return node
    }
    
    // preorder
    public func preorder(root : Node?) {
        guard let root = root else { return }
        print(root.data ?? -1)
        preorder(root: root.left)
        preorder(root: root.right)
    }
    
    // inorder
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? -1)
        inorder(root: root.right)
    }
}

// Testing 
let bst = BST()
var arr = [1,2,3,4,5,6,7,8,9]
bst.root = bst.createTreeFromSortedArray(arr: arr, start: 0, end: arr.count-1)

print("\nPreorder :")
bst.preorder(root: bst.root)
print("\nInorder  :")
bst.inorder(root: bst.root)


