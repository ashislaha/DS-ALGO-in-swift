//: Playground - noun: a place where people can play

import UIKit
import Foundation

class Node {
    var data : Int?
    var left : Node?
    var right : Node?
    
    init(data : Int) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

class BST {
    
    var root : Node?
    
    public func insert(rootNode : Node? , data : Int) -> Node {
        if let root = rootNode, let rootData = root.data {
            if data <= rootData {
                root.left = insert(rootNode: root.left, data: data)
            } else if data > rootData {
                root.right = insert(rootNode: root.right, data: data)
            }
            return root
        } else {
            return Node(data: data)
        }
    }
    
    public func inorder(rootNode : Node?) {
        
        guard let rootNode = rootNode else { return }
        inorder(rootNode: rootNode.left)
        print(rootNode.data ?? -1 , terminator : " ")
        inorder(rootNode: rootNode.right)
        
    }
}

let bst = BST()
bst.root = nil
let arr = [10,20,5,30]
for item in arr {
    bst.root = bst.insert(rootNode: bst.root, data: item)
}

bst.inorder(rootNode: bst.root)


