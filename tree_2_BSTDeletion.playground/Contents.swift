//: Playground - noun: a place where people can play

import UIKit

class BST {

    var root : Node?
    
    class Node {
        var data : Int?
        var left : Node?
        var right : Node?
        
        init(value : Int) {
            self.data = value
            self.left = nil
            self.right = nil
        }
    }
    
    //MARK:- Insert
    
    public func insert(val : Int, root : Node?) -> Node {
        if let root = root, let rootValue = root.data {
            if val < rootValue {
                root.left  = insert(val: val, root: root.left)
            
            } else if val > rootValue {
                root.right = insert(val: val, root: root.right)
            }
            
            return root
        
        } else {
            return Node(value: val)
        }
    }
    
    //MARK:- Inorder
    
    public func inorder(root : Node?) {

        if let root = root {
            if root.data != nil {
                inorder(root: root.left)
                print(root.data ?? -1, terminator: " ")
                inorder(root: root.right)
            }
        }
    }
    
    
    
    //MARK:- Deletion 
    
    public func delete(val : Int, root : Node?) -> Node? {
        
        guard let root = root else { return nil }
        guard let rootData = root.data else { return nil }
        
        if val < rootData {
            root.left = delete(val: val, root: root.left)
        
        } else if val > rootData {
            root.right = delete(val: val, root: root.right)
        
        } else { // same val 
                // check one child
            
            if root.left == nil {
                return root.right
            } else if root.right == nil {
                return root.left
            } else {
                if let minValue = successor(root: root.right) {
                    root.data = minValue
                    root.right = delete(val: minValue, root: root.right)
                }
            }
        }
        return root
    }
    
    //MARK:- Inorder Successor 
    
    public func successor(root : Node?) -> Int? {
        
        guard let root = root else { return nil }
        
        var minVal : Int? = root.data
        var tempRoot : Node? = root
        while tempRoot?.left != nil {
            tempRoot = tempRoot?.left
            minVal = tempRoot?.data
        }
        
        return minVal
    }
}


// Do operarions

let bst = BST()
bst.root = nil

bst.root = bst.insert(val: 20, root: bst.root)
bst.insert(val: 30, root: bst.root)
bst.insert(val: 10, root: bst.root)
bst.insert(val: 40, root: bst.root)
bst.insert(val: 15, root: bst.root)

bst.inorder(root: bst.root)
print("\n")
bst.root = bst.delete(val: 20, root: bst.root)
bst.inorder(root: bst.root)








