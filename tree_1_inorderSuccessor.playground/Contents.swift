//: Playground - noun: a place where people can play

import UIKit


class BST {

    var root : Node?
    
    class Node {
        var data : Int?
        var left : Node?
        var right : Node?
        
        init(val : Int) {
            self.data = val
            self.right = nil
            self.left = nil
        }
    }

    // MARK:- Insert
    
    public func insert(val : Int , root : Node?) -> Node {
        if let root = root , let rootVal = root.data {
            if val < rootVal {
                root.left = insert(val: val, root: root.left)
            } else if val > rootVal {
                root.right = insert(val: val, root: root.right)
            }
            return root
        } else {
            return Node(val: val)
        }
    }
    
    // MARK:- Inorder 
    
    public func inorder(root : Node?) {
        guard let root = root else { return }
        inorder(root: root.left)
        print(root.data ?? -1 , terminator : " ")
        inorder(root: root.right)
    }
    
    
    // MARK:- Inorder Successor and Predecessor 
    
    public func inorderSuccessorAndPredecessor(key : Int, root : Node?) -> (Int, Int) {
        guard let root = root else { return (-1,-1) }
        
        // Identify the Key position
        // Predecessor present in left-subtree & then right-most branch 
        // Successor present in right-subtree & then left-most branch 
        
        var tempRoot : Node? = root
        var parent : Node?  = root // used for leaf node
        
        while tempRoot != nil {
            parent = tempRoot
            
            if let rootVal = tempRoot?.data {
                if key < rootVal { // traverse left
                    tempRoot = tempRoot?.left
                } else if key > rootVal { // traverse right
                    tempRoot = tempRoot?.right
                } else {
                    
                    print("\nKey Present : \(key)")
                    
                    // find out successor 
                    var successor = -1
                    let rightTree = tempRoot?.right
                    if rightTree != nil  {
                        var leftTree = rightTree?.left
                        while leftTree?.left != nil {
                            leftTree = leftTree?.left
                        }
                        successor = leftTree?.data ?? -1
                    } else {
                        if let keyVal = tempRoot?.data , let rootVal = root.data , keyVal < rootVal { // sucessor is parent node data
                            successor = parent?.data ?? -1
                        }
                    }
                    
                    // find out predecessor 
                    
                    var predecessor = -1
                    let leftTree = tempRoot?.left
                    if leftTree != nil  {
                        var rightTree = leftTree?.right
                        while rightTree?.right != nil {
                            rightTree = rightTree?.right
                        }
                        predecessor = rightTree?.data ?? -1
                    } else {
                        if let rootVal = root.data , let keyValue = tempRoot?.data , keyValue > rootVal { // sucessor is parent node data
                            predecessor = parent?.data ?? -1
                        }
                    }
                    return (successor, predecessor)
                }
            }
        }
        return (-1,-1)
    }
}


let bst = BST()
bst.root = nil

bst.root = bst.insert(val: 10, root: bst.root)
bst.insert(val: 5, root: bst.root)
bst.insert(val: 3, root: bst.root)
bst.insert(val: 7, root: bst.root)
bst.insert(val: 20, root: bst.root)
bst.insert(val: 15, root: bst.root)
bst.insert(val: 25, root: bst.root)
bst.insert(val: 18, root: bst.root)

print("Inorder of BST :")
bst.inorder(root: bst.root)

print("Predecessor & Successor : \(bst.inorderSuccessorAndPredecessor(key: 10, root: bst.root))")
print("Predecessor & Successor : \(bst.inorderSuccessorAndPredecessor(key: 5, root: bst.root))")





