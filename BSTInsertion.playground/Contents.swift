//: Playground - noun: a place where people can play

import UIKit
import Foundation

class BST {
    
    var root : Node?

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
    
    public func insert(rootNode : Node? , data : Int) -> Node {
        if let root = rootNode, let rootData = root.data {
            if data <= rootData {
                root.left = insert(rootNode: root.left, data: data)
            } else if data > rootData {
                root.right = insert(rootNode: root.right, data: data)
            }
            
            return rootNode!
            
        } else {
            let node = Node(data: data)
            return node
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
bst.root = bst.insert(rootNode: bst.root, data: 10)
bst.insert(rootNode: bst.root, data: 20)
bst.insert(rootNode: bst.root, data: 5)
bst.insert(rootNode: bst.root, data: 30)

bst.inorder(rootNode: bst.root)



