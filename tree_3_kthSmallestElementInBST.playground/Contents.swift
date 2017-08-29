//: Playground - noun: a place where people can play

import UIKit

// Using Augmented Tree / order statistics 

class BST {
    
    var root : Node?

    class Node {
    
        var data : Int?
        var left : Node?
        var right : Node?
        var lCount : Int = 0
        
        init(data : Int) {
            self.data = data
            self.lCount = 0
            self.left = nil
            self.right = nil
        }
    }

    // Insertion 
    
    public func insert(val : Int, root : Node?) -> Node {
    
        if let root = root, let rootVal = root.data {
            
            if val < rootVal {
                root.lCount += 1
                root.left = insert(val: val, root: root.left)
            
            } else if val > rootVal {
                root.right = insert(val: val, root: root.right)
            }
            return root
        
        } else {
            return Node(data: val)
        }
    }
    
    
    // Find kth Smallest element 
    
    public func kthSmallestElement(k : Int, root : Node?) -> Int? {
        guard let root = root else { return nil }
        
        if k < root.lCount+1 {
            // traverse left tree
            return kthSmallestElement(k: k, root: root.left)
        
        } else if k > root.lCount+1 { // traverse right
            
            return kthSmallestElement(k: k-root.lCount-1, root: root.right)
        
        } else { // it's the root node
            return root.data
        }
    }
    
    // Inorder of BST
    
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator : " ")
        inorder(root: root.right)
        
    }
    
}


let bst = BST()
bst.root = nil


bst.root = bst.insert(val: 10, root: bst.root)
bst.insert(val: 20, root: bst.root)
bst.insert(val: 30, root: bst.root)
bst.insert(val: 5, root: bst.root)
bst.insert(val: 7, root: bst.root)
bst.insert(val: 15, root: bst.root)

if let small = bst.kthSmallestElement(k: 5, root: bst.root) {
    print("\(5)th smallest element : \(small)")
}
bst.inorder(root: bst.root)







