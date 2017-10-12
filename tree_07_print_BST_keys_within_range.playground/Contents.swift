//: Playground - noun: a place where people can play

import UIKit

/*
    within a certain range k1, k2 print all keys in BST
*/


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
    
    // insert 
    public func insert(val : Int, root : Node?) -> Node {
        if let root = root , let rootData = root.data {
            if val < rootData {
                root.left = insert(val: val, root: root.left)
            } else if val > rootData {
                root.right = insert(val: val, root: root.right)
            }
            return root
        } else {
            return Node(val: val)
        }
    }
    
    // print inorder
    public func inorder(root : Node?) {
        guard let root = root  else { return }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator : " ")
        inorder(root: root.right)
    }

    // print within range
    public func printWithinRange(root : Node? , k1 : Int, k2 : Int) {
    
        if let root = root, let rootData = root.data {
            if k1 <= rootData && rootData <= k2 {
                print(rootData)
            }
            if k1 < rootData {
                printWithinRange(root: root.left, k1: k1, k2: k2)
            }
            if k2 > rootData  {
                printWithinRange(root: root.right, k1: k1, k2: k2)
            }
        }
    }
}

let bst = BST()
bst.root = nil
bst.root = bst.insert(val: 20, root: bst.root)
bst.insert(val: 8, root: bst.root)
bst.insert(val: 22, root: bst.root)
bst.insert(val: 4, root: bst.root)
bst.insert(val: 12, root: bst.root)


// print inorder
print("Inorder :")
bst.inorder(root: bst.root)

// print with in range
let k1 = 10
let k2 = 21
print("\n\nRange value of \(k1) and \(k2):")
bst.printWithinRange(root: bst.root, k1: k1, k2: k2)










